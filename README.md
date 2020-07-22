# Aniline data model
One Paragraph of project description goes here

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.
## General model
Data landscape is represented by few DB's:
* <a href="Data lake.md">Data lake</a> - raw data received from data providers (Demyst, Bintelligent etc);
* <a href="DWH.md">DWH</a> - prepared normalized data model;
* Data mart - data slices, denormalized data best fit to UI;
* Transactional/operational DB;
