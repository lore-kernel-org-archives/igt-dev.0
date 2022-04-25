Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9168C10F01E
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 15:17:23 +0000 (UTC)
Date: Mon, 25 Apr 2022 18:17:27 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Talla Raviteja Goud <ravitejax.goud.talla@intel.com>
Message-ID: <Yma7h3fXOZEehJYX@platvala-desk.ger.corp.intel.com>
References: <20220425150248.245497-1-ravitejax.goud.talla@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425150248.245497-1-ravitejax.goud.talla@intel.com>
Subject: Re: [igt-dev] [i-g-t,v3] lib: sync i915_pciids.h with kernel
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

On Mon, Apr 25, 2022 at 08:32:48PM +0530, Talla Raviteja Goud wrote:
> From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> 
> This synchronizes with kernel commit
> 
> 72c3c8d6e5275 ("drm/i915/rpl-p: Add PCI IDs")
> to bring in RPL-P PCI IDs.
> 
> v2: Corresponding kernel commit added in commit message (Petri)
> 
> v3: Copying the header from 72c3c8d6e5275 also brings in these RPL-S ids: 0xA78A 0xA78B (Petri)
> 
> Signed-off-by: Adam Miszczak <adam.miszczak@intel.com>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Signed-off-by: Raviteja Goud Talla <ravitejax.goud.talla@intel.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/i915_pciids.h | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 533890dc..a7b5eea7 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -679,6 +679,17 @@
>  	INTEL_VGA_DEVICE(0xA782, info), \
>  	INTEL_VGA_DEVICE(0xA783, info), \
>  	INTEL_VGA_DEVICE(0xA788, info), \
> -	INTEL_VGA_DEVICE(0xA789, info)
> +	INTEL_VGA_DEVICE(0xA789, info), \
> +	INTEL_VGA_DEVICE(0xA78A, info), \
> +	INTEL_VGA_DEVICE(0xA78B, info)
> +
> +/* RPL-P */
> +#define INTEL_RPLP_IDS(info) \
> +	INTEL_VGA_DEVICE(0xA720, info), \
> +	INTEL_VGA_DEVICE(0xA721, info), \
> +	INTEL_VGA_DEVICE(0xA7A0, info), \
> +	INTEL_VGA_DEVICE(0xA7A1, info), \
> +	INTEL_VGA_DEVICE(0xA7A8, info), \
> +	INTEL_VGA_DEVICE(0xA7A9, info)
>  
>  #endif /* _I915_PCIIDS_H */
> -- 
> 2.34.1
> 
