# Final Project 4: Analysis of Tobacco Use Objectives

This repository contains the final project for DATA550, which analyzes the Healthy People 2020 Tobacco Use Objectives dataset.

## Repository Structure

- **DATA550_final proj.Rmd:** The main R Markdown file containing the data analysis and visualizations
- **Makefile:** Contains a rule to build the final HTML report
- **data/Healthy_People_2020_Tobacco_Use_Objectives_20250128.csv:** The dataset
- **Dockerfile:** Defines a Docker image that can render the R Markdown reproducibly
- **README.md:** This file, explaining the repository and how to generate the report

## Local Build (no Docker)

To generate the HTML report via your local R installation:
```bash
make
```

### 1. Dockerhub image

This image is published as:  
```bash
docker pull jiayiliu7/550_final_proj4:latest
```

→ https://hub.docker.com/r/jiayiliu7/550_final_proj4

### 2. One-step via Makefile

```bash
make docker-run
```

 ### 3. Direct Docker commands

```bash
# build image
docker build --platform linux/amd64 -t jiayiliu7/550_final_proj4:latest .

# ensure report folder exists
mkdir -p report

# run container and render
docker run --rm \
  -v "$(pwd)/report":/home/rstudio/project/report \
  jiayiliu7/550_final_proj4:latest
```


## Code Overview: Tables and Figures

### Tables
1. **Objective Status Summary Table** (`table(data_clean$Objective_Status)`)
   - Created in Data Cleaning section
   - Shows count of objectives in each status category

2. **Regression Results Table** (`summary(lm_model)`)
   - Created in Statistical Analysis section
   - Displays linear model coefficients and statistics

### Figures
1. **Figure 1: Progress Toward Objectives** (`progress-plot`)
   - Bar chart showing distribution of objective statuses
   - Code chunk: Visualization > Progress Toward Objectives

2. **Distribution of Baseline Rates** (`baseline-distribution`)
   - Histogram of baseline tobacco use rates
   - Code chunk: Visualization > Distribution of Baseline Tobacco Use Rates

3. **Baseline Rates by Status** (`baseline-boxplot`)
   - Box plot comparing baseline rates across objective statuses
   - Code chunk: Visualization > Baseline Tobacco Use Rates by Objective Status

4. **Objective Status Proportions** (`objective-status-pie`)
   - Pie chart showing proportion of objectives in each status
   - Code chunk: Visualization > Proportion of Objectives by Status

5. **Baseline vs Target Rates** (`baseline-vs-target`)
   - Scatter plot comparing baseline and target values
   - Code chunk: Visualization > Baseline vs. Target Tobacco Use Rates

## Dependencies
- tidyverse (for data manipulation and visualization)
- knitr (for report generation)
- rmarkdown (for rendering the document)

All analyses were conducted in R version 4.3.0 or later.