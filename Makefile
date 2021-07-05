.PHONY: all
all: lint package index

.PHONY: lint
lint:
	helm lint charts/*

.PHONY: package
package:
	helm package charts/*

.PHONY: index
index:
	helm repo index --url https://nilpntr.github.io/helm-charts/ --merge index.yaml .
