<a href="../README.md">README</a>

# DataMart
Slices of data, data marts. Этот набор данных используется для формирования подготовленных (денормализованных) срезов данных, которые будут использоваться в отчетности или для выгрузки данных в другие базы.

>Таблицы с префиксом "fs" - данные для выгрузки в базу Firestore.

## fs_categories
Продуктовые категории.

Column | Type | Description
--- | --- | ---
id | string | Id of category.
name | string | Name of category.
productAreaId | string | Id of product area.
productAreaName | string | Name of product area.

## fs_companies
Компании.

Column | Type | Description
--- | --- | ---
id | string | Id of company.
**industry** | struct() | Company industry.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*industry.id* | int64 | Id of industry.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*industry.name* | string | Name of industry.
**locationKeys** | array (int64) | List of locations' keys.
**locations** | array(struct()) | List of company locations.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*locations.id* | int64 | Id of loction.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*locations.name* | string | Name of location.
logo | string | Path to logo file.
name | string | Company name.
parentid | string | Id of company parent.
**profile** | struct() | Information about company: description, videos.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*profile.shortDescription* | string | Short description of the company.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*profile.description* | string | Description of the company.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***profile.videos*** | array(string) | Array of link on video files.
**scorecard** | struct() | Complex structure of data. Contains information about aniline indexes, sentiments, ranks and so on.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scorecard.anilineIndex*** | struct() | Information about Aniline index.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.anilineIndex.current* | numeric | Current value of Aniline index.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.anilineIndex.previous* | numeric | Previous value of Aniline index.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.arcDate* | date | Date of last update.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.badge* | int64 |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.customerSentiment* | int64 |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.stars* | int64 |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scorecard.industryRank*** | struct() |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.industryRank.current* | int64 |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.industryRank.previous* | int64 |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.industryRank.totalParticipants* | int64 |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scorecard.totalRank*** | struct() |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.totalRank.current* ||
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.totalRank.previous* ||
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.totalRank.totalParticipants* ||
**scores** | array(struct()) | Sentiments information.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.id* | string | Metric Id.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.reviews* | int64 | Count of reviews (on which the sentiment value was calculated).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.stars* | numeric | Count of starts regarding to the sentiment values.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.title* | string | Sentiment name.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.value* | numeric | Sentiment value.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.order* | int64 | Display order.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.intop* | int64 | Value of "In top x%".
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scores.expanded*** | array(struct()) | Array of values for expanded sentiment view.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.expanded.x* | string | Values of x-axis (year + month: YYYY-mm).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.expanded.value* | int64 | Value.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scores.detailed*** | struct() | Content for detailed view.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview* | struct() | Overview.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.benchmark* | struct() | Benchmark.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.alerts* | struct() | Alerts.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.insights* | struct() | Insights.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.help* | struct() | Help.
site | string | Website of company.
arcdate | date | Date of last data update.
type | string | Type of company: company, carrier, broker.
**workforceProfiles** | array(struct) | People metrics information.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*workforceProfiles.anilineindex* | numeric | Aniline index.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*workforceProfiles.id* | string | Metric Id.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*workforceProfiles.sentiment* | numeric | Customer sentiment value.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*workforceProfiles.title* | string | Metric name.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*workforceProfiles.type* | string | Type of graph.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*workforceProfiles.order* | numeric | Ordering number.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*workforceProfiles.format* | string | Displaying format.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***workforceProfiles.value*** | array(struc())| Mertic detailed values (metirc parts).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*workforceProfiles.value.id* | string | Id of metirc part.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*workforceProfiles.value.name* | string | Name of metric part.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*workforceProfiles.value.value* | float | Value of metric part.

## fs_industries
Industries (NAIC).

Column | Type | Description
--- | --- | ---
id | int64 | Id of industry (3-digit NAIC code).
name | string | Name of industry (NAIC).

## fs_locations
Locations (MSA).

