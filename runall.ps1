Param(
    [Parameter(Mandatory = $True)]$choice # .\runall.ps1 [downall, down, upall, up]
)

# delete everything including vp and vpc
if ($choice -eq "downall") {
    kubectl delete deployments -n a02-ns --all 
    kubectl delete svc -n a02-ns --all
    kubectl delete pvc -n a02-ns --all
    kubectl delete pv -n a02-ns --all
    # kubectl delete namespace a02-ns
}
#  only delete deployment and services
elseif ($choice -eq "down") {
    kubectl delete deployments -n a02-ns --all 
    kubectl delete svc -n a02-ns --all
}
else {
    $folders = "Authentication", "File_System", "MySQL", "Upload", "Video_Streaming"  # Add your folder names in the desired order

    # set up everything including vp and vpc
    if ($choice -eq "upall") {
        kubectl apply -f ./namespace.yml
        $folders = @("Volumes") + $folders
    }  

    # otherwise only set up deployment and services
    foreach ($folder in $folders) {
        $files = Get-ChildItem -Path $folder -Name
        foreach ($file in $files) {
            kubectl apply -f $folder\$file
        }
    }    
}