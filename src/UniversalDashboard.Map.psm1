
# The main index.js bundle
$IndexJs = Get-ChildItem "$PSScriptRoot\index.*.bundle.js"

# Any other JS files in the bundle 
$JsFiles = Get-ChildItem "$PSScriptRoot\*.bundle.js"

# Source maps to make it easier to debug in the browser 
$Maps = Get-ChildItem "$PSScriptRoot\*.map"

# Leaflet has some images we need to include
$Pngs = Get-ChildItem "$PSScriptRoot\*.png"

# Register the main script and get the AssetID
$AssetId = [UniversalDashboard.Services.AssetService]::Instance.RegisterScript($IndexJs.FullName)

# Register all the other scripts. We don't care about the asset ID. They will be loaded by the main JS file.
foreach($item in $JsFiles)
{
    [UniversalDashboard.Services.AssetService]::Instance.RegisterScript($item.FullName) | Out-Null
}

# Register all the source map files so we can make debugging easier.
foreach($item in $Maps)
{
    [UniversalDashboard.Services.AssetService]::Instance.RegisterScript($item.FullName) | Out-Null
}

# Register images
foreach($item in $Pngs)
{
    [UniversalDashboard.Services.AssetService]::Instance.RegisterScript($item.FullName) | Out-Null
}


<#
    Sample control function. This function must have an ID and return a hash table 
#> 
function New-UDMap {
    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(),
        [Parameter()]
        [float]$Longitude,
        [Parameter()]
        [float]$Latitude,
        [Parameter()]
        [int]$Zoom,
        [Parameter()]
        [string]$Height = '500px',
        [Parameter()]
        [string]$Width = '100%'
    )

    End {
        @{
            assetId = $AssetId 
            isPlugin = $true 
            type = "ud-map"
            id = $Id

            lng = $Longitude
            lat = $Latitude
            zoom = $Zoom
            height = $Height
            width = $Width
        }
    }
}