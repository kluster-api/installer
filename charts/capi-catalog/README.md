# CAPI catalog

[CAPI catalog by AppsCode](https://github.com/ops-center/capi-ops-manager) - CAPI catalog by AppsCode

## TL;DR;

```bash
$ helm repo add appscode https://charts.appscode.com/stable/
$ helm repo update
$ helm search repo appscode/capi-catalog --version=v2024.7.9
$ helm upgrade -i capi-catalog appscode/capi-catalog -n kubeops --create-namespace --version=v2024.7.9
```

## Introduction

This chart deploys CAPI catalog on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.21+

## Installing the Chart

To install/upgrade the chart with the release name `capi-catalog`:

```bash
$ helm upgrade -i capi-catalog appscode/capi-catalog -n kubeops --create-namespace --version=v2024.7.9
```

The command deploys CAPI catalog on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall the `capi-catalog`:

```bash
$ helm uninstall capi-catalog -n kubeops
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `capi-catalog` chart and their default values.

|       Parameter       | Description |            Default             |
|-----------------------|-------------|--------------------------------|
| nameOverride          |             | <code>""</code>                |
| fullnameOverride      |             | <code>""</code>                |
| proxies.dockerHub     |             | <code>""</code>                |
| proxies.dockerLibrary |             | <code>""</code>                |
| proxies.ghcr          |             | <code>ghcr.io</code>           |
| proxies.kubernetes    |             | <code>registry.k8s.io</code>   |
| proxies.microsoft     |             | <code>mcr.microsoft.com</code> |
| proxies.appscode      |             | <code>r.appscode.com</code>    |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm upgrade -i`. For example:

```bash
$ helm upgrade -i capi-catalog appscode/capi-catalog -n kubeops --create-namespace --version=v2024.7.9 --set proxies.ghcr=ghcr.io
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```bash
$ helm upgrade -i capi-catalog appscode/capi-catalog -n kubeops --create-namespace --version=v2024.7.9 --values values.yaml
```
