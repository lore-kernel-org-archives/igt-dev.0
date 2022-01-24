Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2D810E16A
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jan 2022 17:17:06 +0000 (UTC)
Date: Mon, 24 Jan 2022 09:17:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <Ye7fDS6NPg3Zekzs@mdroper-desk1.amr.corp.intel.com>
References: <20220124144125.1900320-1-priyanka.dandamudi@intel.com>
 <20220124144125.1900320-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124144125.1900320-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915_pciids: PCI IDS for DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org, adam.miszczak@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 08:11:24PM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Adds PCI IDS for DG2.

We don't modify i915_pciids.h manually like this; we only copy the file
as-is directly from the kernel source tree to resync them.  Since we're
not putting the PCI IDs into the kernel until all the uapi stuff is 100%
hammered out, that means you won't be able to pick up the DG2 IDs via a
resync for a while longer yet.

You can go ahead and upstream the platform definition (patch #2 of your
series) to unblock the landing of other DG2 igt patches; it just won't
be associated with any PCI IDs initially.


Matt

> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Adam Miszczak <adam.miszczak@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  lib/i915_pciids.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 533890dc..b4230424 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -681,4 +681,23 @@
>  	INTEL_VGA_DEVICE(0xA788, info), \
>  	INTEL_VGA_DEVICE(0xA789, info)
>  
> +/* DG2 */
> +#define INTEL_DG2_G10_IDS(info) \
> +        INTEL_VGA_DEVICE(0x5690, info), \
> +        INTEL_VGA_DEVICE(0x5691, info), \
> +        INTEL_VGA_DEVICE(0x5692, info), \
> +
> +#define INTEL_DG2_G11_IDS(info) \
> +        INTEL_VGA_DEVICE(0x56A5, info), \
> +        INTEL_VGA_DEVICE(0x56A6, info), \
> +        INTEL_VGA_DEVICE(0x5693, info), \
> +        INTEL_VGA_DEVICE(0x5694, info), \
> +        INTEL_VGA_DEVICE(0x5695, info), \
> +        INTEL_VGA_DEVICE(0x56B0, info), \
> +        INTEL_VGA_DEVICE(0x56B1, info)
> +
> +#define INTEL_DG2_IDS(info) \
> +        INTEL_DG2_G10_IDS(info) \
> +        INTEL_DG2_G11_IDS(info)
> +
>  #endif /* _I915_PCIIDS_H */
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
