# AGENTS.md

This file provides guidance to coding agents (e.g. Claude Code, claude.ai/code) when working with code in this repository.

## Repository purpose

Go module `go.klusters.dev/installer` — Helm charts and supporting tooling for installing the Kluster API stack (the kluster.dev family of Cluster API helpers). It also exposes a Go API package describing chart values so other kluster.dev components can consume strongly typed installation parameters.

Charts shipped:
- `charts/aws-credential-manager`, `charts/azure-credential-manager`, `charts/gcp-credential-manager` — per-cloud credential operators.
- `charts/capa-vpc-peering-operator` — CAPA VPC peering operator.
- `charts/capi-catalog` — Cluster API catalog (versions, presets metadata).
- `charts/capi-ops-manager` — `ClusterOpsRequest` operator.
- `charts/docker-machine-operator` — Docker Machine operator.

## Architecture

- `charts/` — one subdirectory per Helm chart. Each has `Chart.yaml`, `values.yaml`, `templates/`, plus generated artifacts `doc.yaml`, `README.md`, and (where applicable) `values.openapiv3_schema.yaml` and `crds/`.
- `apis/installer/v1alpha1/` — Go types backing the chart values. Used both for OpenAPI/values-schema generation and as a typed surface for downstream programs. Single API group: `installer:v1alpha1`.
  - `register.go`, `install/`, `fuzzer/` — standard k8s scheme registration and round-trip fuzz helpers.
- `catalog/imagelist.yaml` — image catalog source of truth; the `kmodules.xyz/image-packer` tooling consumes it.
- `hack/scripts/` — codegen / release helpers:
  - `update-catalog.sh` — regenerate `catalog/` from `imagelist.yaml`.
  - `update-chart-dependencies.sh` — refresh `Chart.lock` / subchart pins.
  - `import-crds.sh` — pull CRDs from dependent kluster.dev repos into each chart's `crds/`.
  - `update-local-repo.sh` — refresh local helm repo metadata.
  - `ct.sh` — wrap chart-testing.
  - `open-pr.sh`, `trigger.sh`, `update-release-tracker.sh` — release bookkeeping.
- `tests/` — chart-testing (`ct`) configuration.
- `lintconf.yaml` — YAML lint config consumed by `ct`.
- `vendor/` — checked-in Go deps.

## Common commands

All Make targets run inside the `ghcr.io/appscode/golang-dev` Docker image — Docker must be running.

- `make gen` — regenerate everything: `codegen manifests`.
- `make codegen` — regenerate clientset only.
- `make manifests` — `gen-crds gen-schema gen-chart-doc`.
- `make gen-values-schema` (alias `gen-schema`) — regenerate `values.openapiv3_schema.yaml` from `apis/installer/v1alpha1`.
- `make gen-chart-doc` — regenerate per-chart `README.md` (one target per chart subdir under `charts/`).
- `make update-charts` — refresh chart-level metadata across all charts.
- `make update-local-repo` — refresh local helm repo metadata.
- `make fmt` — gofmt + goimports.
- `make lint` — golangci-lint.
- `make unit-tests` / `make test` — Go unit tests.
- `make ct` — `chart-testing` lint+test.
- `make verify` — `verify-gen verify-modules`; `go mod tidy && go mod vendor` must leave the tree clean.
- `make add-license` / `make check-license` — manage license headers.

Auxiliary helpers (invoked directly):

- `./hack/scripts/update-catalog.sh` — regenerate `catalog/` from `imagelist.yaml`.
- `./hack/scripts/import-crds.sh` — pull CRDs from dependent kluster.dev repos into the chart `crds/` dirs.

Run a single Go test (requires a local Go toolchain):

```
go test ./apis/installer/v1alpha1/... -run TestName -v
```

## Conventions

- Module path is `go.klusters.dev/installer` (vanity URL); imports must use that.
- Edit `apis/installer/v1alpha1/*_types.go` to change a chart's values surface, then run `make gen` so `values.openapiv3_schema.yaml`, the generated clientset, and per-chart `README.md` stay in sync. Do not hand-edit `zz_generated.*.go`, generated chart `README.md` files, `values.openapiv3_schema.yaml`, or anything under `catalog/` except `imagelist.yaml`.
- License: `LICENSE.md` (AppsCode); use `make add-license` to apply headers to new Go files.
- Sign off commits (`git commit -s`); contributions follow the project's DCO requirement.
- Vendor directory is checked in — `go mod tidy && go mod vendor` must leave the tree clean (enforced by `verify-modules`).
- Adding a new chart: create `charts/<name>/` following the existing layout, add it to `imagelist.yaml` if it ships images, and re-run `make gen` so its values schema and README appear.
- CRDs for a chart are **imported** from the upstream operator repo via `import-crds.sh`; do not hand-author `charts/*/crds/*.yaml`.
