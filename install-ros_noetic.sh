#!/bin/bash
echo "=============================================================================="
echo "==== INSTALACION DE ROS NOETIC ==== "
echo "=============================================================================="
echo "Tu ya sabes que poner ***** : "
read -s passs
echo "===="
sleep 4
pwd
cd /home/${2}
pwd

if [ ${1} = 1 ];
then
echo "Agregando sources.list"
sleep 1
echo ${passs} | sudo -S sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
echo "Agregando llaves"
sleep 1
echo ${passs} | sudo -S apt install -y curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
echo "Actualizando repositorios"
sleep 1
echo ${passs} | sudo -S apt update -y
echo "Instalacion de ROS"
sleep 1
echo ${passs} | sudo -S apt install -y ros-noetic-desktop-full

rosversion -d
echo "Agregando PATH _ROS"
sleep 1
source /opt/ros/noetic/setup.bash
rosversion -d

cd /home/${2}
pwd
echo "Herramientas y dependencias para construir paquetes ROS"
sleep 1
echo ${passs} | sudo -S apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
echo "Instalar rosdep"
sleep 1
echo ${passs} | sudo -S apt install -y python3-rosdep
echo "Iniciar rosdep"
sleep 1
echo ${passs} | sudo -S rosdep init
echo "Actualizar rosdep"
sleep 1
rosdep update

echo "install net-tools"
sleep 1
echo ${passs} | sudo -S sudo apt install -y net-tools

echo "================================================ Ejecutar: ================================================"
echo "cd && echo \"source /opt/ros/noetic/setup.bash\" >> ~/.bashrc && echo \"echo \"CARGANDO BASHRC...\" \" >> ~/.bashrc && source ~/.bashrc"
echo "==========================================================================================================="

exit 0

elif [ ${1} = 2 ];
then
cd /home/${2}
echo ${passs} | sudo -S apt install -y install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
echo ${passs} | sudo -S apt install -y python3-rosdep
echo ${passs} | sudo -S rosdep init
rosdep update

echo ${passs} | sudo -S sudo apt install -y net-tools

echo "================================================ Ejecutar: ================================================"
echo "cd && mkdir -p /home/${2}/catkin_ws/src && cd /home/${2}/catkin_ws && catkin_make"
echo "==========================================================================================================="

echo "============================================"
echo "==== FINALIZADO ====="
echo "============================================"

exit 0
elif [ ${1} = 3 ];
then
echo "=============================================================================="
echo "====CONFIGURACION DEL BASRCH ==== "
echo "=============================================================================="
cd /home/${2}
pwd
#catkin_make
echo "=============================================================================="
echo "==== Variables del bashrc ==== "
echo "=============================================================================="
sh -c "echo \"alias eb='nano ~/.bashrc'\" >> /home/${2}/.bashrc"
sh -c "echo \"alias sb='source ~/.bashrc'\" >> /home/${2}/.bashrc"
sh -c "echo \"alias gs='git status'\" >> /home/${2}/.bashrc"
sh -c "echo \"alias gp='git pull'\" >> /home/${2}/.bashrc"
sh -c "echo \"alias cw='cd ~/catkin_ws'\" >> /home/${2}/.bashrc"
sh -c "echo \"alias cs='cd ~/catkin_ws/src'\" >> /home/${2}/.bashrc"
sh -c "echo \"alias cm='cd ~/catkin_ws && catkin_make'\" >> /home/${2}/.bashrc"
sh -c "echo \"alias ri='rosdep install --from-paths src --ignore-src -r -y'\" >> /home/${2}/.bashrc"
echo "=============================================================================="
echo "==== Variables del ROS en bashrc ==== "
echo "=============================================================================="
sh -c "echo 'echo \${ROS_PACKAGE_PATH}' >> /home/${2}/.bashrc"
sh -c "echo 'source ~/catkin_ws/devel/setup.bash' >> /home/${2}/.bashrc"
sh -c "echo 'echo \${ROS_PACKAGE_PATH}' >> /home/${2}/.bashrc"
sh -c "echo '#WORKSTATION CONFIGURATION' >> /home/${2}/.bashrc"
sh -c "echo 'export ROS_IP=192.168.1.10' >> /home/${2}/.bashrc"
sh -c "echo 'export ROS_HOSTNAME=192.168.1.10' >> /home/${2}/.bashrc"
sh -c "echo 'export ROS_MASTER_URI=http://192.168.1.9:11311' >> /home/${2}/.bashrc"
sh -c "echo 'echo \"ROS_IP: \${ROS_IP}\"' >> /home/${2}/.bashrc"
sh -c "echo 'echo \"ROS_HOSTNAME: \${ROS_HOSTNAME}\"' >> /home/${2}/.bashrc"
fi
