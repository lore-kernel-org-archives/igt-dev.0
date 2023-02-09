Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0431610E92C
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 07:52:53 +0000 (UTC)
Date: Thu, 9 Feb 2023 08:52:50 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230209075250.wbbe5hq6sfww2eev@zkempczy-mobl2>
References: <cover.1675854161.git.karolina.stolarek@intel.com>
 <05202b362e00bc6bfce13d94779be11e2489dfa7.1675854161.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05202b362e00bc6bfce13d94779be11e2489dfa7.1675854161.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/6] lib/intel_tiling_info: Rename
 blt_tiling_info to blt_cmd_info
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

On Wed, Feb 08, 2023 at 02:47:35PM +0100, Karolina Stolarek wrote:
> This struct will store other information on the copy command,
> not just what tiling formats it supports. Change the struct name
> to be more generic.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  lib/i915/i915_blt.c          |  8 ++++----
>  lib/i915/intel_tiling_info.c | 16 ++++++++--------
>  lib/i915/intel_tiling_info.h |  4 ++--
>  3 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> index 32d22720..554905d2 100644
> --- a/lib/i915/i915_blt.c
> +++ b/lib/i915/i915_blt.c
> @@ -240,18 +240,18 @@ bool blt_cmd_supports_tiling(const struct blt_cmds_desc *blt_info,
>  			     enum blt_cmd_type cmd,
>  			     enum blt_tiling_type tiling)
>  {
> -	struct blt_tiling_info const *tile_config;
> +	struct blt_cmd_info const *cmd_info;
>  
>  	if (!blt_info)
>  		return false;
>  
> -	tile_config = blt_info->supported_cmds[cmd];
> +	cmd_info = blt_info->supported_cmds[cmd];
>  
>  	/* no config means no support for that tiling */
> -	if (!tile_config)
> +	if (!cmd_info)
>  		return false;
>  
> -	return tile_config->supported_tiling & BIT(tiling);
> +	return cmd_info->supported_tiling & BIT(tiling);
>  }
>  
>  /**
> diff --git a/lib/i915/intel_tiling_info.c b/lib/i915/intel_tiling_info.c
> index 671b9934..5f785777 100644
> --- a/lib/i915/intel_tiling_info.c
> +++ b/lib/i915/intel_tiling_info.c
> @@ -12,39 +12,39 @@
>  		.supported_tiling = _tiling \
>  	}
>  
> -static const struct blt_tiling_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
> -static const struct blt_tiling_info
> +static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
> +static const struct blt_cmd_info
>  		pre_gen8_xy_src_copy = BLT_INFO(XY_SRC_COPY,
>  						BIT(T_LINEAR) |
>  						BIT(T_XMAJOR));
> -static const struct blt_tiling_info
> +static const struct blt_cmd_info
>  		gen8_xy_src_copy = BLT_INFO(XY_SRC_COPY,
>  					    BIT(T_LINEAR) |
>  					    BIT(T_XMAJOR) |
>  					    BIT(T_YMAJOR));
> -static const struct blt_tiling_info
> +static const struct blt_cmd_info
>  		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
>  					      BIT(T_LINEAR)  |
>  					      BIT(T_YMAJOR)  |
>  					      BIT(T_YFMAJOR) |
>  					      BIT(T_TILE64));
> -static const struct blt_tiling_info
> +static const struct blt_cmd_info
>  		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
>  					      BIT(T_LINEAR) |
>  					      BIT(T_YMAJOR) |
>  					      BIT(T_TILE4)  |
>  					      BIT(T_TILE64));
> -static const struct blt_tiling_info
> +static const struct blt_cmd_info
>  		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
>  					    BIT(T_LINEAR) |
>  					    BIT(T_XMAJOR) |
>  					    BIT(T_TILE4)  |
>  					    BIT(T_TILE64));
> -static const struct blt_tiling_info
> +static const struct blt_cmd_info
>  		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
>  					       BIT(T_LINEAR) |
>  					       BIT(T_YMAJOR));
> -static const struct blt_tiling_info
> +static const struct blt_cmd_info
>  		dg2_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
>  					     BIT(T_LINEAR) |
>  					     BIT(T_XMAJOR) |
> diff --git a/lib/i915/intel_tiling_info.h b/lib/i915/intel_tiling_info.h
> index 97fb1ce8..e86b6dd4 100644
> --- a/lib/i915/intel_tiling_info.h
> +++ b/lib/i915/intel_tiling_info.h
> @@ -26,13 +26,13 @@ enum blt_cmd_type {
>  	__BLT_MAX_CMD
>  };
>  
> -struct blt_tiling_info {
> +struct blt_cmd_info {

blt_tiling_info -> blt_cmd_info is ok for me.

>  	enum blt_cmd_type blt_cmd_type;
>  	uint32_t supported_tiling;
>  };
>  
>  struct blt_cmds_desc {

This should imo be renamed to intel_cmds_desc.

> -	struct blt_tiling_info const *supported_cmds[__BLT_MAX_CMD];
> +	struct blt_cmd_info const *supported_cmds[__BLT_MAX_CMD];

Then we can collect more commands (not only blitter here), but
supported_cmds should be renamed to blt_supported_cmds or simply
blt_cmds.

--
Zbigniew

>  };
>  
>  extern const struct blt_cmds_desc pre_gen8_blt_info;
> -- 
> 2.25.1
> 
