# residualize
a simple stata program to residualize some variable on some other variables

## installation 

download this repo. 

*coming soon:* 
- [ ] installation via `net install`.  

## syntax 

```stata
residualize varname varlist, [replace gen(varname) absorb(varlist)]
```

`residualize` takes in a `varname` and residualizes `varname` on `varlist` (time series and factor operators are allowed;
this means `i.varname` syntax is supported).

`absorb(varlist)` is supported; since we use `reghdfe` under the hood, interactions of the form `absorb(var1 var2#var3)` are allowed. 

One of `replace` or `gen(varname)` is required.
`replace` overwrites the original variable; `gen(varname)` saves the residualized variable to `varname`.

## notes

Note: this short program was developed to aid in visualizations.
For this reason, after the residualization is performed, the mean is added back to the residuals.
In a linear regression, the estimates will be the same with and without the means, since we are just adding or subtracting
a constant.
However, non-linear specifications are not, in general, robust to such addition of constants.

**If you would like to use `residualize` with a non-linear model, don't.**

If you open an issue/feature request for it, I'll implement the `nomeans` option.
It's on my to-do's but is not particularly high priority (until someone requests it).
 
*coming soon*: 
- [ ] examples + syntax  
- [ ] implement `nomeans`: option to not add means back in  
