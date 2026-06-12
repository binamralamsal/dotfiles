{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = {
      grep = "grep --color=auto";
      ls = "eza -l --icons";
      cat = "bat";
      vim = "nvim";

      ll = "ls -la";
      gs = "git status";
    };

    initContent = ''
      bindkey -e

      # Completion styling
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"

      # Paths
      export PATH="$PATH:$HOME/.local/bin"
      export PATH="$PATH:$HOME/.cargo/bin"

      export EDITOR=nvim

      # Starship
      eval "$(starship init zsh)"

      # Bun
      export BUN_INSTALL="$HOME/.bun"
      export PATH="$BUN_INSTALL/bin:$PATH"

      [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

      # fnm
      eval "$(fnm env --use-on-cd --shell zsh)"

      # zoxide
      eval "$(zoxide init zsh)"

      # fzf
      source <(fzf --zsh)

      # Yazi cd integration
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        command yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d "" cwd < "$tmp"
        [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
        command rm -f -- "$tmp"
      }
    '';
  };

  programs.starship = {
    enable = true;
  };
}
