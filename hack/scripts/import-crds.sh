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

KOMPUTE_MACHINE_OPERATOR_TAG=${KOMPUTE_MACHINE_OPERATOR_TAG:-master}

crd-importer \
    --input=https://github.com/kompute/machine-operator/raw/${KOMPUTE_MACHINE_OPERATOR_TAG}/config/crd/bases/dockermachine.kompute.dev_drivers.yaml \
    --input=https://github.com/kompute/machine-operator/raw/${KOMPUTE_MACHINE_OPERATOR_TAG}/config/crd/bases/dockermachine.kompute.dev_machines.yaml \
    --out=./charts/dockermachine-operator/crds
