# web service demo

### usage

install

    kubectl apply -f deployment.yml

upgrade

    kubectl set image deployment/demo demo=vifi/k8s-demo:v2

or upgrade to broken version

    kubectl set image deployment/demo demo=vifi/k8s-demo:v3-broken

rollback to the previous revision

    kubectl rollout undo deployment/demo

get service url

    minikube service demo --url
