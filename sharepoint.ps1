
$tenant="projectturkana"
$AdminCenterURL = "https://admin-$tenant.sharepoint.com"
    
#User Name Password to connect 
$AdminUserName = "simon@projectturkana.com"
$AdminPassword = "Qor62756" #App Password

doLogin

### Rename a site
    $sourceAlias = "SouthAfricaCreativeEventsCalendar"
    $targetAlias = "SouthAfricaEventsDemo"
#renameSite
#updateSwatch
$theme = "ProjectTurkana"

function doLogin() {
    #Variables for processing

    
    #Prepare the Credentials
    $SecurePassword = ConvertTo-SecureString $AdminPassword -AsPlainText -Force
    $Cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $AdminUserName, $SecurePassword
    
    #Connect to SharePoint Online tenant
    Connect-SPOService -url $AdminCenterURL -Credential $Cred
}

function updateSwatch() {
    function HashToDictionary {
    Param ([Hashtable]$ht)
    $dictionary = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
    foreach ($entry in $ht.GetEnumerator()) {
    $dictionary.Add($entry.Name, $entry.Value)
    }
    return $dictionary
}
$themepallette = HashToDictionary(
    @{
    "themePrimary" = "#f8aa1d";
    "themeLighterAlt" = "#0a0701";
    "themeLighter" = "#281b05";
    "themeLight" = "#4a3309";
    "themeTertiary" = "#946712";
    "themeSecondary" = "#da971a";
    "themeDarkAlt" = "#f8b334";
    "themeDark" = "#f9bf53";
    "themeDarker" = "#fbcf7f";
    "neutralLighterAlt" = "#174260";
    "neutralLighter" = "#1b4767";
    "neutralLight" = "#245171";
    "neutralQuaternaryAlt" = "#2a5778";
    "neutralQuaternary" = "#2f5c7d";
    "neutralTertiaryAlt" = "#467393";
    "neutralTertiary" = "#c8c8c8";
    "neutralSecondary" = "#d0d0d0";
    "neutralPrimaryAlt" = "#dadada";
    "neutralPrimary" = "#ffffff";
    "neutralDark" = "#f4f4f4";
    "black" = "#f8f8f8";
    "white" = "#123b59";
    "primaryBackground" = "#123b59";
    "primaryText" = "#ffffff";
    "bodyBackground" = "#123b59";
    "bodyText" = "#ffffff";
    "disabledBackground" = "#113955";
    "disabledText" = "#0e2f46";
}

)
Add-SPOTheme -Name $themename -Palette $themepallette -IsInverted $false

}

function renameSite() {
    # Connect to SPO and perform the site rename
    Connect-SPOService "https://$tenant-admin.sharepoint.com"
    $oldUrl = "https://$tenant.sharepoint.com/sites/$sourceAlias"
    $newUrl = "https://$tenant.sharepoint.com/sites/$targetAlias"

    # Perform the site rename
    Start-SPOSiteRename -Identity $oldUrl -NewSiteUrl $newUrl

    # The process might take a while depending the size of the site. You can check the status using this command
    Get-SPOSiteRenameState -Identity $oldUrl

    # By using the standard parameters of Start-SPOSiteRename, a successful site rename will provision  After a successfull site rename a new site with the template 'RedirectSite#0' is created
    $site = Get-SPOSite $oldUrl
    $site.Template
}

