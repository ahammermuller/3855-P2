$folders = Get-ChildItem -Directory

kubectl apply -f .\namespace.yml

foreach($folder in $folders){
    $files = get-ChildItem -Path $folder -Name
    foreach($file in $files){
        kubectl apply -f $folder\$file
    }
}