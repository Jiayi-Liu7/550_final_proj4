all: report.html

.PHONY: docker-run

docker-run:
	@echo "▶ Building Docker image..."
	docker build --platform linux/amd64	-t jiayiliu7/550_final_proj4:latest .
	@echo "▶ Creating report directory..."
	mkdir -p report
	@echo "▶ Rendering report inside container..."
	docker run --rm \
	  -v "$(PWD)/report":/home/rstudio/project/report \
	  jiayiliu7/550_final_proj4:latest
	@echo "✅ Report is ready in ./report"

report.html: DATA550_final_proj.Rmd
	Rscript -e "rmarkdown::render('DATA550_final_proj.Rmd')"

install:
	R -e 'renv::restore()'