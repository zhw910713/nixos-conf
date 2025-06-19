{ config, pkgs, ...}:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-chinese-addons
    ];
  };

  i18n.inputMethod.fcitx5.settings.inputMethod = {
    GroupOrder."0" = "中文";
    GroupOrder."1" = "日语";
    "Groups/0" = {
      Name = "中文";
      "Default Layout" = "us";
      DefaultIM = "wbpy";
    };
    "Groups/0/Items/0".Name = "keyboard-us";
    "Groups/0/Items/1".Name = "wbpy";
    "Groups/1" = {
      Name = "日语";
      "Default Layout" = "us";
      DefaultIM = "mozc";
    };
    "Groups/1/Items/0".Name = "keyboard-us";
    "Groups/1/Items/1".Name = "mozc";
  };

  i18n.inputMethod.fcitx5 = {
    settings.globalOptions = {
      "Hotkey" = {
        "EnumerateWithTriggerKeys" = true;
        "AltTriggerKeys" = "";
        "EnumerateBackwardKeys" = "";
        "EnumerateSkipFirst" = false;
        "PrevPage" = "";
        "NextPage" = "";
        "ModifierOnlyKeyTimeout" = 250;
      };
      "Hotkey/TriggerKeys" = {
        "0" = "Control+space";
        "1" = "Zenkaku_Hankaku";
        "2" = "Hangul";
      };
      "Hotkey/EnumerateForwardKeys" = {
        "0" = "Shift+Shift_L";
      };
      "Hotkey/EnumerateGroupForwardKeys" = {
        "0" = "Control+Shift+Shift_L";
      };
      "Hotkey/EnumerateGroupBackwardKeys" = {
        "0" = "Control+Shift+Control_L";
      };
      "Hotkey/ActivateKeys" = {
        "0" = "Hangul_Hanja";
      };
      "Hotkey/DeactivateKeys" = {
        "0" = "Hangul_Romaja";
      };
      "Hotkey/PrevCandidate" = {
        "0" = "Shift+Tab";
      };
      "Hotkey/NextCandidate" = {
        "0" = "Tab";
      };
      "Hotkey/TogglePreedit" = {
        "0" = "Control+Alt+P";
      };
      "Behavior" = {
        ActiveByDefault = false;
        resetStateWhenFocusIn = "No";
        ShareInputState = "No";
        PreeditEnabledByDefault = true;
        ShowInputMethodInformation = true;
        showInputMethodInformationWhenFocusIn = false;
        CompactInputMethodInformation = true;
        ShowFirstInputMethodInformation = true;
        DefaultPageSize = 5;
        OverrideXkbOption = false;
        CustomXkbOption = "";
        EnabledAddons = "";
        DisabledAddons = "";
        PreloadInputMethod = true;
        AllowInputMethodForPassword = false;
        ShowPreeditForPassword = false;
        AutoSavePeriod = 30;
      };
    };
  };

}
