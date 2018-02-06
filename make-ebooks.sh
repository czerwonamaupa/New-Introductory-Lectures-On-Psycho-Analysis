#!/usr/bin/env bash
pandoc \
    -s \
    --section-divs \
    --toc-depth=1 \
    --epub-cover-image cover.png \
    -o New-Introductory-Lectures-On-Psycho-Analysis.epub \
    -c index.css \
    --template template.t \
    New-Introductory-Lectures-On-Psycho-Analysis.md

ebook-convert New-Introductory-Lectures-On-Psycho-Analysis.{epub,mobi} --cover cover.png
