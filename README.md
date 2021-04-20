## Global Biotic Interactions Workshop, April 2021


[```Workshop Description```](#Workshop-Description) / [```Ixodes Demonstration```](#Ixodes-Demonstration) 


### Workshop Description

####A Practical Exploration of Biotic Interaction Data Management and Information Retrieval through Terrestrial Parasite Tracker (TPT, https://parasitetracker.org) and Global Biotic Interactions (GloBI, https://globalbioticinteractions.org)

28 April 2021 11:00-13:00 Pacific

Jorrit Poelen, Katja Seltmann

During this participatory workshop collection managers, researchers or data providers will use GloBI for data management and information retrieval. Our group exploration into the data will cover the data origins and data integration process and data products.

This workshop is open to anyone interested in biotic or species interaction data even if you are presently not using GloBI. We will highlight data from the Terrestrial Parasite Tracker project, but the methods are available for anyone interested in biotic interactions (https://www.globalbioticinteractions.org/sources). 

The proposed outcome of this workshop is a reusable Carpentries (https://carpentries.org) lesson and improved documentation on methods to integrate and access biotic interaction data. We will work together through a series of exploratory data exercises. No programming experience is required, and you will use your own device to download data and create Google Sheets. Everyone will contribute during this workshop.


### Ixodes Demonstration

1 - Navigate to the https://www.globalbioticinteractions.org/data page. What ways exist to get the data and what are the differences?
![GloBI Data Page](/photos/data.png)

2 - How many records are in the GloBI dataset (interactions.tsv-snapshot)
> wc -l interactions.csv

3 - Extract and make a file of only the Ixodes records using Globi_Ixodes_Data.sh script. Explain that .sh will help reducde size of dataset than can use R. This will take ~ 4 minutes and 12 seconds!
> sh Globi_Ixodes_data.sh

4  - How many records are in the trimmed GloBI datasets? Is there a difference between unique and not?
> wc -l Ixodes_data.csv

> wc -l Ixodes_data_unique.csv

5 - Load trimmed dataset into R using R-studio
> [html preview](https://htmlpreview.github.io/?https://github.com/seltmann/globi-workshop-2021/blob/main/code/globi-example.html)

6 - Put entire dataset into SQLlite database
![GloBI Data Page](/photos/sql.png)
> sqlite3 globi.db

> .mode csv

> .import Ixodes_data_unique.csv interactions

> PRAGMA table_info(interactions);

> SELECT sourceTaxonGenusName, count(sourceTaxonGenusName) FROM interactions group by sourceTaxonGenusName;

> SELECT interactionTypeName, count(interactionTypeName) FROM interactions group by interactionTypeName;

> .exit



