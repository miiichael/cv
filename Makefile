.PHONY: all clean upload resume resume-html resume-pdf cover

default: resume-html

all:	resume-html resume-pdf cover-html

clean:
	rm output/*

upload:	output/resume.html
	scp -p output/resume.html www:/var/www/www/

# I suppose I could have used variables instead of these alias rules...
resume-html: output/resume.html

resume-pdf: output/resume.pdf

cover-html: output/cover.html

# a convenience alias
resume: resume-html

output/resume-footer.html: Makefile
	echo '<div class="footer">Last updated '$(shell date)'</div>' >$@

output/resume.html: resume.md header.html Makefile output/resume-footer.html
	pandoc --from markdown+auto_identifiers+pandoc_title_block $< -o $@ --section-divs --include-in-header=header.html --include-after-body=output/resume-footer.html

output/resume.pdf: output/resume.html
	pandoc $< --pdf-engine=wkhtmltopdf -o $@

#resume.pdf: resume.md
#	pandoc resume.md --pdf-engine=weasyprint -o output/resume.pdf

output/cover.html: cover.md style-cover.html Makefile
	pandoc --from markdown+auto_identifiers+pandoc_title_block $< -o $@ --section-divs --include-in-header=style-cover.html
