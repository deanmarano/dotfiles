# Dean's Dotfiles

These are @deanmarano's configuration files.

If you're not Dean, welcome! You might find useful bits of config to steal.
The `bin` folder contains some helpful scripts.


This contains config for:
* terminal vim (text editor)
* tmux (terminal multiplexer)
* fish (shell)
* asdf (version manager)
* kitty (terminal emulator)
* Homebrew

On a variety of platforms:
* macOS
* Linux
* ChromeOS

If you're setting up a new computer:

* Ensure `git` is installed
  * Deb Linux - `sudo apt install git`
  * Mac - install homebrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
* `cd; git clone https://github.com/deanmarano/dotfiles.git`
  * Use https until SSH key has been setup.
* Run `~/dotfiles/setup.sh`

## Installing a new application

When adding an application to the setup:

* Add the app to the install list (usually `Brewfile`)
* Create the config in the dotfiles repo `touch ~/dotfiles/app.conf`
  * I like to leave off the leading `.` to make the files visible, and add
    them back in the link
* Create symlinks(s) for config to the correct location in `link_dotfiles.sh`
  * With `app` as an example: `ln -s ~/dotfiles/app.conf ~/.config/app/app.conf`
  * Reference files directly to dotfiles path, rather than creating more symlinks
* Use the Solarized Light theme (if applicable)
