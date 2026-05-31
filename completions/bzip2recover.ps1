<#
 # bzip2recover completion
 #>
Import-Module Sabamiso.psm -ErrorAction SilentlyContinue

Register-NativeCompleter -Name bzip2recover -NoFileCompletions -Arguments @{
    Name = 'filename';
    Script = {
        [Sabamiso.Helper]::CompleteFilename($this, $false, $false, {
            $_.Attributes.HasFlag([System.IO.FileAttributes]::Directory) -or $_.Name -match '\.t?bz2?$'
        });
    }
}
