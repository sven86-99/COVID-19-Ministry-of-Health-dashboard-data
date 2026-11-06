# COVID-19-Ministry-of-Health-dashboard-data

Dashboard data collected from Ministry of Health website between 11 February 2022 and 18 February 2024


## Deaths by Vaccination Status in New Zealand

The deaths dataset provided in [`covid_healthdata.xlsx`](https://github.com/sven86-99/COVID-19-Ministry-of-Health-dashboard-data/blob/main/covid_healthdata.xlsx) additionally contains explanatory variables for _Age group_, and _Vaccination Status_.

<img src="report_files/figure-gfm/plot_deaths-1.png" />


## Validation against New Zealand Royal Commission COVID-19 data

The Royal Commission remit did not investigate vaccine effectiveness, as a consequence data
was presented as a cumulative count of all COVID-19 Deaths within 28 days of being reported
as a COVID-19 case.

When aggregated across *Age group* and *Vaccination Status*, this dataset produces mortality figures that closely correspond to [__mortality data__](https://www.covid19lessons.royalcommission.nz/assets/Uploads/figure020-data-v2.csv)  published in Figure 20 of the NZ Royal Commission [__COVID-19 by the Numbers__](https://www.covid19lessons.royalcommission.nz/reports-lessons-learned/covid-19-by-the-numbers/figures-and-tables) report.

<img src="report_files/figure-gfm/plot_rcdataset-1.png" />

## Summary

This data collected in [`covid_healthdata.xlsx`](https://github.com/sven86-99/COVID-19-Ministry-of-Health-dashboard-data/blob/main/covid_healthdata.xlsx) provides information around Cases, Hospitalization, and Deaths by Vaccination Status
which the Ministry of Health publicly disclosed on its website which is not in concordance with their
own subsequent publications. On 29 September 2022 the Ministry of Health published the report
`COVID-19 MORTALITY IN AOTEAROA NEW ZEALAND September 2022`.

* https://www.health.govt.nz/system/files/2022-09/covid-19_mortality_in_aotearoa_inequities_in_risk_september_2022_29_sept.v2.pdf


Pages 27 and 28 in the Appendix of this report highlight that the driving variables of _mortality risk_ and
_case fatality risk_ per 100,000 people from 1 January to 26 August 2022 were:

1. Age Group; and

2. Any hospital identified co-morbidity.

The dashboard data presented above raise questions about why the regression analyses in the
Ministry of Health report [COVID-19 MORTALITY IN AOTEAROA NEW ZEALAND September 2022](https://www.health.govt.nz/system/files/2022-09/covid-19_mortality_in_aotearoa_inequities_in_risk_september_2022_29_sept.v2.pdf)
simplified the vaccination status categories, effectively excluding the
__≥3 doses__ category from the regression models.

A further question is why, in light of the evidence provided and data available to the
Ministry of Health, regression models were not subsequently updated and reported for
2023, 2024 and 2025 using the same statistical methodology. Applying a consistent methodology
across these years would have allowed the results to be compared over time.

As with Statistics New Zealand’s advice to the Ministry of Health to use the HSU 2021 dataset,
independent statistical analysis of publicly released data is recommended to assess the methodology,
statistical rigor, and validate the reported findings to evaluate the robustness of conclusions drawn from the Ministry of Healths underlying proprietary collected datasets during COVID-19.

This evidence, drawn from the Ministry of Health’s publicly available dashboard data,
raises significant questions about the rationale for excluding comparisons of health outcomes
between vaccinated and unvaccinated populations from the remit of the 
_[Royal Commission of Inquiry into COVID-19 Lessons Learned (Phase One and Phase Two)](https://www.covid19lessons.royalcommission.nz)_

## Contents


| Document      | Reference                                                                                               |
|---------------|---------------------------------------------------------------------------------------------------------|
| Source code   | https://github.com/sven86-99/COVID-19-Ministry-of-Health-dashboard-data/blob/main/report.Rmd            |
| Markdown      | https://github.com/sven86-99/COVID-19-Ministry-of-Health-dashboard-data/blob/main/report.md             |
| pdf report    | https://github.com/sven86-99/COVID-19-Ministry-of-Health-dashboard-data/blob/main/report.pdf            |
| Excel dataset | https://github.com/sven86-99/COVID-19-Ministry-of-Health-dashboard-data/blob/main/covid_healthdata.xlsx |


Scalable vector graphic copies of graphs under [svg](https://github.com/sven86-99/COVID-19-Ministry-of-Health-dashboard-data/tree/main/svg) sub directory

```
svg
├── cases.svg
├── deaths.svg
├── hospitalization.svg
├── ICU.svg
├── log_cases.svg
├── log_hospitalization.svg
└── log_ICU.svg
```
