all:
	equivs-build mysqldumpextract.control

check:
	lintian --info `ls -1t *deb | head -n 1`

publish:  all check
	reprepro includedeb wheezy `ls -1t *deb | head -n 1`
	git commit -a
