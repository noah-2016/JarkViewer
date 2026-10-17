#ifndef MyAppVersion
  #define MyAppVersion "2.0"
#endif
#ifndef MyBuildVersion
  #define MyBuildVersion "2.0.0.0"
#endif
#ifndef MyCommit
  #define MyCommit "local"
#endif
#ifndef MySourceDir
  #define MySourceDir "..\..\x64\Release"
#endif
#ifndef MyOutputDir
  #define MyOutputDir "..\..\dist"
#endif
#ifndef MyOutputBaseFilename
  #define MyOutputBaseFilename "JarkViewer-v" + MyAppVersion + "-" + MyCommit + "-x64-setup"
#endif

#define MyAppName "JarkViewer"
#define MyAppExeName "JarkViewer.exe"
#define MyAppPublisher "JARK006"
#define MyAppURL "https://github.com/noah-2016/JarkViewer"

[Setup]
AppId={{ACEC64E6-00B7-4CB4-8BFC-EA383E1DE18C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}/issues
AppUpdatesURL={#MyAppURL}/releases
VersionInfoVersion={#MyBuildVersion}
VersionInfoCompany={#MyAppPublisher}
VersionInfoDescription=JarkViewer Windows Installer ({#MyCommit})
VersionInfoProductName={#MyAppName}
DefaultDirName={localappdata}\Programs\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
SetupIconFile=..\..\JarkViewer\JarkViewer.ico
UninstallDisplayIcon={app}\{#MyAppExeName}
LicenseFile=..\..\LICENSE
OutputDir={#MyOutputDir}
OutputBaseFilename={#MyOutputBaseFilename}
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
CloseApplications=yes
RestartApplications=no
UsePreviousAppDir=yes
UsePreviousGroup=yes

[Languages]
Name: "chinesesimplified"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#MySourceDir}\JarkViewer.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MySourceDir}\JarkThumbnailProvider.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MySourceDir}\BUILD-INFO.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\LICENSE"; DestDir: "{app}"; DestName: "LICENSE.txt"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\卸载 {#MyAppName}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Registry]
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\{#MyAppExeName}"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName}"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\{#MyAppExeName}"; ValueType: string; ValueName: "Path"; ValueData: "{app}"; Flags: uninsdeletevalue

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\JarkViewer.thumbnail"
Type: files; Name: "{app}\JarkViewer.thumbnail.tmp"
