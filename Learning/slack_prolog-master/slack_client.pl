:- module(slack_client, [
        slack_start_listener/0,
        slack_chat/2,
        slack_send/1,
        slack_ping/0,
        is_thread_running/1,
        slack_ensure_im/2,
        name_to_id/2
        ]).

/** <module> slack_client - Provides a websocket API to write slack clients and bots
*/


:- use_module(library(http/http_open)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).
:- use_module(library(url)).
:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/websocket)).


/* tests to see if logicmoo utils are installed.. If not, create the predicates it will use */
:- if( \+ current_predicate( wdmsg/1 )).

:- meta_predicate(with_visible_leash(0)).
with_visible_leash(G):-
   '$leash'(A, A),'$visible'(V, V),
   (tracing->CU=trace;CU=notrace),
   (debugging->CU2=debug;CU2=nodebug),!,
   call_cleanup(G, (notrace,'$leash'(_, A),'$visible'(_, V),call(CU2),call(CU))).

:- meta_predicate(rtrace(0)).
rtrace(G):-  with_visible_leash(( notrace,leash(-all),visible(+full),leash(+exception),trace,debug, call(G))).

:- meta_predicate(must(0)).
must(G):- G *->true;throw(must_failed(G)).

fresh_line:- format(user_error,'~N',[]).

nop(_).

if_debug(_).

dmsg(O):- dmsg('~w~n',[O]).
dmsg(F,Args):- if_debug((fresh_line, format(user_error,F,Args))).

is_thread_running(ID):-
  is_thread(ID), thread_property(ID,status(What)),!,
   (What==running->true;(thread_join(ID,_ ),!,fail)).

:- endif.


:- dynamic(slack_token/1).

% ===============================================
% How this module might find your token:
% ===============================================

% 1st - Checks for a local declaration 
%  (if the next line is uncommented and replaced by a real token )
% slack_token('xoxb-01234567890-xxxxxxxxxxxxxxxx').

% 2nd - Checks for a local file called ".slack_auth.pl" for slack_token/1 as above
:- if(( \+ slack_token(_) , exists_file('.slack_auth.pl'))).
:- include('.slack_auth.pl').
:- endif.

