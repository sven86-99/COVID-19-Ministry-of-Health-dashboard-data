Ministry of Health COVID-19 metrics
================

## Introduction

The New Zealand Te Whatu Ora, Ministry of Health (MoH) reported COVID-19
data metrics to the public on their website:

- <https://www.health.govt.nz/covid-19-novel-coronavirus/covid-19-data-and-statistics/covid-19-case-demographics>

Data was recorded and updated:

1.  Daily between 11 February 2022 and 12 September 2022; and

2.  Weekly between 13 September 2022 and 18 February 2024.

The Ministry of Health stopped reporting metrics by vaccination status
after 18 February 2024.

Metrics for Cases, Hospitalization, and Deaths of people in New Zealand
within 28 days of being reported as a COVID-19 case were stratified on
vaccination type and partially by age. This information was collated
from the Ministry of Health website and entered into an excel
spreadsheet `covid_healthdata.xlsx`.

The authenticity of the dataset made available to the public in
`covid_healthdata.xlsx` can be verified from snapshots over time still
available in the wayback machine:

- <https://web.archive.org/web/20260000000000*/https://www.health.govt.nz/covid-19-novel-coronavirus/covid-19-data-and-statistics/covid-19-case-demographics>

The random variables the Ministry of Health New Zealand reported to the
public were;

| Type | Description |
|:---|:---|
| Vaccination Uptake_HSU 2021 | Numbers of people single/double/triple vaccinated *-not sufficiently stratified by age category* |
| COVID-19 Cases | Reported cases of COVID-19 by vaccination status |
| COVID-19 Hospitalizations | Reported cases requiring hospitalization by vaccination status |
| COVID-19 ICU | Reported cases requiring ICU Hospitalization by vaccination status |
| COVID-19 Deaths | Reported deaths by vaccination status partially stratified by age category |

The information made publicly available by the Ministry of Health
represents only a subset of the metrics collected and maintained within
its proprietary databases.

The publicly disclosed data lack sufficient age group detail and concise
categorisation of vaccination status to support any comprehensive
relative risk analysis. For example, the publication of Deaths in age
categories (0–59, 60–69, 70-79, 80-89, 90+ years) may have been
restricted because a small number of deaths within lower age categories
could increase the likelihood of identifying individuals and potentially
compromising privacy.

## Underestimation of the Population

Prior to 4 August 2022, the Ministry of Health underestimated the New
Zealand population, this introduced a significant bias in the number of
unvaccinated people in New Zealand. This discrepancy arose from its use
of the HSU2020 dataset, which introduced bias into metrics used to
estimate relative risks between vaccinated and unvaccinated populations.

<https://www.youtube.com/watch?v=tL06sCjQHxo&t=364s>

The underlying issue is that vaccination records are expected to be
reasonably accurate as individuals receive vaccinations and are recorded
in relevant databases. However, the estimated total population was
underestimated. By switching to the updated HSU 2021 database, the
residual population classified as unvaccinated increased by an
additional 233,000 people. Consequently, the estimated size of the
unvaccinated population is substantially larger than had been used in
any publication prior to 4 August 2022.

This has important implications for interpreting reported infection
rates and other relative risk measures in any publication prior to 4
August 2022 when comparing vaccinated to unvaccinated. For example, if
prior to using the HSU 2021 database the unvaccinated population was
estimated to be 153,000 people, this would increase to
$154,000 + 233,000 = 387,000$ unvaccinated, a multiplier of
$387/154 = 2.51$ times.

The following screen shot was taken on 8 May 2022 from
<https://covid19map.co.nz/cases>. It illustrates the underestimate in
the total population using a figure of 153,252 for the unvaccinated
population.

<img src="Screen Shot 2022-05-08 at 3.10.02 PM.png" width="470" />

*Note: The relative risk of a person having a booster was 0.8x*
***less*** *likely to catch COVID-19 than an unvaccinated person. This
is actually in favour of the unvaccinated before using the HSU 2021
population. The equivalent parametrisation is that an unvaccinated
person is $1/0.8 = 1.25x$* ***less*** *likely to catch COVID-19 than a
person having a booster.*

## Ministry of Health Cases

The data was recorded as a cumulative tally by vaccination status over
time in the form;

| Date       | Status       | Cases | Hospitalization | ICU |
|:-----------|:-------------|------:|----------------:|----:|
| 2022-02-11 | Unvaccinated |  4443 |             415 |  NA |
| 2022-02-11 | Single vax   |  2167 |             118 |  NA |
| 2022-02-11 | Double vax   |  4921 |              63 |  NA |
| 2022-02-11 | Not eligible |  3343 |              53 |  NA |
| 2022-02-13 | Unvaccinated |  4498 |             417 |  NA |
| 2022-02-13 | Single vax   |  2361 |             121 |  NA |

Any value which is less than the previous daily/weekly total is a
reporting error by the Ministry of Health.

### Reported Cases 2022-02-11 to 2024-02-18

This metric did not stratify by any age categories.

![](report_files/figure-gfm/plot_cases-1.png)<!-- -->

There is an acceleration of reported COVID-19 cases in the `Triple Vax`
category, the crossover point is around 3 May 2022.

There are also so few cases in the single dose category that a
$\log_{10}$ transformation is required.

