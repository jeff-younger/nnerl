-module(nnerl_factory).
-include("nnerl_records.hrl").

-export([
	new_neuron/0,
	new_neuron/1
	]).


%%
%% ------ A factory module that constructs basic data
%%        structures for a neural network.
%%

-spec new_neuron() -> neuron().
new_neuron() ->
	#neuron{}.

-spec new_neuron(#{atom() => term()}).
new_neuron(InitilizationMap) ->
	#neuron{
		invector = maps:get(invector, InitilizationMap, #{}), 
		bias = maps:get(bias, InitilizationMap, 0.0), 
		sumfunc = maps:get(sumfunc, InitilizationMap, undefined), 
		activefunc = maps:get(activefunc, InitilizationMap, undefined),
		outlist = maps:get(outlist, InitilizationMap, [])
	}.

