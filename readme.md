# A DevOps Perspective

This repository is is meant to show what a **Good DevOps Architecture** is supposed to look like.

## Overview

This project is divided into 3 folders:
* Terraform: To provision all infrastructure
* Ansible: To configure the servers
* Kubernetes: To set up a Kubernetes Cluster for Production

For better visibility I have added these folders in a single repo, but the convention is to have separate repos for each of them.

The Achitecture I am following is as follows
* `Staging` server configured to run multiple dockerized projects
* `Deployment` server configured to run Jenkins master
* `Mod Security` as the primary firewall for both of them
* `EKS cluster` to run multiple production environments