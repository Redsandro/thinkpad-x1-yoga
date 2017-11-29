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

```
sudo env ANSIBLE_NOCOWS=1 ansible-playbook x1yoga.yml --skip-tags="packages,extras"
```

### Contribute

Please if you have some ThinkPad X1 Yoga specific tweaks to make this laptop work better and last longer, contribute those tasks.
