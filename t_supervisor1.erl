%% ===================================================================
%% Author xiaotie
%% 2015-6-17
%% 
%% ===================================================================
-module(t_supervisor1).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(Mod, Args), #{id        => Mod,
                            start     => {Mod, start_link, Args},
                            restart   => permanent,
                            shutdown  => brutal_kill,
                            type      => worker}).



%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).



%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok, { {simple_one_for_one, 5, 10}, [?CHILD(mcp_worker, [])] } }.