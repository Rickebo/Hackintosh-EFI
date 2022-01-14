# macOS
This repository currently details my system specifications, and some basic steps I took to install macOS Monterey on my hackintosh.

# System specifications

- Intel Core i7 8700k
  - Intel UHD Graphics 630
- 16GB DDR4 2666MHz RAM
- AsRock Z370 Pro4
  - Realtek 892
- 250 GB PCIe 3-0 NVMe SSD for macOS
- 1TB PCIe 3.0 NVMe SSD for Windows

# EFI
Using OpenCore, with the following kexts:
- AppleALC
- IntelMausi
- Lilu
- SMCProcessor
- SMCSuperIO
- USBInjectAll
- USBMap
- VirtualSMC
- VodooPS2Controller
- WhateverGreen
- XHCI-unsupported

# Setup
1. Setup [config.plist](EFI/OC/config.plist) according to [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/)
2. Try out different display cables until one is found that works. In my case, using a HDMI cable with the integrated graphics worked when using the recommended framebuffer settings, although with a purple tint.
3. Fix video port mapping according to [this guide](https://www.tonymacx86.com/threads/guide-general-framebuffer-patching-guide-hdmi-black-screen-problem.269149/). After this step, the HDMI port on the motherboard works as intended without the purple tint.
4. Disable auto sleep, since it is broken.
5. Fix usb port mapping according to the guide provided on [USBMap's github repository's readme](https://github.com/corpnewt/USBMap). After this step, most USB ports should work.
6. Fix audio by using layout id 1, and making sure that the onboard audio is set to Enabled, not Auto, in UEFI.