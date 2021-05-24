<a href="../README.md">README</a>

# Firestore
Main transactional/operational database.

## Collections

### metricparts

Детализированная информация по метрикам.

Column | Type | Description
--- | --- | ---
id | string | Unique identifier.
name | string | Название детализированной части метрики.
shortName | string | Короткое название детализированной части, то название, которое отображается в графиках.
metricName | string | Название самой метрики.
metricId | string | Id метрики.
metricGroupId | string | Id группы метрик (сентимент или people metrics).
metricGroupName | string | Название группы метрик (сентимент или people metrics).
orederNum | int | Order number.
||

### metricgroups

Группы метрик. На момент написание инструкции, все метрики разбиты на 2 группы: **Sentiment** и **People Metrics**.

Column | Type | Description
--- | --- | ---
id | string | Unique identifier.
name | string | Название группы метрик.
||

### subcategories

Подкатегории продуктов.

Column | Type | Description
--- | --- | ---
id | string | Unique identifier.
name | string | Название подкатегории.
categoryid | string | Id категории.
categoryName | string | Название категории.
productAreaId | string | Id сферы.
productAreaName | string | Название сферы.
||

### categories

Категории продуктов.

Column | Type | Description
--- | --- | ---
id | string | Unique identifier.
name | string | Название категории.
productAreaId | string | Id сферы.
productAreaName | string | Название сферы
||

### productareas

Продуктовые сферы (areas).

Column | Type | Description
--- | --- | ---
id | string | Unique identifier.
name | string | Название сферы.
||

### locations

Локации.

Column | Type | Description
--- | --- | ---
id | int | Unique identifier (MSA код).
name | string | Название локации.
||

### industries

Сферы деятельности

Column | Type | Description
--- | --- | ---
id | int | Unique identifier (3-digit NAIC код).
name | string | Название сферы деятельности.
||

### companies

Компании. Также содержит информацию про метрики и сентименты и скор-карту.

Column | Type | Description
--- | --- | ---
arcdate | date | The last update date.
id | string | Id of the company.
name | string | The company name.
logo | string | Path to logo file.
type | string | The company type: company, provider, broker.
site | string | Website of company.
**industry** | collection | The company industry information.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*industry.id* | int | Id of industry (3-digit NAIC code).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*industry.name* | string | Name of industry.
**locationKeys** | array (int) | Массив MSA-кодов локаций.
**locations** | array (struct()) | Массив локаций.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*locations.id* | int | Id локации (MSA-код).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*locations.name* | string | Название локации.
**profile** | collection() | Information about company: description, videos.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*profile.shortDescription* | string | Short description of the company.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*profile.description* | string | Description of the company.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***profile.videos*** | array(string) | Array of link on video files.
**scorecard** | collectoin | Карта компании.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.anilineIndex* | collection | Анилайн индекс.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.anilineIndex.current* | int | Анилайн индекс, текущий.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.anilineIndex.previous* | int | Анилайн индекс предыдущий.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.arcDate* | date | Дата обновления данных.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.badge* | int | Медалька.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.customerSentiment* | int | Пользовательский сентимент.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.industryRank* | collection | Ранг комании в списке компаний в этой же индустрии.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.industryRank.current* | int | Текущий ранг.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.industryRank.previous* | int | Предыдущий ранг.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.industryRank.totalParticipants* | int | Общее количесво компаний в данной индустрии.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.stars* | float | Количество звёздочек - определяется пользовательским сентиментом.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scorecard.totalRank*** | collection | Ранг компании в общем списке компаний.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.totalRank.current* | int | Текущий ранг.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.totalRank.previous* | int | Предыдущий ранг.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scorecard.totalRank.totalParticipants* | int | Общее количество компаний.
**scores** | array(struct()) | Sentiments information.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.id* | string | Metric Id.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.reviews* | int64 | Count of reviews (on which the sentiment value was calculated).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.stars* | numeric | Count of starts regarding to the sentiment values.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.title* | string | Sentiment name.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.value* | numeric | Sentiment value.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.order* | int64 | Display order.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scores.expanded*** | array(struct()) | Array of values for expanded sentiment view.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.expanded.x* | string | Values of x-axis (year + month: YYYY-mm. For example: "2020'09", "2020'08" etc).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.expanded.value* | int64 | Value.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scores.detailed*** | struct() | Content for detailed view.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scores.detailed.overview*** | struct() | Overview.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scores.detailed.overview.header*** | struct() | Header content.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.header.name* | string | Sentiment name.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.header.sentimentScore* | numeric | Sentiment score.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.header.intop* | int64 | "In top x%" indicator.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.header.stars* | numeric | Star rating.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.header.reviews* | int64 | Number of reviews.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.header.lastUpdate* | date | Date of last update.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scores.detailed.overview.distribution*** | array(struct()) | The sentiment distribution.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.distribution.x* | int64 | x-axis values (fixed number of values: 10, 20, 30, ..., 100).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.distribution.value* | numeric | Number of reviews in the corresponding interval.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scores.detailed.overview.comparison*** | struct() | The current sentiment score comparison with other companies.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.comparison.currentValue* | numeric | The current sentiment score value.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scores.detailed.overview.comparison.linechart*** | array(struct()) | The current sentiment score value.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.comparison.linechart.x* | numeric | x-axis value.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.comparison.linechart.value* | numeric | y-axis value.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***scores.detailed.overview.history*** | array(struct()) | History chart (last 24 months; like expanded view).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.history.x* | string | Value of x-axis (year + month: YYYY-mm. For example: "2020'09", "2020'08" etc).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.overview.history.value* | int64 | Value.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.benchmark* | struct() | Benchmark.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.alerts* | struct() | Alerts.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.insights* | struct() | Insights.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*scores.detailed.help* | struct() | Help.
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

### dm_companies

Компании. Коллекция аналогична коллекции companies. Используется для данных для micro POC.

### dm_locations

Локации. Коллекция аналогична коллекции locations. Используется для данных для micro POC.

### dm_industries

Индустрии. Коллекция аналогична коллекции industries. Используется для данных для micro POC.

### market-research

??? Уточнить у коллег dev-команды что это за коллекция.
