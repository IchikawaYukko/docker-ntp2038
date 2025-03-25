# docker-ntp2038
The NTP server always returns year 2038 for testing purpose.  
常に2038年を返すテスト用NTPサーバ（ぉ

# Test server
You can connect to [ntp2038.akiba.yuriko.co.nz](ntp2038.akiba.yuriko.co.nz) for test this NTP server! (Sorry, IPv6 only)

Or run `ntpdate -qdv ntp2038.akiba.yuriko.co.nz` command like below!
```
[yuriko@cisco-ucs docker-ntp2038]$ ntpdate -qdv ntp2038.akiba.yuriko.co.nz
26 Mar 02:16:34 ntpdate[26006]: ntpdate 4.2.6p5@1.2349-o Tue Jun 23 15:38:19 UTC 2020 (1)
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
refid [2001:470:fd50:20:662:73ff:fe5f:c06c], delay 0.02588, dispersion 0.00000
transmitted 4, in filter 4
reference time:    fe5b2444.46a215ff  Sun, Mar 25 2035  9:58:44.275
originate timestamp: fe5b244c.4220c1b0  Sun, Mar 25 2035  9:58:52.258
transmit timestamp:  eb8d6378.e9cb611a  Wed, Mar 26 2025  2:16:40.913
filter delay:  0.02629  0.02606  0.02599  0.02588
         0.00000  0.00000  0.00000  0.00000
filter offset: 31547413 31547413 31547413 31547413
         0.000000 0.000000 0.000000 0.000000
delay 0.02588, dispersion 0.00000
offset 315474131.344833

26 Mar 02:16:40 ntpdate[26006]: step time server 2001:470:fd50:20:662:73ff:fe5f:c06c offset 315474131.344833 sec
```
