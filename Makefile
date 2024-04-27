#Rendering final report
report.html: code/03_render_report.R report.Rmd descriptive_analysis
	Rscript code/03_render_report.R

output/data_clean.rds: code/00_clean_data.R raw_data/transportation_to_work.xlsx
	Rscript code/00_clean_data.R

output/table_one.rds: code/01_make_table1.R output/data_clean.rds
	Rscript code/01_make_table1.R

output/scatterplot.png: code/02_make_scatter.R output/data_clean.rds
	Rscript code/02_make_scatter.R

#Creating just descriptive analysis
.PHONY: descriptive_analysis
descriptive_analysis: output/table_one.rds output/scatterplot.png

#Cleaning project outputs
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html && rm -f report/report.html && rm -f docker_image

#Syncing Packages
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
#Docker rules
PROJECTFILES = report.rmd code/00_clean_data.R code/01_make_table1.R code/02_make_scatter.R code/03_render_report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

#Image Building Docker
docker_image: $(PROJECTFILES) $(RENVFILES) Dockerfile
	docker build -t final .
	touch $@

#Run a Container
report/report.html:
	docker run -v "$$(pwd)/report:/final_project/report" carmensophia/final_project || "/$$(pwd)/report":final_project/report carmensophia/final_project