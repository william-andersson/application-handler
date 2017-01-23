#macOS style applications for Linux

This is an attempt to simulate the application structure of macOS on Linux-distros
and in a future update have them sandboxed. The Idea is to have the script running in
background at all time monitoring an /Applications folder.

When a distributed application.pkg file is copied to the /Applications folder the
script automatically "installs" the application by unpacking the archive, hiding the
applications folder and copies the .desktop file to the parent (/Applications) folder.
When/if the .desktop file for a given application is removed the script automatically
deletes the hidden folder containing that application.

Applications must be packed as the tree view below shows and compressed with **tar czf FooBar.pkg FooBar**
Remember that all path references must point to the .FooBar folder.
```
FooBar
  |
  |-bin
  |  |
  |  |-FooBar (executable)
  |
  |-data
  |  |
  |  |-FooBar.svg (application icon)
  |  |-(other files used by the application)
  |
  |-lib
  |  |
  |  |-dependencies (those not included in system)
  |
  |-FooBar.desktop
```

<p align="center">
<b>Copyright 2016, William Andersson<b>
</p>
