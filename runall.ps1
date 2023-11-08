$folders = Get-ChildItem -Directory

foreach($folder in $folders){
    $files = get-ChildItem -Path $folder -Name
    foreach($file in $files){
        kubectl apply -f $folder\$file
    }
}