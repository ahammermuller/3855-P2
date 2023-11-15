$folders = Get-ChildItem -Directory

kubectl apply -f .\namespace.yml
kubectl apply -f .\pv.yml
kubectl apply -f .\pvc.yml


foreach($folder in $folders){
    $files = get-ChildItem -Path $folder -Name
    foreach($file in $files){
        kubectl apply -f $folder\$file
    }
}