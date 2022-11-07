Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E31110E4DC
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 17:11:12 +0000 (UTC)
Date: Mon, 7 Nov 2022 18:02:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y2k6G02oTAep271k@kamilkon-desk1>
References: <20221107131842.31387-1-anshuman.gupta@intel.com>
 <20221107131842.31387-2-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221107131842.31387-2-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/igt_pm: Refactor get
 firmware_node fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Badal Nilavar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Anshuman,

On 2022-11-07 at 18:48:40 +0530, Anshuman Gupta wrote:
> Created igt_pm_open_pci_firmware_node() to refactor
> the retrieving the firmware_node fd code.
> 
> igt_pm_open_pci_firmware_node() will be used by other
> firmware_node consumers.
> 
> While doing that fixed the leaked fd as well.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  lib/igt_pm.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 1e6e9ed3f..e289c48e4 100644
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
> @@ -873,23 +887,20 @@ bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
>   */
>  bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
>  {
> -	char name[PATH_MAX];
> -	int dir, fd;
> +	int firmware_node_fd, fd;
>  
> -	snprintf(name, PATH_MAX,
> -		 "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/firmware_node",
> -		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> -
> -	dir = open(name, O_RDONLY);
> -	igt_require(dir > 0);
> +	firmware_node_fd = igt_pm_open_pci_firmware_node(pci_dev);
> +	igt_require(firmware_node_fd > 0);

imho it is better just return false here.

>  
>  	/* BIOS need to enable ACPI D3Cold Support.*/
> -	fd = openat(dir, "real_power_state", O_RDONLY);
> +	fd = openat(firmware_node_fd, "real_power_state", O_RDONLY);
>  	if (fd < 0 && errno == ENOENT)

Here you should also close(firmware_node_fd) before return.
Btw check for errno looks strange.

>  		return false;
>  
>  	igt_require(fd > 0);

This is mixing two different error behaviour, return bool versus
igt_require, imho it is better to return false instead.

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
