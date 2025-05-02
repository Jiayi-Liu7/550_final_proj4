all: report.html

.PHONY: docker-run

docker-run:
	@echo "▶ Pulling Docker image…"
	docker pull --platform linux/amd64 jiayiliu7/550_final_proj4:latest
	@echo "▶ Rendering report (using host files)…."
	docker run --rm \
	  -v "$(PWD)/report":/home/rstudio/project/report \
	  -w /home/rstudio/project \
	  jiayiliu7/550_final_proj4:latest \
	  Rscript -e "rmarkdown::render('DATA550_final_proj.Rmd', output_dir='report')"
	@echo "✅ Report is ready in ./report"

report.html: DATA550_final_proj.Rmd
	Rscript -e "rmarkdown::render('DATA550_final_proj.Rmd', output_dir='report')"

install:
	R -e 'renv::restore()'