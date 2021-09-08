all: output/resume.html output/resume.pdf

output/resume.html: resume.md header.html Makefile
	pandoc --from markdown+auto_identifiers+pandoc_title_block resume.md -o output/resume.html --section-divs --include-in-header=header.html

resume.pdf: resume.html
	pandoc resume.html --pdf-engine=wkhtmltopdf -o output/resume.pdf

#resume.pdf: resume.md
#	pandoc resume.md --pdf-engine=weasyprint -o output/resume.pdf

output/cover.html: cover.md style-cover.html Makefile
	pandoc --from markdown+auto_identifiers+pandoc_title_block cover.md -o output/cover.html --section-divs --include-in-header=style-cover.html
