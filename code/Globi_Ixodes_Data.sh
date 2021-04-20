################################## 
# Author: Katja C. Seltmann
# Email: enicospilus@gmail
# Date: November, 2020
# Purpose: Download data from https://www.globalbioticinteractions.org/ and select rows based on taxonomy or word match
# Data archive: https://doi.org/10.5281/zenodo.3950590
# Live data: https://depot.globalbioticinteractions.org/snapshot/target/data/csv/interactions.csv.gz
# GloBI citation: Jorrit H. Poelen, James D. Simons and Chris J. Mungall. (2014). Global Biotic Interactions: An open infrastructure to share and analyze species-interaction datasets. Ecological Informatics. https://doi.org/10.1016/j.ecoinf.2014.08.005.
# Run in command line from code folder: sh Globi_Ixodes_data.sh
################################## 

################################## 
#PARTS:
# 1. Manually download data from Zenodo. This is a version of the live database. https://doi.org/10.5281/zenodo.3950590
# 2. Using grep, move all records with Ixodes to a new file. 
# 3. Sort unique rows creating a *_data_unique.tsv file for Ixodes
################################## 

echo Creating headers
head -1 ../data/interactions.csv > ../data/Ixodes_data.csv

#find all Ixodes and write one file with all data and a second file only with unique records

echo Finding all Ixodes
cat ../data/interactions.csv | grep -w "Ixodes" >> ../data/Ixodes_data.csv
wc -l ../data/Ixodes_data.csv

echo Sorting unique records
sort -r ../data/Ixodes_data.csv | uniq > ../data/Ixodes_data_unique.csv
wc -l ../data/Ixodes_data_unique.csv
#####################################


#get list of unique interaction types
#cat ../data/Ixodes_data_unique.csv | cut -f 35 | sort -u > ../data/interaction_types.txt

