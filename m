Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAD389893
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Aug 2021 07:39:59 +0000 (UTC)
Date: Tue, 24 Aug 2021 10:42:49 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YSSi+aFcakzTajQr@platvala-desk.ger.corp.intel.com>
References: <20210824055611.1148338-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824055611.1148338-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [igt-dev] [i-g-t] lib: sync ADL-S PCI ids with kernel
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

On Tue, Aug 24, 2021 at 11:26:11AM +0530, Tejas Upadhyay wrote:
> Taken from kernel commit:
> commit c79b846f892d ("drm/i915/adl_s: Update ADL-S PCI IDs")
> 
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

Matches the kernel commit.

Acked-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/i915_pciids.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index eee18fa5..cb45af9f 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -637,13 +637,10 @@
>  /* ADL-S */
>  #define INTEL_ADLS_IDS(info) \
>  	INTEL_VGA_DEVICE(0x4680, info), \
> -	INTEL_VGA_DEVICE(0x4681, info), \
>  	INTEL_VGA_DEVICE(0x4682, info), \
> -	INTEL_VGA_DEVICE(0x4683, info), \
>  	INTEL_VGA_DEVICE(0x4688, info), \
> -	INTEL_VGA_DEVICE(0x4689, info), \
> +	INTEL_VGA_DEVICE(0x468A, info), \
>  	INTEL_VGA_DEVICE(0x4690, info), \
> -	INTEL_VGA_DEVICE(0x4691, info), \
>  	INTEL_VGA_DEVICE(0x4692, info), \
>  	INTEL_VGA_DEVICE(0x4693, info)
>  
> -- 
> 2.31.1
> 
