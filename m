Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD42510E18C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 11:38:37 +0000 (UTC)
Message-ID: <3550400e-c700-62a0-fa73-2b33ec0b8dfe@intel.com>
Date: Tue, 17 May 2022 17:08:02 +0530
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220516151255.13153-1-anshuman.gupta@intel.com>
 <20220516151255.13153-5-anshuman.gupta@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20220516151255.13153-5-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 04/10] lib: Optional
 autosuspend_delay_ms configuration
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 16-05-2022 20:42, Anshuman Gupta wrote:
> Add an option to configure autosuspend_delay_ms as i915 read
> autosuspend_delay_ms to all PCI devices under GFX root port.
> 
> configuring autosuspend_delay_ms as optional.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
LGTM:
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   lib/igt_pm.c | 48 +++++++++++++++++++++++++++++++++++++++---------
>   lib/igt_pm.h |  3 ++-
>   2 files changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 4768deefc8..6ebbad330c 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -988,11 +988,25 @@ static void igt_pm_write_power_attr(int fd, const char *val, int len)
>   	igt_assert(strncmp(buf, val, len) == 0);
>   }
>   
> +static int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
> +{
> +	char delay_str[64];
> +	int delay, delay_fd;
> +
> +	delay_fd = igt_pm_get_power_attr_fd(pci_dev, "autosuspend_delay_ms");
> +	if (igt_pm_read_power_attr(delay_fd, delay_str, 64, true))
> +		igt_assert(sscanf(delay_str, "%d", &delay) > 0);
> +
> +	return delay;
> +}
> +
>   static void
> -igt_pm_setup_pci_dev_power_attrs(struct pci_device *pci_dev, struct igt_pm_pci_dev_pwrattr *pwrattr)
> +igt_pm_setup_pci_dev_power_attrs(struct pci_device *pci_dev,
> +				 struct igt_pm_pci_dev_pwrattr *pwrattr, int delay_ms)
>   {
>   	int control_fd, delay_fd, control_size, delay_size;
>   	char *control, *delay;
> +	char buff[64];
>   
>   	delay_fd = igt_pm_get_power_attr_fd(pci_dev, "autosuspend_delay_ms");
>   	control_fd = igt_pm_get_power_attr_fd(pci_dev, "control");
> @@ -1022,7 +1036,12 @@ igt_pm_setup_pci_dev_power_attrs(struct pci_device *pci_dev, struct igt_pm_pci_d
>   
>   write_power_attr:
>   
> -	igt_pm_write_power_attr(delay_fd, "0\n", 2);
> +	if (delay_ms >= 0) {
> +		int wc;
> +		wc = snprintf(buff, 64, "%d\n", delay_ms);
> +		igt_pm_write_power_attr(delay_fd, buff, wc);
> +	}
> +
>   	igt_pm_write_power_attr(control_fd, "auto\n", 5);
>   
>   	close(delay_fd);
> @@ -1030,7 +1049,7 @@ write_power_attr:
>   }
>   
>   static void
> -igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs)
> +igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, int delay)
>   {
>   	int primary, secondary, subordinate, ret;
>   	struct pci_device_iterator *iter;
> @@ -1052,11 +1071,15 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs)
>   	igt_assert(iter);
>   
>   	/* Setup power attrs for PCI root port */
> -	igt_pm_setup_pci_dev_power_attrs(pci_dev, save_attrs ? &__pci_dev_pwrattr[i++] : NULL);
> +	igt_pm_setup_pci_dev_power_attrs(pci_dev,
> +					 save_attrs ? &__pci_dev_pwrattr[i++] : NULL,
> +					 delay);
> +
>   	while ((dev = pci_device_next(iter)) != NULL) {
>   		if (dev->bus >= secondary && dev->bus <= subordinate) {
>   			igt_pm_setup_pci_dev_power_attrs(dev,
> -							 save_attrs ? &__pci_dev_pwrattr[i++] : NULL);
> +							 save_attrs ? &__pci_dev_pwrattr[i++] : NULL,
> +							 delay);
>   			if (save_attrs)
>   				igt_assert(i <  MAX_PCI_DEVICES);
>   		}
> @@ -1067,14 +1090,21 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs)
>   
>   /**
>    * igt_pm_enable_pci_card_runtime_pm:
> - * @pci_dev: root port pci_dev.
> + * @root: root port pci_dev.
> + * @i915: i915 pci_dev.
>    * Enable runtime PM for all PCI endpoints devices for a given root port by
>    * setting power/control attr to "auto" and setting autosuspend_delay_ms
>    * to zero.
>    */
> -void igt_pm_enable_pci_card_runtime_pm(struct pci_device *pci_dev)
> +void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
> +				       struct pci_device *i915)
>   {
> -	igt_pm_setup_pci_card_power_attrs(pci_dev, false);
> +	int delay = -1;
> +
> +	if (i915)
> +		delay = igt_pm_get_autosuspend_delay(i915);
> +
> +	igt_pm_setup_pci_card_power_attrs(root, false, delay);
>   	pci_system_cleanup();
>   }
>   
> @@ -1089,7 +1119,7 @@ void igt_pm_enable_pci_card_runtime_pm(struct pci_device *pci_dev)
>   void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev)
>   {
>   	memset(__pci_dev_pwrattr, 0, sizeof(__pci_dev_pwrattr));
> -	igt_pm_setup_pci_card_power_attrs(pci_dev, true);
> +	igt_pm_setup_pci_card_power_attrs(pci_dev, true, 0);
>   }
>   
>   static void
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index c53dae2c31..f28b6ebfde 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -74,7 +74,8 @@ bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output);
>   bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev);
>   enum igt_acpi_d_state
>   igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev);
> -void igt_pm_enable_pci_card_runtime_pm(struct pci_device *pci_dev);
> +void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
> +				       struct pci_device *i915);
>   void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);
>   void igt_pm_restore_pci_card_runtime_pm(void);
>   void igt_pm_print_pci_card_runtime_status(void);
