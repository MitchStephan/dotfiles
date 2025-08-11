# Kubernetes / IaC CLI enhancements (minimal set)

# Guard: ensure we don't double-source
[[ -n "${__KUBETOOLS_LOADED:-}" ]] && return
__KUBETOOLS_LOADED=1

# k alias (keep completion)
if command -v kubectl >/dev/null 2>&1; then
  alias k="kubectl"

  # Load kubectl completion (official)
  # shellcheck disable=SC1090
  source <(kubectl completion zsh 2>/dev/null)

  # Ensure alias k gets same completion function
  compdef __start_kubectl k
fi

# Helm completion
if command -v helm >/dev/null 2>&1; then
  # shellcheck disable=SC1090
  source <(helm completion zsh 2>/dev/null)
fi

# Terraform completion (uses bashcompinit bridge)
if command -v terraform >/dev/null 2>&1; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C "$(command -v terraform)" terraform
fi

# Krew path (for kubectl plugins: ctx, ns, etc.)
if [[ -d "$HOME/.krew/bin" ]]; then
  path=("$HOME/.krew/bin" $path)
fi