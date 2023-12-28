Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A3010E109
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Dec 2023 00:41:06 +0000 (UTC)
Date: Wed, 27 Dec 2023 19:40:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH i-g-t v4 2/4] lib/igt_pm: Add helper to get/set
 auto_suspenddelay_ms
Message-ID: <ZYzEGVSh0WbrGyeH@intel.com>
References: <20231221163338.2157257-1-anshuman.gupta@intel.com>
 <20231221163338.2157257-3-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231221163338.2157257-3-anshuman.gupta@intel.com>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 21, 2023 at 10:03:36PM +0530, Anshuman Gupta wrote:
> Sometimes we want to test pm igt test with an explicit auto
> suspend delay, therefore adding helpers to get/set the pci_dev
> auto_suspenddelay_ms.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

we also need to change the default value from 0 to 1 at least,
and then see how much more time machine we use. But 0 is unrealistic.

> ---
>  lib/igt_pm.c | 53 ++++++++++++++++++++++++++++++++++++++++------------
>  lib/igt_pm.h |  2 ++
>  2 files changed, 43 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index c2d98fceb..d436c2c50 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1068,18 +1068,6 @@ static void igt_pm_write_power_attr(int fd, const char *val, int len)
>  	igt_assert(strncmp(buf, val, len) == 0);
>  }
>  
> -static int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
> -{
> -	char delay_str[64];
> -	int delay, delay_fd;
> -
> -	delay_fd = igt_pm_get_power_attr_fd(pci_dev, "autosuspend_delay_ms");
> -	if (igt_pm_read_power_attr(delay_fd, delay_str, 64, true))
> -		igt_assert(sscanf(delay_str, "%d", &delay) > 0);
> -
> -	return delay;
> -}
> -
>  static void
>  igt_pm_setup_pci_dev_power_attrs(struct pci_device *pci_dev,
>  				 struct igt_pm_pci_dev_pwrattr *pwrattr, int delay_ms)
> @@ -1165,6 +1153,47 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, i
>  	pci_iterator_destroy(iter);
>  }
>  
> +/**
> + * igt_pm_get_autosuspend_delay:
> + * @pci_dev: pci_dev.
> + * Get pci_dev autosuspend delay value from pci sysfs "autosuspend_delay_ms".
> + *
> + * Returns:
> + * autosuspend_delay_ms.
> + */
> +int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
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
> +/**
> + * igt_pm_set_autosuspend_delay:
> + * @pci_dev: pci_dev.
> + * @delay_ms: autosuspend delay in ms.
> + * Set pci_dev autosuspend delay value through pci sysfs "autosuspend_delay_ms".
> + */
> +void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
> +{
> +	char delay_str[64];
> +	int delay_fd;
> +
> +	delay_fd = igt_pm_get_power_attr_fd(pci_dev, "autosuspend_delay_ms");
> +
> +	if (delay_ms >= 0) {
> +		int wc;
> +
> +		wc = snprintf(delay_str, 64, "%d\n", delay_ms);
> +		igt_pm_write_power_attr(delay_fd, delay_str, wc);
> +	}
> +}
> +
>  /**
>   * igt_pm_enable_pci_card_runtime_pm:
>   * @root: root port pci_dev.
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 306a9eb46..8394315c6 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -77,6 +77,8 @@ int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev);
>  bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev);
>  enum igt_acpi_d_state
>  igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev);
> +int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev);
> +void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms);
>  void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
>  				       struct pci_device *i915);
>  void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value);
> -- 
> 2.25.1
> 
