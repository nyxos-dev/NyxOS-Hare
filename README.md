# NyxOS-Hare

NyxOS, rebuilt from scratch in Hare — a freestanding x86_64 operating system.
Part of the NyxOS family: the same OS, built again in a different language.

The original (C): https://github.com/kazah-png/nyx-os

**Why Hare:** small, freestanding, and systems-focused.
Proven in the wild: bare-metal experiments.

**Layout:** `boot/` — entry + bootstrap · `kernel/` — the kernel proper.

**Status:** early — bringing up the toolchain and a minimal higher-half kernel.
