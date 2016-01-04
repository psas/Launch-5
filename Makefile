all: site

site: index.markdown
	jekyll build

index.markdown:
	cd data; make
	cd data/launch-overview; make PSAS-launch-5-overview.md
	printf -- "---\nlayout: page\ntitle: Launch 5\ndescription: We launched LV2 with a complete avionics system over 5,000 meters on August 20th 2005, outside of Brothers Oregon.\n---\n\n* Table of Contents\n{:toc}\n\n" | cat - data/launch-overview/PSAS-launch-5-overview.md > index.markdown
	sed -i 's/^!\[\][(]/![](data\/launch-overview\//g' index.markdown
