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

KUBEWARE_CATALOG_TAG=${KUBEWARE_CATALOG_TAG:-master}

crd-importer \
    --input=https://github.com/kubeware/catalog/raw/${KUBEWARE_CATALOG_TAG}/config/crd/bases/catalog.kubeware.dev_elasticsearchbindings.yaml \
    --input=https://github.com/kubeware/catalog/raw/${KUBEWARE_CATALOG_TAG}/config/crd/bases/catalog.kubeware.dev_kafkabindings.yaml \
    --input=https://github.com/kubeware/catalog/raw/${KUBEWARE_CATALOG_TAG}/config/crd/bases/catalog.kubeware.dev_mariadbbindings.yaml \
    --input=https://github.com/kubeware/catalog/raw/${KUBEWARE_CATALOG_TAG}/config/crd/bases/catalog.kubeware.dev_memcachedbindings.yaml \
    --input=https://github.com/kubeware/catalog/raw/${KUBEWARE_CATALOG_TAG}/config/crd/bases/catalog.kubeware.dev_mongodbbindings.yaml \
    --input=https://github.com/kubeware/catalog/raw/${KUBEWARE_CATALOG_TAG}/config/crd/bases/catalog.kubeware.dev_mysqlbindings.yaml \
    --input=https://github.com/kubeware/catalog/raw/${KUBEWARE_CATALOG_TAG}/config/crd/bases/catalog.kubeware.dev_perconaxtradbbindings.yaml \
    --input=https://github.com/kubeware/catalog/raw/${KUBEWARE_CATALOG_TAG}/config/crd/bases/catalog.kubeware.dev_pgbouncerbindings.yaml \
    --input=https://github.com/kubeware/catalog/raw/${KUBEWARE_CATALOG_TAG}/config/crd/bases/catalog.kubeware.dev_postgresbindings.yaml \
    --input=https://github.com/kubeware/catalog/raw/${KUBEWARE_CATALOG_TAG}/config/crd/bases/catalog.kubeware.dev_proxysqlbindings.yaml \
    --input=https://github.com/kubeware/catalog/raw/${KUBEWARE_CATALOG_TAG}/config/crd/bases/catalog.kubeware.dev_redisbindings.yaml \
    --out=./charts/catalog-manager/crds
