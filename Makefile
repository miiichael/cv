resume.html: resume.md header.html Makefile
	pandoc --from markdown+auto_identifiers+pandoc_title_block resume.md -o resume.html --section-divs --include-in-header=header.html