![](report_files/figure-gfm/plot_logcases-1.png)<!-- -->

The $\log_{10}$ transformation highlights a Ministry of Health
classification error in data reporting.

### Reported Hospitalizations 2022-02-11 to 2024-02-18

This metric did not stratify by any age categories.

![](report_files/figure-gfm/plot_hospitalization-1.png)<!-- -->

There is an acceleration of reported COVID-19 cases in the `Triple Vax`
category, the crossover point is around 2 June 2922. This is a lag of
around a month from the Case crossover point of 3 May 2022.

There are also so few cases in the single dose category that a
$\log_{10}$ transformation is required.

![](report_files/figure-gfm/plot_logHospitalization-1.png)<!-- -->

### Reported ICU 2022-02-11 to 2024-02-18

This metric did not stratify by any age categories.

![](report_files/figure-gfm/plot_ICU-1.png)<!-- -->

![](report_files/figure-gfm/plot_logICU-1.png)<!-- -->

## Ministry of Health reported Deaths

The data was recorded as a cumulative tally by vaccination status and
(partially) stratified by age over time in wide format;

| Date       | Age_group | Not_fully_vaccinated | Fully_vaccinated | Received_booster |
|:-----------|:----------|---------------------:|-----------------:|-----------------:|
| 2022-03-15 | 0 to 59   |                   17 |                5 |               NA |
| 2022-03-15 | 60 to 69  |                    9 |                4 |                3 |
| 2022-03-15 | 70 to 79  |                   14 |                4 |                7 |
| 2022-03-15 | 80 to 89  |                   15 |               14 |                9 |
| 2022-03-15 | 90+       |                   10 |                9 |                5 |

This was converted into narrow format, and the following explanatory
variables were reparametrised:

| From                 |                      To |
|:---------------------|------------------------:|
| Not_fully_vaccinated | $\le1\;\mbox{dose}\:\:$ |
| Fully_vaccinated     | $\quad2\; \mbox{doses}$ |
| Received_booster     |    $\ge3\;\mbox{doses}$ |

### Vaccination vs Unvaccinated

Insufficient information was provided by the Ministry of Health to
estimate relative risks between vaccinated and unvaccinated populations,
however the screenshot from 26 November 2023 provides an approximate
snapshot at that date of the proportion of the New Zealand population
categorized by vaccine status published by the Ministry of Health.

<img src="Screen Shot 2023-11-26 at 9.16.30 AM.png" width="470" />

It can be inferred from this image that on 26 November 2023 the
Vaccination categories in the New Zealand population were:

1.  People with $\le 1\; \mbox{dose}$ equals 18%;

2.  Vaccinated people with $2 \; \mbox{doses}$ equals $82 - 53 = 29$%;

3.  Vaccinated people with $\ge 3\; \mbox{doses}$ equals 53%.

### Reported Deaths by Vaccination Status from 2022-02-11 to 2024-02-18

This metric was partially stratified by age category. Essentially, it is
a tally of deaths among people who had contracted COVID-19 within the
preceding 28 days. As vaccination targeted the elderly first, then
successive lower age groups, there will be confounding by age with
vaccination status, and Simpsons paradox applies.

This metric was partially stratified by age category. Essentially, it
represents a tally of deaths among people who had contracted COVID-19
within the preceding 28 days. As the vaccination programme initially
prioritised older people before progressively extending eligibility to
younger age groups, vaccination status is correlated with age.
Consequently, age is a potential confounding variable when comparing
mortality between vaccination groups. The potential for Simpson’s
paradox must be considered when interpreting the metrics.

Visualising the cumulative COVID-19 Deaths over time conditioned on
Vaccination Status, and Age category.

![](report_files/figure-gfm/plot_deaths-1.png)<!-- -->

The cumulative trend suggests that deaths due to COVID-19 were
significantly higher in the vaccinated group with $\ge 3\; \mbox{doses}$
across all age groups.

## Summary

On 29 September 2022 the Ministry of Health published the report
COVID-19 MORTALITY IN AOTEAROA NEW ZEALAND September 2022.

- <https://www.health.govt.nz/system/files/2022-09/covid-19_mortality_in_aotearoa_inequities_in_risk_september_2022_29_sept.v2.pdf>

Pages 27 and 28 in the Appendix of this report highlight that the
driving variables of *mortality risk* and *case fatality risk* per
100,000 people from 1 January to 26 August 2022 were:

1.  Age Group; and

2.  Any hospital identified co-morbidity.

It should also be noted that the age weightings used to estimate fully
adjusted risk are not provided in the report.

The dashboard data presented above raise questions about why the
regression analyses published by the Ministry of Health simplified the
vaccination status categories, effectively excluding the
$\ge 3\; \mbox{doses}$ category from the regression models.

A further question is why, in light of the evidence provided and data
available to the Ministry of Health, regression models were not
subsequently updated and reported for 2023, 2024 and 2025 using the same
statistical methodology. Applying a consistent methodology across these
years would have allowed the results to be compared over time.

As with Statistics New Zealand’s advice to the Ministry of Health to use
the HSU 2021 dataset, independent statistical analysis of publicly
released data is recommended to assess the methodology, statistical
rigor, and validate the reported findings to evaluate the robustness of
conclusions drawn from the Ministry of Healths underlying proprietary
collected datasets during COVID-19.
