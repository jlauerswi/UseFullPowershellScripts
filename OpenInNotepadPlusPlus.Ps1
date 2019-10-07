# Opens Notepad++ from powershell, with option to open a particular file, even by specifying the relative path of the file.
# The reason I created it was because you have to pass the full path when calling notepad++ from the command line.
# This way you can just specify the relative path of your file.
# Usage Open-Notepad++ [[-FileName] <string>]
# For example: Open-Notepad++ -FileName .\Hellow.ps1

function Open-Notepad++ {
	param(
        [Parameter(Mandatory=$false)][string]$FileName
    )
	
	If (!($FileName)) {
		notepad++
	} else {
		If (!(Test-Path $FileName)) {
			Throw $FileName + " doesn't exist in the specified path"
		}
    # Assumes you have notepad++ in your Path variable.
    # Otherwise replace "notepad++" with full .exe path (e.g. "& 'C:\Program Files (x86)\Notepad++\notepad++.exe'").
		notepad++ (Get-Item $FileName).ToString()
	}
}
