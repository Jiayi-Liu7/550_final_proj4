all: report.html

report.html: DATA550_final_proj.Rmd
	Rscript -e "rmarkdown::render('DATA550_final_proj.Rmd')"

install:
	R -e 'renv::restore()'