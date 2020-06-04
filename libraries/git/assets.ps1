function Get-GitReposBatchFilePaths (
    [Parameter(Mandatory = $false)] [string[]] $Filters
    , [Parameter(Mandatory = $false)] [switch] $UnionFilters
) {
    Get-AssetBatchFilePaths `
        -Path "$global:PROFILE_ASSETS_DIR/git/repos.txt" `
        -Filters $Filters `
        -UnionFilters:$UnionFilters
}

function Get-GitReposGroupFilePaths (
    [Parameter(Mandatory = $true)] [string] $GroupName
    , [Parameter(Mandatory = $false)] [string] $StartName
    , [Parameter(Mandatory = $false)] [string] $StopName
) {
    Get-AssetGroupFilePaths `
        -Path "$global:PROFILE_ASSETS_DIR/git/repo-groups/$GroupName" `
        -StartName $StartName `
        -StopName $StopName
}

function Update-GitReposCacheFile (
    [Parameter(Mandatory = $false)] $Config = (Get-ProfileConfig)
) {
    Update-AssetCacheFile `
        -Include '.git' `
        -SearchPaths $Config['git']['searchPaths'] `
        -OutFilePath "$global:PROFILE_ASSETS_DIR/git/repos.txt" `
        -StoreParentPath
}