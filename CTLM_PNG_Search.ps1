Set-PSDebug -Trace 0

Function Find-Screenshots{
    $missing = import-csv -path "$home\Downloads\Missing_Screenshots.csv"
    $userpath = Read-Host "Please input File Path you want to search"
    $keep = Test-Path $userpath\keep
    If(!$Keep){New-Item -Path $userpath -name "Keep" -ItemType "directory"}
    $pictures = Get-ChildItem -path $userpath

    foreach ($range in $missing){
    $start = $range.start
    $end = $range.finish
    Write-host "Now Checking Between $start and $end"

        foreach ($picture in $pictures){
        $Picture_Short = $picture.basename
        $Picture_Number = [int]$picture_Short
            If($Picture_Number -ge $start -and $Picture_Number -le $end){
            Write-Host "Found $picture_number"
                Move-Item -Path $userpath\$picture_short.png -Destination $userpath\keep\$picture_short.png
            }
        }
    }
}

Find-Screenshots