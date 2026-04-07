# home-manager example

## Usage

You should fork this repo into a private dotconfig repo.

After installing home-manager, replace `~/.config/home-manager/home.nix` with a
symlink to one of the `enironments/*.nix` files.

For example, you might hae a personal.nix setup for your personal box.
Assuming you have this repo checked out at `~/work/dotconfig`:

```
cd ~/.config/home-manager
rm home.nix
ln -ns ~/work/dotconfig/environments/personal.nix home.nix
home-manager switch
```

Make sure to personalize the config. Home directories, username, and git
identity are among the basic configs. Check out [nixpkgs](https://search.nixos.org/packages).
There are also overlays that allow one to use specific versions of packages.

This repo includes direnv as a zsh plugin, with zsh as the default shell. This
allows home-manager to manage direnv for us.

See the home-manager manual: https://nix-community.github.io/home-manager/

## TODO
The organization of this example is inverted. We could had the top-level
`environments/*.nix` files at the top level, and import from files in
the `modules/` directory.
