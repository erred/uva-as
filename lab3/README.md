software
https://www.fontenay-ronan.fr/ais-receiver-on-a-raspberry-pi-with-rtl-sdr/
build antenna
https://www.rtl-sdr.com/rtl-sdr-tutorial-cheap-ais-ship-tracking/

1. How does the AIS protocol work and how can you receive this signal?
2. Can you find any information with the AIS receiver that you would not be able to see on a tracking website?
3. Could you receive more vessels by using a different antenna?

## AIS

Automatic identification system

Satellite AIS (S-AIS)

AIS uses the globally allocated Marine Band channels 87 & 88.

AIS uses the high side of the duplex from two VHF radio "channels" (87B) and (88B)

Channel A 161.975 MHz (87B)
Channel B 162.025 MHz (88B)

NRZI encoded with GMSK modulation

NRZI: encode 1 as transition

```
<8 bit ramp up><24 bit preamble><8 bit start flag><168 bit payload><16 bit CRC><8 bit stop flag><24 bit buffer>
```

class a:
VHF maritime channels 87B (161.975 MHz) and 88B (162.025 MHz), and use 9.6 kbit/s Gaussian minimum shift keying (GMSK) modulation over 25 kHz channels using the High-level Data Link Control (HDLC) packet protocol

class b:
Output is the standard AIS data stream at 38.400 kbit/s, as RS232 and/or NMEA formats

The SOTDMA broadcast mode allows the system to be overloaded by 400 to 500% through sharing of slots, and still provides nearly 100% throughput for ships closer than 8 to 10 nmi to each other in a ship to ship mode.

SOTDMA Self-Organized Time Division Multiple Access
FATDMS fixed-access time-division multiple-access
PATDMA pre-announce time-division multiple-access

2,250 time slots established every 60 seconds on each frequency.
tagged with a random timeout of between 4 and 8 minutes

Types:

- Class A: SOTDMA: large ships, reserve slot in tdma
- Class B: SOTDMA: CS (old) find empty slot, CO (new) same as Class A
- Base Station: control devices
- Aids to Navigation: FATDMA collect, transmit, relay AIS + sea / weather
- Search and Rescue Transceiver: PATDMA random select burst

37 km
shipboard range: only up to about 74 kilometres

An AIS transceiver sends the following data every 2 to 10 seconds depending on a vessel's speed while underway, and every 3 minutes while a vessel is at anchor:

In addition, the following data are broadcast every 6 minutes

```
Typical NMEA 0183 standard AIS message: !AIVDM,1,1,,A,14eG;o@034o8sd<L9i:a;WF>062D,0*7D

In order:

!AIVDM:        The NMEA message type, other NMEA device messages are restricted
1              Number of sentences (some messages need more than one, maximum generally is 9)
1              Sentence number (1 unless it is a multi-sentence message)
               The blank is the sequential message ID (for multi-sentence messages)
A              The AIS channel (A or B), for dual channel transponders it must match the channel used
14eG;...       The encoded AIS data, using AIS-ASCII6
0*             End of data, always 0 for parsing and error correction
7D             NMEA checksum (NMEA 0183 Standard CRC16)
```
