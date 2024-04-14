# 550_Final_Project

Final Project for DATA550

This repository contains the code and files for analyzing transportation mode for California residents aged 16 and older commuting to work from 2006 to 2010. The analysis focuses on exploring the risk ratios of various transportation modes among different racial and ethnic groups in California by three selected regions, Bay Area, Butte, and Monterey Bay.

## How to Generate the Final Report

To generate the final report, follow these steps:

1.  Fork and clone this repository

2.  Navigate to the project directory from the terminal

3.  Run the Makefile using the `make` command in your terminal or command prompt (example: `make report.html`)

## Contents of the Report

The final report includes the following sections:

-   Introduction: Provides an overview of the dataset and the aim of the analysis.
-   Descriptive Analysis:
    -   Table One: Displays characteristics of the dataset, including risk ratios of transportation modes by race/ethnicity and region.
    -   Part Two: Includes a scatter plot showing the association between risk ratios of transportation modes and race/ethnicity across different regions in California.

## Code for Creating the Required Table

The code for creating Table One is located in the file `01_make_table1.R` within the `code` folder of the directory. You can also run `make output/table_one.rds` in your terminal.

## Code for Creating the Required Figure

The code for creating the scatter plot is located in the file `02_make_scatter.R` within the `code` folder. You can also run `make output/scatterplot.png` in your terminal. If you would like to create both table one and figure in one step, you can run `make descriptive_analysis` from the terminal.

## Synchronizing Your Package Repository using `renv` package

1\. If `renv` package is not already installed, run `install.packages("renv")` in the console

2\. Set the working directory to the project directory\`

3\. To sync the package repository and install the required packages specified in the renv.lock file, run `make install` from the terminal. This automatically runs `renv::restore()\` .
