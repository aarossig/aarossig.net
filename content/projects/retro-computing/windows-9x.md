---
title: "windows 9x"
date: 2022-10-15T12:43:00-07:00
draft: true
---

Here are some configuration/setup tricks that I have used while configuring
Windows 9x based virtual machines under QEMU.

## KVM Compatibility

Windows 9x will hang if shutdown in a KVM environment. In order to prevent this,
disable the shutdown logo by renaming `C:\WINDOWS\LOGOW.SYS` to another name
such as `C:\WINDOWS\LOGOW.SYS.BAK` or just remove it.

{{< image src="images/projects/retro-computing/windows-95-windows-folder.png"
    alt="Windows 95 Logow.sys in the Windows folder" >}}

## Disk Drive Performance

Windows 9x will run very poorly with the default disk drivers. In order to
improve performance, enable `DMA` mode.

{{< image src="images/projects/retro-computing/windows-95-dma-fix.png"
    alt="Windows 95 hard drive performance DMA fix" >}}
