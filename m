Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF5610E5C2
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Dec 2021 09:53:16 +0000 (UTC)
Date: Tue, 21 Dec 2021 11:50:51 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YcGje5sGkLRagQ1b@platvala-desk.ger.corp.intel.com>
References: <20211221054930.4128285-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20211221054930.4128285-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221054930.4128285-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [igt-dev] [i-g-t 1/2] lib: sync i915_pciids.h with kernel
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

On Tue, Dec 21, 2021 at 11:19:29AM +0530, Tejas Upadhyay wrote:
> This synchronizes with kernel commit
> 
> 7e28d0b26759 ("drm/i915/adl-n: Enable ADL-N platform")
> to bring in ADL-N PCI IDs.
> 
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/i915_pciids.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index baf3d1d3..533890dc 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -666,6 +666,12 @@
>  	INTEL_VGA_DEVICE(0x46C2, info), \
>  	INTEL_VGA_DEVICE(0x46C3, info)
>  
> +/* ADL-N */
> +#define INTEL_ADLN_IDS(info) \
> +	INTEL_VGA_DEVICE(0x46D0, info), \
> +	INTEL_VGA_DEVICE(0x46D1, info), \
> +	INTEL_VGA_DEVICE(0x46D2, info)
> +
>  /* RPL-S */
>  #define INTEL_RPLS_IDS(info) \
>  	INTEL_VGA_DEVICE(0xA780, info), \
> -- 
> 2.31.1
> 
