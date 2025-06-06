# Installer Maintenance Guide

## Setup
### Clone the installer branch
`git clone --branch installer --single-branch https://github.com/Zehen-249/Osdag.git`
### Recreate the pixi environment 
- Open terminal and go to osdag-pixi folder `cd */path/to/pixi-installer/osdag-pixi`
#### To update the installer script
- Run `pixi install`
- It will Read the pixi.lock file.
- Create a deterministic environment with exact versions and platform-specific builds
#### To update Osdag with the latest release version on conda channel or any dependency of Osdag
- Edit the `pixi.toml` file.
- Specify the updated version of the dependency or Osdag.
- Now run `pixi install`.
- It will regenerate pixi.lock file with update versions and will create the environment.


## Maintenance 
- Once the pixi environment for the latest release is created, create a new folder in the parent directory for the new release version of the installer.
- Update the outputfile name as as needed, follow the pattern.
- Update product version. 
- Make the neccessary changes in the installer script (.nsi).
- Compile the script. (See Appendix B in Winodws Installer for Osdag(Developer’s Guide))
- The installer.exe will be created in the same directory where .nsi script is placed.
- Get this new installer digitally signed with the certificate. (See Chapter ?? Winodws Installer for Osdag (Developer’s Guide))
- Distribute this new installer.

<hr>
For more detailed steps, read the Winodws Installer for Osdag(Developer’s Guide) document. Update this document if necessary for future maintainers. 
