ccss.css: base-styles.css config
	sed 's|/[*].*[*]/||g;/^\s*$$/d' base-styles.css | tr -d '[[:space:]]' | sed -E 's/;*}/}\n/g' | awk -F'\t' 'FNR!=NR {print} FNR==NR {qs[$$1]=$$2} /^[.][[:alpha:]]/ {rs[i++]=$$0} END {for (q in qs) { print "@media "qs[q]"{"; for (i in rs) print gensub(/[.]([-_[:alpha:]]+)/, "."q"-\\1", "g", rs[i]); print "}"}}' config - | tr -d '\n' > ccss.css
