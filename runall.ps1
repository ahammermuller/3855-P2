
kubectl apply -f ./namespace.yml

$folders = "Volumes", "Authentication", "File_System", "MySQL", "Upload", "Video_Streaming"  # Add your folder names in the desired order
foreach ($folder in $folders) {
    $files = Get-ChildItem -Path $folder -Name
    foreach ($file in $files) {
        kubectl apply -f $folder\$file
    }
}