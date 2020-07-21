# Demo scripts for Pure Service Orchestrator™ Explorer

Pure Service Orchestrator™ Explorer (PSO Explorer) provides a unified view into storage, empowering Kubernetes admins and storage admins with 360-degree container storage visibility. The collection of scripts in this repo allow you to demonstrate some of the features of PSO Explorer.

## What does the demo do?

This demo provides a set of scripts and YAML files which can be used to install [PSO](https://github.com/purestorage/helm-charts/), [PSO Explorer](https://github.com/PureStorage-OpenConnect/pso-explorer) and optionally [Metal LoadBalancer](https://metallb.universe.tf/). In addition it privides a script to deploy some workloads on the Kubernetes cluster.

## Software Pre-Requisites
You need to following:
- [Kubernetes](https://kubernetes.io/) 1.13+
- [Helm3](https://helm.sh/)

You do not need to have PSO or PSE Explorer installed on the cluster.

# Scripts

## Prepare to use the scripts
The scripts are ready to use, however you should check the `values-good.yaml` configuration file, if you are going to use the install/upgrade scripts for PSO.

```
vi values-good.yaml
```


## Script library

| Script                                      | Description                                                                                                                                                |
|------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `install-pso-explorer.sh` | Script to install Pure Service Orchestrator™ Explorer on your Kubernetes cluster. PSO does not have to be installed. If you want to use a LoadBalancer to access PSO Explorer and don't have a Load Balancer installed on your cluster, also check out `metallb/install-metallb.sh` |
| `install-pso-good.sh` | Script to install Pure Service Orchestrator™ on your cluster with a good configuration. Make sure you add your own FlashArray / FlashBlade credentials to `values-good.yaml`. |
| `install-pso-bad.sh` | Script to install Pure Service Orchestrator™ on your cluster with a faulty configuration, which will allow you to show the YAML verification feature of PSO Explorer. |
| `upgrade-pso-good.sh` | Script to upgrade Pure Service Orchestrator™ configuration to a working configuration. Make sure you add your own FlashArray / FlashBlade credentials to `values-good.yaml`. |
| `upgrade-pso-bad.sh` | Script to upgrade Pure Service Orchestrator™ configuration to a faulty configuration, which will allow you to show the YAML verification feature of PSO Explorer. |
| `remove_pso.sh` | Script to uninstall both Pure Service Orchestrator™ and PSO Explorer from the Kubernetes cluster |
| `deploy_workloads.sh` | Script to deploy some workloads: 4x Wordpress deployment, 2x Workbench block, 1x Workench file, 1x Elastic Search (3-node cluster) |
| `snapshot-alpha.sh` | Script to create snapshot for block volumes using Kubernetes v1alpha1 Snapshot API. For this to work the Alpha API needs to be enabled. |
| `snapshot-beta.sh` | Script to create snapshot for block volumes using Kubernetes v1beta1 Snapshot API. For this to work the Beta API needs to be enabled. |
| `remove_workloads.sh` | Script to remove the workloads, volumes and snapshots, to clean-up after the demo. |

## Metal Load Balancer

In addition to the scripts above there is also an example script to installe metallb load balancer on the cluster. To use this, make sure you edit `metallb/metallb-config.yaml` to specify the IP addresses you want to use for the load balancer, these are generally in the same IP range as your Kubernetes nodes. 

```
vi metallb/metallb-config.yaml
```

Next we can deploy metallb to our cluster, using the install script:

```
cd metallb
./install-metallb.sh
```



