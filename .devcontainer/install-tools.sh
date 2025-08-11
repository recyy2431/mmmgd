#!/usr/bin/env bash
set -euxo pipefail

# Ensure GOPATH bin is on PATH for this session
export PATH="$HOME/go/bin:$PATH"

# ProjectDiscovery + friends
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest

# Amass
go install github.com/owasp-amass/amass/v4/...@latest

# Fuzzing and URL collection
go install github.com/ffuf/ffuf/v2@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/tomnomnom/anew@latest

# Quality-of-life
mkdir -p "$HOME/.config/nuclei" "$HOME/tools" "$HOME/wordlists"
[ -d "$HOME/.config/nuclei/templates" ] || nuclei -ut || true

# Symlinks for quick access
mkdir -p "${PWD}/bin"
for b in subfinder httpx naabu nuclei dnsx mapcidr katana amass ffuf gau waybackurls anew; do
  ln -sf "$HOME/go/bin/$b" "${PWD}/bin/$b" || true
done

echo "Done."
