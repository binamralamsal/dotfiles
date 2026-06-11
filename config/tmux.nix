{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    mouse = true;
    baseIndex = 1;
    keyMode = "vi";
    sensibleOnTop = true;

    extraConfig = ''
      set-option -sa terminal-overrides ',kitty:RGB'

      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
      set -g status-position top

      set-window-option -g automatic-rename on
      set-option -g automatic-rename-format "#{b:pane_current_path}"

      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Window navigation
      bind -n M-h previous-window
      bind -n M-l next-window
      bind -n M-n new-window
      bind -n M-x kill-window

      # Arrow key pane switching
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Vi copy mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Split in current path
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # Reload config
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      # Catppuccin v2 config
      set -g @catppuccin_flavor "mocha"
      set -g @catppuccin_window_status_style "rounded"

      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_directory}"
      set -ag status-right "#{E:@catppuccin_status_session}"
      set -ag status-right "#{E:@catppuccin_status_date_time}"
    '';

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      yank
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"
        '';
      }
    ];
  };
}
