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

package v1alpha1

import (
	core "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"kmodules.xyz/resource-metadata/apis/shared"
)

const (
	ResourceKindAzureCredentialManager = "AzureCredentialManager"
	ResourceAzureCredentialManager     = "azurecredentialmanager"
	ResourceAzureCredentialManagers    = "azurecredentialmanagers"
)

// AzureCredentialManager defines the schama for AzureCredentialManager operator installer.

// +genclient
// +genclient:skipVerbs=updateStatus
// +k8s:openapi-gen=true
// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object

// +kubebuilder:object:root=true
type AzureCredentialManager struct {
	metav1.TypeMeta   `json:",inline,omitempty"`
	metav1.ObjectMeta `json:"metadata,omitempty"`
	Spec              AzureCredentialManagerSpec `json:"spec,omitempty"`
}

// AzureCredentialManagerSpec is the schema for Identity Server values file
type AzureCredentialManagerSpec struct {
	//+optional
	NameOverride string `json:"nameOverride"`
	//+optional
	FullnameOverride string `json:"fullnameOverride"`
	//+optional
	RegistryFQDN string         `json:"registryFQDN"`
	ReplicaCount int32          `json:"replicaCount"`
	Image        ImageReference `json:"image"`
	//+optional
	ImagePullSecrets []string `json:"imagePullSecrets"`
	//+optional
	PodAnnotations map[string]string `json:"podAnnotations"`
	//+optional
	PodLabels map[string]string `json:"podLabels"`
	// PodSecurityContext holds pod-level security attributes and common container settings.
	// Optional: Defaults to empty.  See type description for default values of each field.
	// +optional
	PodSecurityContext *core.PodSecurityContext `json:"podSecurityContext"`
	//+optional
	SecurityContext *core.SecurityContext `json:"securityContext"`
	//+optional
	Resources core.ResourceRequirements `json:"resources"`
	//+optional
	NodeSelector map[string]string `json:"nodeSelector"`
	// If specified, the pod's tolerations.
	// +optional
	Tolerations []core.Toleration `json:"tolerations"`
	// If specified, the pod's scheduling constraints
	// +optional
	Affinity *core.Affinity `json:"affinity"`
	// +optional
	LivenessProbe *core.Probe `json:"livenessProbe"`
	// +optional
	ReadinessProbe *core.Probe              `json:"readinessProbe"`
	Service        ServiceSpec              `json:"service"`
	ServiceAccount StaticServiceAccountSpec `json:"serviceAccount"`
	Volumes        []core.Volume            `json:"volumes"`
	VolumeMounts   []core.VolumeMount       `json:"volumeMounts"`
	// +optional
	Distro shared.DistroSpec `json:"distro"`
	// +optional
	Azure      AzureSpec  `json:"azure"`
	Monitoring Monitoring `json:"monitoring"`
	// +optional
	Apiserver AzureCredentialManagerApiserver `json:"apiserver"`
	// +optional
	BucketAccessor AzureBucketAccessor `json:"bucketAccessor"`
}

type AzureSpec struct {
	//+optional
	ClientId string `json:"clientId"`
	//+optional
	TenantId string `json:"tenantId"`
}

type AzureCredentialManagerApiserver struct {
	GroupPriorityMinimum        int             `json:"groupPriorityMinimum"`
	VersionPriority             int             `json:"versionPriority"`
	EnableMutatingWebhook       bool            `json:"enableMutatingWebhook"`
	EnableValidatingWebhook     bool            `json:"enableValidatingWebhook"`
	Ca                          string          `json:"ca"`
	BypassValidatingWebhookXray bool            `json:"bypassValidatingWebhookXray"`
	UseKubeapiserverFqdnForAks  bool            `json:"useKubeapiserverFqdnForAks"`
	Healthcheck                 HealthcheckSpec `json:"healthcheck"`
	ServingCerts                ServingCerts    `json:"servingCerts"`
}

type AzureBucketAccessor struct {
	AzureMaxIntervalSeconds string `json:"azureMaxIntervalSeconds"`
	AzureMaxWaitSeconds     string `json:"azureMaxWaitSeconds"`
}

// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object

// AzureCredentialManagerList is a list of AzureCredentialManagers
type AzureCredentialManagerList struct {
	metav1.TypeMeta `json:",inline"`
	metav1.ListMeta `json:"metadata,omitempty"`
	// Items is a list of AzureCredentialManager CRD objects
	Items []AzureCredentialManager `json:"items,omitempty"`
}
