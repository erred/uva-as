https://www.krackattacks.com/

https://www.youtube.com/watch?v=fZ1R9RliM1w
https://www.youtube.com/watch?v=mYtvjijATa4

## testing clients

attack script is a malicious AP

### wlp0s20f0u1: ap, wlp58s0: client

sudo python2 ./krack-test-client.py
sudo ./krackattacks-scripts/wpa_supplicant/wpa_supplicant -D nl80211 -i wlp58s0 -c net.conf

[12:39:48] 34:13:e8:50:8c:05: Client DOESN'T accept replayed broadcast frames (this is good)
[12:41:14] 34:13:e8:50:8c:05: Client installs the group key in the group key handshake with the given replay counter (this is good)
[12:43:25] 34:13:e8:50:8c:05: Client DOESN'T reinstall the group key in the group key handshake (this is good)
[12:45:05] 34:13:e8:50:8c:05: client DOESN'T reinstall the pairwise key in the 4-way handshake (this is good) (used standard attack).
[12:47:16] 34:13:e8:50:8c:05: client DOESN'T reinstall the pairwise key in the 4-way handshake (this is good) (used TPTK attack).
[12:49:33] 34:13:e8:50:8c:05: Client always installs the group key in the 4-way handshake with a zero replay counter (this is bad).
[12:49:33] Or client accepts replayed broadcast frames (see --replay-broadcast).

### wlp0s20f0u1: ap, phone: client

sudo python2 ./krack-test-client.py

[13:17:50] c6:a7:b9:86:94:d2: Client DOESN'T accept replayed broadcast frames (this is good)
[13:22:28] c6:a7:b9:86:94:d2: Client installs the group key in the group key handshake with the given replay counter (this is good)
[13:23:57] c6:a7:b9:86:94:d2: Client DOESN'T reinstall the group key in the group key handshake (this is good)
[13:20:05] c6:a7:b9:86:94:d2: client DOESN'T reinstall the pairwise key in the 4-way handshake (this is good) (used standard attack).
[13:25:20] c6:a7:b9:86:94:d2: client DOESN'T reinstall the pairwise key in the 4-way handshake (this is good) (used TPTK attack).
[13:26:19] c6:a7:b9:86:94:d2: Client always installs the group key in the 4-way handshake with a zero replay counter (this is bad).
[13:26:19] Or client accepts replayed broadcast frames (see --replay-broadcast).