% 3rd - Checks env for SLACK_API_TOKEN
%  ( defined by# export SLACK_API_TOKEN=xoxb-01234567890-xxxxxxxxxxxxxxxx )
:- if(( \+ slack_token(_))).
:- getenv('SLACK_API_TOKEN',Was)->asserta(slack_token(Was));true.
:- endif.

% 4th - Checks users config directory for file called ".slack_auth.pl"  slack_token/1 as above
:- if(( \+ slack_token(_) , exists_file('~/.slack_auth.pl'))).
:- include('~/.slack_auth.pl').
:- endif.

:- if(( \+ slack_token(_))).
:- throw(missing(slack_token(_))).
:- endif.

% ===============================================
% Utility functions
% ===============================================

slack_token_string(S):-slack_token(T),atom_string(T,S).

slack_get_websocket_url(URL):-
  slack_token(Token),
  format(atom(GetURL),'https://slack.com/api/rtm.start?token=~w',[Token]),
  http_open(GetURL, In, []),
  json_read_dict(In,Term),
  dict_pairs(Term,_,Pairs),
  must(maplist(slack_receive(rtm),Pairs)),
  URL=Term.url,
  listing(slack_inform/3),
  close(In).

:- dynamic(slack_websocket/3).

slack_get_websocket(WS):- slack_websocket(WS,_,_),!.
slack_get_websocket(WS):-
   slack_get_websocket_url(URL),!,
   slack_open_websocket(URL,WS),!.

slack_open_websocket(URL,WS):-
   ignore(slack_websocket(OLD_WS,_,_)),
   http_open_websocket(URL, WS, []),
   stream_pair(WS,I,O),
   asserta(slack_websocket(WS,I,O)),
   (nonvar(OLD_WS)->slack_remove_websocket(OLD_WS);true).

slack_remove_websocket(OLD_WS):-
   ignore(retract(slack_websocket(OLD_WS,_,_))),
   ignore(catch(ws_close(OLD_WS,1000,''),_,true)).

% ===============================================
% Property Names
% ===============================================
skip_propname(K):- var(K),!.
skip_propname(_-_):-!,fail.
skip_propname(Type):-string(Type),!,string_to_atom(Type,K),!,skip_propname(K).
skip_propname(rtm).
skip_propname(rtm_e).
skip_propname(data).
skip_propname(var).

slack_propname(Type,var):-var(Type),!.
slack_propname(Type,K):-string(Type),!,string_to_atom(Type,K).
slack_propname(Key-Type,NewType):-!,slack_propname(Key,Type,NewType).
slack_propname(Key.Type,NewType):-!,slack_propname(Key,Type,NewType).
slack_propname(Key,Key).

slack_propname(Type,Key,NewType):- skip_propname(Type),!,slack_propname(Key,NewType).
slack_propname(Key,Type,NewType):- skip_propname(Type),!,slack_propname(Key,NewType).
slack_propname(_Type,Key,NewType):-slack_propname(Key,NewType).


slack_start_listener:-
 call_cleanup((
  repeat,
  once(slack_get_websocket(WS)),
  once(ws_receive(WS,Data,[format(json)])),
  (Data==
    end_of_file->!;
  (once(slack_receive(rtm_e,Data)),fail))),
  slack_remove_websocket(WS)).



undict(ID,IDO):- is_dict(ID),ID.IDK=IDV,IDK=id,IDO=IDV.
undict(ID,ID).


% ignored
slack_event(reconnect_url,_Dict):-!.
/*
  must((Dict.url=URL,
   dmsg(reconnect(URL)),!,
   dmsg(slack_open_websocket(URL,_)))).
*/

% simplify the data objects
slack_event(Type,O):- is_dict(O),O.Key=Data,Key=data,!,slack_receive(Type,Data),!.

% typify the data objects
slack_event(rtm_e,O):- is_dict(O),O.Key=Type,Key=type,!,slack_receive(Type,O),!.

% Notice newly created IMs
slack_event(im_open,Dict):-
  Dict.channel=IDI,
  Dict.user=User,
  undict(IDI,ID),
  string_to_atom(ID,IDA),
  asserta(slack_inform(ims, instance, IDA)),
  asserta(slack_inform(IDA, id, ID)),
  asserta(slack_inform(IDA, user, User)).

slack_event(_,end_of_file):- throw(slack_event(rtm_e,end_of_file)).


% slack_event(Type,Data):-add_slack_info(now,Type,Data).

slack_unused(user_typing).
slack_unused(reconnect_url).

slack_receive(Type,Data):- string(Data),(string_to_dict(Data,Dict)->true;string_to_atom(Data,Dict)),!,slack_receive(Type,Dict).
slack_receive(Type,Data):- slack_propname(Type,NewType)-> Type\==NewType,!,slack_receive(NewType,Data).
slack_receive(Type,Dict):- type_to_url(K,Type),!, slack_receive(K,Dict).
slack_receive(Type,Data):- slack_event(Type,Data),!.
slack_receive(Type,Data):- slack_inform(Type,Data),!.
slack_receive(Type,Data):- slack_unused(Type), nop(dmsg(unused(slack_receive(Type,Data)))).
slack_receive(Type,Data):- dmsg(unknown(slack_receive(Type,Data))).



:- dynamic(slack_info/3).

slack_inform(Type,Data):-is_dict(Data),Data.Key=ID,Key=id,!,string_to_atom(ID,Atom),
   add_slack_info(Type,Atom,Data).
slack_inform(rtm,Data):- is_list(Data),!, maplist(slack_receive(rtm),Data).
slack_inform(Type,Key-[A|Data]):-is_dict(A),is_list(Data),!,maplist(slack_receive(Type-Key),[A|Data]).
slack_inform(Type,Key-Data):- atomic(Data),add_slack_info(Type,Key,Data).
slack_inform(Type,Key-Data):- is_dict(Data),dict_pairs(Data,Tag,Pairs),maplist(slack_receive(Type-Key-Tag),Pairs).



add_slack_info(Type,ID,Data):- is_dict(Data),dict_pairs(Data,_Tag,Pairs),!, add_slack_info1(Type,instance,ID),
   maplist(add_slack_info1(Type,ID),Pairs).
add_slack_info(Type,ID,Data):-add_slack_info1(Type,ID,Data).

add_slack_info1(Type,ID,K-V):- atom(Type),!,add_slack_info1(ID,K,V).
add_slack_info1(Type,ID,Data):-assert(slack_info(Type,ID,Data)).


name_to_id(Name,ID):-text_to_string(Name,NameS),slack_inform(ID,name,NameS),!.
name_to_id(Name,ID):-text_to_string(Name,NameS),slack_inform(_,instance,ID), slack_inform(ID,_,NameS),!.

same_ids(ID,IDS):-text_to_string(ID,IDA),text_to_string(IDS,IDB),IDA==IDB.

slack_ensure_im2(To,IM):- name_to_id(To,ID), slack_inform(IM,user,IDS),same_ids(ID,IDS),slack_inform(ims,instance,IM),!.
slack_ensure_im(To,IM):- slack_ensure_im2(To,IM),!.
slack_ensure_im(To,IM):- name_to_id(To,ID), slack_send({type:'im_open',user:ID}),!,must(slack_ensure_im2(To,IM)),!.


slack_id_time(ID,TS):-flag(slack_id,OID,OID+1),ID is OID+1,get_time(Time),number_string(Time,TS).


slack_self(Self):-slack_inform(self, id, Self).

%  {"id":2,"type":"ping","time":1484999912}
slack_ping :- slack_id_time(ID,_),get_time(Time),TimeRnd is round(Time),slack_send({"id":ID,"type":"ping", "time":TimeRnd}).

% {"id":3,"type":"message","channel":"D3U47CE4W","text":"hi there"}
slack_chat :- slack_chat(logicmoo,"hi there").
slack_chat2:- slack_chat(dmiles,"hi dmiles").


slack_chat(To,Msg):-  slack_ensure_im(To,IM),
	  slack_send({
            type: "message", 
            username:"@prologmud_connection",
	    channel: IM,
            text: Msg
	   }),!.

slack_post(Cmd,Params):- slack_token(Token),
	  make_url_params(Params,URLParams),
	  format(string(S),'https://slack.com/api/~w?token=~w&~w',[Cmd,Token,URLParams]),
	  dmsg('~N SLACK-POST ~q ~n',[S]),!,
	  http_open(S,Out,[]),!,
	  json_read_dict(Out,Dict),
	  dict_append_curls(Dict,Params,NewDict),
	  slack_receive(Cmd,NewDict).

dict_append_curls(Dict,Params,NewDict):-any_to_curls(Params,Curly),
	dict_append_curls3(Dict,Curly,NewDict).

dict_append_curls3(Dict,{},Dict):-!.
dict_append_curls3(Dict,{Curly},NewDict):-!,dict_append_curls3(Dict,Curly,NewDict).
dict_append_curls3(Dict,(A,B),NewDict):-!,dict_append_curls3(Dict,A,NewDictM),dict_append_curls3(NewDictM,B,NewDict).
dict_append_curls3(Dict,KS:V,NewDict):- string_to_atom(KS,K), put_dict(K,Dict,V,NewDict).


string_to_dict:-
 string_to_dict("{\"type\":\"dnd_updated_user\",\"user\":\"U3T3R279S\",\"dnd_status\":{\"dnd_enabled\":false,\"next_dnd_start_ts\":1,\"next_dnd_end_ts\":1},\"event_ts\":\"1485012634.280271\"}",Dict),
  dmsg(Dict).

string_to_dict(String,Dict):-
   open_string(String,Stream),
   catch(json_read_dict(Stream,Dict),_,fail),!.



type_to_url("message",'chat.postMessage').
type_to_url("im_open",'im.open').

make_url_params({In},Out):-!,make_url_params(In,Out).
make_url_params((A,B),Out):-!,make_url_params(A,AA),make_url_params(B,BB),format(atom(Out),'~w&~w',[AA,BB]).
make_url_params([A|B],Out):-!,make_url_params(A,AA),make_url_params(B,BB),format(atom(Out),'~w&~w',[AA,BB]).
make_url_params([A],Out):-!,make_url_params(A,Out).
make_url_params(KV,Out):-get_kv(KV,K,A),www_form_encode(A,AA),format(atom(Out),'~w=~w',[K,AA]).

get_kv(K:V,K,V):- must(nonvar(K);throw(get_kv(K:V,K,V))).
get_kv(K-V,K,V).
get_kv(K=V,K,V).

slack_send(DataI):- any_to_curls(DataI,Data),slack_send00(Data).

slack_send00({"type":Type,Params}):-type_to_url(Type,Cmd),!,slack_post(Cmd,Params).
% @TODO comment the above and fix this next block
slack_send00(Data):-slack_get_websocket(WebSocket),
   slack_websocket(WebSocket, _WsInput, WsOutput),
   flush_output(WsOutput),
   slack_send(WsOutput,Data),
   flush_output(WsOutput).

dict_to_curly(Dict,{type:Type,Data}):- del_dict(type,Dict,Type,DictOut),dict_pairs(DictOut,_,Pairs),any_to_curls(Pairs,Data).
dict_to_curly(Dict,{type:Type,Data}):- dict_pairs(Dict,Type,Pairs),nonvar(Type),any_to_curls(Pairs,Data).
dict_to_curly(Dict,{Data}):- dict_pairs(Dict,_,Pairs),any_to_curls(Pairs,Data).

any_to_curls(Dict,Out):- is_dict(Dict),!,dict_to_curly(Dict,Data),any_to_curls(Data,Out).
any_to_curls(Var,"var"):- \+ must(\+ var(Var)),!.
any_to_curls({DataI},{Data}):-!,any_to_curls(DataI,Data).
any_to_curls((A,B),(AA,BB)):-!,any_to_curls(A,AA),any_to_curls(B,BB).
any_to_curls([A|B],(AA,BB)):-!,any_to_curls(A,AA),any_to_curls(B,BB).
any_to_curls([A],AA):-!,any_to_curls(A,AA).
any_to_curls(KV,AA:BB):-get_kv(KV,A,B),!,any_to_curls(A,AA),any_to_curls(B,BB).
any_to_curls(A,AA):- catch(text_to_string(A,AA),_,fail),!.
any_to_curls(A,A).

slack_send(WsOutput,Data):- format(WsOutput,'~q',[Data]),dmsg(slack_sent(Data)).


% start slack listener in a thread
:- if(( \+ (is_thread_running(slack_start_listener)))).
:- thread_create(slack_start_listener,_,[alias(slack_start_listener)]).
:- endif.

% if the above fails .. run in debug mode
:- if(( \+ (is_thread_running(slack_start_listener)))).
:- rtrace(slack_start_listener).
:- endif.
