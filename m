Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946E06F492
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 15:01:27 +0000 (UTC)
Date: Thu, 3 Jun 2021 08:05:00 -0700
From: James Ausmus <james.ausmus@intel.com>
Message-ID: <YLjvlo3I3O29RDhh@jausmus-gentoo-dev6>
References: <20210603143125.276353-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603143125.276353-1-matthew.d.roper@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: sync i915_pciids.h with kernel
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
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 07:31:25AM -0700, Matt Roper wrote:
> This synchronizes with kernel commit
> 
>         760759f2cf71 ("drm/i915/adl_p: Add PCI Devices IDs")
> 
> to bring in ADL-P PCI IDs as well as a couple more ADL-S IDs.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  lib/i915_pciids.h | 23 +++++++++++++++++++++++

I think we need the changes to lib/intel_chipset.h
lib/intel_device_info.h as well before the ADL-P IDs can make a
difference

-James

>  1 file changed, 23 insertions(+)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index ebd0dd1c..eee18fa5 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -640,9 +640,32 @@
>  	INTEL_VGA_DEVICE(0x4681, info), \
>  	INTEL_VGA_DEVICE(0x4682, info), \
>  	INTEL_VGA_DEVICE(0x4683, info), \
> +	INTEL_VGA_DEVICE(0x4688, info), \
> +	INTEL_VGA_DEVICE(0x4689, info), \
>  	INTEL_VGA_DEVICE(0x4690, info), \
>  	INTEL_VGA_DEVICE(0x4691, info), \
>  	INTEL_VGA_DEVICE(0x4692, info), \
>  	INTEL_VGA_DEVICE(0x4693, info)
>  
> +/* ADL-P */
> +#define INTEL_ADLP_IDS(info) \
> +	INTEL_VGA_DEVICE(0x46A0, info), \
> +	INTEL_VGA_DEVICE(0x46A1, info), \
> +	INTEL_VGA_DEVICE(0x46A2, info), \
> +	INTEL_VGA_DEVICE(0x46A3, info), \
> +	INTEL_VGA_DEVICE(0x46A6, info), \
> +	INTEL_VGA_DEVICE(0x46A8, info), \
> +	INTEL_VGA_DEVICE(0x46AA, info), \
> +	INTEL_VGA_DEVICE(0x462A, info), \
> +	INTEL_VGA_DEVICE(0x4626, info), \
> +	INTEL_VGA_DEVICE(0x4628, info), \
> +	INTEL_VGA_DEVICE(0x46B0, info), \
> +	INTEL_VGA_DEVICE(0x46B1, info), \
> +	INTEL_VGA_DEVICE(0x46B2, info), \
> +	INTEL_VGA_DEVICE(0x46B3, info), \
> +	INTEL_VGA_DEVICE(0x46C0, info), \
> +	INTEL_VGA_DEVICE(0x46C1, info), \
> +	INTEL_VGA_DEVICE(0x46C2, info), \
> +	INTEL_VGA_DEVICE(0x46C3, info)
> +
>  #endif /* _I915_PCIIDS_H */
> -- 
> 2.25.4
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
