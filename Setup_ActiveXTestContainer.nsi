; example1.nsi
;
; This script is perhaps one of the simplest NSIs you can make. All of the
; optional settings are left to their default settings. The installer simply 
; prompts the user asking them where to install, and drops a copy of example1.nsi
; there. 

;--------------------------------

Unicode true

!define APP "ActiveXTestContainer"

!system 'MySign "bin\x86\TstCon.exe" "bin\x64\TstCon.exe"'
!finalize 'MySign "%1"'

; The name of the installer
Name "${APP}"

; The file to write
OutFile "Setup_${APP}.exe"

; The default installation directory
InstallDir "$DESKTOP\${APP}"

; Request application privileges for Windows Vista
RequestExecutionLevel user

XPStyle on

;--------------------------------

; Pages

LicenseData "README.rtf"

Page license
Page directory
Page instfiles

;--------------------------------

; The stuff to install
Section "" ;No components page, name is not important

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  SetOutPath "$INSTDIR\x86"
  File /r         "bin\x86\*.*"
  SetOutPath "$INSTDIR\x64"
  File /r         "bin\x64\*.*"
  
  ExecShell "open" "$INSTDIR"
  
  IfErrors +2
    SetAutoClose true

SectionEnd ; end the section
