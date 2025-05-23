/*
Copyright 2023 The KubeStellar Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package vcluster

import (
	"context"
	"fmt"

	"github.com/kubestellar/kubeflex/pkg/util"
	corev1 "k8s.io/api/core/v1"
	apierrors "k8s.io/apimachinery/pkg/api/errors"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/util/intstr"
	"sigs.k8s.io/controller-runtime/pkg/client"
	"sigs.k8s.io/controller-runtime/pkg/controller/controllerutil"

	tenancyv1alpha1 "github.com/kubestellar/kubeflex/api/v1alpha1"
)

const (
	TargetPort = 8443
)

func (r *VClusterReconciler) ReconcileNodePortService(ctx context.Context, hcp *tenancyv1alpha1.ControlPlane) error {
	namespace := util.GenerateNamespaceFromControlPlaneName(hcp.Name)

	// create service object
	service := &corev1.Service{
		ObjectMeta: metav1.ObjectMeta{
			Name:      util.VClusterNodePortServiceName,
			Namespace: namespace,
		},
	}

	err := r.Client.Get(ctx, client.ObjectKeyFromObject(service), service, &client.GetOptions{})
    if err != nil {
        if apierrors.IsNotFound(err) {
            service := generateNodePortService(util.VClusterNodePortServiceName, namespace)
            if err := controllerutil.SetControllerReference(hcp, service, r.Scheme); err != nil {
                return fmt.Errorf("failed to SetControllerReference: %w", err)
            }
            if err = r.Client.Create(ctx, service, &client.CreateOptions{}); err != nil {
                if util.IsTransientError(err) {
                    return err // Retry transient errors
                }
                return fmt.Errorf("failed to create service: %w", err)
            }
        } else if util.IsTransientError(err) {
            return err // Retry transient errors
        } else {
            return fmt.Errorf("failed to get service: %w", err)
        }
    }
    return nil
}

func generateNodePortService(name, namespace string) *corev1.Service {
	return &corev1.Service{
		ObjectMeta: metav1.ObjectMeta{
			Name:      name,
			Namespace: namespace,
		},
		Spec: corev1.ServiceSpec{
			Selector: map[string]string{
				"app":     "vcluster",
				"release": "vcluster",
			},
			Type: corev1.ServiceTypeNodePort,
			Ports: []corev1.ServicePort{
				{
					Port:       443,
					Name:       "https",
					Protocol:   "TCP",
					TargetPort: intstr.FromInt(TargetPort),
				},
			},
		},
	}
}
