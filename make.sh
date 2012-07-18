#!/bin/bash

# generate resume from xml / xslt
java -jar ~/bin/saxon9he.jar -t resume/ResumeHarlanWood.xml resume/ResumeToHtml.xsl > resume/index.html

# Use Jekyll to generate most of site:
rm -rf _site && jekyll --pygments
                                       
