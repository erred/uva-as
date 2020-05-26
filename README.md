# Advanced Security

study notes

## rf

- 433 Mhz
- 2kbps (default, balance stability), 5kbps max
- (forward) error correction
- duty cycling: possible, collisions, enforceable by law
- trilateration: distances, triangulation: angles
- antenna types: pattern, bandwidth, gain, impedance, 1/2^n wavelength = speed / freq
- security by encryption: overhead
- amplitude shift keyring:
- on off keyring:

## bt

- ibeacons, bluetooth low energy, advertising mode, trilateration
- mitm proxy, cheap dongles, success depends
- pairing: legacy symmetric pin, weak key, offline crack
- pairing: simple secure, asymmetric, 4 modes
- sniffing: channel hopping, offset, encryption
- 3 fixed advert channels
- smart watch debug through snoop log
- att: transfer data, gatt: services and characteristics, l2cap: multiplexing, flow control, and segmentation and reassembly of service data units

## sdr

- p2000 emergency paging network 169.65 Mhz, motorola flex
- ais ships 162 Mhz
- car handsfree (phone-bt-kit-fm-speaker) 96.6Mhz
- ads-b planes 1090Mhz 1Mbps
- rng: noise, interference
- pocsag commercial pager, frequency shift keyring
- weather sat: 137.5 Mhz

## wifi

- "pineapple" with multiple radios
- krack: nonce reuse, spec oversight
- wep: small iv set, forgeable auth, large number of packets
- wpa2: weak derived keys, brute force recover password
- wpa3: dragonblood, dos, timing side channel, bruteforce
- radius: complex

## gsm
