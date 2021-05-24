# Aniline data model
The project describes the data landscape of Aniline Service.

## General model
The data landscape is represented by a few layers:
* <a href="Docs/DataLake.md">Data Lake</a> - raw data received from data providers (Demyst, Bentelligence etc);
* <a href="Docs/DWH.md">DWH</a> - prepared normalized data model;
* <a href="Docs/DataMart.md">Data Mart</a> - data slices, denormalized data best fit to UI;
* <a href="Docs/FS.md">FS</a> - transactional/operational DB;
* <a href="Docs/PGDataMart.md">Postgre SQL datamart.</a>

#### <a href="https://app.diagrams.net/#G19FF3plWQwnvTChL08UDJsYsW722v7RZs">Drawio schema</a>
