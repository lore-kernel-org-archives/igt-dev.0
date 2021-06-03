Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE6A6F4FA
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 18:58:09 +0000 (UTC)
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Date: Thu, 3 Jun 2021 18:58:07 +0000
Message-ID: <0d9f54e895ed48968d801355820967ef@intel.com>
References: <20210603143125.276353-1-matthew.d.roper@intel.com>
In-Reply-To: <20210603143125.276353-1-matthew.d.roper@intel.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Thursday, June 3, 2021 7:31 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH i-g-t] lib: sync i915_pciids.h with kernel
> 
> This synchronizes with kernel commit
> 
>         760759f2cf71 ("drm/i915/adl_p: Add PCI Devices IDs")
> 
> to bring in ADL-P PCI IDs as well as a couple more ADL-S IDs.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

> ---
>  lib/i915_pciids.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h index ebd0dd1c..eee18fa5
> 100644
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

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
