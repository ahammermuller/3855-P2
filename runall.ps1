$folders = Get-ChildItem -Directory

kubectl apply -f .\namespace.yml
kubectl apply -f .\pv-filesys.yml
kubectl apply -f .\pv-upload.yml
kubectl apply -f .\pvc-filesys.yml
kubectl apply -f .\pvc-upload.yml

foreach($folder in $folders){
    $files = get-ChildItem -Path $folder -Name
    foreach($file in $files){
        kubectl apply -f $folder\$file
    }
}