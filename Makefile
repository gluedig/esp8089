# copyright (c) 2010 - 2013 espressif system
#linux_sdio

#ifneq ($(KERNELRELEASE),)
# kbuild part of makefile

DRIVER_NAME := eagle

EXTRA_CFLAGS += -DP2P_CONCURRENT -DESP_USE_SDIO

ccflags-y += -DDEBUG -DSIP_DEBUG -DFAST_TX_STATUS -DKERNEL_IV_WAR -DRX_SENDUP_SYNC -DESP_CLASS

# fw from sources (eagle_fwX.h) otherwise from files in /etc/eagle (eagle_fwX.bin)
ccflags-y += -DHAS_FW
# init data from sources (esp_conf.h & esp_init_data.h)
ccflags-y += -DHAS_INIT_DATA
# init data from files in /etc/eagle (init_data.conf & esp_init_data.bin)
#ccflags-y += -DINIT_DATA_CONF
# test mode
#ccflags-y += -DTEST_MODE

obj-m := $(DRIVER_NAME).o
$(DRIVER_NAME)-y += esp_init.o
$(DRIVER_NAME)-y += esp_debug.o
$(DRIVER_NAME)-y += sdio_sif_esp.o
$(DRIVER_NAME)-y += spi_sif_esp.o
$(DRIVER_NAME)-y += esp_io.o
$(DRIVER_NAME)-y += esp_file.o
$(DRIVER_NAME)-y += esp_main.o
$(DRIVER_NAME)-y += esp_sip.o
$(DRIVER_NAME)-y += esp_ext.o
$(DRIVER_NAME)-y += esp_ctrl.o
$(DRIVER_NAME)-y += esp_mac80211.o
$(DRIVER_NAME)-y += esp_debug.o
$(DRIVER_NAME)-y += esp_utils.o
$(DRIVER_NAME)-y += esp_pm.o
$(DRIVER_NAME)-y += testmode.o

$(DRIVER_NAME):
	# $(MAKE) -C /lib/modules/`uname -r` M=`pwd`
	$(MAKE) -i -C /cold/bh/linux-2.6.39.4 M=`pwd`
.PHONE:clean
clean:
	rm -f *.o *.ko *.mod.c
	# $(MAKE) -C /lib/modules/`uname -r`/build M=`pwd` clean
	$(MAKE) -C /cold/bh/linux-2.6.39.4 M=`pwd` clean
#else
#KDIR ?= /lib/modules/`uname -r`/build


#default:
#	$(MAKE) -C $(KDIR) M=$$PWD

#endif
