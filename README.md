
# PWS — Pentest Workspace

PWS (Pentest Workspace) is a lightweight command-line tool that automatically creates a standardized directory structure for penetration testing engagements.

It helps security professionals organize their assessment files, evidence, notes, reports, and other resources in a consistent workspace.

## Features

- Create a pentest workspace in the current directory.
- Create a dedicated workspace for a specific target.
- Standardize directory organization across engagements.
- Simple command-line interface.
- Lightweight shell script with no additional dependencies.

## Installation

1. Download the `pws.sh` script.

2. Add the following line to your shell configuration file.

For Zsh (`~/.zshrc`):

```bash
source /path/to/pws.sh
```

For Bash (`~/.bashrc`):

```bash
source /path/to/pws.sh
```

3. Reload your shell configuration:

```bash
source ~/.zshrc
```

Or, if you use Bash:

```bash
source ~/.bashrc
```

## Usage

Create a workspace in the current directory:

```bash
pws
```

Create a dedicated workspace for a specific target:

```bash
pws <target_name>
```

Display the help information:

```bash
pws -h
```

## Examples

Create a workspace for a general pentest engagement:

```bash
pws
```

Create a workspace for a specific target:

```bash
pws example.com
```

## Requirements

- Linux or macOS.
- Bash or Zsh.
- Standard Unix command-line utilities.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
