report.html: code/03_render_report.R report.Rmd descriptive_analysis
	Rscript code/03_render_report.R

output/data_clean.rds: code/00_clean_data.R raw_data/transportation_to_work.xlsx
	Rscript code/00_clean_data.R

output/table_one.rds: code/01_make_table1.R output/data_clean.rds
	Rscript code/01_make_table1.R

output/scatterplot.png: code/02_make_scatter.R output/data_clean.rds
	Rscript code/02_make_scatter.R
	
.PHONY: descriptive_analysis
descriptive_analysis: output/table_one.rds output/scatterplot.png
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html