## Retro Computing

These are some notes from my retro computing setup. I became interested in
running operating systems that were popular in my childhood on modern
hardware and decided to see if I could replicate the experience with QEMU and
other tools like DOSBox.

This page captures some notes about my setup.

### Windows 9x

<a href="res/projects/retro/windows_95_dma_fix.png">
  <img width="50%" src="res/projects/retro/windows_95_windows_folder.png#floatleft">
</a>

#### KVM Compatibility

Windows 95 will hang if shutdown in a KVM environment. In order to prevent this,
disable the shutdown logo by renaming `C:\WINDOWS\LOGOW.SYS` to another name
such as `C:\WINDOWS\LOGOW.SYS.BAK` or just remove it.<br>

<a href="res/projects/retro/windows_95_dma_fix.png">
  <img width="50%" src="res/projects/retro/windows_95_dma_fix.png#floatleft">
</a>

#### Disk Drive Performance

Windows 95 will run very poorly with the default disk drivers. In order to
improve performance, enable `DMA` mode.<br>
