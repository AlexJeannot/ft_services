
if [ "$1" = "start" ]
then
    echo "\n\033[38;5;81m######################################\n################ START ###############\n######################################\n\033[0m"
    minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
    #sleep 5

    #echo "\n\033[38;5;88m >>>> \033[38;5;118m Environment switch\n\033[0m"
    #eval $(minikube docker-env)
    #sleep 5

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Ingress enable\n\033[0m"
    minikube addons enable ingress

elif [ "$1" == "end" ]
then
    echo "\n\033[38;5;88m >>>> \033[38;5;118m Minikube stop\n\033[0m"
    minikube stop

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Minikube delete\n\033[0m"
    minikube delete
elif [ "$1" = "deploy" ]
then
    echo "\n\033[38;5;88m >>>> \033[38;5;118m Minikube ip : \033[0m"
    minikube ip
    export ip=`minikube ip`
    echo "ip = $ip"
    sed 's/minikubeip/'$ip'/g' ./wordpress/files/wordpress/wp-config-template.php > ./wordpress/files/wordpress/wp-config.php
    sed 's/minikubeip/'$ip'/g' ./mysql/wordpress_template.sql > ./mysql/wordpress.sql
    sed 's/minikubeip/ajeannot/g' ./ftps/setup_template.sh > ./ftps/setup.sh
    sed 's/minikubeip/'$ip'/g' ./ftps/vsftpd_template.conf > ./ftps/vsftpd_load.conf

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Creation of nginx image\n\033[0m"
    docker build -t nginx-image ./nginx

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Creation of wordpress image\n\033[0m"
    docker build -t wordpress-image ./wordpress

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Creation of phpmyadmin image\n\033[0m"
    docker build -t  phpmyadmin-image ./phpmyadmin

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Creation of mysql image\n\033[0m"
    docker build -t mysql-image ./mysql

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Creation of ftps image\n\033[0m"
    docker build -t ftps-image ./ftps

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Starting of pods, services and ingress\n\033[0m"
    kubectl apply -f ./deployment

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Ingress check\n\033[0m"
    kubectl get ingress

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Services check\n\033[0m"
    kubectl get services
    sleep 5

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Pods check\n\033[0m"
    kubectl get pods
elif [ "$1" = "clean" ]
then
    echo "\n\033[38;5;88m >>>> \033[38;5;118m Delete of pods, services and ingress\n\033[0m"
    kubectl delete -f ./deployment
fi


