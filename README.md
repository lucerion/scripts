# Scripts

* [add_path](add_path) - adds executables directory to the $PATH
* [als](als) - shell aliases manager
* [ex_projections](ex_projections) - Elixir apps [projection](https://github.com/tpope/vim-projectionist) file generator
* [git-branch](git-branch) - helps work with git branches in one command
* [gql](gql) - sends GraphQL request from file
* [id3tags](id3tags) - changes (bulk) ID3 tags for MP3 files
* [linker](linker) - links directories by groups
* [open_vpn](open_vpn) - openvpn2 wrapper that manages connections by configuration file
* [orm](orm) - aliases for the ORMs (ruby, javascript, elixir, ...) commands
* [pgconn](pgconn) - psql wrapper that connects to the PostgreSQL by configuration file
* [ruby2json](ruby2json) - ruby hash to json convertor
* [starter](starter) - starts commands depending on the current directory path
* [vim-pack](vim-pack) - Vim (vim8, neovim) package manager
* [vim-server](vim-server) - open files in the one Vim instance


## Installation

Copy `.env.example` to `.env` and edit it. Run `make <command>` in the root directory and then enter script name or
`make <command>` in a script directory where `<command>`

* `install` - copy script to user home binary directory (default path: `~/.local/bin`, can be configured with `BIN_DIR` env variable)
* `config` - copy config example (default path: `~/.config`, can be configured with `CONFIG_DIR` env variable)
* `uninstall` - remove script only
* `purge` - remove script and config
