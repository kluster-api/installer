/*
Copyright AppsCode Inc. and Contributors

Licensed under the AppsCode Community License 1.0.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://github.com/appscode/licenses/raw/1.0.0/AppsCode-Community-1.0.0.md

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package v1alpha1_test

import (
	"os"
	"testing"

	"go.klusters.dev/installer/apis/installer/v1alpha1"

	sc "kmodules.xyz/schema-checker"
)

func TestDefaultValues(t *testing.T) {
	checker := sc.New(os.DirFS("../../.."),
		sc.TestCase{Obj: v1alpha1.AwsCredentialManagerSpec{}},
		sc.TestCase{Obj: v1alpha1.CapaVpcPeeringOperatorSpec{}},
		sc.TestCase{Obj: v1alpha1.CapiOpsManagerSpec{}},
		sc.TestCase{Obj: v1alpha1.DockerMachineOperatorSpec{}},
	)
	checker.TestAll(t)
}
