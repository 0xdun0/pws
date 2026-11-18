pws() {
    local R="\033[0;31m" G="\033[0;32m" B="\033[1;34m" N="\033[0m"

    # Help
    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        cat <<'EOF'
pws — pentest workspace setup

Usage:
  pws              Create workspace structure in the current directory
  pws <target>     Create workspace structure under ./<target>/
  pws -h           Show this help

Structure created:
  nmap/  content/  exploits/  scripts/  loot/
  notes/  scans/    screenshots/  creds/
EOF
        return 0
    fi

    local base="." name
    name="$(basename "$PWD")"

    if [[ -n "$1" ]]; then
        base="./$1"
        name="$1"
    fi

    # Sanity check: parent directory writable?
    if [[ ! -w "$(dirname "$base")" ]]; then
        echo -e "${R}[!]${N} Parent directory is not writable: $(dirname "$base")"
        return 1
    fi

    local -a dirs=(nmap content exploits scripts loot notes scans screenshots creds)
    local created=0 existed=0

    echo -e "${B}[*]${N} Setting up workspace: ${name}"

    mkdir -p "$base" || { echo -e "${R}[!]${N} Failed to create $base"; return 1; }

    for d in "${dirs[@]}"; do
        if [[ -d "$base/$d" ]]; then
            existed=$((existed + 1))
        else
            mkdir -p "$base/$d" && created=$((created + 1))
        fi
    done

    # Notes template (never overwrites an existing file)
    if [[ ! -f "$base/notes/notes.md" ]]; then
        cat > "$base/notes/notes.md" <<EOF
# $name — Pentest Notes

Date: $(date '+%Y-%m-%d %H:%M')
Target: $name
Scope:

## Hosts

## Discovered services

## Credentials

## Findings
EOF
    fi

    echo -e "${G}[+]${N} Created: ${created}  |  Already existed: ${existed}"
    echo -e "${G}[✓]${N} Workspace: $(cd "$base" && pwd)"
}
