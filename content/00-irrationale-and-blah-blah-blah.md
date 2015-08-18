---
date: 2015-08-18T18:17:02+03:00
draft: false
title: (Ir)Rationale and blah blah blah
tags:
  - planning
---

## Warning

**This useless wall of text is really just to keep my focus on the project, and to document it for my later self (hi older me!). This is not a tutorial of any kind, It's not meant to be useful, and the project will probably not even succeed. TL;DR is adviced.**


## Why build a cluster?

* Because of reasons!
* Because ~~I can~~ can I?
* Just because.

Now I don't really have any burning needs for a cluster. However, I do like to tinker with one. Being a software developer these days is more than likely to include The Internets and networked applications in some form or another. Along with the current "full stack" trends, I also happen to have an interest in the Ops-side of things, and prefer to rule my own platforms.

Some of my daily work as a software designer and eveningly work as a procrastinating paralysis by analysis -affected wannabe nerd has included the Ops-side of things such as [provisioning](https://puppetlabs.com/) of [web servers](https://en.wikipedia.org/wiki/LAMP_%28software_bundle%29), [automation](http://www.ansible.com/home) and [orchestration](http://saltstack.com/) of more [dynamic](https://www.docker.com/) [DIY-ish](http://www.freedesktop.org/wiki/Software/systemd/) environments, and lately drifting towards [more](http://kubernetes.io/) [complete](https://coreos.com/) [solutions](http://mesos.apache.org/).

Why not try out these things in a "real" environment instead of the plain old [Vagrant](https://www.vagrantup.com/) clusters? You could play with [distributed](http://cassandra.apache.org/) [storages](http://ceph.com/). And it might not be a bad idea to dapple with that [big](http://spark.apache.org/) [data](https://hadoop.apache.org/) thing while at it.

Mainly it's just for fun, show-off and shiny LEDs with a TFT-dashboard!


## Initial Hardware plans

Most of the stuff will be planned as I go. This will lead to failures and unnecessary money burned.

### Parts ordered

At the time of writing, I've ordered an initial bunch of stuff
that I have carefully (not) calculated to be needed. Such items
include:

* **6x** [Raspberry Pi 2 Model B](https://www.raspberrypi.org/products/raspberry-pi-2-model-b/)
  * The more the merrier, when the intention is to play with failovers, balancing and HA-stuff
  * Non-masterless setups take 1 to 3 nodes just to control the cluster, which leaves just the bare minimum of 3 slaves
  * Six was the most I really dared without a real need as a justification
  * For the initial plan I had just an 8-port switch
  * Will keep the possible future expansion in mind when building

* **6x** [Samsung MicroSDHC 16GB PRO](http://www.samsung.com/us/computer/memory-storage-accessories/MB-MG16DA/AM)

* [Corsair CX Series™ Modular CX430M ATX Power Supply](http://www.corsair.com/en/cx-series-cx430m-modular-atx-power-supply-430-watt-80-plus-bronze-certified-modular-psu)
  * Modularity was desired, planning to build my own cables straight from the source without adapters

[![rpi2s](/img/00/rpi2s_thumb.jpg)](/img/00/rpi2s.jpg)

* **15x** 50cm Cat5e (red, orange, purple) cables
  * Couldn't find a full rainbow suite of cables at a reasonable price :(, so I opted for a somewhat coherent color pattern (at least tried)

* **8x** [USB Male to Micro USB Male Charging Cable - Orange](http://www.dx.com/p/bolongking-usb-male-to-micro-usb-female-charging-cable-orange-105cm-199712)
  * Orange is a nice color
  * One review said these can transfer over 1A
  * However, I don't really need these, since I changed my mind after ordering (using diy molex-usb -cables)

* **10x** Straight Micro USB Male Plug Socket Connectors, **10x** Right Angle Micro USB Male Plug Socket Connectors
  * Because you might need these in some unexpected situation in the future! (=hoarding)
  * Because why plan to determine which style suits better, when you can experiment (=lazyness, hoarding)
  * I really lack at planning

* [OpenWrt capable board thingy](http://eud.dx.com/product/gl-inet-wi-fi-router-openwrt-ssh-usb-64mbyte-ram-wireless-repeater-pcb-board-green-844346531)
  * Planning to use for dhcp and routing
  * Will have cluster-internal network and a firewall/router
  * Hating the idea of an external USB dongle on one RPi
  * Initially considered the more expensive [Carambola 2](http://shop.8devices.com/carambola2-bundle)


### Parts already owned

* ATX Power cables, various styles with various molex sockets
  * Hoard hoard; when some PSUs gave up the smoke, I took a pliers and snipidy snip the cables - finally it might pay off!
  * 6-pin PCIe molex sockets seems to fit to the modular Corsair's outlets

[![scrap cables](/img/00/atx_cables_thumb.jpg)](/img/00/atx_cables.jpg)

* [Adafruit PiTFT 320x240 2.8" TFT+Touchscreen](https://www.adafruit.com/products/1601)
  * Have had this for 2 years without any use
  * Let's create a mega-super hyper-interactive dashboard 3000 2.0!
      * Expected results: mind-bogglingly beautiful colors and subtle yet powerful transitions penetrating your vision-organs, creating a long lasting comfortable and fluffy happy-space inside your soul, and leaving you in a total awe of the marvelous times we're living
      * Actual results: probably a few crappy gray buttons (did I say I was an engineer?...)

[![adafruit tft](/img/00/tft_thumb.jpg)](/img/00/tft.jpg)

* [Raspberry Pi 1 Model B+](https://www.raspberrypi.org/products/model-b-plus/)
  * Power/TFT-Dashboard controller
  * Have had this laying around without any use

[![getting to know the pi](/img/00/deskstuff_thumb.jpg)](/img/00/deskstuff.jpg)

* Random 2.5" HDDs
  * Not sure if these well be ever used, low priority
  * Although the idea of a [Ceph](http://ceph.com/) cluster is intriguing!
  * Would neet USB-SATA -adapters


### Parts @TODO

* [Acrylic Sheets](http://www.biltema.fi/fi/Rakentaminen/Muut/Muovilasi-2000030030/) for the case
  * Because what else - there are LEDs and stuff at the boards!
  * Will not create nasty skin-penetrating chips when operated
  * Better for a show off if result is success (if not, ~~Photoshop~~ ~~Gimp~~ ~~lie~~ never publish)

* Cheap (free) old 16-24 port 10/100M switch to replace the 8-port
  * If one happened to appear while building


## Initial building plans

I haven't done any real planning outside my head (yet). Mostly because I really haven't used any CAD-like software before, and being a depth-first -minded person who gets stuck to the n:th subtask even with the simplest of distractions, I couldn't get past the "what design softare to learn" -stage in the first week.

### Casing

The case will be build mostly from acrylic sheets. I don't have access to laser cutters or 3d-printers, but I actually like crafting stuff with hands. Not that I'm good at it or even patient... I have only a rough plan of the layout of the things:

    +---------------------+  Side view of the case
    | optional HDDs       |
    +----------+----------+
    | RPi 1    | ATX      |  @TODO:
    | RPi 2    |          |    - router location
    | .....    |          |    - dashboard location
    | RPi n    |          |
    +----------+----------+
    | Ethernet Switch     |
    +---------------------+

The building will be mostly done by arranging stuff with eye, measuring and rounding the measurements to nicely looking numbers. The boards will probably be between two vertical acrylic sheets that have rails routed to them. The case will probably not have full coverage of side panels because of a better ventilation and access.

I'll leave the rest of the subject for some actual building with pictures.

### Power

My current plan is to power the RPi 2:s from the 5-volt rail(s?) of the PSU (rated for 110W). One RPi 2 [could draw around 4W](https://en.wikipedia.org/wiki/Raspberry_Pi) with 24W for 6, so even with the losses etc I assume (without better knowledge) that it'll suffice for now. If not, there's the [12V rail + converters](http://likemagicappears.com/projects/raspberry-pi-cluster/power-cards/) -route.

The switch will be powered from the 12V rail (384W), so there will hopefully be only one power cord to the system. The oddball RPi 1 with the TFT will be powered from the VSB 5v, which is always supplying the power.

I'm planning to power the RPis via their USB ports, [since it seems to be a better way than via the GPIO pins](http://raspberrypi.stackexchange.com/a/1618). For this I will solder a bunch of 6-pin Molex <-> Micro USB -cables to be attached straight to the PSU. I'll blindly assume the 5V from the PSU will be [at least 5V](http://www.apolonio.com/node/44) and on par with cheap usb wall sockets.


### Power management

The previous experiences have shown that the RPi:s tend to corrupt their memory cards very easily if not powered off properly. Therefore the turning on and off the cluster will be one of the first priorities.

Current solution is to power one RPi (v1, the one with the TFT) from the always-on VSB of the PSU. This host will then be [connected to the PS-ON -pin](http://www.instructables.com/id/Using-the-Raspberry-Pi-to-control-an-ATX-power-sup/) with a couple of resistors and a transistor to allow the RPi to control the state of the PSU and hence the other devices.

Naturally blind shutdowns would lead to corruptions, so the RPi responsible for the PSU needs to also be able to command the others to clean shutdown, and also be able to observe the state of the process. This will probably be done with the help of Ansible. The startup/shutdown process is also planned to be visualize via the TFT-Dashboard.

This also makes the oddball-RPi a natural control-host for all Ansible tasks, but since it'll also host other things such as the Dashboard, some short-term statistics etc, it remains to be seen if the older RPi v1 is up to the task.


### Software

[Arch](https://www.archlinux.org/) for the RPi 2:s, because of the greater propability of readily available and fresh packages. My main choise atm would be [CentOS](https://www.centos.org/), and even though I've never really used Arch, I prefer it's official PRi images over currently missing CentOS ones.

[Raspbian](https://www.raspbian.org/) for the dash/power-controller, mainly because of the hassle-free TFT-drivers with touch support. I suspect most of the software work in the project will actually be with this host, but it remains to be seen.

As said before, the plan is to create a cluster-local network between the hosts, and use a dedicated router/firewall to provide a single WAN-endpoint for outside connection. This will avoid dependencies and provide isolation from the outside network, making the cluster movable to different places and networks.

The whole stack will initially be powered by custom code, Ansible and probably Mesos because of it's versatility and ability to run most of the alternatives on top of it. But more of that later.


### Postscript (not the page description language)

Oh, and the name *Katiska*; since *there are two hard things in*... well, you know, stuff needs to be named and It's not easy. The countless hours lost in that problem space.

Normally I would go with generic uninsteresting scheme like `node01.mesos.domain.tld`, `node02.mesos.domain.tld`... especially since cluster nodes **should** be anonymous and disposable by nature, abstracted away from the eyes of the user. It's the whole point!

But since this is a cute hobby project, I wanted to use traditional caring naming pattern here. Having skimmed through [some suggestions](http://namingschemes.com/), I opted for Finnish fish names, and therefore Katiska aka. a Fish Trap (hacky steel wire thingy).
