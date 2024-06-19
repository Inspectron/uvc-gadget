CROSS_COMPILE	?= /opt/rockchip/output/host/bin/arm-buildroot-linux-gnueabihf-gcc
ARCH		?= armv7l
KERNEL_DIR	?= /opt/rockchip/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr

CC		:= $(CROSS_COMPILE)
KERNEL_INCLUDE	:= -I$(KERNEL_DIR)/include -I$(KERNEL_DIR)/arch/$(ARCH)/include \
					-I$(KERNEL_DIR)/include/gstreamer-1.0 -I$(KERNEL_DIR)/include/glib-2.0 \
					-I$(KERNEL_DIR)/lib/glib-2.0/include
CFLAGS		:= -W -Wall -g $(KERNEL_INCLUDE) $(pkg-config --cflags)
LDFLAGS		:= -g $(pkg-config --libs gstreamer-1.0) -lgstreamer-1.0 -lgobject-2.0 -lglib-2.0 -lgstapp-1.0

all: uvc-gadget

uvc-gadget: uvc-gadget.o
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	rm -f *.o
	rm -f uvc-gadget
