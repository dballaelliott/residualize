# residualize
a simple stata program to residualize some variable on some other variables

## installation 

download this repo. 

*coming soon:* installation via net install.

## syntax 

```stata
residualize varname varlist, [replace gen(varname)]
```

`residualize` takes in a `varname` and residualizes `varname` on `varlist` (time series and factor operators are allowed;
this means `i.varname` syntax is supported). 

One of `replace` or `gen(varname)` is required.
`replace` overwrites the original variable; `gen(varname)` saves the residualized variable to `varname`.
