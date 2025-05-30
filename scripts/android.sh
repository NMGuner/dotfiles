#!/usr/bin/env zsh

echo "Installing Android SDK and tools..."

# Android Platform Tools
sdkmanager --install platform-tools

# Setup Android SDK 35
sdkmanager --install "platforms;android-35"
sdkmanager --install "build-tools;35.0.1"
sdkmanager --install "sources;android-35"

# Update old packages if needed
sdkmanager --update

# Accept all licenses
yes | sdkmanager --licenses

# Check if symlink exists before creating it
SDK_LINK="$HOME/Library/Android/sdk"
if [ ! -L "$SDK_LINK" ]; then
    # symlink the sdk directory from the macOS default location
    ln -s /opt/homebrew/share/android-commandlinetools "$SDK_LINK"
    echo "Android SDK symlink created."
else
    echo "Android SDK symlink already exists, skipping..."
fi

echo "Android SDK and tools have been installed."
