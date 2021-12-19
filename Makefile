.PHONY: all
all: clean lint package index

.PHONY: lint
lint:
	helm lint charts/*

.PHONY: clean
clean:
	rm *.tgz || true

.PHONY: package
package:
	helm package charts/*

.PHONY: index
index:
	helm repo index --url https://nilpntr.github.io/helm-charts/ --merge index.yaml .
