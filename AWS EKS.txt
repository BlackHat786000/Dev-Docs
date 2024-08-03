// setup AWS CLI
https://www.youtube.com/watch?v=u0JyzUGzvJA

// install eksctl tool
https://docs.aws.amazon.com/emr/latest/EMR-on-EKS-DevelopmentGuide/setting-up-eksctl.html

// create cluster
eksctl create cluster --name udityadav --region ap-south-1 --nodegroup-name linux-nodes --node-type t2.micro --nodes 2

// Finding the Load Balancer External IP Address to access your spring boot endpoints publicly
aws eks update-kubeconfig --name udit_yadav --region ap-south-1 (Configure your kubeconfig)
kubectl get services (The EXTERNAL-IP column will show the IP address assigned to your service. This is the IP address you can use to access your application.)
http://a600b1617bea14c978310f56e039d21e-826562045.ap-south-1.elb.amazonaws.com/hello

// delete cluster
eksctl delete cluster --name udityadav

// rollout deployment if anything unexpected happens during deployment (pod stuck in pending state due to non-availability of nodes)
kubectl rollout undo deployment/spring-boot-deployment
