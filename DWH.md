## DWH
Main database to collect all about aniline da
### Compnay (subsidiary)
Main entity. Companies, providers and subsidiaries.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier.
name | string | Name.
parentid | int64 | Identifier of a parent company. There is a child-parent relation between records of Company table. It is assumed company can have a subsidiaries.
type | string | Type of company: "company" or "provider". Decided to store all types of customers - hr and providers - in single entity.
info | string | General information about company.
logo | bytes | Image, company's logo.
site | string | The website of a company.
startdate| date | Date from which to take the company into account.
||

### Metric
Metrics.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier.
name | string | Name.
description | string | Descripgion of metric.
groupid | int64 | Id of metric group.
||

### MetricGroup
Metrics' groups.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier.
name | string | Name.
||

### Product
Providers' products.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier.
name | string | Name.
subcategoryid | int64 | Id of subcategory.
||

### Category
Products' category.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier.
name | string | Name.
||

### Subcategory
Products' subcategory.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier.
name | string | Name.
categoryid | int64 | Id of category.
||

### Location
MSA (Metropolitan statistical area) locations.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier.
name | string | Name.
||

### Industry
Industries.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier.
name | string | Name.
||

### Scorecard
Main indicators of companies.

Column | Type | Description
--- | --- | ---
arcdate | date | Archive date.
companyid | int64 | Id of company.
anilineindex | numeric | Aniline index.
totalrank | int64 | Rank by aniline index (amoung all companies).
industryrank | int64 | Rank by aniline index amount all companies with the same industry.
badge | int64 | Badge.
customersentiment | numeric | Customer sentiment.
||

### MetricValues
Values of metrics.

Column | Type | Description
--- | --- | ---
arcdate | date | Archive date.
companyid | int64 | Id of company.
metricid | int64 | Id of metric.
values | array<numeric> | Values.
totalranking | int64 | Rank ...
industryranking | int64 | Rank ...
||

### Video
Video of providers.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier.
providerid | int64 | Id of provider.
video | bytes | Video content.
||

### ProviderToCompany
Relations provider-company.

Column | Type | Description
--- | --- | ---
companyid | int64 | Id of company.
providerid | int64 | Id of provider.
period | struct<fromdate date, tilldate date> | Period when the provider served the company.
||
