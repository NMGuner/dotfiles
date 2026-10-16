#!/usr/bin/env zsh

echo "Installing Android SDK and tools..."

# Accept all licenses first, so the installs below don't stop for prompts
yes | sdkmanager --licenses > /dev/null

# Android Platform Tools
sdkmanager --install platform-tools

# Setup Android SDK 36
sdkmanager --install "platforms;android-36"
sdkmanager --install "build-tools;36.0.0"
sdkmanager --install "sources;android-36"

# Update old packages if needed
sdkmanager --update

# Check if symlink exists before creating it
SDK_LINK="$HOME/Library/Android/sdk"
if [ -L "$SDK_LINK" ]; then
    echo "Android SDK symlink already exists, skipping..."
elif [ -e "$SDK_LINK" ]; then
    # e.g. an SDK installed by Android Studio; ln -s would put the link inside that folder
    echo "Warning: $SDK_LINK already exists and is not a symlink, skipping..."
else
    # symlink the sdk directory from the macOS default location
    mkdir -p "$(dirname "$SDK_LINK")"
    ln -s /opt/homebrew/share/android-commandlinetools "$SDK_LINK"
    echo "Android SDK symlink created."
fi

echo "Android SDK and tools have been installed."
