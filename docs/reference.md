---
title: Reference Sheets for Pumas-AI Time to Event Workshop
---

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

## Key Points

- You can define time to event models in Pumas by using the `TimeToEvent` function in the `@derived` block
- You can use any parameterized function to define the underlying distribution of the hazard function
- Time to event models in Pumas need to be fitted using either `NaivePooled` or `LaplaceI` and do not support `FOCE`

## Summary of Basic Commands

| Action      | Command       | Observations          |
| ----------- | ------------- | --------------------- |
| Define a time to event model | `TimeToEvent(λ, Λ)` | `TimeToEvent` should be used in the `@derived` block, `λ` and `Λ` are hazard and cumulative hazard respectively.  |

## Glossary

Time to event model

: Definition of the term one above.

Hazard

: Say about basal, total, and cumulative hazard

Weibull distribution

: Say something about TTE and the Kappa shape parameter and assumptions

Gompertz distribution

: Say something about TTE and the Kappa shape parameter and assumptions

## Get in touch

If you have any suggestions or want to get in touch with our education team,
please send an email to <training@pumas.ai>.

## License

This content is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
