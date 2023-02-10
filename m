Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40A810E04A
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Feb 2023 09:17:58 +0000 (UTC)
Date: Fri, 10 Feb 2023 10:17:46 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230210091746.vwbxvui3mokmuoh2@zkempczy-mobl2>
References: <cover.1675950055.git.karolina.stolarek@intel.com>
 <9e92981b9950f0dff82ffc02d253bad15360ffe8.1675950055.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e92981b9950f0dff82ffc02d253bad15360ffe8.1675950055.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/9] lib/intel_tiling_info: Update
 names of commands definitions
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

On Thu, Feb 09, 2023 at 03:12:05PM +0100, Karolina Stolarek wrote:
> intel_cmds_info will describe other copy commands, not just
> these offered by blitter. Change the definition names to be
> more generic.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  lib/i915/intel_tiling_info.c | 12 ++++----
>  lib/i915/intel_tiling_info.h | 12 ++++----
>  lib/intel_device_info.c      | 58 ++++++++++++++++++------------------
>  3 files changed, 41 insertions(+), 41 deletions(-)
> 
> diff --git a/lib/i915/intel_tiling_info.c b/lib/i915/intel_tiling_info.c
> index 467e4b45..3df23b60 100644
> --- a/lib/i915/intel_tiling_info.c
> +++ b/lib/i915/intel_tiling_info.c
> @@ -51,27 +51,27 @@ static const struct blt_tiling_info
>  					     BIT(T_TILE4)  |
>  					     BIT(T_TILE64));
>  
> -const struct intel_cmds_info pre_gen8_blt_info = {
> +const struct intel_cmds_info pre_gen8_cmds_info = {

Please squash this with 1/9. You may keep rb.

--
Zbigniew

>  	.supported_cmds = {
>  		[SRC_COPY] = &src_copy,
>  		[XY_SRC_COPY] = &pre_gen8_xy_src_copy
>  	}
>  };
>  
> -const struct intel_cmds_info gen8_blt_info = {
> +const struct intel_cmds_info gen8_cmds_info = {
>  	.supported_cmds = {
>  		[XY_SRC_COPY] = &gen8_xy_src_copy,
>  	}
>  };
>  
> -const struct intel_cmds_info gen11_blt_info = {
> +const struct intel_cmds_info gen11_cmds_info = {
>  	.supported_cmds = {
>  		[XY_SRC_COPY] = &gen8_xy_src_copy,
>  		[XY_FAST_COPY] = &gen11_xy_fast_copy,
>  	}
>  };
>  
> -const struct intel_cmds_info gen12_blt_info = {
> +const struct intel_cmds_info gen12_cmds_info = {
>  	.supported_cmds = {
>  		[XY_SRC_COPY] = &gen8_xy_src_copy,
>  		[XY_FAST_COPY] = &gen12_xy_fast_copy,
> @@ -79,7 +79,7 @@ const struct intel_cmds_info gen12_blt_info = {
>  	}
>  };
>  
> -const struct intel_cmds_info gen12_dg2_blt_info = {
> +const struct intel_cmds_info gen12_dg2_cmds_info = {
>  	.supported_cmds = {
>  		[XY_SRC_COPY] = &gen8_xy_src_copy,
>  		[XY_FAST_COPY] = &dg2_xy_fast_copy,
> @@ -87,7 +87,7 @@ const struct intel_cmds_info gen12_dg2_blt_info = {
>  	}
>  };
>  
> -const struct intel_cmds_info gen12_mtl_blt_info = {
> +const struct intel_cmds_info gen12_mtl_cmds_info = {
>  	.supported_cmds = {
>  		[XY_FAST_COPY] = &dg2_xy_fast_copy,
>  		[XY_BLOCK_COPY] = &dg2_xy_block_copy
> diff --git a/lib/i915/intel_tiling_info.h b/lib/i915/intel_tiling_info.h
> index 2b310f0c..6854c64b 100644
> --- a/lib/i915/intel_tiling_info.h
> +++ b/lib/i915/intel_tiling_info.h
> @@ -35,12 +35,12 @@ struct intel_cmds_info {
>  	struct blt_tiling_info const *supported_cmds[__BLT_MAX_CMD];
>  };
>  
> -extern const struct intel_cmds_info pre_gen8_blt_info;
> -extern const struct intel_cmds_info gen8_blt_info;
> -extern const struct intel_cmds_info gen11_blt_info;
> -extern const struct intel_cmds_info gen12_blt_info;
> -extern const struct intel_cmds_info gen12_dg2_blt_info;
> -extern const struct intel_cmds_info gen12_mtl_blt_info;
> +extern const struct intel_cmds_info pre_gen8_cmds_info;
> +extern const struct intel_cmds_info gen8_cmds_info;
> +extern const struct intel_cmds_info gen11_cmds_info;
> +extern const struct intel_cmds_info gen12_cmds_info;
> +extern const struct intel_cmds_info gen12_dg2_cmds_info;
> +extern const struct intel_cmds_info gen12_mtl_cmds_info;
>  
>  #define for_each_tiling(__tiling) \
>  	for (__tiling = T_LINEAR; __tiling < __BLT_MAX_TILING; __tiling++)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index a4cfca6a..174e2b6f 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -145,7 +145,7 @@ static const struct intel_device_info intel_sandybridge_info = {
>  	.graphics_ver = 6,
>  	.display_ver = 6,
>  	.is_sandybridge = true,
> -	.cmds_info = &pre_gen8_blt_info,
> +	.cmds_info = &pre_gen8_cmds_info,
>  	.codename = "sandybridge"
>  };
>  static const struct intel_device_info intel_sandybridge_m_info = {
> @@ -153,7 +153,7 @@ static const struct intel_device_info intel_sandybridge_m_info = {
>  	.display_ver = 6,
>  	.is_mobile = true,
>  	.is_sandybridge = true,
> -	.cmds_info = &pre_gen8_blt_info,
> +	.cmds_info = &pre_gen8_cmds_info,
>  	.codename = "sandybridge"
>  };
>  
> @@ -161,7 +161,7 @@ static const struct intel_device_info intel_ivybridge_info = {
>  	.graphics_ver = 7,
>  	.display_ver = 7,
>  	.is_ivybridge = true,
> -	.cmds_info = &pre_gen8_blt_info,
> +	.cmds_info = &pre_gen8_cmds_info,
>  	.codename = "ivybridge"
>  };
>  static const struct intel_device_info intel_ivybridge_m_info = {
> @@ -169,7 +169,7 @@ static const struct intel_device_info intel_ivybridge_m_info = {
>  	.display_ver = 7,
>  	.is_mobile = true,
>  	.is_ivybridge = true,
> -	.cmds_info = &pre_gen8_blt_info,
> +	.cmds_info = &pre_gen8_cmds_info,
>  	.codename = "ivybridge"
>  };
>  
> @@ -177,7 +177,7 @@ static const struct intel_device_info intel_valleyview_info = {
>  	.graphics_ver = 7,
>  	.display_ver = 7,
>  	.is_valleyview = true,
> -	.cmds_info = &pre_gen8_blt_info,
> +	.cmds_info = &pre_gen8_cmds_info,
>  	.codename = "valleyview"
>  };
>  
> @@ -185,7 +185,7 @@ static const struct intel_device_info intel_valleyview_info = {
>  	.graphics_ver = 7, \
>  	.display_ver = 7, \
>  	.is_haswell = true, \
> -	.cmds_info = &pre_gen8_blt_info, \
> +	.cmds_info = &pre_gen8_cmds_info, \
>  	.codename = "haswell"
>  
>  static const struct intel_device_info intel_haswell_gt1_info = {
> @@ -207,7 +207,7 @@ static const struct intel_device_info intel_haswell_gt3_info = {
>  	.graphics_ver = 8, \
>  	.display_ver = 8, \
>  	.is_broadwell = true, \
> -	.cmds_info = &gen8_blt_info, \
> +	.cmds_info = &gen8_cmds_info, \
>  	.codename = "broadwell"
>  
>  static const struct intel_device_info intel_broadwell_gt1_info = {
> @@ -233,14 +233,14 @@ static const struct intel_device_info intel_cherryview_info = {
>  	.graphics_ver = 8,
>  	.display_ver = 8,
>  	.is_cherryview = true,
> -	.cmds_info = &gen8_blt_info,
> +	.cmds_info = &gen8_cmds_info,
>  	.codename = "cherryview"
>  };
>  
>  #define SKYLAKE_FIELDS \
>  	.graphics_ver = 9, \
>  	.display_ver = 9, \
> -	.cmds_info = &gen11_blt_info, \
> +	.cmds_info = &gen11_cmds_info, \
>  	.codename = "skylake", \
>  	.is_skylake = true
>  
> @@ -268,7 +268,7 @@ static const struct intel_device_info intel_broxton_info = {
>  	.graphics_ver = 9,
>  	.display_ver = 9,
>  	.is_broxton = true,
> -	.cmds_info = &gen11_blt_info,
> +	.cmds_info = &gen11_cmds_info,
>  	.codename = "broxton"
>  };
>  
> @@ -276,7 +276,7 @@ static const struct intel_device_info intel_broxton_info = {
>  	.graphics_ver = 9, \
>  	.display_ver = 9, \
>  	.is_kabylake = true, \
> -	.cmds_info = &gen11_blt_info, \
> +	.cmds_info = &gen11_cmds_info, \
>  	.codename = "kabylake"
>  
>  static const struct intel_device_info intel_kabylake_gt1_info = {
> @@ -303,7 +303,7 @@ static const struct intel_device_info intel_geminilake_info = {
>  	.graphics_ver = 9,
>  	.display_ver = 9,
>  	.is_geminilake = true,
> -	.cmds_info = &gen11_blt_info,
> +	.cmds_info = &gen11_cmds_info,
>  	.codename = "geminilake"
>  };
>  
> @@ -311,7 +311,7 @@ static const struct intel_device_info intel_geminilake_info = {
>  	.graphics_ver = 9, \
>  	.display_ver = 9, \
>  	.is_coffeelake = true, \
> -	.cmds_info = &gen11_blt_info, \
> +	.cmds_info = &gen11_cmds_info, \
>  	.codename = "coffeelake"
>  
>  static const struct intel_device_info intel_coffeelake_gt1_info = {
> @@ -333,7 +333,7 @@ static const struct intel_device_info intel_coffeelake_gt3_info = {
>  	.graphics_ver = 9, \
>  	.display_ver = 9, \
>  	.is_cometlake = true, \
> -	.cmds_info = &gen11_blt_info, \
> +	.cmds_info = &gen11_cmds_info, \
>  	.codename = "cometlake"
>  
>  static const struct intel_device_info intel_cometlake_gt1_info = {
> @@ -350,7 +350,7 @@ static const struct intel_device_info intel_cannonlake_info = {
>  	.graphics_ver = 10,
>  	.display_ver = 10,
>  	.is_cannonlake = true,
> -	.cmds_info = &gen11_blt_info,
> +	.cmds_info = &gen11_cmds_info,
>  	.codename = "cannonlake"
>  };
>  
> @@ -358,7 +358,7 @@ static const struct intel_device_info intel_icelake_info = {
>  	.graphics_ver = 11,
>  	.display_ver = 11,
>  	.is_icelake = true,
> -	.cmds_info = &gen11_blt_info,
> +	.cmds_info = &gen11_cmds_info,
>  	.codename = "icelake"
>  };
>  
> @@ -366,7 +366,7 @@ static const struct intel_device_info intel_elkhartlake_info = {
>  	.graphics_ver = 11,
>  	.display_ver = 11,
>  	.is_elkhartlake = true,
> -	.cmds_info = &gen11_blt_info,
> +	.cmds_info = &gen11_cmds_info,
>  	.codename = "elkhartlake"
>  };
>  
> @@ -374,7 +374,7 @@ static const struct intel_device_info intel_jasperlake_info = {
>  	.graphics_ver = 11,
>  	.display_ver = 11,
>  	.is_jasperlake = true,
> -	.cmds_info = &gen11_blt_info,
> +	.cmds_info = &gen11_cmds_info,
>  	.codename = "jasperlake"
>  };
>  
> @@ -382,7 +382,7 @@ static const struct intel_device_info intel_tigerlake_gt1_info = {
>  	.graphics_ver = 12,
>  	.display_ver = 12,
>  	.is_tigerlake = true,
> -	.cmds_info = &gen12_blt_info,
> +	.cmds_info = &gen12_cmds_info,
>  	.codename = "tigerlake",
>  	.gt = 1,
>  };
> @@ -391,7 +391,7 @@ static const struct intel_device_info intel_tigerlake_gt2_info = {
>  	.graphics_ver = 12,
>  	.display_ver = 12,
>  	.is_tigerlake = true,
> -	.cmds_info = &gen12_blt_info,
> +	.cmds_info = &gen12_cmds_info,
>  	.codename = "tigerlake",
>  	.gt = 2,
>  };
> @@ -400,7 +400,7 @@ static const struct intel_device_info intel_rocketlake_info = {
>  	.graphics_ver = 12,
>  	.display_ver = 12,
>  	.is_rocketlake = true,
> -	.cmds_info = &gen12_blt_info,
> +	.cmds_info = &gen12_cmds_info,
>  	.codename = "rocketlake"
>  };
>  
> @@ -409,7 +409,7 @@ static const struct intel_device_info intel_dg1_info = {
>  	.graphics_rel = 10,
>  	.display_ver = 12,
>  	.is_dg1 = true,
> -	.cmds_info = &gen12_blt_info,
> +	.cmds_info = &gen12_cmds_info,
>  	.codename = "dg1"
>  };
>  
> @@ -420,7 +420,7 @@ static const struct intel_device_info intel_dg2_info = {
>  	.has_4tile = true,
>  	.is_dg2 = true,
>  	.codename = "dg2",
> -	.cmds_info = &gen12_dg2_blt_info,
> +	.cmds_info = &gen12_dg2_cmds_info,
>  	.has_flatccs = true,
>  };
>  
> @@ -428,7 +428,7 @@ static const struct intel_device_info intel_alderlake_s_info = {
>  	.graphics_ver = 12,
>  	.display_ver = 12,
>  	.is_alderlake_s = true,
> -	.cmds_info = &gen12_blt_info,
> +	.cmds_info = &gen12_cmds_info,
>  	.codename = "alderlake_s"
>  };
>  
> @@ -436,7 +436,7 @@ static const struct intel_device_info intel_raptorlake_s_info = {
>  	.graphics_ver = 12,
>  	.display_ver = 12,
>  	.is_raptorlake_s = true,
> -	.cmds_info = &gen12_blt_info,
> +	.cmds_info = &gen12_cmds_info,
>  	.codename = "raptorlake_s"
>  };
>  
> @@ -444,7 +444,7 @@ static const struct intel_device_info intel_alderlake_p_info = {
>  	.graphics_ver = 12,
>  	.display_ver = 13,
>  	.is_alderlake_p = true,
> -	.cmds_info = &gen12_blt_info,
> +	.cmds_info = &gen12_cmds_info,
>  	.codename = "alderlake_p"
>  };
>  
> @@ -452,7 +452,7 @@ static const struct intel_device_info intel_alderlake_n_info = {
>  	.graphics_ver = 12,
>  	.display_ver = 13,
>  	.is_alderlake_n = true,
> -	.cmds_info = &gen12_blt_info,
> +	.cmds_info = &gen12_cmds_info,
>  	.codename = "alderlake_n"
>  };
>  
> @@ -463,7 +463,7 @@ static const struct intel_device_info intel_ats_m_info = {
>  	.is_dg2 = true,
>  	.has_4tile = true,
>  	.codename = "ats_m",
> -	.cmds_info = &gen12_dg2_blt_info,
> +	.cmds_info = &gen12_dg2_cmds_info,
>  	.has_flatccs = true,
>  };
>  
> @@ -474,7 +474,7 @@ static const struct intel_device_info intel_meteorlake_info = {
>  	.has_4tile = true,
>  	.is_meteorlake = true,
>  	.codename = "meteorlake",
> -	.cmds_info = &gen12_mtl_blt_info
> +	.cmds_info = &gen12_mtl_cmds_info
>  };
>  
>  static const struct pci_id_match intel_device_match[] = {
> -- 
> 2.25.1
> 
