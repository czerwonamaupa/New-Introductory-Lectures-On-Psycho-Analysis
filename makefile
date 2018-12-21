default : index.html ebooks/New-Introductory-Lectures-On-Psycho-Analysis.mobi

index.html : New-Introductory-Lectures-On-Psycho-Analysis.md styles/index.css styles/html.css filters/* template.t
	pandoc \
			-s \
			--filter filters/hyphenate.py \
			--section-divs \
			-o index.html \
			-c styles/index.css \
			-c styles/html.css \
			--template template.t \
			New-Introductory-Lectures-On-Psycho-Analysis.md

styles/ebook.css : styles/index.css styles/epub.css
	cat styles/index.css > styles/ebook.css && cat styles/epub.css >> styles/ebook.css

ebooks/New-Introductory-Lectures-On-Psycho-Analysis.epub : New-Introductory-Lectures-On-Psycho-Analysis.md  styles/ebook.css filters/* template.t cover.png
	pandoc \
			-s \
			--filter filters/hyphenate.py \
			--section-divs \
			--toc-depth=1 \
			--epub-cover-image cover.png \
			-o ebooks/New-Introductory-Lectures-On-Psycho-Analysis.epub \
			-c styles/ebook.css \
			--template template.t \
			-t epub3 \
			New-Introductory-Lectures-On-Psycho-Analysis.md

ebooks/New-Introductory-Lectures-On-Psycho-Analysis.mobi : ebooks/New-Introductory-Lectures-On-Psycho-Analysis.epub
	kindlegen ebooks/New-Introductory-Lectures-On-Psycho-Analysis.epub

clean :
	$(RM) ebooks/* index.html styles/ebook.css
