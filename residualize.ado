**! version 0.0.2

cap program drop residualize 
program residualize 
/****************************************************************************** 
required: varname varlist
    first variable = variable to residualize
    second variable (or varlist) = variable that we are residualizing on 
        (i.e. pulling out)
also required: 
    either replace or [gen]erate
        generate puts the residualized version in a new variable
        replace replaces varname with the residualized version
******************************************************************************/
syntax varlist(min=2 ts fv), [replace] [GENerate(name)]

local y: word 1 of `varlist' 

regress `varlist'
su `y' if e(sample), meanonly 
local mu = `r(mean)'

tempvar residual 
predict `residual', residual 

** TODO: move the bottom error up to the top and check it before we actually do stuff.
if !missing("`replace'") replace `y' = `residual' + `mu' 
else if !missing("`generate'") gen `generate' = `residual' + `mu' 
else di as error "Please specificy " as input "replace" as error " or " as input "generate({it:varname})" 

end 