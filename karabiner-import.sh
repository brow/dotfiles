#!/bin/sh
# Configuration for Karabiner. Generated by `karabiner export`, commented by me.

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 0

# Easier Escape
/bin/echo -n .
$cli set option.emacsmode_controlLeftbracket 1

# Easier arrow keys
/bin/echo -n .
$cli set option.vimode_hjkl 1
/bin/echo -n .
$cli set option.vimode_fn_hjkl 1

# Remap Caps Lock for AEII and normal keyboards, assuming Seil is being used to
# remap Caps Lock to PC Application.
/bin/echo -n .
$cli set private.pc_application_to_controlLock 1
/bin/echo -n .
$cli set private.pc_application_to_control 1

# Remap fkeys to media keys, brightness, etc.
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f1 1
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f7 1
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f10 1

/bin/echo -n .
/bin/echo