# Function definitions -------------------

# Creates recipe for bioflux dataset with few parameter options, quite specific function...

recipe_GPP <- function(tidyDF){
  pp <- recipes::recipe(GPP_NT_VUT_REF ~ SW_IN_F + VPD_F + TA_F, 
                        data = tidyDF |> drop_na()) |> 
    recipes::step_BoxCox(c(all_predictors(),-TA_F,-VPD_F)) |>  #Both sometimes contain negative values... check why
    recipes::step_center(all_numeric(), -all_outcomes()) |>
    recipes::step_scale(all_numeric(), -all_outcomes())
  return(pp)
}