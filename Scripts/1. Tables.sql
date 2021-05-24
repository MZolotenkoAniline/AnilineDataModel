--drop table DWH.Company;
create table `DWH.Company`
  (
    id        string      not null,
    name      string      not null,
    parentid  string,
    type      string      not null,
    info      struct<shortDescription string, description string>,
    logo      struct<image bytes, link string>,
    site      string,
    location  struct<id int64, name string, city string, state string, otherlocation array<struct<id int64, name string>>>,
    industry  struct<id int64, name string, otherindustry array<struct<id int64, name string>>>,
    region    string,
    created   datetime  not null,
    updated   datetime,
    source    struct<created datetime, updated datetime, id int64, name string, recordid string, ein int64> not null
  );

--  drop table DWH.Region
create table `DWH.Region`
  (
    id        string  not null,
    name      string  not null,
  );

--  drop table DWH.MetricGroup
create table `DWH.MetricGroup`
  (
    id            string     not null,
    name          string      not null,
    shortName     string        not null
  );

--  drop table DWH.Metric
create table `DWH.Metric`
  (
    id            string      not null,
    name          string      not null,
    description   string,
    groupid       string      not null,
    displayType   string,
    displayFormat string,
    orderNum      int64
  );

--  drop table DWH.MetricPart
create table `DWH.MetricPart`
  (
    id            string      not null,
    name          string      not null,
    metricid      string      not null,
    shortName     string      not null,
  );

--  drop table DWH.Category
create table `DWH.Category`
  (
    id            string not null,
    name          string not null
  );

--  drop table DWH.Subcategory
create table `DWH.Subcategory`
  (
    id            string not null,
    name          string not null,
    categoryid    string not null,
    keywords      array<string>
  );

--  drop table DWH.Product
create table `DWH.Product`
  (
    id              string      not null,
    name            string      not null,
    subcategoryid   string      not null,
    companyid       string      not null,
    keywords        array<string>,
    logo            string,
    description     string,
  );

--  ---------------------------------------------------------------------------------------------
--  Связь компании с продуктами
--
--  drop table DWH.CompanyProduct
create table DWH.CompanyProduct
  (
    companyid           string      not null,
    brokreproductid     string,
    providerproductid   string,
  );

--  drop table DWH.Location
create table `DWH.Location`
  (
    id              int64 not null,
    name            string not null,
    regionid        string
  );

--  drop table DWH.Industry
create table `DWH.Industry`
  (
    id    int64 not null,
    name  string not null
  );

--drop table DWH.Scorecard;
create table `DWH.Scorecard`
  (
    arcdate           date      not null,
    companyid         string not null,
    anilineindex      numeric  not null,
    totalrank         int64 not null,
    industryrank      int64 not null,
    badge             int64 not null,
    customersentiment numeric
  );

--  drop table DWH.MetricPartValue
create table `DWH.MetricPartValue`
  (
    arcdate           date  not null,
    companyid         string not null,
    metricpartid      string not null,
    value             numeric,
    totalranking      int64,
    industryranking   int64,
    review            int64,
  );

--  ---------------------------------------------------------------------------------
--
--

--  drop table DWH.Video
create table `DWH.Video`
  (
    id  int64 not null,
    companyid int64 not null,
    link string
  );

--  drop table DWH.ProviderToCompany
/*create table `DWH.ProviderToCompany`
  (
    companyid int64 not null,
    providerid int64 not null,
    period struct<fromdate date, tilldate date> not null
  );
*/
--drop table DWH.ProductToCompany
/*
create table `DWH.ProductToCompany`
  (
    ProductId       int64 not null,
    CompanyId       string not null,
    ProviderId      string,
    BrokerId        string
  );
  */
--  ---------------------------------------------------------------------------------------------
--  Списки курируемых брокеров и провайдеров
--
create table DWH.CuratedBrokers
  (
    name      string  not null,
    website   string  not null,
    bentelId  array<int64>,
    rank      int64,
  );

create or replace table DWH.CuratedProviders
  (
    name    string  not null,
    website string  not null,
    bentelid array<int64>
  );
