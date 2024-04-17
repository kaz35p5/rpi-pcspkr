KDIR ?= /lib/modules/$(shell uname -r)/build
export DTC ?= /usr/bin/dtc

all:
	$(MAKE) -C $(KDIR) M=$$PWD modules

clean:
	$(MAKE) -C $(KDIR) M=$$PWD $@

install:
	$(MAKE) -C $(KDIR) M=$$PWD modules_install
