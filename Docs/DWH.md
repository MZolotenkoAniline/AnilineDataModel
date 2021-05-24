<a href="../README.md">README</a>

# DWH
Main database to collect all about companies, metrics and etc. **BigQuery** database.
## Compnay
Main entity. All records are divided into 3 types: member, broker and provider. The type depends on a source of data. First (member) is an HR. Last two are services providers.

Column | Type | Description
--- | --- | ---
id | string | Unique identifier (GUID/UUID).
name | string | Name.
parentid | string | Identifier of a parent company. There is a child-parent relation between records of Company table. It is assumed company can have a subsidiaries.
type | string | Type of company: "member", "provider", "broker".
info | struct(shortDescription string, description string) | General information about company.
logo | struct (image bytes, link string) | Image, company's logo.
site | string | The website of a company.
location | struct (id int64, name string, city string, state string, otherlocation array(id int64, name string)) | Main location (id, name) of the Company and its secondary locations (ids, names). Location id is MSA code, location name is MSA name.
industry | struct (id int64, name string, otherindustry array(id int64, name string)) | Main industry (id, name) of the Company and its secondary industries (ids, names). Industry id is SIC code, industry name is SIC name.
region | string| Id of the company's region.
created| datetime | Date and time of the record creation.
updated | datetime | Date and time of the record last change.
source | struct(created datetime, updated datetime, id int64, name string, recordId string, ein int64) | Some service information: when created and changed the source record, its id and source name ("member", "carrier", "broker").

## Region
Region dictionary.

Column | Type | Description
--- | --- | ---
id | string | Id of region.
name | string | Name of region

## MetricGroup
Metrics' groups.

Column | Type | Description
--- | --- | ---
id | string | Unique identifier.
name | string | Name.
shortName | string | Short name.

## Metric
Base metrics.

Column | Type | Description
--- | --- | ---
id | string | Unique identifier.
name | string | Name.
description | string | Descripgion of metric.
groupid | string | Id of metric group.
displayType | string | Type of display on the web page.
displayFormat | string | Format of displayed values.
orderNum | int64 | Web UI ordering.

## MetricPart
Parts of metrics.

Column | Type | Description
--- | --- | ---
id | string | Unique identifier.
name | string | Name.
metricid | string | Id of base metric.
shortName | string | Web UI name.

## ProductArea

Products' areas.

Column | Type | Description
--- | --- | ---
id | string | Unique identifier.
name | string | Name.
icon | text | Link to the product area icon.
orderNum | int64 | The sort order in web application.

## Category
Products' category.

Column | Type | Description
--- | --- | ---
id | string | Unique identifier.
name | string | Name.
productAreaId | string | Id of the product area.
icon | text | Link to the category icon.
orderNum | int64 | The sort order in web application.

## Subcategory
Products' subcategory.

Column | Type | Description
--- | --- | ---
id | string | Unique identifier.
name | string | Name.
categoryid | string | Id of category.
keywords | array(string) | Array of default keywords.

## Product
Providers' products.

Column | Type | Description
--- | --- | ---
id | string | Unique identifier.
name | string | Name.
subcategoryid | string | Id of subcategory.
providerid | string | Id of the company (provider or broker).
keywords | array (string) | An array of the product keywords.
logo | string | Path to logo file.
description | string | The product description.

## CompanyProduct
Relations company to brokers' and providers' products.

Column | Type | Description
--- | --- | ---
companyid | string | Id of the company.
brokerproductid | string | Id of the broker's product.
providerproductid | string | Id of the provider's product.

## Location
MSA (Metropolitan statistical area) locations.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier (MSA code).
name | string | Name.
regionid | string | Id of Aniline region.

## Industry
Industries.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier (NAIC code).
name | string | Name.

## Scorecard
Main indicators of companies.

Column | Type | Description
--- | --- | ---
arcdate | date | Archive date.
companyid | string | Id of company.
anilineindex | numeric | Aniline index.
totalrank | int64 | Rank by aniline index (amoung all companies).
industryrank | int64 | Rank by aniline index amount all companies with the same industry.
badge | int64 | Badge.
customersentiment | numeric | Customer sentiment.

## MetricPartValue
Values of metricparts.

Column | Type | Description
--- | --- | ---
arcdate | date | Archive date.
companyid | string | Id of company.
metricpartid | string | Id of metric.
value | numeric | Values.
totalranking | int64 | Company's position according to Aniline index relative to other companies with the same type.
industryranking | int64 | Company's position according to Aniline index relative to other companies with the same type and the same **industry**.
review | int64 | Count of reviews (for sentiment metrics).

## CuratedBrokers
The list of brorkes, which are curated by Aniline.

Column | Type | Description
--- | --- | ---
name | string | Broker's name.
website | string | Broker's website.
bentelid | array(int64) | The list of Bentel data IDs, which related to the broker.
rank | int64 | Rank of the broker (James' algorithm; depends on the broker's product list; affects on broker's priority during linking company with products and brokers).

## CuratedProviders
The list of providers (carriers), which are curated by Aniline.

Column | Type | Description
--- | --- | ---
name | string | Provider's name.
website | string | Provider's website.
bentelid | array(int64) | The list of Bentel data IDs, which related to the provider.

## Video
Video of providers.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier.
companyid | int64 | Id of company.
link | string | Link to video content.

## POC_Company
List of companies for micro POC.

Column | Type | Description
--- | --- | ---
id | int64 | Unique identifier (Bentelligence view ).
Record_ID | string | Record Id (Bentelligence view).
EMPLOYER | string | The compeny name.
ER_HDCT | string | Employee count.
MSA | string | MSA region name.
MSA_NUM | string | MSA region code.
NAIC | string | Industry NAIC code.
site | string | The company website.
row_num | int64 | Order number.
