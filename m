Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A2A10E8D3
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 11:13:27 +0000 (UTC)
Date: Thu, 11 Jan 2024 12:13:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] lib: Add non-kernel macros to
 i915_pciids_local.h
Message-ID: <20240111111322.t7dpptippmtpzzxw@kamilkon-desk.igk.intel.com>
References: <20240110081532.1378038-1-chaitanya.kumar.borah@intel.com>
 <20240110081532.1378038-3-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240110081532.1378038-3-chaitanya.kumar.borah@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chaitanya,
On 2024-01-10 at 13:45:31 +0530, Chaitanya Kumar Borah wrote:

one more nit spotted, see below.

> Add MTL and PVC PCI-ID macros which are not present in kernel
> header to i915_pciids_local.h. This will help us sync the kernel
> and IGT headers.
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  lib/i915_pciids_local.h | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
> index 91c26152a..1ed8364c5 100644
> --- a/lib/i915_pciids_local.h
> +++ b/lib/i915_pciids_local.h
> @@ -7,4 +7,42 @@
>  
>  #include "i915_pciids.h"
>  
> +/* MTL perf */
> +#ifndef INTEL_MTL_M_IDS
> +#define INTEL_MTL_M_IDS(info) \
> +       INTEL_VGA_DEVICE(0x7D60, info)
> +#endif
> +
> +#ifndef INTEL_MTL_P_GT2_IDS
> +#define INTEL_MTL_P_GT2_IDS(info) \
> +       INTEL_VGA_DEVICE(0x7D45, info)
> +#endif
> +
> +#ifndef INTEL_MTL_P_GT3_IDS
> +#define INTEL_MTL_P_GT3_IDS(info) \
> +        INTEL_VGA_DEVICE(0x7D55, info), \
> +        INTEL_VGA_DEVICE(0x7DD5, info)
> +#endif
> +
> +#ifndef INTEL_MTL_P_IDS
> +#define INTEL_MTL_P_IDS(info) \
> +       INTEL_MTL_P_GT2_IDS(info), \
> +       INTEL_MTL_P_GT3_IDS(info)
> +#endif
> +
> +/* PVC */
> +#ifndef INTEL_PVC_IDS
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

These should be sorted, BD1 and BD2 should be before BD5.
I will correct it before merge.

Regards,
Kamil

> +#endif
> +
>  #endif /* _I915_PCIIDS_LOCAL_H */
> -- 
> 2.25.1
> 
