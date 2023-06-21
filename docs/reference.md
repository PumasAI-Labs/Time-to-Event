---
title: Reference Sheets for Pumas-AI Time to Event Workshop
---

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

## Key Points

- You can define time to event models in Pumas by using the `TimeToEvent` function in the `@derived` block
- You can use any parameterized function to define the underlying distribution of the hazard function
- Time to event models in Pumas need to be fitted using either `NaivePooled` or `LaplaceI` and do not support `FOCE`

## Summary of Basic Commands

| Action                       | Command             | Observations                                                                                                     |
| ---------------------------- | ------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Define a time to event model | `TimeToEvent(λ, Λ)` | `TimeToEvent` should be used in the `@derived` block, `λ` and `Λ` are hazard and cumulative hazard respectively. |

## Glossary

Time to event model

: Umbrella class of statistical methods for which the outcome variable of interest is time. We are interested in the time until an event occurs.

Hazard

: Instantaneous rate at which an event of interest occurs at a given point in time. It represents the risk or probability of experiencing the event within a very small time interval, given that the individual has survived up to that point. The basal hazard refers to the baseline hazard rate or the hazard rate in the absence of any covariates or explanatory variables. The total hazard, also known as the conditional hazard or the hazard function, takes into account both the basal hazard and the effects of covariates. The cumulative hazard function represents the cumulative probability of experiencing the event of interest up to a given time t. It is obtained by integrating the hazard function over time.

Weibull distribution

: Commonly used probability distribution to describe the distribution of event times. It is a flexible distribution that allows for a wide range of hazard shapes, including increasing, decreasing, or constant hazard rates over time.

Gompertz distribution

: The Gompertz distribution is another probability distribution commonly used in survival analysis and time to event modeling. It is a flexible distribution that allows for a wide range of hazard shapes, including increasing, decreasing, or constant hazard rates over time.

## Get in touch

If you have any suggestions or want to get in touch with our education team,
please send an email to <training@pumas.ai>.

## License

This content is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
