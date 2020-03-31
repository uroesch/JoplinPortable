[![Build](https://github.com/uroesch/JoplinPortable/workflows/build-package/badge.svg)](https://github.com/uroesch/JoplinPortable/actions?query=workflow%3Abuild-package)
[![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/uroesch/JoplinPortable?include_prereleases)](https://github.com/uroesch/JoplinPortable/releases)
[![Runs on](https://img.shields.io/badge/runs%20on-Win64%20%26%20Win32-blue)](#runtime-dependencies)

# Joplin Portable for PortableApps.com

<img src="App/AppInfo/appicon_128.png" align="left">

[Joplin](https://joplinapp.org/) is a free, open source note taking
and to-do application, which can handle a large number of notes
organised into notebooks.  The notes are searchable, can be copied,
tagged and modified either from the applications directly or from
your own text editor. The notes are in Markdown format.

Notes exported from Evernote via .enex files can be imported into Joplin,
including the formatted content (which is converted to Markdown), resources
(images, attachments, etc.) and complete metadata (geolocation, updated time,
created time, etc.). Plain Markdown files can also be imported.

The notes can be synchronised with various cloud services including Nextcloud,
Dropbox, OneDrive, WebDAV or the file system (for example with a network
directory). When synchronising the notes, notebooks, tags and other metadata
are saved to plain text files which can be easily inspected, backed up and
moved around.

The application is available for Windows, Linux, macOS, Android and iOS (the 
terminal app also works on FreeBSD). A Web Clipper, to save web pages and 
screenshots from your browser, is also available for Firefox and Chrome.

## Runtime dependencies
* 32-bit or 64-bit version of Windows.

## Support matrix

| OS              | 32-bit             | 64-bit              | 
|-----------------|:------------------:|:-------------------:|
| Windows XP      | :no_entry_sign:    | :no_entry_sign:     | 
| Windows Vista   | :no_entry_sign:    | :no_entry_sign:     | 
| Windows 7       | :white_check_mark: | :white_check_mark:  |  
| Windows 8       | :white_check_mark: | :white_check_mark:  | 
| Windows 10      | :heavy_check_mark: | :heavy_check_mark:  |

Legend: :no_entry_sign: not supported; :white_check_mark: supposed to work but not verified; :heavy_check_mark: verified;

## Status 
This PortableApps project is in beta stage. 

## Todo
- [ ] Documentation
- [ ] Icons are showing a black background instead of being transparent

## Disclaimer
Joplin is already Portable right from the bat. This wrapper does only segrate 
the data into the PortableApps `Data` directory.

## Build

### Prerequisites

* [PortableApps.com Launcher](https://portableapps.com/apps/development/portableapps.com_launcher)
* [PortableApps.com Installer](https://portableapps.com/apps/development/portableapps.com_installer)
* [Powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7)
* [Wine (Linux / MacOS only)](https://www.winehq.org/)

### Build

To build the installer run the following command in the root of the git repository.

```
powershell Other/Update/Update.ps1
```
