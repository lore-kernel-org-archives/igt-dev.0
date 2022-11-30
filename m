Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CE410E421
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Nov 2022 08:43:50 +0000 (UTC)
Date: Wed, 30 Nov 2022 09:43:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y4cXwayr5QBmlGW8@kamilkon-desk1>
References: <20221123085441.2821638-1-anshuman.gupta@intel.com>
 <20221123085441.2821638-4-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221123085441.2821638-4-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/5] lib/igt_pm: Refactor get
 firmware_node fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Anshuman,

one small nit, see below.

On 2022-11-23 at 14:24:39 +0530, Anshuman Gupta wrote:
> Created igt_pm_open_pci_firmware_node() to refactor
> the retrieving the firmware_node fd code.
> 
> igt_pm_open_pci_firmware_node() will be used by other
> firmware_node consumers.
> 
> While doing that fixed the leaked fd as well.
> 
> v2:
> - return false instead of igt_require on no firmware_node_fd. [Kamil]
> - use igt_assert() when failed to open 'real_power_state' on error
>   other then ENONET.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/igt_pm.c | 36 +++++++++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 1e6e9ed3ff..4f0cfbdd10 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -863,6 +863,20 @@ bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
>  	return strstr(buf, "LPSP: capable");
>  }
>  
> +static int igt_pm_open_pci_firmware_node(struct pci_device *pci_dev)
> +{
> +	char name[PATH_MAX];
> +	int dir;
> +
> +	snprintf(name, PATH_MAX,
> +		 "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/firmware_node",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	dir = open(name, O_RDONLY);
> +
> +	return dir;
> +}
> +
>  /**
>   * igt_pm_acpi_d3cold_supported:
>   * @pci_dev: root port pci_dev.
> @@ -873,23 +887,23 @@ bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
>   */
>  bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
>  {
> -	char name[PATH_MAX];
> -	int dir, fd;
> -
> -	snprintf(name, PATH_MAX,
> -		 "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/firmware_node",
> -		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +	int firmware_node_fd, fd;
>  
> -	dir = open(name, O_RDONLY);
> -	igt_require(dir > 0);
> +	firmware_node_fd = igt_pm_open_pci_firmware_node(pci_dev);
> +	if (firmware_node_fd < 0)
> +		return false;
>  
>  	/* BIOS need to enable ACPI D3Cold Support.*/
> -	fd = openat(dir, "real_power_state", O_RDONLY);
> -	if (fd < 0 && errno == ENOENT)
> +	fd = openat(firmware_node_fd, "real_power_state", O_RDONLY);
> +	if (fd < 0 && errno == ENOENT) {
> +		close(firmware_node_fd);
>  		return false;
> +	}
>  
> -	igt_require(fd > 0);
> +	igt_assert(errno > 0);

You want here no error, so
	igt_assert(errno == 0);
or better:
	igt_assert_f(fd > 0, "failed to open real_power_state, errno=%d\n", errno);

Regards,
Kamil

>  
> +	close(firmware_node_fd);
> +	close(fd);
>  	return true;
>  }
>  
> -- 
> 2.25.1
> 
