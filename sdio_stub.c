/* Copyright (c) 2008 -2014 Espressif System.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 *
 *  sdio stub code template
 */

void sif_platform_rescan_card(unsigned insert)
{
}

void sif_platform_reset_target(void)
{
}

void sif_platform_target_poweroff(void)
{
}

void sif_platform_target_poweron(void)
{
}

void sif_platform_target_speed(int high_speed)
{
}

void sif_platform_check_r1_ready(struct esp_pub *epub)
{
}

#ifdef ESP_ACK_INTERRUPT
void sif_mmc_ack_interrupt(struct esp_pub *epub)
{
}
#endif //ESP_ACK_INTERRUPT

