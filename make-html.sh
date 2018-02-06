#!/usr/bin/env bash
pandoc \
    -s \
    --section-divs \
    -o index.html \
    -c index.css \
    --template template.t \
    New-Introductory-Lectures-On-Psycho-Analysis.md
