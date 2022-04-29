Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FEC10E74A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 14:48:01 +0000 (UTC)
Date: Fri, 29 Apr 2022 10:47:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <Ymv6jBIDhNOishd6@intel.com>
References: <20220429085425.24568-1-anshuman.gupta@intel.com>
 <20220429085425.24568-4-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429085425.24568-4-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/8] lib/igt_pm: D3Cold runtime pm
 infrastructure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com,
 badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 02:24:20PM +0530, Anshuman Gupta wrote:
> Enable gfx card pci devices runtime pm for all pci devices
> and bridge under the topology of Gfx Card root port.
> 
> Added a library function to get the PCI root port ACPI
> D state and to print the pci card devices runtime pm
> status.
> 
> v2:
> - Save pci dev power attr to dynamically allocated array. [Rodrigo]
> - Set autosuspend delay to 0 on supported devices. [Rodrigo]
> - %s/else if/else in  igt_pm_get_acpi_real_d_state. [Kamil]
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  lib/igt_pm.c | 290 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pm.h |  23 ++++
>  2 files changed, 313 insertions(+)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index b409ec463..20296c40b 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -28,6 +28,7 @@
>  #include <fcntl.h>
>  #include <stdio.h>
>  #include <limits.h>
> +#include <pciaccess.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <unistd.h>
> @@ -75,6 +76,7 @@ enum {
>  #define MIN_POWER_STR		"min_power\n"
>  /* Remember to fix this if adding longer strings */
>  #define MAX_POLICY_STRLEN	strlen(MAX_PERFORMANCE_STR)
> +#define MAX_PCI_DEVICES		256
>  int8_t *__sata_pm_policies;
>  int __scsi_host_cnt;
>  
> @@ -856,3 +858,291 @@ bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
>  
>  	return strstr(buf, "LPSP: capable");
>  }
> +
> +/**
> + * igt_pm_acpi_d3cold_supported:
> + * @pci_dev: root port pci_dev.
> + * Check ACPI D3Cold support.
> + *
> + * Returns:
> + * True if ACPI D3Cold supported otherwise false.
> + */
> +bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
> +{
> +	char name[PATH_MAX];
> +	int dir, fd;
> +
> +	snprintf(name, PATH_MAX,
> +		 "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/firmware_node",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	dir = open(name, O_RDONLY);
> +	igt_require(dir > 0);
> +
> +	/* BIOS need to enable ACPI D3Cold Support.*/
> +	fd = openat(dir, "real_power_state", O_RDONLY);
> +	if (fd < 0 && errno == ENOENT)
> +		return false;
> +
> +	igt_require(fd > 0);
> +
> +	return true;
> +}
> +
> +/**
> + * igt_pm_get_acpi_real_d_state:
> + * @pci_dev: root port pci_dev.
> + * Get ACPI D state for a given root port.
> + *
> + * Returns:
> + * igt_acpi_d_state state.
> + */
> +enum igt_acpi_d_state
> +igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev)
> +{
> +	char name[PATH_MAX];
> +	char acpi_d_state[64];
> +	int fd, n_read;
> +
> +	snprintf(name, PATH_MAX,
> +		 "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/firmware_node/real_power_state",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	fd = open(name, O_RDONLY);
> +	if (fd < 0)
> +		return IGT_ACPI_UNKNOWN_STATE;
> +
> +	n_read = read(fd, acpi_d_state, sizeof(acpi_d_state) - 1);
> +	igt_assert(n_read >= 0);
> +	acpi_d_state[n_read] = '\0';
> +	close(fd);
> +
> +	if (strncmp(acpi_d_state, "D0\n", n_read) == 0)
> +		return IGT_ACPI_D0;
> +	if  (strncmp(acpi_d_state, "D1\n", n_read) == 0)
> +		return IGT_ACPI_D1;
> +	if  (strncmp(acpi_d_state, "D2\n", n_read) == 0)
> +		return IGT_ACPI_D2;
> +	if  (strncmp(acpi_d_state, "D3hot\n", n_read) == 0)
> +		return IGT_ACPI_D3Hot;
> +	if  (strncmp(acpi_d_state, "D3cold\n", n_read) == 0)
> +		return IGT_ACPI_D3Cold;
> +
> +	return IGT_ACPI_UNKNOWN_STATE;
> +}
> +
> +static struct igt_pm_pci_dev_pwrattr  *__pci_dev_pwrattr;
> +static int __igt_pm_pci_dev_cnt;

looking at this now I believe I prefer the static global one than this
reallocated one.

I saw that we have other examples in igt lib that follows same patter so that
should be okay.

But honestly what I don't like is the global at all.
I see that you have the exit handler below that takes care of the unset,
but I believe as a "lib" this should be independent for symmetric reasons.

what I had in mind was something to be called at setup fixture and clean up
fixture. you save locally your pci config and then you clean that up on
restore...

But now seeing other global cases in the core of igt lib I don't care much
anymore...

But probably cleaner with the static now... and sorry about the back and forth
on this...

> +
> +static void __igt_pm_pci_card_exit_handler(int sig)
> +{
> +	igt_pm_restore_pci_card_runtime_pm();
> +}
> +
> +static int igt_pm_get_power_attr_fd(struct pci_device *pci_dev, const char *attr)
> +{
> +	char name[PATH_MAX];
> +	int fd;
> +
> +	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/power/%s",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, attr);
> +
> +	fd = open(name, O_RDWR);
> +	igt_assert_f(fd >= 0, "Can't open %s\n", attr);
> +
> +	return fd;
> +}
> +
> +static bool igt_pm_save_power_attr(int fd, char *attr, int len, bool autosuspend)
> +{
> +	int size;
> +
> +	size = read(fd, attr, len - 1);
> +
> +	if (autosuspend) {
> +		if (size < 0)
> +			return false;
> +	} else {
> +		igt_assert(size > 0);
> +	}
> +
> +	attr[size] = '\0';
> +	strchomp(attr);
> +
> +	return true;
> +}
> +
> +static void igt_pm_setup_power_attr(int fd, const char *val)
> +{
> +	int size, len;
> +	char buf[6];
> +
> +	len = strlen(val);
> +
> +	size = write(fd, val, len);
> +	igt_assert_eq(size, len);
> +	lseek(fd, 0, SEEK_SET);
> +	size = read(fd, buf, ARRAY_SIZE(buf));
> +	igt_assert_eq(size, len);
> +	igt_assert(strncmp(buf, val, len) == 0);
> +}
> +
> +static void
> +__igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev, int index)
> +{
> +	int control_fd, delay_fd, control_size, delay_size;
> +	char *control, *delay;
> +
> +	igt_assert(index <  MAX_PCI_DEVICES);
> +
> +	if (!(index % 16)) {
> +		__pci_dev_pwrattr =
> +			realloc(__pci_dev_pwrattr,
> +				sizeof(struct igt_pm_pci_dev_pwrattr) * (index / 16 + 1) * 16);
> +	}
> +
> +	control = __pci_dev_pwrattr[index].control;
> +	control_size =  sizeof(__pci_dev_pwrattr[index].control);
> +	delay = __pci_dev_pwrattr[index].autosuspend_delay;
> +	delay_size =  sizeof(__pci_dev_pwrattr[index].autosuspend_delay);
> +	__pci_dev_pwrattr[index].pci_dev = pci_dev;
> +	__pci_dev_pwrattr[index].autosuspend_supported = true;
> +
> +	delay_fd = igt_pm_get_power_attr_fd(pci_dev, "autosuspend_delay_ms");
> +	control_fd = igt_pm_get_power_attr_fd(pci_dev, "control");
> +
> +	if (!igt_pm_save_power_attr(delay_fd, delay, delay_size, true)) {
> +		__pci_dev_pwrattr[index].autosuspend_supported = false;
> +		igt_debug("PCI '%04x:%02x:%02x.%01x' doesn't support auto_suspend\n",
> +			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +	}
> +
> +	igt_pm_save_power_attr(control_fd, control, control_size, false);
> +	igt_debug("PCI '%04x:%02x:%02x.%01x' Saved 'control, autosuspend_delay_ms' as '%s, %s'\n",
> +		  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, control,
> +		  __pci_dev_pwrattr[index].autosuspend_supported ? delay : "NA");
> +
> +	if (!index)
> +		igt_install_exit_handler(__igt_pm_pci_card_exit_handler);
> +
> +	if (__pci_dev_pwrattr[index].autosuspend_supported)
> +		igt_pm_setup_power_attr(delay_fd, "0\n");
> +
> +	igt_pm_setup_power_attr(control_fd, "auto\n");
> +
> +	close(delay_fd);
> +	close(control_fd);
> +}
> +
> +/**
> + * igt_pm_setup_pci_card_runtime_pm:
> + * @pci_dev: root port pci_dev.
> + * Setup runtime PM for all PCI endpoints devices for a given root port by
> + * enabling runtime suspend and setting autosuspend_delay_ms to zero.
> + * It also saves power control attribute for all PCI endpoints
> + * devices under given root port.
> + */
> +void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev)
> +{
> +	int primary, secondary, subordinate, ret;
> +	struct pci_device_iterator *iter;
> +	struct pci_device *dev;
> +	int i;
> +
> +	ret = pci_device_get_bridge_buses(pci_dev, &primary, &secondary, &subordinate);
> +	igt_assert(!ret);
> +
> +	ret = pci_system_init();
> +	igt_assert(!ret);
> +
> +	iter = pci_slot_match_iterator_create(NULL);
> +	/* Setup runtime pm for PCI root port */
> +	__igt_pm_setup_pci_card_runtime_pm(pci_dev, i++);
> +	while ((dev = pci_device_next(iter)) != NULL) {
> +		if (dev->bus >= secondary && dev->bus <= subordinate)
> +			__igt_pm_setup_pci_card_runtime_pm(dev, i++);
> +	}
> +
> +	__igt_pm_pci_dev_cnt = i;
> +}
> +
> +static void
> +igt_pm_restore_power_attr(struct pci_device *pci_dev, const char *attr, char *val, int len)
> +{
> +	int fd;
> +
> +	igt_debug("PCI '%04x:%02x:%02x.%01x' Restoring %s attr to '%s'\n",
> +		  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, attr, val);
> +
> +	fd = igt_pm_get_power_attr_fd(pci_dev, attr);
> +	igt_assert(write(fd, val, len) == len);
> +
> +	close(fd);
> +}
> +
> +/**
> + * igt_pm_restore_pci_card_runtime_pm:
> + * Restore control and autosuspend_delay_ms power attribute for all
> + * PCI endpoints devices under gfx root port, which were saved earlier
> + * by igt_pm_setup_pci_card_runtime_pm().
> + */
> +void igt_pm_restore_pci_card_runtime_pm(void)
> +{
> +	int i = 0;
> +
> +	if (!__pci_dev_pwrattr)
> +		return;
> +
> +	for (i = 0; i < __igt_pm_pci_dev_cnt; i++) {
> +		igt_pm_restore_power_attr(__pci_dev_pwrattr[i].pci_dev, "control",
> +					  __pci_dev_pwrattr[i].control,
> +					  sizeof(__pci_dev_pwrattr[i].control));
> +
> +		if (!__pci_dev_pwrattr[i].autosuspend_supported)
> +			continue;
> +
> +		igt_pm_restore_power_attr(__pci_dev_pwrattr[i].pci_dev, "autosuspend_delay_ms",
> +					  __pci_dev_pwrattr[i].autosuspend_delay,
> +					  sizeof(__pci_dev_pwrattr[i].autosuspend_delay));
> +	}
> +
> +	pci_system_cleanup();
> +	free(__pci_dev_pwrattr);
> +	__pci_dev_pwrattr = NULL;
> +}
> +
> +static void igt_pm_print_pci_dev_runtime_status(struct pci_device *pci_dev)
> +{
> +	char name[PATH_MAX], runtime_status[64];
> +	int fd, n_read;
> +
> +	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/power/runtime_status",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	fd = open(name, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Can't open runtime_status\n");
> +
> +	n_read = read(fd, runtime_status, sizeof(runtime_status) - 1);
> +	igt_assert(n_read >= 0);
> +	runtime_status[n_read] = '\0';
> +	igt_info("runtime suspend status for PCI '%04x:%02x:%02x.%01x' %s\n",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, runtime_status);
> +	close(fd);
> +}
> +
> +/**
> + * igt_pm_print_pci_card_runtime_status:
> + * @pci_dev: root port pci_dev.
> + * Print runtime suspend status for all PCI endpoints devices for a given
> + * root port.
> + */
> +void igt_pm_print_pci_card_runtime_status(void)
> +{
> +	int i = 0;
> +
> +	if (!__pci_dev_pwrattr)
> +		return;
> +
> +	for (i = 0; i < __igt_pm_pci_dev_cnt; i++)
> +		igt_pm_print_pci_dev_runtime_status(__pci_dev_pwrattr[i].pci_dev);
> +}
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 162d3ca3c..898178670 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -46,6 +46,23 @@ enum igt_runtime_pm_status {
>  	IGT_RUNTIME_PM_STATUS_UNKNOWN,
>  };
>  
> +/* PCI ACPI firmware node real state */
> +enum igt_acpi_d_state {
> +	IGT_ACPI_D0,
> +	IGT_ACPI_D1,
> +	IGT_ACPI_D2,
> +	IGT_ACPI_D3Hot,
> +	IGT_ACPI_D3Cold,
> +	IGT_ACPI_UNKNOWN_STATE,
> +};
> +
> +struct	igt_pm_pci_dev_pwrattr {
> +	struct pci_device *pci_dev;
> +	char control[64];
> +	bool autosuspend_supported;
> +	char autosuspend_delay[64];
> +};
> +
>  bool igt_setup_runtime_pm(int device);
>  void igt_disable_runtime_pm(void);
>  void igt_restore_runtime_pm(void);
> @@ -54,5 +71,11 @@ bool igt_wait_for_pm_status(enum igt_runtime_pm_status status);
>  bool igt_pm_dmc_loaded(int debugfs);
>  bool igt_pm_pc8_plus_residencies_enabled(int msr_fd);
>  bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output);
> +bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev);
> +enum igt_acpi_d_state
> +igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev);
> +void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);
> +void igt_pm_restore_pci_card_runtime_pm(void);
> +void igt_pm_print_pci_card_runtime_status(void);
>  
>  #endif /* IGT_PM_H */
> -- 
> 2.26.2
> 
