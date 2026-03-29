# NativeCommandCompleter.completions

Completion definitions for [NativeCommandCompleter.psm](https://github.com/teramako/NativeCommandCompleter.psm).

## 🚀 Install

### Via PowerShell Gallery
```powershell
Install-PSResource NativeCommandCompleter.completions
```

Add to your profile:
```powershell
Import-Module NativeCommandCompleter.psm
Import-Module NativeCommandCompleter.completions
```

### Via git clone
```powershell
git clone https://github.com/teramako/NativeCommandCompleter.completions.git
```

Add to your profile:
```powershell
Import-Module NativeCommandCompleter.psm
$env:PS_COMPLETE_PATH = "path/to/NativeCommandCompleter.completions/completions"
```

## 📋 Completions

See the [`completions/`](./completions) directory for all available completion definitions.

## ✍️ Contributing

To add completions for a new command, create a `.ps1` file named after the command in the `completions/` directory.

See the [NativeCommandCompleter.psm documentation](https://github.com/teramako/NativeCommandCompleter.psm#-write-completion-scripts) for how to write completion scripts.
