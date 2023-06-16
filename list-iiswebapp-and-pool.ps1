[Void][Reflection.Assembly]::LoadWithPartialName("Microsoft.Web.Administration")
$sm = New-Object Microsoft.Web.Administration.ServerManager
foreach($site in $sm.Sites) {
    foreach ($app in $site.Applications) {
        [PSCustomObject]@{
            Application = $site.Name + $app.Path
            Pool = $app.ApplicationPoolName
        }
    }
}
