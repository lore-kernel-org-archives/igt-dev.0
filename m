Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D02B112166
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 07:42:44 +0000 (UTC)
Date: Fri, 22 Apr 2022 10:42:45 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Talla Raviteja Goud <ravitejax.goud.talla@intel.com>
Message-ID: <YmJcdWH1lSjnPS73@platvala-desk.ger.corp.intel.com>
References: <20220421055819.3765382-1-ravitejax.goud.talla@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421055819.3765382-1-ravitejax.goud.talla@intel.com>
Subject: Re: [igt-dev] [i-g-t,v2, 1/2] lib: sync i915_pciids.h with kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 11:28:18AM +0530, Talla Raviteja Goud wrote:
> From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> 
> This synchronizes with kernel commit
> 
> 72c3c8d6e5275 ("drm/i915/rpl-p: Add PCI IDs")
> to bring in RPL-P PCI IDs.
> 
> v2: Corresponding kernel commit added in commit message (Petri)
> 
> Signed-off-by: Adam Miszczak <adam.miszczak@intel.com>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Signed-off-by: Raviteja Goud Talla <ravitejax.goud.talla@intel.com>
> ---
>  lib/i915_pciids.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 533890dc..3233a06e 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -681,4 +681,13 @@
>  	INTEL_VGA_DEVICE(0xA788, info), \
>  	INTEL_VGA_DEVICE(0xA789, info)

You need to _copy_ the file from that kernel commit. It has changes to
the list of RPL-S ids here too, this patch doesn't match what's in
72c3c8d6e5275.


-- 
Petri Latvala


>  
> +/*RPL-P */
> +#define INTEL_RPLP_IDS(info) \
> +	INTEL_VGA_DEVICE(0xA720, info), \
> +	INTEL_VGA_DEVICE(0xA721, info), \
> +	INTEL_VGA_DEVICE(0xA7A0, info), \
> +	INTEL_VGA_DEVICE(0xA7A1, info), \
> +	INTEL_VGA_DEVICE(0xA7A8, info), \
> +	INTEL_VGA_DEVICE(0xA7A9, info)
> +
>  #endif /* _I915_PCIIDS_H */
> -- 
> 2.34.1
> 
