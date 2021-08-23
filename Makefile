all: resume.html resume.pdf

resume.html: resume.md header.html Makefile
	pandoc --from markdown+auto_identifiers+pandoc_title_block resume.md -o resume.html --section-divs --include-in-header=header.html

resume.pdf: resume.html
	pandoc resume.html --pdf-engine=wkhtmltopdf -o output/resume.pdf

#resume.pdf: resume.md
#	pandoc resume.md --pdf-engine=weasyprint -o output/resume.pdf
