using Pumas
using PumasUtilities
using PharmaDatasets
using DataFrames
using DataFramesMeta

# dataset
tte_single = dataset("tte_single")

# including AMT column
@rtransform! tte_single :AMT = 0

# Pumas Modeling
pop_single = read_pumas(
    tte_single;
    observations = [:DV],
    covariates = [:DOSE],
    id = :ID,
    time = :TIME,
    amt = :AMT,
    evid = :EVID,
)

# Exponential
tte_single_exp_model = @model begin
    @param begin
        λ₁ ∈ RealDomain(; lower = 0, init = 0.001) # basal hazard
        β ∈ RealDomain(; init = 0.001)           # fixed effect DOSE
        ω ∈ RealDomain(; lower = 0)              # inter-subject variability
    end

    @random begin
        η ~ Normal(0.0, ω)
    end

    @covariates DOSE

    @pre begin
        _λ₁ = λ₁ * exp(η)          # basal hazard with inter-subject variability
        _λ₀ = _λ₁ * exp(β * DOSE)  # total hazard
    end

    @vars begin
        # exponential
        λ = _λ₀
    end

    @dynamics begin
        # the derivative of cumulative hazard is equal to hazard
        Λ' = λ
    end

    @derived begin
        DV ~ @. TimeToEvent(λ, Λ) # special type of distribution
    end
end

tte_single_exp_fit =
    fit(tte_single_exp_model, pop_single, init_params(tte_single_exp_model), LaplaceI())

# Weibull
tte_single_weibull_model = @model begin
    @param begin
        λ₁ ∈ RealDomain(; lower = 0, init = 0.001) # basal hazard
        β ∈ RealDomain(; init = 0.001)           # fixed effect DOSE
        ω ∈ RealDomain(; lower = 0)              # inter-subject variability
        Κ ∈ RealDomain(; lower = 0, init = 0.001)  # Weibull shape
    end

    @random begin
        η ~ Normal(0.0, ω)
    end

    @covariates DOSE

    @pre begin
        _Κ = Κ                     # shape parameter
        _λ₁ = λ₁ * exp(η)          # basal hazard with inter-subject variability
        _λ₀ = _λ₁ * exp(β * DOSE)  # total hazard
    end

    @vars begin
        # Weibull
        # 1e-10 for model numerical stability
        λ = _λ₀ * _Κ * (_λ₀ * t + 1e-10)^(_Κ - 1)
    end

    @dynamics begin
        # the derivative of cumulative hazard is equal to hazard
        Λ' = λ
    end

    @derived begin
        DV ~ @. TimeToEvent(λ, Λ) # special type of distribution
    end
end

tte_single_weibull_fit = fit(
    tte_single_weibull_model,
    pop_single,
    init_params(tte_single_weibull_model),
    LaplaceI(),
)

# Gompertz
tte_single_gompertz_model = @model begin
    @param begin
        λ₁ ∈ RealDomain(; lower = 0, init = 0.001) # basal hazard
        β ∈ RealDomain(; init = 0.001)           # fixed effect DOSE
        ω ∈ RealDomain(; lower = 0)              # inter-subject variability
        Κ ∈ RealDomain(; lower = 0, init = 0.001)  # Gompertz shape
    end

    @random begin
        η ~ Normal(0.0, ω)
    end

    @covariates DOSE

    @pre begin
        _Κ = Κ                     # shape parameter
        _λ₁ = λ₁ * exp(η)          # basal hazard with inter-subject variability
        _λ₀ = _λ₁ * exp(β * DOSE)  # total hazard
    end

    @vars begin
        # Gompertz
        λ = _λ₀ * exp(_Κ * t)
    end

    @dynamics begin
        # the derivative of cumulative hazard is equal to hazard
        Λ' = λ
    end

    @derived begin
        DV ~ @. TimeToEvent(λ, Λ) # special type of distribution
    end
end

tte_single_gompertz_fit = fit(
    tte_single_gompertz_model,
    pop_single,
    init_params(tte_single_gompertz_model),
    LaplaceI(),
)

# compare MLE estimates
compare_estimates(;
    Exponential = tte_single_exp_fit,
    Weibull = tte_single_weibull_fit,
    Gompertz = tte_single_gompertz_fit,
)
