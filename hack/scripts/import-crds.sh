#!/bin/bash

# Copyright AppsCode Inc. and Contributors
#
# Licensed under the AppsCode Community License 1.0.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://github.com/appscode/licenses/raw/1.0.0/AppsCode-Community-1.0.0.md
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

KLUSTER_API_CAPI_OPS_MANAGER_TAG=${KLUSTER_API_CAPI_OPS_MANAGER_TAG:-master}

crd-importer \
    --input=https://github.com/kluster-api/capi-ops-manager/raw/${KLUSTER_API_CAPI_OPS_MANAGER_TAG}/crds/catalog.klusters.dev_capiversions.yaml \
    --out=./charts/capi-catalog/crds

crd-importer \
    --input=https://github.com/kluster-api/capi-ops-manager/raw/${KLUSTER_API_CAPI_OPS_MANAGER_TAG}/crds/catalog.klusters.dev_capiversions.yaml \
    --input=https://github.com/kluster-api/capi-ops-manager/raw/${KLUSTER_API_CAPI_OPS_MANAGER_TAG}/crds/ops.klusters.dev_clusteropsrequests.yaml \
    --out=./charts/capi-ops-manager/crds
