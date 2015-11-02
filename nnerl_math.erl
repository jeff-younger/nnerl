-module(nnerl_math).
-include("nnerl_records.hrl").
-include_lib("eunit/include/eunit.hrl").

-export([
	map_dot_product/1
	]).


-spec map_dot_product(dendrites()) -> input_signal().
map_dot_product(VectorMap) -> 
	maps:fold(
		fun(_Pid, {InSignal, Weight}, AccIn) -> AccIn + (InSignal * Weight) end, 
		0.0,
		VectorMap).



%%
%% ------ Tests
%%%
map_dot_product_test_() ->
	[
		?_assert(map_dot_product(#{}) =:= 0.0),
		?_assert(map_dot_product(#{1 => {12.0, 11.0}}) =:= 132.0),
		?_assert(map_dot_product(#{1 => {12.0, 13.0}, 2 => {2.0, 16.0}}) =:= 188.0),
		?_assert(map_dot_product(#{1 => {12.458, 13.62117}}) =:= 169.69253586),
		?_assert(map_dot_product(#{1 => {12.458, 13.62117}, 2 => {1.3, 45.0009}}) =:= 228.19370586),
		?_assert(map_dot_product(#{1 => {12.458, 13.62117}, 
			2 => {1.3, 45.0009}, 3 => {0.004, 1.23}}) =:= 228.19862586)
	].