Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F167D10E0BE
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 07:57:52 +0000 (UTC)
Date: Thu, 9 Feb 2023 08:57:49 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230209075749.a3wavg3ut376f23i@zkempczy-mobl2>
References: <cover.1675854161.git.karolina.stolarek@intel.com>
 <8cd64d5a3dc63ff2475d64b4a893b62184519921.1675854161.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cd64d5a3dc63ff2475d64b4a893b62184519921.1675854161.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/6] lib/intel_cmds_info: Add flags
 field to describe command properties
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

On Wed, Feb 08, 2023 at 02:47:37PM +0100, Karolina Stolarek wrote:
> Blitter commands may have different properties depending on the
> platform. Add a new field to blt_cmd_info struct to describe
> their properties. Update block-copy definitions for DG2 and MTL
> to use that field.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  lib/i915/intel_cmds_info.c | 28 ++++++++++++++++++++++------
>  lib/i915/intel_cmds_info.h |  4 ++++
>  2 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/i915/intel_cmds_info.c b/lib/i915/intel_cmds_info.c
> index d99b3131..f79a8e86 100644
> --- a/lib/i915/intel_cmds_info.c
> +++ b/lib/i915/intel_cmds_info.c
> @@ -12,6 +12,12 @@
>  		.supported_tiling = _tiling \
>  	}
>  
> +#define BLT_INFO_EXT(_cmd, _tiling, _flags)  { \
> +		.blt_cmd_type = _cmd, \
> +		.supported_tiling = _tiling, \
> +		.flags = _flags, \
> +	}
> +
>  static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
>  static const struct blt_cmd_info
>  		pre_gen8_xy_src_copy = BLT_INFO(XY_SRC_COPY,
> @@ -45,11 +51,21 @@ static const struct blt_cmd_info
>  					       BIT(T_LINEAR) |
>  					       BIT(T_YMAJOR));
>  static const struct blt_cmd_info
> -		dg2_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
> -					     BIT(T_LINEAR) |
> -					     BIT(T_XMAJOR) |
> -					     BIT(T_TILE4)  |
> -					     BIT(T_TILE64));
> +		dg2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> +						 BIT(T_LINEAR) |
> +						 BIT(T_XMAJOR) |
> +						 BIT(T_TILE4)  |
> +						 BIT(T_TILE64),
> +						 BLT_CMD_EXTENDED |
> +						 BLT_CMD_SUPPORTS_COMPRESSION);
> +
> +static const struct blt_cmd_info
> +		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> +						 BIT(T_LINEAR) |
> +						 BIT(T_XMAJOR) |
> +						 BIT(T_TILE4)  |
> +						 BIT(T_TILE64),
> +						 BLT_CMD_EXTENDED);
>  
>  const struct blt_cmds_desc pre_gen8_blt_info = {
>  	.supported_cmds = {
> @@ -90,6 +106,6 @@ const struct blt_cmds_desc gen12_dg2_blt_info = {
>  const struct blt_cmds_desc gen12_mtl_blt_info = {
>  	.supported_cmds = {
>  		[XY_FAST_COPY] = &dg2_xy_fast_copy,
> -		[XY_BLOCK_COPY] = &dg2_xy_block_copy
> +		[XY_BLOCK_COPY] = &mtl_xy_block_copy

Add ',' at the end of the line.

>  	}
>  };
> diff --git a/lib/i915/intel_cmds_info.h b/lib/i915/intel_cmds_info.h
> index e86b6dd4..37cfca84 100644
> --- a/lib/i915/intel_cmds_info.h
> +++ b/lib/i915/intel_cmds_info.h
> @@ -29,6 +29,10 @@ enum blt_cmd_type {
>  struct blt_cmd_info {
>  	enum blt_cmd_type blt_cmd_type;
>  	uint32_t supported_tiling;
> +

This empty line is unnecessary.

--
Zbigniew

> +	uint32_t flags;
> +#define BLT_CMD_EXTENDED               (1 << 0)
> +#define BLT_CMD_SUPPORTS_COMPRESSION   (1 << 1)
>  };
>  
>  struct blt_cmds_desc {
> -- 
> 2.25.1
> 
