for id in $(seq $1 $2)
do
  VBoxManage clonevm K8s --name="knode$id" --groups="/K8s" --register
  VBoxManage modifyvm knode$id --nic1 nat
  echo 'nat ok'
  VBoxManage modifyvm knode$id --nic2 hostonly --hostonlyadapter2 vboxnet0
  echo 'host ok'
  VBoxManage modifyvm knode$id --cpus 2
  VBoxManage modifyvm knode$id --memory 4096
  VBoxManage startvm --type gui knode$id
  sleep 30
done