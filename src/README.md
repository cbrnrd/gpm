# GPM - GitHub Package Manager

### `gpm install`
The goal with the install task is to request GitHub as little as possible. Most
 info can be found in the repo's `.git` directory.

The `install` command works as follows:

1. Checks if the repo exists on GitHub
2. If it does, clone the repo into a temp folder in the user home (`~`)
3. Look for the gpm.json file.
4. If the file exists, check for `gpmbins` directory
5. Make sure the correct arch binary exists for the current system arch
6. Copy the binary to `/usr/local/bin`

*TODO*
* Add post install capabilities to gpm.json

### `gpm uninstall`

The `uninstall` command works as follows:

1. Using `command -v` locate where the binary is (user might have moved it).
2. Take the output of step one and shred/rm the file.

### `gpm download`

The `download` command is the same as the `install` command except it moves the
 binary to the current working directory.