Column | Type | Description
--- | --- | ---
id | int64 | Id of location (MSA code).
name | string | Name of location (MSA).
regionid | string | Id of location's region.

## fs_metricgroups
Groups of metrics.

Column | Type | Description
--- | --- | ---
id | string | Id of metirc group.
name | string | Name of metric group.

## fs_metrics
Metrics.

Column | Type | Description
--- | --- | ---
id | string | Id of metirc.
name | string | Name of metric.
description | string | Metric description.
groupid | string | Id of metric group.
displayType | string | Determines the type of graph in web application.
displayFormat | string | Determines displaying format.
orderNum | int64 | Order number.

## fs_metricparts
Детализированные значения метрик.

Column | Type | Description
--- | --- | ---
id | string | Id of metric.
name | string | Name of metric.
shortName | string | Short name, for displaying in graphs.
metricId | string | Id of metric.
metricName | string | Name of metric.
metricGroupId | string | Id of metric group.
metricGroupName | string | Name of metric group.
orderNum | int64 | Order number.

## fs_productareas
Product areas (global categories).

Column | Type | Description
--- | --- | ---
id | string | Id of product area.
name | string | Name of product area.

## fs_subcategories
Product subcategories.

Column | Type | Description
--- | --- | ---
id | string | Id of product area.
name | string | Name of product area.
categoryid | string | Id of category.
castegoryName | string | Name of category.
productAreaId | string | Id of product area.
productAreaName | string | Name of product area.

>Таблицы с префиксом "pg" - данные для выгрузки в базу Postgre SQL.

## pg_datamart_companies
Companies.

Column | Type | Description
--- | --- | ---
companyId | string | Id of company.
companyName | string | Company name.
companyType | string | Company type.
industryId | int64 | Id of company industry.
industryName | string | Name of company industry.
locationId | int64 | Id of company location.
locatsionName | string | Name of company location.
headcount | int64 | Count of employees.
anilineIndex | int64 | Aniline index.
anilineIndexPrev | int64 | Aniline index (previous value)
anilineIndexIncreased | int64 | Increase of aniline index compared to the previous values.
anilineIndexDecreased | int64 | Decrease of aniline index compared to the previous values.
anilineIndexWithin | int64 | Change of aniline index compared to the previous values.
anilineIndexIncreasedPerc | numeric | Increase of aniline index in percentage compared to the previous values.
anilineIndexDecreasedPerc | numeric | Decreate of aniline index in percentage compared to the previous values.
anilineIndexWithinPerc | numeric | Change of aniline index in percentage compared to the previous values.
relatedCompanyList | string | String of related companies with ";" delimiter.
relatedCompanyNumber | int64 | Count of related companies.
productSubcategories | string | String of products subcategories with ";" delimiter.
productKeywords | string |  String of products keywords with ";" delimiter.
region | string | Id of company aniline region.
regionNames | string | Name of company aniline region.
avgHeadcount | numeric | Average headcount by all related companies of provider.

## pg_datamart_metricparts
Metrics.

Column | Type | Description
--- | --- | ---
metricPartId | string | Id of metric.
metricName | string | Name of metric.
companyId | string | Id of company.
companytype | string | Type of company.
currValue | numeric | Current metric value.
prevValue | numeric | Previous metric value.
increased | numeric | Increase in value.
decreased | numeric | Decreate in value.
within | numeric |
increasedPerc | numeric | Increase in value in percent.
decreasedPerc | numeric | Decrease in value in percent.
withinPerc | numeric |

## pg_datamart_products
Products. Таблица содержит все связанные с компанией продукты: если услуга предоставляется через брокера, то будет 2 записи: первая - продукт брокера, вторая - продукт кэриера.

Column | Type | Description
--- | --- | ---
companyid | string | Id of company.
productid | string | Id of product.
subcategoryid | string | Id of product subcategory.
keywords | string | String of keywords with ";" delimiter.
productName | string | Product name.
subcategoryName | string | Subcategory name.
categoryName | string | Category name.
imageLink | text | Link to product logo.
