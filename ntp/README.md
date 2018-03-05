
## Important Variables

In the `vars/main.yaml` file there is a variable named `ntp_server`. If this variable is given a value, the default centos.ntp.org ntp servers will be commented out and the value of `ntp_server` will be added. This will ensure the ntp server will be used instead of the public centos servers.

###### ./vars/main.yaml
For example, to make the system use its own local clock for ntp, set the variable as follows

`ntp_server: 127.127.1.0`

To make the system query some other local server for time

`ntp_server: 192.168.1.150`

And to leave the default settings and simply use predefined ntp servers
`ntp_server: `

## Example Playbook
An example playbook to run this role

    - hosts: ntp_server
      roles:
        - ntp

## Post Run Checks
After you run this playbook, you can verify it is working using standard methods. If the server is using its local clock you will see the following.

```
[root@freeipa ~]# ntpq -p
     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
*LOCAL(0)        .LOCL.           5 l   46   64  377    0.000    0.000   0.000
```

```
[root@freeipa ~]# ntpstat
synchronised to local net at stratum 6
   time correct to within 11 ms
   polling server every 64 s
```
