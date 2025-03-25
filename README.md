# docker-ntp2038
The NTP server always returns year 2038 for testing purpose.  
常に2038年を返すテスト用NTPサーバ（ぉ

# NTP_YEAR
You can set `NTP_YEAR` variable for return another year.  
`NTP_YEAR` 環境変数を設定することで、ほかの年を返すことも可能。

# Test server
You can connect to [ntp2038.akiba.yuriko.co.nz](ntp2038.akiba.yuriko.co.nz) for test this NTP server! (Sorry, IPv6 only)

Or run `ntpdate -qdv ntp2038.akiba.yuriko.co.nz` command like below!
```
[root@trijn ~]# ntpdate -qdv ntp2038.akiba.yuriko.co.nz
26 Mar 03:44:55 ntpdate[24378]: ntpdate 4.2.6p5@1.2349-o Tue Jun 23 15:38:19 UTC 2020 (1)
Looking for host ntp2038.akiba.yuriko.co.nz and service ntp
host found : cisco-ucs.home.yuriko.co.nz
transmit(2001:470:fd50:20:662:73ff:fe5f:c06c)
receive(2001:470:fd50:20:662:73ff:fe5f:c06c)
transmit(2001:470:fd50:20:662:73ff:fe5f:c06c)
receive(2001:470:fd50:20:662:73ff:fe5f:c06c)
transmit(2001:470:fd50:20:662:73ff:fe5f:c06c)
receive(2001:470:fd50:20:662:73ff:fe5f:c06c)
transmit(2001:470:fd50:20:662:73ff:fe5f:c06c)
receive(2001:470:fd50:20:662:73ff:fe5f:c06c)
server 2001:470:fd50:20:662:73ff:fe5f:c06c, port 123
stratum 15, precision -25, leap 00, trust 000
refid [2001:470:fd50:20:662:73ff:fe5f:c06c], delay 0.03461, dispersion 0.00000
transmitted 4, in filter 4
reference time:    04000469.5e498c43  Mon, Feb 17 1902  2:39:53.368
originate timestamp: 0400049b.492c52e0  Mon, Feb 17 1902  2:40:43.285
transmit timestamp:  eb8d782e.2f52008a  Wed, Mar 26 2025  3:45:02.184
filter delay:  0.03714  0.03461  0.03526  0.03601
         0.00000  0.00000  0.00000  0.00000
filter offset: 41016023 41016023 41016023 41016023
         0.000000 0.000000 0.000000 0.000000
delay 0.03461, dispersion 0.00000
offset 410160237.095359

26 Mar 03:45:02 ntpdate[24378]: step time server 2001:470:fd50:20:662:73ff:fe5f:c06c offset 410160237.095359 sec
```

You can set source for chronyd or ntpd to monitor offset. (it should be 4747days)
```
[root@trijn ~]# chronyc sources -v
210 Number of sources = 4

  .-- Source mode  '^' = server, '=' = peer, '#' = local clock.
 / .- Source state '*' = current synced, '+' = combined , '-' = not combined,
| /   '?' = unreachable, 'x' = time may be in error, '~' = time too variable.
||                                                 .- xxxx [ yyyy ] +/- zzzz
||      Reachability register (octal) -.           |  xxxx = adjusted offset,
||      Log2(Polling interval) --.      |          |  yyyy = measured offset,
||                                \     |          |  zzzz = estimated error.
||                                 |    |           \
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^+ 47.79.37.210                  2  10   377   662    -97us[  -97us] +/- 2881us
^+ any.time.nl                   2  10   377   667    -52us[  -31us] +/- 1313us
^* 2406:da14:10c4:9aa0:123::     1  10   377   664   +183us[ +203us] +/- 1166us
^x cisco-ucs.home.yuriko.co>    15   6   377    16   -4747d[ -4747d] +/- 5684us
```
