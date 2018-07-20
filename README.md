> :warning: __Note:__
>
> This will install packages from `bionic` repositories.
> E.g.: Linux Mint 19, Ubuntu 18.04.
>
> For `xenial`, check out the `xenial` branch.

> :warning: **Note:** Brightness scripts are implemented on `lightdm`. It won't work on `gdm`.
>
> I haven't worked with Ubuntu 18.04/gdm (yet) because I consider it [broken](https://askubuntu.com/a/1031509) for now.

---

> :information_source: **Note:** Extra packages have been moved to a different repository:
>
> * [Redsandro/ansible-ubuntu-software](https://github.com/Redsandro/ansible-ubuntu-software)

---

# ThinkPad X1 Yoga Provisioning Playbook

This playbook was made for and tested on my __Lenovo ThinkPad X1 Yoga__ (2nd gen) __JD__ series with UHD __OLED__ panel.

Basically for when I was switching between different distros, but it crystallized into a playbook for __Linux Mint 18.3__ codename `sylvia`. Some others wanted to use it, so I put it here.

There's really not a lot of fine-tuning, so you best download this repo and remove all the things you don't want:

```
git clone https://github.com/Redsandro/thinkpad-x1-yoga.git /tmp/thinkpad-x1-yoga
```

### Features

Most importantly, this contains a workaround for __OLED Brightness Control__ through the __Fn Keys__.

* Change brightness through Fn Keys
* Set default Brightness
* Install `tlp` Advanced Power Management
* Install Official packages (Skip with `--skip-tags packages`)
* Install Extra packages (Skip with `--skip-tags extras`)

### Requirements

Get the latest `ansible`:

```
sudo apt-add-repository ppa:ansible/ansible
sudo apt update && sudo apt install ansible
```

### Usage

#### Most probable use-case

```
sudo env ANSIBLE_NOCOWS=1 ansible-playbook x1yoga.yml --skip-tags="packages,extras"
```

#### Everything except packages

```
sudo env ANSIBLE_NOCOWS=1 ansible-playbook x1yoga.yml --skip-tags packages
```

#### `tlp` Advanced Power Management only

Or simply for updating your configuration.

```
sudo env ANSIBLE_NOCOWS=1 ansible-playbook x1yoga.yml --tags tlp
```

#### GRUB background + 3 second timeout

```
sudo env ANSIBLE_NOCOWS=1 ansible-playbook x1yoga.yml --tags grub
```

#### Enable touch in Firefox

```
sudo env ANSIBLE_NOCOWS=1 ansible-playbook x1yoga.yml --tags firefox
```

### Tips

#### Battery

The `tlp` power management is configured to keep the battery below fully charged to improve battery life. So before you get on an airplane, it makes sense to fully charge the battery once:

* `sudo tlp fullcharge`

For more power management options, see [the `tlp` manual](http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html#tlp).

### Disclaimer

Use at your own risk. For advanced users only. Inspect the source before using. Worst case scenario: If something is conflicting or incompatible with your environment, your display manager might fail. You might have to log into textmode and undo related things.

### Contribute

Please if you have some ThinkPad X1 Yoga specific tweaks to make this laptop work better and last longer, contribute those tasks.

### Donate

__Ƀ__ `1Dj21fUCtt3RXBWuoJ2TpzAyNmh2BU5YSL`
