---
title: Instructor's Notes for Pumas-AI Time to Event Workshop
---

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

The purpose of this workshop is to showcase the `TimeToEvent` distribution.
It is a special type of distribution that accepts two positional arguments:

1. hazard: `λ`
1. cumulative hazard `Λ`

Start with the `01-single_tte.jl` file.
Showcase the `tte_single` dataset.
Focus on explaining the evid `3` at time `0` for all subjects.
This is a reset event code and it is used in time to event data to notify when the model needs to account for the hazard.
If a subject has not experienced the event until the observed time frame (right censoring),
then no more observations would be added for that subject.
However, if there is an event, then an evid `0` would be recorded at the observed time with `1` as the `DV` value.
We also have a binary covariate `DOSE` that impacts in the propensity of subjects experiencing an event.
Since we are using evids, we need also to specify an amount when parsing the data with `read_pumas`.
However, we don't have an amount column in the `tte_single` dataset.
We need to create a column `:AMT` filled with `0`s.
That solves the amount issue.
Our population is ready to be used in the subsequent models.

We will use three models in the single time to event workflow.
They have the same covariate (`DOSE`) but they differ on the assumptions of the underlying distribution of the hazard function:

1. Exponential hazard function: assumes constant hazard
1. Weibull hazard function: assumes either increasing, decreasing or constant hazard
1. Gompertz hazard function: assumes either increasing, decreasing or constant hazard

The exponential model is the first TTE model that we will fit.
We are defining `λ₁` as the basal hazard and `β` as the `DOSE` covariate effect.
In the `@pre` block we calculate `_λ₁` as the basal hazard with inter-subject
variability and `_λ₀` as the total hazard for each subject.
Since the exponential model has a simple formula,
we define the in the `@vars` block that `λ = _λ₀ `.

For the Weibull model the parameters are almost the same as the exponential model,
but with the addition of the shape parameter `Κ`.
In the `@vars` block we use the Weibull formula for the hazard function `λ`.
The Gompertz model follows a similar pattern as the Weibull model.

In all of these three models, we are using the special distribution `TimeToEvent`.
For the fitting procedure we cannot use `FOCE()` and we need to use either `NaivePooled()` or `LaplaceI()`.

Finally, you can compare the estimates with the `compare_estimates` from `PumasUtilities`.
If you find it opportune, you can go over model comparisons between the three models with fit metrics, e.g. AIC,
goodness of fit plots, and visual predictive checks.
However, be mindful that model assessment is not a requirement for this workshop.

## Get in touch

If you have any suggestions or want to get in touch with our education team,
please send an email to <training@pumas.ai>.

## License

This content is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
