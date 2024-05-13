# Inbox Agent

[Inbox Agent by AppsCode](https://github.com/ops-center/capi-ops-manager) - Inbox Agent by AppsCode

## TL;DR;

```bash
$ helm repo add appscode https://charts.appscode.com/stable/
$ helm repo update
$ helm search repo appscode/capi-catalog --version=0.1.0
$ helm upgrade -i capi-catalog appscode/capi-catalog -n kubeops --create-namespace --version=0.1.0
```

## Introduction

This chart deploys Inbox Agent on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.21+

## Installing the Chart

To install/upgrade the chart with the release name `capi-catalog`:

```bash
$ helm upgrade -i capi-catalog appscode/capi-catalog -n kubeops --create-namespace --version=0.1.0
```

The command deploys Inbox Agent on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall the `capi-catalog`:

```bash
$ helm uninstall capi-catalog -n kubeops
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `capi-catalog` chart and their default values.

|    Parameter     | Description |     Default     |
|------------------|-------------|-----------------|
| nameOverride     |             | <code>""</code> |
| fullnameOverride |             | <code>""</code> |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm upgrade -i`. For example:

```bash
$ helm upgrade -i capi-catalog appscode/capi-catalog -n kubeops --create-namespace --version=0.1.0 --set -- generate from values file --
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```bash
$ helm upgrade -i capi-catalog appscode/capi-catalog -n kubeops --create-namespace --version=0.1.0 --values values.yaml
```
