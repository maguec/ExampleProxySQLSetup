#!/bin/bash
set -eou pipefail

# Script to connect to the proxysql-controller via mysql, without execing into the pod

mysql_host=$(kubectl get service proxysql-cluster-controller --output=jsonpath='{.spec.clusterIP}')
mysql_port=$(kubectl get service proxysql-cluster-controller --output=jsonpath='{.spec.ports[].port}')

mysql -h"$mysql_host" -P"$mysql_port" -uradmin -pradmin
