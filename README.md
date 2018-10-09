
### Editor Note
I'm in the process of getting everything cleaned up. Code coming soon.

# XForceAFL
A kernel fuzzer for the original Xbox

## What?
XForceAFL is a kernel fuzzer for the original Xbox albeit a poorly thought out one. It uses XQEMU and concepts from [TriforceAFL](https://github.com/nccgroup/TriforceAFL) hence the name.

## Why?
There are plenty of exploits out there to get unsigned code execution on the Xbox. Most of the non-hardware based exploits require a specific game, and a gamesave which exploits some vulnerability in said game. I would like to see an exploit that most people can take advantage of with things they have around there home.

## How?
My primary areas of focus as of now has been the network stack. A vulnerability found here might only require a router and an ethernet cable to trigger. Perhaps the cdrom driver doesn't properly validate some field. A corrupt xbe header might yield some interesting results. There is plenty of attack surface.

## Technical Overview
If you would like a more in depth understanding of how this works, I'd recommend checking out the [TriforceAFL](https://github.com/nccgroup/TriforceAFL) repository. More or less, some psuedo-hypercalls have been added to XQEMU. The get called with a driver program (compiled XBE). These hypercalls indicate which memory should be traced, when to start / stop tracing, and supply the driver with fuzzed data. TriforceAFL is designed to utilize QEMU's TCG. More modern XQEMU no longer uses TCG so I used an older version to avoid headache.

## Setup
```
git clone https://github.com/MatthewTingum/XForceAFL.git
cd XForceAFL-master
make
cd ./qemu_mode/qemu
make
```

You will need to compile a client-side driver. In addition, you will need some seed inputs. Check out the `example` directory.

```
$ sh ./xfuzz.sh
```
