-type input_dendrite() :: pid().
-type input_weight() :: float().
-type input_signal() :: float().
-type neuron_bias() :: float().
-type output_signal() :: float().
-type output_dendrite() :: pid().
-type dendrites() :: #{input_dendrite() => {input_weight(), input_signal()}}.  % input vector
-type soma() :: fun((dendrites() -> input_signal()).     % summation function
-type axon() :: fun((input_signal()) -> output_signal()). % activation function
-type synapse() :: [output_dendrite()].


-record(neuron, {
	invector = #{} :: dendrites(), 
	bias = 0.0 :: neuron_bias(), 
	sumfunc = undefined :: soma(), 
	activefunc = undefined :: axon(),
	outlist = [] :: synapse()
	}).
-type neuron() :: #neuron{}.
