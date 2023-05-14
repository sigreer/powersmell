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
Add-SPOTheme -Name "ProjectTurkana" -Palette $themepallette -IsInverted $false

}
