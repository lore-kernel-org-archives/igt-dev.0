Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614F36E8C6
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2020 08:29:22 +0000 (UTC)
Date: Wed, 12 Aug 2020 11:24:57 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200812082457.GO7444@platvala-desk.ger.corp.intel.com>
References: <20200812080501.30369-1-adam.miszczak@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812080501.30369-1-adam.miszczak@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Add DG1 platform definition
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
To: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 10:05:01AM +0200, Adam Miszczak wrote:
> Introduce DG1 PCI IDs and related definitions.
> 
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> ---
>  lib/i915_pciids.h       | 4 ++++
>  lib/intel_chipset.h     | 2 ++
>  lib/intel_device_info.c | 8 ++++++++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index d6cb2899..96e408b4 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -618,4 +618,8 @@
>  	INTEL_VGA_DEVICE(0x4C90, info), \
>  	INTEL_VGA_DEVICE(0x4C9A, info)
>  
> +/* DG1 */
> +#define INTEL_DG1_IDS(info) \
> +	INTEL_VGA_DEVICE(0x4905, info)
> +
>  #endif /* _I915_PCIIDS_H */

This file should be a direct copy from the kernel, with the IGT commit
message stating what kernel commit it's copied from and where that
commit is.

(Note to self: We need some better documentation on this process...)


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
