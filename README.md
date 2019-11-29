# Istio Rules

## Overview
Istio rules for chain-abstraction k8s cluster

This rule set defines:

1. An istio-gateway
2. The game jam abstraction virtual service
3. Logging for network traffic using mixer

## Prerequisites
Ensure you have a k8s cluster with istio installed

Check to see the everything is working by gettting the load balancer ip and port
```shell
kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}'
```

## To deploy
```shell
make gateway
make game-jam
make logs
```

## To monitor
Check if prometheus is alive
```
kubectl -n istio-system get svc prometheus
```

Set up port forwarding of prometheus ui to local machine => http://localhost:9090/
```
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}') 9090:9090 &
```

Get network logs exposed by the `make logs` command
```
kubectl logs -n istio-system -l istio-mixer-type=telemetry -c mixer
```


## To clean
Check virtual services 
```shell
kubectl get virtualservices
kubectl delete virtualservices game-jam-abstraction
```

Check destination rules 
```shell
kubectl get destinationrules
kubectl delete virtualservices *
```

Check gateway 
```shell
kubectl get gateway
kubectl delete gateway *
```