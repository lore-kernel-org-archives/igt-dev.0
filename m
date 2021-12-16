Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6605310F238
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 11:28:20 +0000 (UTC)
Date: Thu, 16 Dec 2021 13:27:42 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YbsirhuBf94hm3ZE@platvala-desk.ger.corp.intel.com>
References: <20211216111510.4094034-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216111510.4094034-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [igt-dev] [i-g-t] lib: sync i915_pciids.h with kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 16, 2021 at 04:45:10PM +0530, Tejas Upadhyay wrote:
> This synchronizes with kernel commit
> 
> 52407c220c44 ("drm/i915/rpl-s: Add PCI IDS for Raptor Lake S")
> 
> to bring in RPL-S PCI IDs.
> 
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  lib/i915_pciids.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index c00ac546..baf3d1d3 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -666,4 +666,13 @@
>  	INTEL_VGA_DEVICE(0x46C2, info), \
>  	INTEL_VGA_DEVICE(0x46C3, info)
>  
> +/* RPL-S */
> +#define INTEL_RPLS_IDS(info) \
> +	INTEL_VGA_DEVICE(0xA780, info), \
> +	INTEL_VGA_DEVICE(0xA781, info), \
> +	INTEL_VGA_DEVICE(0xA782, info), \
> +	INTEL_VGA_DEVICE(0xA783, info), \
> +	INTEL_VGA_DEVICE(0xA788, info), \
> +	INTEL_VGA_DEVICE(0xA789, info)
> +
>  #endif /* _I915_PCIIDS_H */
> -- 
> 2.31.1
> 

Acked-by: Petri Latvala <petri.latvala@intel.com>

But you also need to change lib/intel_device_info.c accordingly. See
9da04f759312cae8caa9aaac863163d0d98c964e for an example.
