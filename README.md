# kx3esp
KX3 ESP: low-cost portable wifi adapter for the Elecraft KX3

The Elecraft KX3 is a lovely piece of kit, it even has built-in PSK31 and RTTY modems. Unfortunately, the only input method for text to be sent is sending Morse with a keyer paddle which the KX3 captures and encodes.

*Unless* you have a computer of some kind connected to its serial port in some fashion - hams being the hackers we are, that is up to and including an iPhone connected to a TCP socket your laptop has connected to the KX3 serial port.

Laptops, unfortunately, are heavy. Not very, but they're quite a pain to lug if you want to do say Summits on the Air and want to do PSK31 because picking out voice from the noise floor is hard and you haven't found the attention span to learn Morse.

You can use a $100 ad-hoc only wifi dongle. But it won't connect to your home network, and you need special software for it. Okay, not that you don't anyway, but you know.

I happened to have a bunch of ESP8266s hanging around so I got on Digi-Key and ordered some parts and wrote some code and... that's as far as I've gotten so far. This is a repo in progress - it will contain the full details required after everything is built and tested.

You need the nodeMCU firmware to use this.
