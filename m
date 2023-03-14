Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696AA10E0D2
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 11:21:05 +0000 (UTC)
Date: Tue, 14 Mar 2023 12:20:37 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230314112037.67m33u3crzh65nx3@zkempczy-mobl2>
References: <20230314105452.2169208-1-bhanuprakash.modem@intel.com>
 <20230314105452.2169208-5-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314105452.2169208-5-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 4/5] lib/intel_chipset: Add support to XE
 driver to get devid
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 04:24:51PM +0530, Bhanuprakash Modem wrote:
> As many tests are using intel devid, add a helper to get it for
> XE driver.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/intel_chipset.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
> index efb6f1771..73dbd813d 100644
> --- a/lib/intel_chipset.c
> +++ b/lib/intel_chipset.c
> @@ -41,6 +41,7 @@
>  #include "drmtest.h"
>  #include "intel_chipset.h"
>  #include "igt_core.h"
> +#include "xe/xe_query.h"
>  
>  /**
>   * SECTION:intel_chipset
> @@ -112,9 +113,22 @@ intel_get_pci_device(void)
>  	return pci_dev;
>  }
>  
> +static uint32_t __i915_get_drm_devid(int fd)
> +{
> +	struct drm_i915_getparam gp;
> +	int devid = 0;
> +
> +	memset(&gp, 0, sizeof(gp));
> +	gp.param = I915_PARAM_CHIPSET_ID;
> +	gp.value = &devid;
> +	ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp));
> +
> +	return devid;
> +}
> +
>  /**
>   * intel_get_drm_devid:
> - * @fd: open i915 drm file descriptor
> + * @fd: open i915/xe drm file descriptor
>   *
>   * Queries the kernel for the pci device id corresponding to the drm file
>   * descriptor.
> @@ -125,22 +139,18 @@ intel_get_pci_device(void)
>  uint32_t
>  intel_get_drm_devid(int fd)
>  {
> -	struct drm_i915_getparam gp;
>  	const char *override;
> -	int devid = 0;
>  
> -	igt_assert(is_i915_device(fd));
> +	igt_assert(is_intel_device(fd));
>  
>  	override = getenv("INTEL_DEVID_OVERRIDE");
>  	if (override)
>  		return strtol(override, NULL, 0);
>  
> -	memset(&gp, 0, sizeof(gp));
> -	gp.param = I915_PARAM_CHIPSET_ID;
> -	gp.value = &devid;
> -	ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp));
> -
> -	return devid;
> +	if (is_i915_device(fd))
> +		return __i915_get_drm_devid(fd);
> +	else
> +		return xe_dev_id(fd);

This is the problem, it depends on implicit xe_device calls I've
added to cache driver/hw settings, but this function shouldn't
rely on it. I mean similar to __i915_get_drm_devid() you should
create helper which doesn't depend on anything.

--
Zbigniew

>  }
>  
>  /**
> -- 
> 2.39.1
> 
