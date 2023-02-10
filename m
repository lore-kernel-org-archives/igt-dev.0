Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB18510E13C
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Feb 2023 09:19:14 +0000 (UTC)
Date: Fri, 10 Feb 2023 10:19:04 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230210091904.w4fcpcv5kjaloc4b@zkempczy-mobl2>
References: <cover.1675950055.git.karolina.stolarek@intel.com>
 <cdb3b7ef5c27efbf753a357ad934c4d69ad947a4.1675950055.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdb3b7ef5c27efbf753a357ad934c4d69ad947a4.1675950055.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/9] lib/intel_tiling_info: Update
 intel_cmds_info field name
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

On Thu, Feb 09, 2023 at 03:12:06PM +0100, Karolina Stolarek wrote:
> Change supported_cmds field to blt_cmds to show it only describes
> blitter-specific copy commands.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  lib/i915/i915_blt.c          |  4 ++--
>  lib/i915/intel_tiling_info.c | 12 ++++++------
>  lib/i915/intel_tiling_info.h |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> index 92860e8d..dace57b3 100644
> --- a/lib/i915/i915_blt.c
> +++ b/lib/i915/i915_blt.c
> @@ -222,7 +222,7 @@ bool blt_supports_command(const struct intel_cmds_info *cmds_info,
>  {
>  	igt_require_f(cmds_info, "No config found for the platform\n");
>  
> -	return cmds_info->supported_cmds[cmd];
> +	return cmds_info->blt_cmds[cmd];

Squash with 1/9 and 2/9. Keep rb.

--
Zbigniew

>  }
>  
>  /**
> @@ -245,7 +245,7 @@ bool blt_cmd_supports_tiling(const struct intel_cmds_info *cmds_info,
>  	if (!cmds_info)
>  		return false;
>  
> -	tile_config = cmds_info->supported_cmds[cmd];
> +	tile_config = cmds_info->blt_cmds[cmd];
>  
>  	/* no config means no support for that tiling */
>  	if (!tile_config)
> diff --git a/lib/i915/intel_tiling_info.c b/lib/i915/intel_tiling_info.c
> index 3df23b60..78e1ce16 100644
> --- a/lib/i915/intel_tiling_info.c
> +++ b/lib/i915/intel_tiling_info.c
> @@ -52,27 +52,27 @@ static const struct blt_tiling_info
>  					     BIT(T_TILE64));
>  
>  const struct intel_cmds_info pre_gen8_cmds_info = {
> -	.supported_cmds = {
> +	.blt_cmds = {
>  		[SRC_COPY] = &src_copy,
>  		[XY_SRC_COPY] = &pre_gen8_xy_src_copy
>  	}
>  };
>  
>  const struct intel_cmds_info gen8_cmds_info = {
> -	.supported_cmds = {
> +	.blt_cmds = {
>  		[XY_SRC_COPY] = &gen8_xy_src_copy,
>  	}
>  };
>  
>  const struct intel_cmds_info gen11_cmds_info = {
> -	.supported_cmds = {
> +	.blt_cmds = {
>  		[XY_SRC_COPY] = &gen8_xy_src_copy,
>  		[XY_FAST_COPY] = &gen11_xy_fast_copy,
>  	}
>  };
>  
>  const struct intel_cmds_info gen12_cmds_info = {
> -	.supported_cmds = {
> +	.blt_cmds = {
>  		[XY_SRC_COPY] = &gen8_xy_src_copy,
>  		[XY_FAST_COPY] = &gen12_xy_fast_copy,
>  		[XY_BLOCK_COPY] = &gen12_xy_block_copy,
> @@ -80,7 +80,7 @@ const struct intel_cmds_info gen12_cmds_info = {
>  };
>  
>  const struct intel_cmds_info gen12_dg2_cmds_info = {
> -	.supported_cmds = {
> +	.blt_cmds = {
>  		[XY_SRC_COPY] = &gen8_xy_src_copy,
>  		[XY_FAST_COPY] = &dg2_xy_fast_copy,
>  		[XY_BLOCK_COPY] = &dg2_xy_block_copy,
> @@ -88,7 +88,7 @@ const struct intel_cmds_info gen12_dg2_cmds_info = {
>  };
>  
>  const struct intel_cmds_info gen12_mtl_cmds_info = {
> -	.supported_cmds = {
> +	.blt_cmds = {
>  		[XY_FAST_COPY] = &dg2_xy_fast_copy,
>  		[XY_BLOCK_COPY] = &dg2_xy_block_copy
>  	}
> diff --git a/lib/i915/intel_tiling_info.h b/lib/i915/intel_tiling_info.h
> index 6854c64b..fa8a9b9d 100644
> --- a/lib/i915/intel_tiling_info.h
> +++ b/lib/i915/intel_tiling_info.h
> @@ -32,7 +32,7 @@ struct blt_tiling_info {
>  };
>  
>  struct intel_cmds_info {
> -	struct blt_tiling_info const *supported_cmds[__BLT_MAX_CMD];
> +	struct blt_tiling_info const *blt_cmds[__BLT_MAX_CMD];
>  };
>  
>  extern const struct intel_cmds_info pre_gen8_cmds_info;
> -- 
> 2.25.1
> 
