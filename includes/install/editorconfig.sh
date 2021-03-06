#!/usr/bin/env bash

#####################################################################################
# Install .editorconfig file
#####################################################################################
if [[ -e "$HOME/$EDITOR_CONFIG_SETTINGS" ]]; then
   if [[ -e "$HOME/.backup$EDITOR_CONFIG_SETTINGS" ]]; then
      inform "$EDITOR_CONFIG_SETTINGS and .backup$EDITOR_CONFIG_SETTINGS exist." true
      inform "Nothing to install. Continuing..."
   else
      inform "$EDITOR_CONFIG_SETTINGS file exists." true
      pause_and_warn

      inform "Renaming to .backup$EDITOR_CONFIG_SETTINGS..."
      mv -v "$HOME/$EDITOR_CONFIG_SETTINGS" "$HOME/.backup$EDITOR_CONFIG_SETTINGS"

      inform "Downloading $EDITOR_CONFIG_SETTINGS..."
      curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/"$EDITOR_CONFIG_SETTINGS"

      if [[ -e "$EDITOR_CONFIG_SETTINGS" ]]; then
         inform "$EDITOR_CONFIG_SETTINGS downloaded successfully."

         inform "Installing $EDITOR_CONFIG_SETTINGS..."
         mv -v "$EDITOR_CONFIG_SETTINGS" "$HOME/"

         if [[ -e "$EDITOR_CONFIG_SETTINGS" ]]; then
            warn "$EDITOR_CONFIG_SETTINGS was not successfully installed. Please investigate, then continue."
            pause_and_warn
         else
            inform "$EDITOR_CONFIG_SETTINGS was installed successfully."
         fi
      fi
   fi
else
   inform "Downloading $EDITOR_CONFIG_SETTINGS..."
   curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/"$EDITOR_CONFIG_SETTINGS"

   if [[ -e "$EDITOR_CONFIG_SETTINGS" ]]; then
      inform "$EDITOR_CONFIG_SETTINGS downloaded successfully."

      inform "Installing $EDITOR_CONFIG_SETTINGS..."
      mv -v "$EDITOR_CONFIG_SETTINGS" "$HOME/"

      if [[ -e "$EDITOR_CONFIG_SETTINGS" ]]; then
         warn "$EDITOR_CONFIG_SETTINGS was not successfully installed. Please investigate, then continue."
         pause_and_warn
      else
         inform "$EDITOR_CONFIG_SETTINGS was installed successfully."
      fi
   fi
fi
