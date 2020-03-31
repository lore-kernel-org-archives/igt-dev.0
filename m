Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053FF6E88C
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 20:54:26 +0000 (UTC)
Date: Tue, 31 Mar 2020 13:54:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20200331205426.GA3600836@mdroper-desk1.amr.corp.intel.com>
References: <20200327002301.16434-1-swathi.dhanavanthri@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200327002301.16434-1-swathi.dhanavanthri@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib: Sync i915_pciids.h with kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 05:23:01PM -0700, Swathi Dhanavanthri wrote:
> Changes:
> 3882581753d1 ("drm/i915/tgl: Add new PCI IDs to TGL")
> v2: Separated U series CML IDs to be in sync with kernel
> 8717c6b7414f ("Separate U series pci id from origianl list")
> v3: Updating lib/intel_device_info.c with the U series
> 
> Signed-off-by: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/i915_pciids.h       | 32 +++++++++++++++++++-------------
>  lib/intel_device_info.c |  2 ++
>  2 files changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 3e26a917..662d8351 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -446,23 +446,18 @@
>  
>  /* CML GT1 */
>  #define INTEL_CML_GT1_IDS(info)	\
> -	INTEL_VGA_DEVICE(0x9B21, info), \
> -	INTEL_VGA_DEVICE(0x9BAA, info), \
> -	INTEL_VGA_DEVICE(0x9BAB, info), \
> -	INTEL_VGA_DEVICE(0x9BAC, info), \
> -	INTEL_VGA_DEVICE(0x9BA0, info), \
>  	INTEL_VGA_DEVICE(0x9BA5, info), \
>  	INTEL_VGA_DEVICE(0x9BA8, info), \
>  	INTEL_VGA_DEVICE(0x9BA4, info), \
>  	INTEL_VGA_DEVICE(0x9BA2, info)
>  
> +#define INTEL_CML_U_GT1_IDS(info) \
> +	INTEL_VGA_DEVICE(0x9B21, info), \
> +	INTEL_VGA_DEVICE(0x9BAA, info), \
> +	INTEL_VGA_DEVICE(0x9BAC, info)
> +
>  /* CML GT2 */
>  #define INTEL_CML_GT2_IDS(info)	\
> -	INTEL_VGA_DEVICE(0x9B41, info), \
> -	INTEL_VGA_DEVICE(0x9BCA, info), \
> -	INTEL_VGA_DEVICE(0x9BCB, info), \
> -	INTEL_VGA_DEVICE(0x9BCC, info), \
> -	INTEL_VGA_DEVICE(0x9BC0, info), \
>  	INTEL_VGA_DEVICE(0x9BC5, info), \
>  	INTEL_VGA_DEVICE(0x9BC8, info), \
>  	INTEL_VGA_DEVICE(0x9BC4, info), \
> @@ -471,6 +466,11 @@
>  	INTEL_VGA_DEVICE(0x9BE6, info), \
>  	INTEL_VGA_DEVICE(0x9BF6, info)
>  
> +#define INTEL_CML_U_GT2_IDS(info) \
> +	INTEL_VGA_DEVICE(0x9B41, info), \
> +	INTEL_VGA_DEVICE(0x9BCA, info), \
> +	INTEL_VGA_DEVICE(0x9BCC, info)
> +
>  #define INTEL_KBL_IDS(info) \
>  	INTEL_KBL_GT1_IDS(info), \
>  	INTEL_KBL_GT2_IDS(info), \
> @@ -536,7 +536,9 @@
>  	INTEL_WHL_U_GT3_IDS(info), \
>  	INTEL_AML_CFL_GT2_IDS(info), \
>  	INTEL_CML_GT1_IDS(info), \
> -	INTEL_CML_GT2_IDS(info)
> +	INTEL_CML_GT2_IDS(info), \
> +	INTEL_CML_U_GT1_IDS(info), \
> +	INTEL_CML_U_GT2_IDS(info)
>  
>  /* CNL */
>  #define INTEL_CNL_PORT_F_IDS(info) \
> @@ -591,12 +593,16 @@
>  
>  /* TGL */
>  #define INTEL_TGL_12_IDS(info) \
> -	INTEL_VGA_DEVICE(0x9A49, info), \
>  	INTEL_VGA_DEVICE(0x9A40, info), \
> +	INTEL_VGA_DEVICE(0x9A49, info), \
>  	INTEL_VGA_DEVICE(0x9A59, info), \
>  	INTEL_VGA_DEVICE(0x9A60, info), \
>  	INTEL_VGA_DEVICE(0x9A68, info), \
>  	INTEL_VGA_DEVICE(0x9A70, info), \
> -	INTEL_VGA_DEVICE(0x9A78, info)
> +	INTEL_VGA_DEVICE(0x9A78, info), \
> +	INTEL_VGA_DEVICE(0x9AC0, info), \
> +	INTEL_VGA_DEVICE(0x9AC9, info), \
> +	INTEL_VGA_DEVICE(0x9AD9, info), \
> +	INTEL_VGA_DEVICE(0x9AF8, info)
>  
>  #endif /* _I915_PCIIDS_H */
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 208965d1..21f7a957 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -395,6 +395,8 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	INTEL_CML_GT1_IDS(&intel_cometlake_gt1_info),
>  	INTEL_CML_GT2_IDS(&intel_cometlake_gt2_info),
> +	INTEL_CML_U_GT1_IDS(&intel_cometlake_gt1_info),
> +	INTEL_CML_U_GT2_IDS(&intel_cometlake_gt2_info),
>  
>  	INTEL_CNL_IDS(&intel_cannonlake_info),
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
