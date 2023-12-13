Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6326E10E180
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 13:17:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c2718a768so68236675e9.0
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 05:17:33 -0800 (PST)
Message-ID: <c3cae6fc-8a97-4abd-9918-bba55c1757ca@gmail.com>
Date: Wed, 13 Dec 2023 15:17:22 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] lib: sync i915_pciids.h with kernel
Content-Language: en-US
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231212090841.2060493-1-chaitanya.kumar.borah@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231212090841.2060493-1-chaitanya.kumar.borah@intel.com>
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
Cc: nemesa.garg@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is not correct. This does not synchronize with kernel commit. 
i915_pciids.h is supposed to be copied as is from kernel. Also don't do 
other changes in same patch, put intel_device_info.c changes into their 
own patch.

You can see "git log lib/i915_pciids.h" for examples, sans two latest 
changes into the file. Two two latest changes are broken.

/Juha-Pekka

On 12.12.2023 11.08, Chaitanya Kumar Borah wrote:
> This synchronizes with kernel commit
> 
> 8940da9fe5f27 ("drm/i915/mtl: Adding DeviceID for Arrowlake-S under MTL")
> to bring in ARL-S PCI IDs.
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   lib/i915_pciids.h       | 4 ++++
>   lib/intel_device_info.c | 1 +
>   2 files changed, 5 insertions(+)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index bee58554d..106e42f84 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -750,6 +750,10 @@
>   	INTEL_MTL_M_IDS(info), \
>   	INTEL_MTL_P_IDS(info)
>   
> +/* ARL-S */
> +#define INTEL_ARLS_IDS(info) \
> +	INTEL_VGA_DEVICE(0x7D67, info)
> +
>   /* PVC */
>   #define INTEL_PVC_IDS(info) \
>   	INTEL_VGA_DEVICE(0x0BD0, info),	\
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 34817f7b6..48036bec5 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -614,6 +614,7 @@ static const struct pci_id_match intel_device_match[] = {
>   	INTEL_ATS_M_IDS(&intel_ats_m_info),
>   
>   	INTEL_MTL_IDS(&intel_meteorlake_info),
> +	INTEL_ARLS_IDS(&intel_meteorlake_info),
>   
>   	INTEL_PVC_IDS(&intel_pontevecchio_info),
>   
