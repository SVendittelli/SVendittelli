set shell := ["zsh", "-uc"]
set windows-shell := ["pwsh.exe", "-NoLogo", "-Command"]

[private]
@default:
    just --list --justfile {{justfile()}}

# Run GitHub Action locally
act:
    act -s GITHUB_TOKEN="$(gh auth token)"

# Generate terminal recording
vhs:
    docker run --rm -v "$(pwd):/vhs" ghcr.io/charmbracelet/vhs profile.tape
