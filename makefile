default : index.html New-Introductory-Lectures-On-Psycho-Analysis.mobi

web.css : styles/index.css styles/html.css
	cat styles/index.css > web.css && cat styles/html.css >> web.css

index.html : New-Introductory-Lectures-On-Psycho-Analysis.md web.css filters/* template.t
	pandoc \
			-s \
			--filter filters/hyphenate.py \
			--section-divs \
			-o index.html \
			-c web.css \
			--template template.t \
			New-Introductory-Lectures-On-Psycho-Analysis.md

ebook.css : styles/index.css styles/epub.css
	cat styles/index.css > ebook.css && cat styles/epub.css >> ebook.css

New-Introductory-Lectures-On-Psycho-Analysis.epub : New-Introductory-Lectures-On-Psycho-Analysis.md  ebook.css filters/* template.t cover.png
	pandoc \
			-s \
			--filter filters/hyphenate.py \
			--section-divs \
			--toc-depth=1 \
			--epub-cover-image cover.png \
			-o New-Introductory-Lectures-On-Psycho-Analysis.epub \
			-c ebook.css \
			--template template.t \
			-t epub3 \
			New-Introductory-Lectures-On-Psycho-Analysis.md

New-Introductory-Lectures-On-Psycho-Analysis.mobi : New-Introductory-Lectures-On-Psycho-Analysis.epub
	kindlegen New-Introductory-Lectures-On-Psycho-Analysis.epub

clean :
	$(RM) index.html ebook.css web.css New-Introductory-Lectures-On-Psycho-Analysis.epub New-Introductory-Lectures-On-Psycho-Analysis.mobi
