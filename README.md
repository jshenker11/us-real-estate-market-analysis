# U.S. Real Estate Market Analysis & Forecasting

**R · Exploratory Data Analysis · Economic Indicators · Time-Series Forecasting**

An analysis of regional U.S. reported housing prices and household incomes using 2014–2022 data. The project explores geographic differences, the relationship between income and prices, shifts between pre-2020 and 2020–2021 periods, and a simple exponential-smoothing (ETS) forecast.

> **Portfolio update:** This repository is based on a November 2024 R Markdown project. The analysis was revised for reproducibility and more defensible forecast evaluation; it is **not an exact copy** of the originally submitted report.

## Project highlights

- Examined **1,575 source observations** covering **five geographic groups**: Midwest, Northeast, South, West, and the United States.
- Analyzed **1,050 records** after excluding the ambiguous `Total1` category, retaining the dataset's `Single` and `Double` labels.
- Explored regional average prices and correlations with reported median household income using **R, dplyr, and ggplot2**.
- Compared mean prices and income for **2014–2019** against **2020–2021**, with appropriate limitations on causal interpretation.
- Evaluated an **ETS(A,A,N)** time-series model on a **held-out 2022 period**, then created an illustrative 12-month forecast for 2023.

## Data

| Attribute | Value |
|---|---|
| Period | January 2014 – December 2022 |
| Original records | 1,575 |
| Records after filtering `Total1` | 1,050 |
| Regions | Midwest, Northeast, South, West, United States |
| Source home-size labels | `Single`, `Double`, `Total1` |
| Recorded monthly periods | 105 of 108 |

The original CSV omits **May 2019, January 2020, and February 2021** for all regions/categories. These dates are explicitly restored to the monthly index and interpolated **for forecasting only**, rather than shifting subsequent observations along a time axis.

**Variable-definition caution:** The source calls its price field `Average Sales Price` and its size categories `Single`, `Double`, and `Total1`; it does not by itself establish that `Single` and `Double` mean one-bedroom and two-bedroom properties. The number-of-households field is already expressed in thousands. This README preserves the source labels rather than imposing unverified interpretations.

## Analysis

1. **Preparation:** clean category labels, check missingness, exclude the ambiguous aggregate, create dates, and standardize display units.
2. **Exploration:** compare average reported price by region and category, examine income-price relationships, and chart price trends.
3. **Period comparison:** calculate descriptive percent differences in average prices and median incomes between pre-2020 and 2020–2021.
4. **Forecast validation:** train a nonseasonal additive-trend ETS model on 2014–2021, assess predictions against the held-out 2022 observations, and report out-of-sample MAE and RMSE when the notebook runs.
5. **Illustrative forecast:** refit ETS with observations through December 2022 and forecast the next 12 months of the dataset's national price measure.

The FRED median national sale-price image is supplied for background context, **not** as a numerically comparable ground truth for the average-price series analyzed here.

## Repository contents

| File | Description |
|---|---|
| `real_estate_analysis.Rmd` | Portfolio revision: code, charts, narrative, 2022 holdout test, and 2023 forecast |
| `RealEstateUnitedStates.csv` | Original dataset supplied with the project |
| `houseprices2.png` | Original FRED chart used for contextual comparison |
| `install_packages.R` | Installs needed R packages |
| `.gitignore` | Excludes local temporary R and R Markdown files |

## Run the analysis

1. Install [R](https://cran.r-project.org/) and [RStudio](https://posit.co/download/rstudio-desktop/) (or another environment capable of rendering R Markdown).
2. Download/clone the repository and open it as the working directory.
3. In the R console run:

   ```r
   source("install_packages.R")
   ```

4. Open `real_estate_analysis.Rmd` and select **Knit → Knit to HTML**. Keep the CSV and PNG beside the `.Rmd` file.

## Limitations and attribution

- Period comparisons describe historical associations, not the causal impact of COVID-19.
- Several observations share the same year-and-region income value, so monthly income observations are not independent.
- Imputation was used to fill exactly three entirely absent months for the modeling step.
- ETS assumes a continuation of historical patterns and does not model mortgage rates, employment, or housing supply.
- FRED's [MSPUS series](https://fred.stlouisfed.org/series/MSPUS), sourced from the U.S. Census Bureau and HUD, measures the national **median** sale price and is not directly comparable to this dataset's category-level **average** price.
- **Original dataset attribution/licensing should be confirmed** before publishing the included CSV publicly. If redistribution is not allowed, remove the CSV and supply a permitted source link instead.

**Original project:** November 2024. **Portfolio documentation and forecasting-method revision:** October 2026.
