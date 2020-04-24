se Case 2: Enable Helm In Your Cluster
NOTE: This guide assumes that you have Helm v2.x installed in your cluster. Helm v3.x no longer requires Tiller. Check this link for instructions.

Helm v2.x comprises of two parts: a client and a server (Tiller) inside the kube-system namespace. Tiller runs inside your Kubernetes cluster, and manages releases (installations) of your charts. To be able to do this, Tiller needs access to the Kubernetes API. By default, RBAC policies will not allow Tiller to carry out these operations, so we need to do the following:

Create a Service Account tiller for the Tiller server (in the kube-system namespace). As we mentioned before, Service Accounts are meant for intra-cluster processes running in Pods.

Bind the cluster-admin ClusterRole to this Service Account. We will use ClusterRoleBindings as we want it to be applicable in all namespaces. The reason is that we want Tiller to manage resources in all namespaces.

Update the existing Tiller deployment (tiller-deploy) to associate its pod with the Service Account tiller.

The cluster-admin ClusterRole exists by default in your Kubernetes cluster, and allows superuser operations in all of the cluster resources. The reason for binding this role is because with Helm charts, you can have deployments consisting of a wide variety of Kubernetes resources. For instance:

Pods.
PersistentVolumes.
ConfigMaps.
Deployments.
Secrets.
Namespaces.
Replicasets,
Roles.
RoleBindings.
So to make Helm compatible with any existing chart, binding the cluster-admin to the tiller Service Account is the best option. However, if you plan to use a very specific type of Helm chart (for example, one that only creates ConfigMaps, Pods, PersistentVolumes and Secrets), you could create more restrictive RBAC rules.

Step 1: Create The Tiller Service Account
Create a tiller-serviceaccount.yaml file using kubectl:

kubectl create serviceaccount tiller --namespace kube-system

Step 2: Bind The Tiller Service Account To The Cluster-Admin Role
Create a tiller-clusterrolebinding.yaml file with the following contents:

kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: tiller-clusterrolebinding
subjects:
- kind: ServiceAccount
  name: tiller
  namespace: kube-system
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: ""

Deploy the ClusterRoleBinding:

kubectl create -f tiller-clusterrolebinding.yaml

Step 3: Update The Existing Tiller Deployment
Update the existing tiller-deploy deployment with the Service Account you created earlier:

helm init --service-account tiller --upgrade

Wait a few seconds for the Tiller server to be redeployed.

Step 4: Test The New Helm RBAC Rules
All being well, you should be able to execute this command without errors:

helm ls
And that’s it! You have configured Helm RBAC rules in your Kubernetes cluster.