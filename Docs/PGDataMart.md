<a href="../README.md">README</a>

## PG DataMart
PostgreSQL database for web UI. Contains data slices for much more quick data extraction for web queries.

### datamart.Companies
Slice of companies.

Column | Type | Description
--- | --- | ---
companyId | uuid | Id of company.
companyName | text | Name of company.
companyType | text | Type of company: member, carrier, broker
industryId | int | Id of main industry (NAIC code).
industryName | text | Name of main industry.
industryIdOther | int[] | An array of id's of other industries.
industryNameOther | text[] | An array of names of other industries.
locationId | int | Id of main location (MSA code).
locationName | text | Name of main location.
locationIdOther | int[] | An array of id's of other locations.
locationNameOther | text[] | An array of names of other locations.
headcount | int | "Headcount" metric value.
anilineIndex | numeric | Aniline index value.
anilineIndexPrev | numeric | Aniline index previous value.
anilineIndexIncreased | numeric | Increase of aniline index compared to the previous value.
anilineIndexDecreased | numeric | Decrease of aniline index compared to the previous value.
anilineIndexWithin | numeric | Change of aniline index compared to the previous value.
anilineIndexIncreasedPerc | numeric | Increase of aniline index in percentage compared to the previous value.
anilineIndexDecreasedPerc | numeric | Decrease of aniline index in percentage compared to the previous value.
anilineIndexWithinPerc | numeric | Change of aniline index in percentage compared to the previous value.
relatedCompanyList | uuid[] | An array of GUID's of related companies/providers.
relatedCompanyNumber | int | Count of company in relatedCompanyList
products | json[] | Provider's products.
productSubcategories | uuid[] | An array of subcategories of all provider products.
productKeywords | text[] | An array of all keywords of all provider products.
region | uuid[] | An array of id's of company regions.
regionNames | text[] | An array of name's of company regions.
avgHeadcount| numeric | Average headcount value of all my companies.

### datamart.Products
Slice of product-company relations. Таблица содержит все связанные с компанией продукты: если услуга предоставляется через брокера, то будет 2 записи: первая - продукт брокера, вторая - продукт кэриера.

Column | Type | Description
--- | --- | ---
productId | uuid | Id of product.
companyId | uuid | Id of company (member).
providerId | uuid | Id of provider (broker or carrier).
providerType | string | Type of provider: broker, carrier.
subcategoryid | uuid | Id of subcategory.
keywords | text[] | An array of keywords of the product.
productName | text | Product name.
subcategoryName | text | Subcategory name.
categoryName | text | Category name.
imageLink | text | Link to product logo.
heading | text | Text of heading.
description | text | Text of product description.

### datamart.MetricParts
Slice of metricpart-company relations.

Column | Type | Description
--- | --- | ---
metricPartId | uuid | Id of metricpart.
metricName | text | Name of metricpart.
companyId | uuid | Id of company.
companyType | text | Type of company.
currValue | numeric | Curren value of the metricpart.
prevValue | numeric | Previous value of the metricpart.
increased | numeric | На сколько увеличилось значение по сравнению с предыдущим.
decreased | numeric | На сколько уменьшилось значение по сравнению с предыдущим.
within | numeric | На сколько изменилось значени по сравнению с предыдущим.
increasedPerc | numeric | % увеличения значения по сравнению с предыдущим.
decreasedPerc | numeric | % уменьшения значения по сравнению с предыдущим.
withinPerc | numeric | % изменения занчения по сравнению с предыдущим.

### datamart.emailverification
Tokens used for email verification by users.

Column | Type | Description
--- | --- | ---
emailverificationid | uuid | Id of emailverification.
userid | text | Id of user.
token | text | Verification token.
expirationdate | date | Date when until which the token is valid.

### datamart.subcategories
Product areas, categories and subcategories in one dictionary. Is used for "My Provider" page (card view) in HR portal.

Column | Type | Description
--- | --- | ---
subcategoryid | uuid | Id of the subcategory.
subcategoryname | text | Name of the subcategrory.
subcategoryicon | text | Icon of the subcategory.
categoryid | uuid | Id of the category.
categoryname | text | Name of the category.
categoryicon | text | Icon of the category.
productareaid | uuid | Id of the product area.
productareaname | text | Name of the product area.
productareaicon | text | Icon of the product area.

### datamart.companyproducts
List of company with broker + carrier names and carriers' products. It used for "My Brokers" page in HR portal.

Column | Type | Description
--- | --- | ---
companyid | uuid | Id of the subcategory.
brokername | text | Broker name.
carriername | text | Carrier name.
carrierproductname | text | Carrier product name.
carrierid | uuid | Carrier id.
brokerid | uuid | Brokers id.
productid | uuid | Product id.

### datamart.quotes
List of quotes.

Column | Type | Description
--- | --- | ---
quoteid | uuid | Id of the quote.
categoryid | uuid | Id of category of quote.
categoryname | text | Name of category.
contactuid | text | Firebase uid of user who created the quote.
contactname | text | Author's name.
contactemail | text | Author's email.
memberid | uuid | Companyid of author's company.
membername | text | Companyname of author's company.
providerid | uuid | CompanyId of recipient.
providername | text | Companyname of recipient
visible | boolean | Visibility parameter of quote.
status | enum | Status of quote ("sent", "accepted", "rejected")
requesttext | text | Text of quote.
responsetext | text | Text of response to quote
respondedat | timestamp | Time of response.
createdat | timestamp | Time of creation.

### datamart.premiumcompanies
A list of companies who have premium access

Column | Type | Description
--- | --- | ---
companyid | uuid | Id of company.
createdat | timestamp | Timestamp of when a company was given premium.
issueruid | text | Firebase userId of admin who has issued the premium.
