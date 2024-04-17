KDIR ?= /lib/modules/$(shell uname -r)/build
export DTC ?= /usr/bin/dtc

all:
	$(MAKE) -C $(KDIR) M=$$PWD modules

clean:
	$(MAKE) -C $(KDIR) M=$$PWD $@

install:
	install -d $(DESTDIR)/boot/overlays
	install rpi-pcspkr.dtbo $(DESTDIR)/boot/overlays/

	install -d $(DESTDIR)/etc/udev/rules.d
	install -m 644 99-rpi-pcspkr.rules $(DESTDIR)/etc/udev/rules.d

#	$(MAKE) -C $(KDIR) M=$$PWD modules_install
