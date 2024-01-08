Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1811110E22B
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jan 2024 12:40:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e461c1f5cso11214165e9.3
 for <igt-dev@lists.freedesktop.org>; Mon, 08 Jan 2024 04:40:24 -0800 (PST)
Message-ID: <b5c218bc-168f-4b23-ba64-347e26f89ea2@gmail.com>
Date: Mon, 8 Jan 2024 14:40:07 +0200
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 2/2] lib: sync i915_pciids.h with kernel
Content-Language: en-US
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240105124641.784371-1-chaitanya.kumar.borah@intel.com>
 <20240105124641.784371-3-chaitanya.kumar.borah@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240105124641.784371-3-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 5.1.2024 14.46, Chaitanya Kumar Borah wrote:
> This synchronizes with kernel commit
> 
>      5032c607e886 ("drm/i915: ATS-M device ID update")
> 
> Also move out macros which are not present in kernel header to
> i915_pciid_local.h

Hi Chaitanya,

I'd prefer you do one thing per patch. Ie. first move those pciids which 
don't belong here to local file and then do synchronization. Otherwise 
things look ok to me on this set. I do still wonder why those pvc pciids 
are here in the first place but let's keep that issue outside of the 
scope of these patches.

/Juha-Pekka

> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   lib/i915_pciids.h       | 56 ++++++++++++++++++-----------------------
>   lib/i915_pciids_local.h | 25 ++++++++++++++++++
>   2 files changed, 50 insertions(+), 31 deletions(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index bee58554d..fcf1849aa 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -588,6 +588,7 @@
>   	INTEL_VGA_DEVICE(0x4551, info), \
>   	INTEL_VGA_DEVICE(0x4555, info), \
>   	INTEL_VGA_DEVICE(0x4557, info), \
> +	INTEL_VGA_DEVICE(0x4570, info), \
>   	INTEL_VGA_DEVICE(0x4571, info)
>   
>   /* JSL */
> @@ -641,6 +642,7 @@
>   	INTEL_VGA_DEVICE(0x4682, info), \
>   	INTEL_VGA_DEVICE(0x4688, info), \
>   	INTEL_VGA_DEVICE(0x468A, info), \
> +	INTEL_VGA_DEVICE(0x468B, info), \
>   	INTEL_VGA_DEVICE(0x4690, info), \
>   	INTEL_VGA_DEVICE(0x4692, info), \
>   	INTEL_VGA_DEVICE(0x4693, info)
> @@ -683,14 +685,22 @@
>   	INTEL_VGA_DEVICE(0xA78A, info), \
>   	INTEL_VGA_DEVICE(0xA78B, info)
>   
> +/* RPL-U */
> +#define INTEL_RPLU_IDS(info) \
> +	INTEL_VGA_DEVICE(0xA721, info), \
> +	INTEL_VGA_DEVICE(0xA7A1, info), \
> +	INTEL_VGA_DEVICE(0xA7A9, info), \
> +	INTEL_VGA_DEVICE(0xA7AC, info), \
> +	INTEL_VGA_DEVICE(0xA7AD, info)
> +
>   /* RPL-P */
>   #define INTEL_RPLP_IDS(info) \
> +	INTEL_RPLU_IDS(info), \
>   	INTEL_VGA_DEVICE(0xA720, info), \
> -	INTEL_VGA_DEVICE(0xA721, info), \
>   	INTEL_VGA_DEVICE(0xA7A0, info), \
> -	INTEL_VGA_DEVICE(0xA7A1, info), \
>   	INTEL_VGA_DEVICE(0xA7A8, info), \
> -	INTEL_VGA_DEVICE(0xA7A9, info)
> +	INTEL_VGA_DEVICE(0xA7AA, info), \
> +	INTEL_VGA_DEVICE(0xA7AB, info)
>   
>   /* DG2 */
>   #define INTEL_DG2_G10_IDS(info) \
> @@ -705,11 +715,14 @@
>   	INTEL_VGA_DEVICE(0x5693, info), \
>   	INTEL_VGA_DEVICE(0x5694, info), \
>   	INTEL_VGA_DEVICE(0x5695, info), \
> -	INTEL_VGA_DEVICE(0x5698, info), \
>   	INTEL_VGA_DEVICE(0x56A5, info), \
>   	INTEL_VGA_DEVICE(0x56A6, info), \
>   	INTEL_VGA_DEVICE(0x56B0, info), \
> -	INTEL_VGA_DEVICE(0x56B1, info)
> +	INTEL_VGA_DEVICE(0x56B1, info), \
> +	INTEL_VGA_DEVICE(0x56BA, info), \
> +	INTEL_VGA_DEVICE(0x56BB, info), \
> +	INTEL_VGA_DEVICE(0x56BC, info), \
> +	INTEL_VGA_DEVICE(0x56BD, info)
>   
>   #define INTEL_DG2_G12_IDS(info) \
>   	INTEL_VGA_DEVICE(0x5696, info), \
> @@ -725,7 +738,8 @@
>   	INTEL_DG2_G12_IDS(info)
>   
>   #define INTEL_ATS_M150_IDS(info) \
> -	INTEL_VGA_DEVICE(0x56C0, info)
> +	INTEL_VGA_DEVICE(0x56C0, info), \
> +	INTEL_VGA_DEVICE(0x56C2, info)
>   
>   #define INTEL_ATS_M75_IDS(info) \
>   	INTEL_VGA_DEVICE(0x56C1, info)
> @@ -733,34 +747,14 @@
>   #define INTEL_ATS_M_IDS(info) \
>   	INTEL_ATS_M150_IDS(info), \
>   	INTEL_ATS_M75_IDS(info)
> +
>   /* MTL */
> -#define INTEL_MTL_M_IDS(info) \
> +#define INTEL_MTL_IDS(info) \
>   	INTEL_VGA_DEVICE(0x7D40, info), \
> -	INTEL_VGA_DEVICE(0x7D60, info)
> -#define INTEL_MTL_P_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x7D45, info)
> -#define INTEL_MTL_P_GT3_IDS(info) \
> +	INTEL_VGA_DEVICE(0x7D45, info), \
>   	INTEL_VGA_DEVICE(0x7D55, info), \
> +	INTEL_VGA_DEVICE(0x7D60, info), \
> +	INTEL_VGA_DEVICE(0x7D67, info), \
>   	INTEL_VGA_DEVICE(0x7DD5, info)
> -#define INTEL_MTL_P_IDS(info) \
> -	INTEL_MTL_P_GT2_IDS(info), \
> -	INTEL_MTL_P_GT3_IDS(info)
> -
> -#define INTEL_MTL_IDS(info) \
> -	INTEL_MTL_M_IDS(info), \
> -	INTEL_MTL_P_IDS(info)
> -
> -/* PVC */
> -#define INTEL_PVC_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0BD0, info),	\
> -	INTEL_VGA_DEVICE(0x0BD5, info),	\
> -	INTEL_VGA_DEVICE(0x0BD6, info),	\
> -	INTEL_VGA_DEVICE(0x0BD7, info),	\
> -	INTEL_VGA_DEVICE(0x0BD8, info),	\
> -	INTEL_VGA_DEVICE(0x0BD9, info),	\
> -	INTEL_VGA_DEVICE(0x0BDA, info),	\
> -	INTEL_VGA_DEVICE(0x0BDB, info),	\
> -	INTEL_VGA_DEVICE(0x0BD1, info),	\
> -	INTEL_VGA_DEVICE(0x0BD2, info)
>   
>   #endif /* _I915_PCIIDS_H */
> diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
> index 91c26152a..a30e18526 100644
> --- a/lib/i915_pciids_local.h
> +++ b/lib/i915_pciids_local.h
> @@ -7,4 +7,29 @@
>   
>   #include "i915_pciids.h"
>   
> +/* MTL perf */
> +#define INTEL_MTL_M_IDS(info) \
> +       INTEL_VGA_DEVICE(0x7D60, info)
> +#define INTEL_MTL_P_GT2_IDS(info) \
> +       INTEL_VGA_DEVICE(0x7D45, info)
> +#define INTEL_MTL_P_GT3_IDS(info) \
> +        INTEL_VGA_DEVICE(0x7D55, info), \
> +        INTEL_VGA_DEVICE(0x7DD5, info)
> +#define INTEL_MTL_P_IDS(info) \
> +       INTEL_MTL_P_GT2_IDS(info), \
> +       INTEL_MTL_P_GT3_IDS(info)
> +
> +/* PVC */
> +#define INTEL_PVC_IDS(info) \
> +       INTEL_VGA_DEVICE(0x0BD0, info), \
> +       INTEL_VGA_DEVICE(0x0BD5, info), \
> +       INTEL_VGA_DEVICE(0x0BD6, info), \
> +       INTEL_VGA_DEVICE(0x0BD7, info), \
> +       INTEL_VGA_DEVICE(0x0BD8, info), \
> +       INTEL_VGA_DEVICE(0x0BD9, info), \
> +       INTEL_VGA_DEVICE(0x0BDA, info), \
> +       INTEL_VGA_DEVICE(0x0BDB, info), \
> +       INTEL_VGA_DEVICE(0x0BD1, info), \
> +       INTEL_VGA_DEVICE(0x0BD2, info)
> +
>   #endif /* _I915_PCIIDS_LOCAL_H */
