
index.markdown:
	cd data; make
	cd data/launch-overview; make PSAS-launch-5-overview.md
	printf -- "---\nlayout: page\ntitle: Launch 5\n---\n\n\n" | cat - data/launch-overview/PSAS-launch-5-overview.md > index.markdown
