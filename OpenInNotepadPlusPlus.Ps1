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
