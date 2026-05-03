# Sabamiso.completions

Completion definitions for [Sabamiso.psm](https://github.com/teramako/Sabamiso.psm).

## 🚀 Install

### Via PowerShell Gallery
```powershell
Install-PSResource Sabamiso.completions
```

Add to your profile:
```powershell
Import-Module Sabamiso.psm
Import-Module Sabamiso.completions
```

### Via git clone
```powershell
git clone https://github.com/teramako/Sabamiso.completions.git
```

Add to your profile:
```powershell
Import-Module Sabamiso.psm
$env:PS_COMPLETE_PATH = "path/to/Sabamiso.completions/completions"
```

## 📋 Completions

See the [`completions/`](./completions) directory for all available completion definitions.

## ✍️ Contributing

To add completions for a new command, create a `.ps1` file named after the command in the `completions/` directory.

See the [Sabamiso.psm documentation](https://github.com/teramako/Sabamiso.psm#-write-completion-scripts) for how to write completion scripts.
