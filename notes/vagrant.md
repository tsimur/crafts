# Vagrant notes

## Power off all vagrant machines
```bash
vagrant global-status | awk '/virtualbox running/{ print $1 }' | xargs vagrant halt
```