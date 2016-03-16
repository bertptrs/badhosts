# Badhosts

Like many people, I have a server, and like most others, it is often attempted
to log into. I use SSHGuard to protect myself from that. This repository
contains the hosts that ignore that.

The badhosts file in this repository is created by running the
`update-badhosts.sh` script on a systemd timer. It reads from the current
sshguard blacklist, and adds any new IP addresses to the list.

If the resulting blacklist is of any help to anyone, let me know.

If you want to use this script yourself, feel free to run it/fork me. Please
note that the SSHGuard blacklist format differs per version of SSHGuard. I am
using version 1.6.3 running on Arch Linux.
