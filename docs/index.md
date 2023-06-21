---
title: Pumas-AI Time to Event Workshop
description: Workshop template for the introduction to time to event (TTE) modeling in Pumas.
---

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

This workshop introduces **time to event models** into Pumas.

It covers how to:

- define single and repeated time to event models with the following underlying distributions for the hazard function:
    - exponential
    - Weibull
    - Gompertz

The following Julia files are provided:

1.  `01-single_tte.jl`: covers how to define single time to event models
1.  `02-repeated_tte.jl`: covers how to define repeated time to event models

!!! success "Prerequisites"

    We recommend users being familiar with the Pumas `@model` specification, how to parse data into a `Population`, and how to use the `fit` function.

    The formal requirements are the [NLME Modeling Workshop](https://pumasai-labs.github.io/NLME-Model/).

## Schedule

| Time (HH:MM) | Activity | Description                              |
| ------------ | -------- | ---------------------------------------- |
| 00:00        | Setup    | Download files required for the workshop |
| 00:05        | Single time to event modeling | Showcase `01-single_tte.jl` |
| 00:25        | Repeated time to event modeling | Showcase `02-repeated_tte.jl` |
| 00:45        | Closing Remarks | See if there are any questions and feedback |

## Get in touch

If you have any suggestions or want to get in touch with our education team,
please send an email to <training@pumas.ai>.

## Authors

- Jose Storopoli - <jose@pumas.ai>

## License

This content is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
