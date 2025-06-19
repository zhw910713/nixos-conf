{ inputs, ... }:
{
  ## autostart
  wayland.windowManager.hyprland.settings.exec-once = [
    "swww-daemon &"
    "qs &"
    "fcitx5 &"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
    "/nix/store/9bf2k2fax9vay9kj55mzh819bw6w9xzx-polkit-kde-agent-1-6.3.5/libexec/polkit-kde-authentication-agent-1"
  ];
  ## keybinds 
  wayland.windowManager.hyprland.settings = {

    monitor = [ "HDMI-A-1,1920x1080@60,1920x0,1,mirror,eDP-1" ];

    bind = [
      # 窗口管理快捷键
      "SUPER, SUPER_L, exec, quickshellipc call TEST_ALIVE || pkill fuzzel || fuzzel"
      #"SUPER, mouse:272, exec, quickshell:overviewToggleReleaseInterrupt"
      #"SUPER, mouse:273, exec, quickshell:overviewToggleReleaseInterrupt"
      
      # 侧边栏控制
      "SUPER, A, exec, quickshell:sidebarLeftToggle"
      "SUPER, N, exec, quickshell:sidebarRightToggle"
      
      # 剪贴板和表情符号
      "SUPER, V, exec, cliphist list | fuzzel --match-mode fzf --dmenu | cliphist decode | wl-copy"
      "SUPER, M, exec, ~/.config/quickshell/scripts/hyprland/fuzzel-emoji.sh copy"
            
      # 截图工具
      "SUPER+SHIFT, S, exec, pidof slurp || hyprshot --freeze --clipboard-only --mode region --silent"
      "SUPER+SHIFT+ALT, S, exec, pidof slurp || grim -g \"$(slurp)\" - | swappy -f -"
      ", Print, exec, grim - | wl-copy"
      "CTRL, Print, exec, mkdir -p $(xdg-user-dir PICTURES)/Screenshots && grim $(xdg-user-dir PICTURES)/Screenshots/Screenshot_$(date '+%Y-%m-%d_%H.%M.%S').png"

      # 屏幕录制
      #"SUPER ALT, R, exec, ~/.config/quickshell/scripts/hyprland/record.sh"
      #"CTRL ALT, R, exec, ~/.config/quickshell/scripts/hyprland/record.sh --fullscreen"
      #"SUPER SHIFT ALT, R, exec, ~/.config/quickshell/scripts/hyprland/record.sh --fullscreen-sound"
      #"SUPER SHIFT ALT, mouse:273, exec, ~/.config/ags/scripts/ai/primary-buffer-query.sh"

      # 系统功能
      "CTRL+ALT, Delete, exec, quickshellipc call TEST_ALIVE || pkill wlogout || wlogout -p layer-shell"
      "CTRL+SUPER, R, exec, killall ags agsv1 gjs ydotool quickshellquickshell; quickshell&"

      # 窗口控制
      "SUPER, Left, movefocus, l"
      "SUPER, Right, movefocus, r"
      "SUPER, Up, movefocus, u"
      "SUPER, Down, movefocus, d"
      "SUPER SHIFT, Left, movewindow, l"
      "SUPER SHIFT, Right, movewindow, r"
      "SUPER SHIFT, Up, movewindow, u"
      "SUPER SHIFT, Down, movewindow, d"
      "ALT, F4, killactive"
      "SUPER, Q, killactive"
      "SUPER SHIFT ALT, Q, exec, hyprctl kill"
      "SUPER ALT, Space, togglefloating"
      "SUPER, D, fullscreen, 1"
      "SUPER, F, fullscreen, 0"
      "SUPER ALT, F, fullscreenstate, 0 3"
      "SUPER, P, pin"

      # 工作区管理
      "SUPER SHIFT, 1, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh movetoworkspacesilent 1"
      "SUPER SHIFT, 2, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh movetoworkspacesilent 2"
      "SUPER SHIFT, 3, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh movetoworkspacesilent 3"
      "SUPER SHIFT, 4, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh movetoworkspacesilent 4"
      "SUPER SHIFT, 5, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh movetoworkspacesilent 5"
      "SUPER SHIFT, 6, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh movetoworkspacesilent 6"
      "SUPER SHIFT, 7, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh movetoworkspacesilent 7"
      "SUPER SHIFT, 8, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh movetoworkspacesilent 8"
      "SUPER SHIFT, 9, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh movetoworkspacesilent 9"
      "SUPER SHIFT, 0, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh movetoworkspacesilent 10"
      "SUPER SHIFT, mouse_down, movetoworkspace, r-1"
      "SUPER SHIFT, mouse_up, movetoworkspace, r+1"
      "SUPER ALT, mouse_down, movetoworkspace, -1"
      "SUPER ALT, mouse_up, movetoworkspace, +1"
      "SUPER ALT, Page_Down, movetoworkspace, +1"
      "SUPER ALT, Page_Up, movetoworkspace, -1"
      "SUPER SHIFT, Page_Down, movetoworkspace, r+1"
      "SUPER SHIFT, Page_Up, movetoworkspace, r-1"
      "CTRL SUPER SHIFT, Right, movetoworkspace, r+1"
      "CTRL SUPER SHIFT, Left, movetoworkspace, r-1"
      "SUPER ALT, S, movetoworkspacesilent, special"
      "CTRL SUPER, S, togglespecialworkspace"

      # 应用切换
      "ALT, Tab, cyclenext"
      "ALT, Tab, bringactivetotop"            

      # 工作区切换
      "SUPER, 1, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh workspace 1"
      "SUPER, 2, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh workspace 2"
      "SUPER, 3, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh workspace 3"
      "SUPER, 4, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh workspace 4"
      "SUPER, 5, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh workspace 5"
      "SUPER, 6, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh workspace 6"
      "SUPER, 7, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh workspace 7"
      "SUPER, 8, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh workspace 8"
      "SUPER, 9, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh workspace 9"
      "SUPER, 9, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh workspace 9"
      "SUPER, 0, exec, ~/.config/quickshell/scripts/hyprland/workspace_action.sh workspace 10"
      "CTRL SUPER, Right, workspace, r+1"
      "CTRL SUPER, Left, workspace, r-1"
      "CTRL SUPER ALT, Right, workspace, m+1"
      "CTRL SUPER ALT, Left, workspace, m-1"
      "SUPER, Page_Down, workspace, +1"
      "SUPER, Page_Up, workspace, -1"
      "CTRL SUPER, Page_Down, workspace, r+1"
      "CTRL SUPER, Page_Up, workspace, r-1"
      "SUPER, mouse_up, workspace, +1"
      "SUPER, mouse_down, workspace, -1"
      "CTRL SUPER, mouse_up, workspace, r+1"
      "CTRL SUPER, mouse_down, workspace, r-1"
      "SUPER, S, togglespecialworkspace"
      "SUPER, mouse:275, togglespecialworkspace"
      "CTRL SUPER, BracketLeft, workspace, -1"
      "CTRL SUPER, BracketRight, workspace, +1"
      "CTRL SUPER, Up, workspace, r-5"
      "CTRL SUPER, Down, workspace, r+5"

      # 系统功能
      "SUPER ALT, F11, exec, bash -c 'RANDOM_IMAGE=$(find ~/Pictures -type f | grep -v -i \"nipple\" | grep -v -i \"pussy\" | shuf -n 1); ACTION=$(notify-send \"Test notification with body image\" \"This notification should contain your user account <b>image</b> and <a href=\\\"https://discord.com/app\\\">Discord</a> <b>icon</b>. Oh and here is a random image in your Pictures folder: <img src=\\\"$RANDOM_IMAGE\\\" alt=\\\"Testing image\\\"/>\" -a \"Hyprland keybind\" -p -h \"string:image-path:/var/lib/AccountsService/icons/$USER\" -t 6000 -i \"discord\" -A \"openImage=Open profile image\" -A \"action2=Open the random image\" -A \"action3=Useless button\"); [[ $ACTION == *openImage ]] && xdg-open \"/var/lib/AccountsService/icons/$USER\"; [[ $ACTION == *action2 ]] && xdg-open \"$RANDOM_IMAGE\"'"
      "SUPER ALT, F12, exec, bash -c 'RANDOM_IMAGE=$(find ~/Pictures -type f | grep -v -i \"nipple\" | grep -v -i \"pussy\" | shuf -n 1); ACTION=$(notify-send \"Test notification\" \"This notification should contain a random image in your <b>Pictures</b> folder and <a href=\\\"https://discord.com/app\\\">Discord</a> <b>icon</b>.\\n<i>Flick right to dismiss!</i>\" -a \"Discord (fake)\" -p -h \"string:image-path:$RANDOM_IMAGE\" -t 6000 -i \"discord\" -A \"openImage=Open profile image\" -A \"action2=Useless button\" -A \"action3=Cry more\"); [[ $ACTION == *openImage ]] && xdg-open \"/var/lib/AccountsService/icons/$USER\"'"
      "SUPER ALT, Equal, exec, notify-send \"Urgent notification\" \"Ah hell no\" -u critical -a 'Hyprland keybind'"
      "SUPER, L, exec, loginctl lock-session"
      "SUPER SHIFT, L, exec, loginctl lock-session"
      "SUPER SHIFT, L, exec, sleep 0.1 && systemctl suspend || loginctl suspend"
      "CTRL SHIFT ALT SUPER, Delete, exec, systemctl poweroff || loginctl poweroff"

      # 媒体控制
      "SUPER SHIFT, N, exec, playerctl next || playerctl position $(bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\")"
      "SUPER SHIFT ALT, mouse:275, exec, playerctl previous"
      "SUPER SHIFT ALT, mouse:276, exec, playerctl next || playerctl position $(bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\")"
      "SUPER SHIFT, B, exec, playerctl previous"
      "SUPER SHIFT, P, exec, playerctl play-pause"

      # 应用程序启动
      "SUPER, Return, exec, ~/.config/quickshell/scripts/hyprland/launch_first_available.sh \"kitty -1\" \"foot\" \"alacritty\" \"wezterm\" \"konsole\" \"kgx\" \"uxterm\" \"xterm\""
      "SUPER, T, exec, ~/.config/quickshell/scripts/hyprland/launch_first_available.sh \"kitty -1\" \"foot\" \"alacritty\" \"wezterm\" \"konsole\" \"kgx\" \"uxterm\" \"xterm\""
      "CTRL ALT, T, exec, [float; move 15% 5%; size 70% 60%] foot"
      "SUPER, E, exec, ~/.config/quickshell/scripts/hyprland/launch_first_available.sh \"dolphin\" \"nautilus\" \"nemo\" \"thunar\""
      "SUPER, B, exec, ~/.config/quickshell/scripts/hyprland/launch_first_available.sh \"zen-browser\" \"firefox\" \"brave\" \"chromium\" \"google-chrome-stable\" \"microsoft-edge-stable\" \"opera\""
      "SUPER, C, exec, ~/.config/quickshell/scripts/hyprland/launch_first_available.sh"

      "Ctrl+Super, T, exec, ~/.config/quickshell/scripts/colors/switchwall.sh"

    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    general = {
      gaps_in = 4;
      gaps_out = 5;
      gaps_workspaces = 50;
      border_size = 1;
      #col.active_border = "rgba(0DB7D4FF)";
      #col.inactive_border = "rgba(31313600)";
      resize_on_border = true;
      no_focus_fallback = true;
      allow_tearing = true;
      snap.enabled = true;
    };

    misc = {
      background_color = "rgba(1D1011FF)";
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      vfr = 1;
      vrr = 1;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
      animate_manual_resizes = false;
      animate_mouse_windowdragging = false;
      enable_swallow = true;
      swallow_regex = "(foot|kitty|allacritty|Alacritty)";
      new_window_takes_over_fullscreen = 2;
      allow_session_lock_restore = true;
      initial_workspace_tracking = false;
      focus_on_activate = true;
    };

    plugin = {
      hyprbars = {
        bar_text_font = "Rubik, Geist, AR One Sans, Reddit Sans, Inter, Roboto, Ubuntu, Noto Sans, sans-serif";
        bar_height = 30;
        bar_padding = 10;
        bar_button_padding = 5;
        bar_precedence_over_border = true;
        bar_part_of_window = true;
        bar_color = "rgba(1D1011FF)";
        col.text = "rgba(F7DCDEFF)";
        hyprbars-button = [
          "rgb(F7DCDE), 13, 󰖭, hyprctl dispatch killactive"
          "rgb(F7DCDE), 13, 󰖯, hyprctl dispatch fullscreen 1"
          "rgb(F7DCDE), 13, 󰖰, hyprctl dispatch movetoworkspacesilent special"
        ];
      };
      hyprexpo = {
        columns = 3;
        gap_size = 5;
        bg_col = "rgb(000000)";
        workspace_method = "first 1";
        enable_gesture = false;
        gesture_distance = 300;
        gesture_positive = false;
      };
    };

    windowrule = [

    "tag +browser, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr|[Ff]irefox-bin)$"
    "tag +notif, class:^(swaync-control-center|swaync-notification-window|swaync-client|class)$"
    "noblur, tag:multimedia_video*"
    "opacity 1.0, tag:multimedia_video*"
    "center, class:([Tt]hunar), title:negative:(.*[Tt]hunar.*)"
    "center, title:^(Keybindings)$"
    "center, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
    "move 72% 7%,title:^(Picture-in-Picture)$"
    "idleinhibit fullscreen, fullscreen:1"

    # 工作区分配规则
    "workspace 2, tag:browser*"
    "workspace 5, tag:gamestore*"
    "workspace 8, tag:games*"
    "workspace 4, class:code"

    # 浮动窗口规则
    "float, class:([Zz]oom|onedriver|onedriver-launcher|mpv|com.github.rafostar.Clapper|[Qq]alculate-gtk|[Ff]erdium)$"
    "float, title:^(Picture-in-Picture|Authentication Required|Add Folder to Workspace|Save As|SDDM Background|Open Files)$"
    "float, class:(codium|codium-url-handler|VSCodium), title:negative:(.*codium.*|.*VSCodium.*)"
    "float, class:^(com.heroicgameslauncher.hgl)$, title:negative:(Heroic Games Launcher)"
    "float, class:^([Ss]team)$, title:negative:^([Ss]team)$"
    "float, class:([Tt]hunar), title:negative:(.*[Tt]hunar.*)"
    "float, title:^(Choose wallpaper)(.*)$"

    # 窗口位置和尺寸
    "center, title:^(Authentication Required|Add Folder to Workspace|Save As|SDDM Background)$"
    "size 70% 60%, title:^(Add Folder to Workspace|Save As|Open Files)$"
    "size 70% 70%, tag:(wallpaper|settings)*"

    # 其他规则
    "pin, title:^(Picture-in-Picture)$"
    "keepaspectratio, title:^(Picture-in-Picture)$"
    "noblur, tag:games*"
    "fullscreen, tag:games*"
    ];

    env = [
    "QT_QPA_PLATFORM, wayland"
    "QT_QPA_PLATFORMTHEME, kde"
    "ILLOGICAL_IMPULSE_VIRTUAL_ENV, ~/.local/state/quickshell/.venv"
    ];

    gestures = {
      workspace_swipe = true;
      workspace_swipe_distance = 700;
      workspace_swipe_fingers = 3;
      workspace_swipe_min_fingers = true;
      workspace_swipe_cancel_ratio = 0.2;
      workspace_swipe_min_speed_to_force = 5;
      workspace_swipe_direction_lock = true;
      workspace_swipe_direction_lock_threshold = 10;
      workspace_swipe_create_new = true;
    };

    dwindle = {
      preserve_split = true;
      smart_split = false;
      smart_resizing = false;
      # precise_mouse_move = true;
    };

    decoration = {
      rounding = 18;
      blur = {
        enabled = true;
        xray = true;
        special = false;
        new_optimizations = true;
        size = 14;
        passes = 3;
        brightness = 1;
        noise = 0.01;
        contrast = 1;
        popups = true;
        popups_ignorealpha = 0.6;
        input_methods = true;
        input_methods_ignorealpha = 0.8;
      };
      shadow = {
        enabled = true;
        ignore_window = true;
        range = 30;
        offset = "0 2";
        render_power = 4;
        color = "rgba(00000010)";
      };
      dim_inactive = true;
      dim_strength = 0.025;
      dim_special = 0.07;
    };

    animations = {
      enabled = true;
      bezier = [
        "expressiveFastSpatial, 0.42, 1.67, 0.21, 0.90"
        "expressiveSlowSpatial, 0.39, 1.29, 0.35, 0.98"
        "expressiveDefaultSpatial, 0.38, 1.21, 0.22, 1.00"
        "emphasizedDecel, 0.05, 0.7, 0.1, 1"
        "emphasizedAccel, 0.3, 0, 0.8, 0.15"
        "standardDecel, 0, 0, 0, 1"
        "menu_decel, 0.1, 1, 0, 1"
        "menu_accel, 0.52, 0.03, 0.72, 0.08"
      ];
      animation = [
        "windowsIn, 1, 3, emphasizedDecel, popin 80%"
        "windowsOut, 1, 2, emphasizedDecel, popin 90%"
        "windowsMove, 1, 3, emphasizedDecel, slide"
        "border, 1, 10, emphasizedDecel"
        "layersIn, 1, 2.7, emphasizedDecel, popin 93%"
        "layersOut, 1, 2, menu_accel, popin 94%"
        "fadeLayersIn, 1, 0.5, menu_decel"
        "fadeLayersOut, 1, 2.2, menu_accel"
        "workspaces, 1, 7, menu_decel, slide"
        "specialWorkspaceIn, 1, 2.8, emphasizedDecel, slidevert"
        "specialWorkspaceOut, 1, 1.2, emphasizedAccel, slidevert"
      ];
    };

    input = {
      kb_layout = "us";
      numlock_by_default = true;
      repeat_delay = 250;
      repeat_rate = 35;
      follow_mouse = 1;
      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        clickfinger_behavior = true;
        scroll_factor = 0.5;
      };
    };

    binds = {
      scroll_event_delay = 0;
      hide_special_on_workspace_change = true;
    };

    cursor = {
      zoom_factor = 1;
      zoom_rigid = false;
    };

    workspace = [
      "special:special, gapsout:30"
    ];

    layerrule = [
      "xray 1, .*"
      "noanim, walker"
      "noanim, selection"
      "noanim, overview"
      "noanim, anyrun"
      "noanim, indicator.*"
      "noanim, osk"
      "noanim, hyprpicker"
      "noanim, noanim"
      "blur, gtk-layer-shell"
      "ignorezero, gtk-layer-shell"
      "blur, launcher"
      "ignorealpha 0.5, launcher"
      "blur, notifications"
      "ignorealpha 0.69, notifications"
      "blur, logout_dialog"
      "animation slide left, sideleft.*"
      "animation slide right, sideright.*"
      "blur, session[0-9]*"
      "blur, bar[0-9]*"
      "ignorealpha 0.6, bar[0-9]*"
      "blur, barcorner.*"
      "ignorealpha 0.6, barcorner.*"
      "blur, dock[0-9]*"
      "ignorealpha 0.6, dock[0-9]*"
      "blur, indicator.*"
      "ignorealpha 0.6, indicator.*"
      "blur, overview[0-9]*"
      "ignorealpha 0.6, overview[0-9]*"
      "blur, cheatsheet[0-9]*"
      "ignorealpha 0.6, cheatsheet[0-9]*"
      "blur, sideright[0-9]*"
      "ignorealpha 0.6, sideright[0-9]*"
      "blur, sideleft[0-9]*"
      "ignorealpha 0.6, sideleft[0-9]*"
      "blur, osk[0-9]*"
      "ignorealpha 0.6, osk[0-9]*"
      "blurpopups, quickshell:.*"
      "blur, quickshell:.*"
      "ignorealpha 0.79, quickshell:.*"
      "animation slide, quickshell:bar"
      "animation fade, quickshell:screenCorners"
      "animation slide right, quickshell:sidebarRight"
      "animation slide left, quickshell:sidebarLeft"
      "animation slide bottom, quickshell:osk"
      "animation slide bottom, quickshell:dock"
      "blur, quickshell:session"
      "noanim, quickshell:session"
      "ignorealpha 0, quickshell:session"
      "animation fade, quickshell:notificationPopup"
      "blur, quickshell:backgroundWidgets"
      "ignorealpha 0.05, quickshell:backgroundWidgets"
      "noanim, qu"
    ];
  };
}
