{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "capa-vpc-peering-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "capa-vpc-peering-operator.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "capa-vpc-peering-operator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "capa-vpc-peering-operator.labels" -}}
helm.sh/chart: {{ include "capa-vpc-peering-operator.chart" . }}
{{ include "capa-vpc-peering-operator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "capa-vpc-peering-operator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "capa-vpc-peering-operator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "capa-vpc-peering-operator.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "capa-vpc-peering-operator.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Returns the appscode license
*/}}
{{- define "appscode.license" -}}
{{- .Values.license }}
{{- end }}

{{/*
Returns the registry used for operator docker image
*/}}
{{- define "image.registry" -}}
{{- list .Values.registryFQDN .Values.image.registry | compact | join "/" }}
{{- end }}

{{- define "appscode.imagePullSecrets" -}}
{{- with .Values.imagePullSecrets -}}
imagePullSecrets:
{{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}

{{/*
Returns the enabled monitoring agent name
*/}}
{{- define "monitoring.agent" -}}
{{- .Values.monitoring.agent }}
{{- end }}

{{/*
Returns whether the ServiceMonitor will be labeled with custom label
*/}}
{{- define "monitoring.apply-servicemonitor-label" -}}
{{- ternary "false" "true" ( empty .Values.monitoring.serviceMonitor.labels ) -}}
{{- end }}

{{/*
Returns the ServiceMonitor labels
*/}}
{{- define "monitoring.servicemonitor-label" -}}
{{- range $key, $val := .Values.monitoring.serviceMonitor.labels }}
{{ $key }}: {{ $val }}
{{- end }}
{{- end }}
