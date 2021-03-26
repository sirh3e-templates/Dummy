[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [int]
    $VERSION_MAJOR,
    [Parameter(Mandatory=$true)]
    [int]
    $VERSION_MINOR,
    [Parameter(Mandatory=$true)]
    [int]
    $VERSION_PATCH,
    [Parameter()]
    [string]
    $GIT_TAG_MESSAGE,
    [Parameter()]
    [string]
    $VERSION_SUFIX
)

if ($VERSION_SUFIX.Length -eq 0){
    $GIT_TAG_VERSION="v$VERSION_MAJOR.$VERSION_MINOR.$VERSION_PATCH"
}else{
    $GIT_TAG_VERSION="v$VERSION_MAJOR.$VERSION_MINOR.$VERSION_PATCH-$VERSION_SUFIX"
}

if ($GIT_TAG_MESSAGE.Length -eq 0){
    $GIT_TAG_MESSAGE="Version: $GIT_TAG_VERSION"
}

$Confirmation = Read-Host "Version: '$GIT_TAG_VERSION' Message: '$GIT_TAG_MESSAGE' (y,n)"
if ($Confirmation -ne 'y'){
    return
}

git tag -a $GIT_TAG_VERSION -m $GIT_TAG_MESSAGE