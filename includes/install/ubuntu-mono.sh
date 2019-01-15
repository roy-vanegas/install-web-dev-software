#####################################################################################
# Install the Ubunutu Mono typeface
#####################################################################################
if [[ -e "$HOME/Library/Fonts/UbuntuMono-Regular.ttf" ]]; then
   inform "Ubuntu Mono Regular is already installed." true
   pause_and_warn
else
   inform "Downloading the Ubuntu Mono typeface..."
   curl "https://fonts.google.com/download?family=Ubuntu%20Mono" -o "$UBUNTU_MONO_INSTALLER"

   inform "Unzipping the Ubuntu Mono typeface into Font Book..."
   unzip "$UBUNTU_MONO_INSTALLER" -d Ubuntu_Mono

   inform "Installing the Ubuntu Mono typeface into Font Book..."
   mv -v Ubuntu_Mono/*.ttf "$HOME/Library/Fonts/"

   inform "Removing Ubuntu_Mono folder..." true
   rm -fr Ubuntu_Mono

   inform "Removing $UBUNTU_MONO_INSTALLER file..." true
   rm -fr "$UBUNTU_MONO_INSTALLER"
fi
