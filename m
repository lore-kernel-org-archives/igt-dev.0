Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6010C6E7E5
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2020 20:48:01 +0000 (UTC)
Date: Wed, 25 Mar 2020 13:48:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20200325204800.GE2996752@mdroper-desk1.amr.corp.intel.com>
References: <20200320001319.6982-1-swathi.dhanavanthri@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320001319.6982-1-swathi.dhanavanthri@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Sync i915_pciids.h with kernel
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

On Thu, Mar 19, 2020 at 05:13:19PM -0700, Swathi Dhanavanthri wrote:
> Changes:
> 91b79fb35d67 ("drm/i915/tgl: Add new PCI IDs to TGL")

I'm not sure if this is the right commit ID.  I see that kernel commit
as commit 3882581753d1 ("drm/i915/tgl: Add new PCI IDs to TGL").

You might also want to be slightly more verbose in the commit message
(e.g., instead of just saying "Changes:" say something like "Synchronize
with kernel headers as of commit XXX").

It looks like there's some restructuring of the CML device ID's that
exists in the kernel's copy of i915_pciids.h that still isn't present in
IGT.  Usually we just copy the entire file from the kernel source tree
into the IGT source tree to make sure we've picked up all the latest
changes for all platforms.


Matt

> 
> Signed-off-by: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
> ---
>  lib/i915_pciids.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 3e26a917..753f97b5 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -591,12 +591,16 @@
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
