Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F7410E65D
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Dec 2021 09:54:18 +0000 (UTC)
Date: Tue, 21 Dec 2021 11:51:28 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YcGjoOxvJ4rWiHY7@platvala-desk.ger.corp.intel.com>
References: <20211221054930.4128285-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20211221054930.4128285-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221054930.4128285-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [igt-dev] [i-g-t 2/2] lib/adl_n: Add Alder Lake N platform
 definition
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

On Tue, Dec 21, 2021 at 11:19:30AM +0530, Tejas Upadhyay wrote:
> Adding Alder lake N platform definitions
> 
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/intel_chipset.h     | 2 ++
>  lib/intel_device_info.c | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index cf8ff1ae..3527cbe5 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -80,6 +80,7 @@ struct intel_device_info {
>  	bool is_alderlake_s : 1;
>  	bool is_raptorlake_s : 1;
>  	bool is_alderlake_p : 1;
> +	bool is_alderlake_n : 1;
>  	const char *codename;
>  };
>  
> @@ -184,6 +185,7 @@ void intel_check_pch(void);
>  #define IS_ALDERLAKE_S(devid)	(intel_get_device_info(devid)->is_alderlake_s)
>  #define IS_RAPTORLAKE_S(devid)	(intel_get_device_info(devid)->is_raptorlake_s)
>  #define IS_ALDERLAKE_P(devid)	(intel_get_device_info(devid)->is_alderlake_p)
> +#define IS_ALDERLAKE_N(devid)	(intel_get_device_info(devid)->is_alderlake_n)
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>  #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 178e7d0a..40942afe 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -410,6 +410,13 @@ static const struct intel_device_info intel_alderlake_p_info = {
>  	.codename = "alderlake_p"
>  };
>  
> +static const struct intel_device_info intel_alderlake_n_info = {
> +	.graphics_ver = 12,
> +	.display_ver = 13,
> +	.is_alderlake_n = true,
> +	.codename = "alderlake_n"
> +};
> +
>  static const struct pci_id_match intel_device_match[] = {
>  	INTEL_I810_IDS(&intel_i810_info),
>  	INTEL_I815_IDS(&intel_i815_info),
> @@ -503,6 +510,7 @@ static const struct pci_id_match intel_device_match[] = {
>  	INTEL_ADLS_IDS(&intel_alderlake_s_info),
>  	INTEL_RPLS_IDS(&intel_raptorlake_s_info),
>  	INTEL_ADLP_IDS(&intel_alderlake_p_info),
> +	INTEL_ADLN_IDS(&intel_alderlake_n_info),
>  
>  	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
>  };
> -- 
> 2.31.1
> 
