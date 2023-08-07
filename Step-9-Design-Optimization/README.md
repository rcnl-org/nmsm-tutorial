# Design Optimization

## User Defined Cost Function Terms

Design Optimization allows for cost function terms that are defined by the user. This allows users to find a solution that accommodates to their specific problem.

User defined cost terms are added to Design Optimization by including the function in the MATLAB path or in the directory that Design Optimization is being run from. There are a few options to choose from:

### Model Functions

`<model_functions>` - This element in Design Optimization is a space separated list of function names that allows for modifying the model after the states, controls and static parameters are selected for that function iteration, but before any modeled values are calculated. This allows you to apply your static parameters to the model before the cost function is calculated.

The signature of a function in `<model_functions>` should be:

`function inputs = your_model_function(inputs, values)`

where `inputs` is a struct of experimental values (check the `auxdata` field) and values are the states, controls, and static parameters produced by GPOPS-II.

### Static Parameter Initialization

Static parameters can also be included as part of a user defined cost term. Static parameters are values that are optimized alongside the states and controls for a given problem. Static parameters are added to Design Optimization through the following XML element set:

```
<RCNLParameterTermSet>
	<RCNLParameterTerm>
		<type>your_parameter_name</type>
		<initial_values>0</initial_values>
        <upper_bounds>0.1</upper_bounds>
        <lower_bounds>-0.1</lower_bounds>
		<is_enabled>true</is_enabled>
	</RCNLParameterTerm>
</RCNLParameterTermSet>
```

For `<RCNLParameterTerm>` elements, the name of the static parameter should be used for the `<type>` element. This static parameter can then be found in `values.your_parameter_name` in the above model function arguments.

### User Defined Cost Terms

On top of allowing static parameters and model changes, a user can define an additional cost term to be added to the continuous or endpoint (discrete) cost calculations. The XML element set to define a user-defined cost term is as follows:

```
<RCNLCostTerm>
    <type>user_defined</type>
    <function_name>your_user_defined_cost_fn</function_name>
    <cost_term_type>discrete</cost_term_type>
    <is_enabled>true</is_enabled>
    <custom_element>5<custom_element>
</RCNLCostTerm>
```

In this case the type should be `user_defined` and the `function_name` should be the name of the function that calculates the cost and is contained in the MATLAB path or in the directory that Design Optimization is being run from. The `cost_term_type` element must contain either `continuous` or `discrete` to indicate if that cost term is calculated during the continuous or endpoint portions of the GPOPS-II iteration. Lastly, the `custom_element` is an example of the ability to pass in any named element with any value to the custom function. This facilitates building complex user_defined functions with custom arguments that you or your research team can adjust on the fly.

The signature of a function that defines a user-defined cost term is as follows:

```
function cost = your_user_defined_cost_fn(values, modeledValues, auxdata, costTerm)
```

Where each argument is:

- values - the states and controls provided by GPOPS-II
- modeledValues - the calculated values for the given 'values' and model
- auxdata - the initial input data, can be used to reference experimental values
- costTerm - this contains the information included in the XML child elements of the `RCNLCostTerm`

Custom XML elements, such as the `custom_element` term in the `RCNLCostTerm` above, can be found via the costTerm argument. Specifically, "5" can be found via `costTerm.custom_element` in this example.
