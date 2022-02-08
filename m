Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8AA10E3B6
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Feb 2022 06:36:21 +0000 (UTC)
Date: Tue, 8 Feb 2022 08:35:16 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YgIPJNAP+zvtoU1V@platvala-desk.ger.corp.intel.com>
References: <20220207182152.31211-1-jeevan.b@intel.com>
 <20220207182152.31211-2-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207182152.31211-2-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 01/17] lib/i915_pciids: PCI IDS for DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, Melkaveri@freedesktop.org, Adam Miszczak <adam.miszczak@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 11:51:36PM +0530, Jeevan B wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Adds PCI IDS for DG2.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Adam Miszczak <adam.miszczak@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  lib/i915_pciids.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h

This file is supposed to be copied from the kernel. The kernel doesn't
have DG2 PCI ids yet, as was pointed out the last time this change was
sent to the mailing list.


-- 
Petri Latvala


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
> 2.17.1
> 
