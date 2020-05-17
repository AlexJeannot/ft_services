# FUNCTIONS
substitute_ip()
{
    echo "\033[38;5;88m >>>> \033[38;5;118m Substituting IP of $2\n\033[0m"
    sed 's/minikubeip/'$ip'/g' ./images/$3 > ./images/$4
}


build_images()
{
    for service in $1
    do
        echo "\n\033[38;5;88m >>>> \033[38;5;118m Creating $service image\n\033[0m"
        docker build -t $service-image ./images/$service
    done
}

deploy_services()
{
    for service in $1
    do
        echo "\n\033[38;5;88m >>>> \033[38;5;118m Deploying $service service\n\033[0m"
        kubectl apply -f ./kubernetes/$service
    done
}

# SCRIPT
if [ -z "$1" ]
then
    echo "\n\033[38;5;81m######################################\n################ START ###############\n######################################\n\033[0m"
    minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
    eval $(minikube docker-env)

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Enabling addons\n\033[0m"
    minikube addons enable ingress
    minikube addons enable metrics-server
    minikube addons enable dashboard

    echo "\n\033[38;5;81m######################################\n############ SUBSTITUTE IP ###########\n######################################\n\033[0m"
    export ip=`minikube ip`
    echo "Minikube ip = $ip\n"
    substitute_ip $ip "nginx index" "/nginx/files/index-template.html" "/nginx/files/index.html"
    substitute_ip $ip "wordpress config" "/wordpress/files/wordpress/wp-config-template.php" "/wordpress/files/wordpress/wp-config.php"
    substitute_ip $ip "mysql script" "/mysql/files/wordpress-template.sql" "/mysql/files/wordpress.sql"
    substitute_ip $ip "vsftpd config" "/ftps/files/vsftpd-template.conf" "/ftps/files/vsftpd.conf"
    substitute_ip $ip "telegraf config" "/telegraf/files/telegraf/etc/telegraf/telegraf-template.conf" "/telegraf/files/telegraf/etc/telegraf/telegraf.conf"
    substitute_ip $ip "grafana datasources" "/grafana/files/grafana/conf/provisioning/datasources/default-template.yaml.bak" "/grafana/files/grafana/conf/provisioning/datasources/default.yaml"


    echo "\n\033[38;5;81m######################################\n############# BUILD IMAGE ############\n######################################\n\033[0m"
    build_images "nginx wordpress phpmyadmin mysql ftps influxdb telegraf grafana"


    echo "\n\033[38;5;81m######################################\n########### DEPLOY SERVICES ##########\n######################################\n\033[0m"
    deploy_services "ingress nginx wordpress phpmyadmin mysql ftps influxdb telegraf grafana"

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Ingress check\n\033[0m"
    kubectl get ingress

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Services check\n\033[0m"
    kubectl get services
    sleep 10

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Pods check\n\033[0m"
    kubectl get pods


    echo "\n\033[38;5;81m######################################\n############# INFORMATIONS ###########\n######################################\n\033[0m"
    echo "Minikube ip = $ip\n"

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Wordpress logins\n\033[0m"
    echo "Id: wp_user (Administrator)\nPassword: rHDUr0)@Bz8\$@mLT)T\n\n"
    echo "Id: user1   (Subscriber)\nPassword: FLs^4PPH5n3mYNk&B@q0X65P\n\n"
    echo "Id: user2   (Contributor)\nPassword: x(Ti(25G3##&JzAsy\$M0tUOe\n\n"
    echo "Id: user3   (Editor)\nPassword: h!pejfq07adaawjy7(TTov%4\n\n"
    echo "Id: user4   (contributor)\nPassword: d0j!lzVLfH57#3xfZ8W76Gmd\n\n"

    echo "\n\033[38;5;88m >>>> \033[38;5;118m PhpMyAdmin login\n\033[0m"
    echo "Id: db_user\nPassword: db_password\n\n"

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Grafana login\n\033[0m"
    echo "Id: admin\nPassword:: admin\n\n"

    echo "\n\033[38;5;88m >>>> \033[38;5;118m SSH login\n\033[0m"
    echo "Id: ssh_user\nPassword: ssh_password\n\n"

    open http://$ip:80
    minikube dashboard
elif [ "$1" = "end" ]
then
    echo "\n\033[38;5;88m >>>> \033[38;5;118m Minikube stop\n\033[0m"
    minikube stop

    echo "\n\033[38;5;88m >>>> \033[38;5;118m Minikube delete\n\033[0m"
    minikube delete
fi
