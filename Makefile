all: report.html

report.html: "DATA550_final proj.Rmd"
	Rscript -e "rmarkdown::render('DATA550_final proj.Rmd')"
