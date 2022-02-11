Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E6910EB2A
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Feb 2022 12:06:34 +0000 (UTC)
Date: Fri, 11 Feb 2022 14:05:32 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YgZRDIXlb1lnTykg@platvala-desk.ger.corp.intel.com>
References: <20220210113832.17590-1-zbigniew.kempczynski@intel.com>
 <20220210113832.17590-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220210113832.17590-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/intel_device_info: Add DG2
 definition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 12:38:29PM +0100, Zbigniew Kempczyński wrote:
> Before pciids will land in the kernel and then are merged to IGT we need
> to add them locally to unblock compilation and testing staged kernels.
> We can use some hybrid solution where intel_device_info takes official
> pciids from i915_pciids.h and not official from i915_drm_local.h. Such
> strategy allows us to decrease code changes in the libraries / tests
> especially where IS_GENx() or IS_<machine>() macros are in use.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> ---
>  lib/i915/i915_drm_local.h | 9 +++++++++
>  lib/intel_device_info.c   | 8 ++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
> index 9e82c9688..9afe9db8d 100644
> --- a/lib/i915/i915_drm_local.h
> +++ b/lib/i915/i915_drm_local.h
> @@ -5,6 +5,8 @@
>  #ifndef _I915_DRM_LOCAL_H_
>  #define _I915_DRM_LOCAL_H_
>  
> +#include "i915_pciids.h"
> +
>  #if defined(__cplusplus)
>  extern "C" {
>  #endif
> @@ -21,6 +23,13 @@ extern "C" {
>   */
>  #define I915_ENGINE_CLASS_COMPUTE 4
>  
> +/* DG2 */
> +#define INTEL_DG2_IDS(info) \
> +	INTEL_VGA_DEVICE(0x56A0, info), \
> +	INTEL_VGA_DEVICE(0x56A2, info), \
> +	INTEL_VGA_DEVICE(0x56A5, info), \
> +	INTEL_VGA_DEVICE(0x56A6, info)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 40942afe7..fa438e1d1 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -1,5 +1,6 @@
>  #include "intel_chipset.h"
>  #include "i915_pciids.h"
> +#include "i915/i915_drm_local.h"
>  
>  #include <strings.h> /* ffs() */
>  
> @@ -389,6 +390,12 @@ static const struct intel_device_info intel_dg1_info = {
>  	.codename = "dg1"
>  };
>  
> +static const struct intel_device_info intel_dg2_info = {
> +	.graphics_ver = 12,
> +	.display_ver = 12,
> +	.codename = "dg2"

Isn't display ver 13 though?


-- 
Petri Latvala



> +};
> +
>  static const struct intel_device_info intel_alderlake_s_info = {
>  	.graphics_ver = 12,
>  	.display_ver = 12,
> @@ -506,6 +513,7 @@ static const struct pci_id_match intel_device_match[] = {
>  	INTEL_RKL_IDS(&intel_rocketlake_info),
>  
>  	INTEL_DG1_IDS(&intel_dg1_info),
> +	INTEL_DG2_IDS(&intel_dg2_info),
>  
>  	INTEL_ADLS_IDS(&intel_alderlake_s_info),
>  	INTEL_RPLS_IDS(&intel_raptorlake_s_info),
> -- 
> 2.32.0
> 
