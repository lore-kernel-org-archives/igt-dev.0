Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32655112AAE
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 11:20:11 +0000 (UTC)
Date: Tue, 31 May 2022 14:17:58 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Karolina Drobnik <karolina.drobnik@intel.com>
Message-ID: <YpX5Zjda+qtdoT+n@platvala-desk.ger.corp.intel.com>
References: <20220531105928.1029905-1-karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531105928.1029905-1-karolina.drobnik@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Add ATS-M definitions
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

On Tue, May 31, 2022 at 12:59:28PM +0200, Karolina Drobnik wrote:
> Add local definitions for ATS-M to enable it for testing.
> 
> Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/i915_pciids_local.h | 11 +++++++++++
>  lib/intel_chipset.h     |  2 ++
>  lib/intel_device_info.c | 11 +++++++++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
> index 2a18109e..b3ac70ff 100644
> --- a/lib/i915_pciids_local.h
> +++ b/lib/i915_pciids_local.h
> @@ -17,4 +17,15 @@
>  	INTEL_VGA_DEVICE(0x56A5, info), \
>  	INTEL_VGA_DEVICE(0x56A6, info)
>  
> +/* ATS-M */
> +#define INTEL_ATS_M150_IDS(info) \
> +	INTEL_VGA_DEVICE(0x56C0, info)
> +
> +#define INTEL_ATS_M75_IDS(info) \
> +	INTEL_VGA_DEVICE(0x56C1, info)
> +
> +#define INTEL_ATS_M_IDS(info) \
> +	INTEL_ATS_M150_IDS(info), \
> +	INTEL_ATS_M75_IDS(info)
> +
>  #endif /* _I915_PCIIDS_LOCAL_H */
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 4d9f4623..81547408 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -84,6 +84,7 @@ struct intel_device_info {
>  	bool is_raptorlake_s : 1;
>  	bool is_alderlake_p : 1;
>  	bool is_alderlake_n : 1;
> +	bool is_ats_m : 1;
>  	const char *codename;
>  };
>  
> @@ -190,6 +191,7 @@ void intel_check_pch(void);
>  #define IS_RAPTORLAKE_S(devid)	(intel_get_device_info(devid)->is_raptorlake_s)
>  #define IS_ALDERLAKE_P(devid)	(intel_get_device_info(devid)->is_alderlake_p)
>  #define IS_ALDERLAKE_N(devid)	(intel_get_device_info(devid)->is_alderlake_n)
> +#define IS_ATS_M(devid)	(intel_get_device_info(devid)->is_ats_m)
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>  #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 0253a732..5b1da33f 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -427,6 +427,15 @@ static const struct intel_device_info intel_alderlake_n_info = {
>  	.codename = "alderlake_n"
>  };
>  
> +static const struct intel_device_info intel_ats_m_info = {
> +	.graphics_ver = 12,
> +	.display_ver = 0, /* no display support */
> +	.is_ats_m = true,
> +	.has_4tile = true,
> +	.codename = "ats_m",
> +	.has_flatccs = true,
> +};
> +
>  static const struct pci_id_match intel_device_match[] = {
>  	INTEL_I810_IDS(&intel_i810_info),
>  	INTEL_I815_IDS(&intel_i815_info),
> @@ -524,6 +533,8 @@ static const struct pci_id_match intel_device_match[] = {
>  	INTEL_RPLP_IDS(&intel_alderlake_p_info),
>  	INTEL_ADLN_IDS(&intel_alderlake_n_info),
>  
> +	INTEL_ATS_M_IDS(&intel_ats_m_info),
> +
>  	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
>  };
>  
> -- 
> 2.25.1
> 
