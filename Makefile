SITEMANIFEST=/etc/puppet/manifests/site.pp
LINTFLAGS=

noop:
	puppet apply $(SITEMANIFEST) --noop

apply:
	puppet apply $(SITEMANIFEST)

lint:
	find . -name '*.pp' -not -path "./modules/stdlib/*" -not -path "./modules/jenkins/*" -print -exec puppet-lint $(LINTFLAGS) '{}' \;
