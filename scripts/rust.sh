#!/usr/bin/env zsh

echo "Installing Rust and Rustup..."

# Check if Rust is already installed
if ! command -v rustc &> /dev/null; then
    # Install Rust using rustup
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
else
    echo "Rust is already installed."
fi

# Update Rust and components
rustup update

# Setup shell environment for cargo
if [[ -f "$HOME/.cargo/env" ]]; then
    source "$HOME/.cargo/env"
else
    echo "Warning: .cargo/env not found. Please ensure Rust is properly installed."
fi

# Install Rust toolchain
rustup toolchain install stable
# Set the stable toolchain as default
rustup default stable

# Install rust standard library source
rustup component add rust-src

# Install common Rust components
# fustfmt: https://github.com/rust-lang/rustfmt
rustup component add rustfmt
# clippy: https://github.com/rust-lang/rust-clippy
rustup component add clippy
# rust-analyzer: https://github.com/rust-lang/rust-analyzer
rustup component add rust-analyzer

echo "Rust and Rustup have been installed."
