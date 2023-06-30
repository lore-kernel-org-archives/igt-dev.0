Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6E110E49C
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 15:40:39 +0000 (UTC)
Date: Fri, 30 Jun 2023 17:40:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230630154034.7uue4cxjulv5qfdj@kamilkon-desk1>
References: <cover.1687862551.git.karolina.stolarek@intel.com>
 <0d0d0cb111368438c6617c3f0e67f085502e3dda.1687862551.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d0d0cb111368438c6617c3f0e67f085502e3dda.1687862551.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/3] lib/intel_cmds_info: Add library
 support for XY_COLOR_BLT
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

Hi Karolina,

On 2023-06-27 at 12:58:18 +0200, Karolina Stolarek wrote:
> From: Vikas Srivastava <vikas.srivastava@intel.com>
> 
> Add API to check support for XY_COLOR_BLT command in existing
> library for gen12 and older platforms.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_blt.c       | 16 ++++++++++++++++
>  lib/intel_blt.h       |  1 +
>  lib/intel_cmds_info.c | 23 ++++++++++++++++++++---
>  lib/intel_cmds_info.h |  1 +
>  4 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 28a740094..4836149e4 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -317,6 +317,22 @@ bool blt_has_xy_src_copy(int fd)
>  	return blt_supports_command(cmds_info, XY_SRC_COPY);
>  }
>  
> +/**
> + * blt_has_xy_color
> + * @fd: drm fd
> + *
> + * Check if XY_COLOR_BLT is supported by @fd device
> + *
> + * Returns:
> + * true if it does, false otherwise.
> + */
> +bool blt_has_xy_color(int fd)
> +{
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
> +
> +	return blt_supports_command(cmds_info, XY_COLOR_BLT);
> +}
> +
>  /**
>   * blt_fast_copy_supports_tiling
>   * @fd: drm fd
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 0cbe881f4..64006273f 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -172,6 +172,7 @@ bool blt_cmd_has_property(const struct intel_cmds_info *cmds_info,
>  bool blt_has_block_copy(int fd);
>  bool blt_has_fast_copy(int fd);
>  bool blt_has_xy_src_copy(int fd);
> +bool blt_has_xy_color(int fd);
>  
>  bool blt_fast_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
>  bool blt_block_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index 151cb5f72..366b37f2c 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -82,24 +82,38 @@ static const struct blt_cmd_info
>  						 BIT(T_TILE64),
>  						 BLT_CMD_EXTENDED);
>  
> +static const struct blt_cmd_info
> +		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT,
> +						 BIT(T_LINEAR) |
> +						 BIT(T_XMAJOR));
> +
> +static const struct blt_cmd_info
> +		gen6_xy_color_blt = BLT_INFO_EXT(XY_COLOR_BLT,
> +						 BIT(T_LINEAR) |
> +						 BIT(T_YMAJOR) |
> +						 BIT(T_XMAJOR),
> +						 BLT_CMD_EXTENDED);
> +
>  const struct intel_cmds_info pre_gen6_cmds_info = {
>  	.blt_cmds = {
>  		[SRC_COPY] = &src_copy,
> -		[XY_SRC_COPY] = &pre_gen6_xy_src_copy
> +		[XY_SRC_COPY] = &pre_gen6_xy_src_copy,
> +		[XY_COLOR_BLT] = &pre_gen6_xy_color_blt,
>  	}
>  };
>  
>  const struct intel_cmds_info gen6_cmds_info =  {
>  	.blt_cmds = {
>  		[SRC_COPY] = &src_copy,
> -		[XY_SRC_COPY] = &gen6_xy_src_copy
> +		[XY_SRC_COPY] = &gen6_xy_src_copy,
> +		[XY_COLOR_BLT] = &gen6_xy_color_blt,
>  	}
> -
>  };
>  
>  const struct intel_cmds_info gen8_cmds_info = {
>  	.blt_cmds = {
>  		[XY_SRC_COPY] = &gen6_xy_src_copy,
> +		[XY_COLOR_BLT] = &gen6_xy_color_blt,
>  	}
>  };
>  
> @@ -107,6 +121,7 @@ const struct intel_cmds_info gen11_cmds_info = {
>  	.blt_cmds = {
>  		[XY_SRC_COPY] = &gen6_xy_src_copy,
>  		[XY_FAST_COPY] = &gen11_xy_fast_copy,
> +		[XY_COLOR_BLT] = &gen6_xy_color_blt,
>  	}
>  };
>  
> @@ -115,6 +130,7 @@ const struct intel_cmds_info gen12_cmds_info = {
>  		[XY_SRC_COPY] = &gen6_xy_src_copy,
>  		[XY_FAST_COPY] = &gen12_xy_fast_copy,
>  		[XY_BLOCK_COPY] = &gen12_xy_block_copy,
> +		[XY_COLOR_BLT] = &gen6_xy_color_blt,
>  	}
>  };
>  
> @@ -123,6 +139,7 @@ const struct intel_cmds_info gen12_dg2_cmds_info = {
>  		[XY_SRC_COPY] = &gen6_xy_src_copy,
>  		[XY_FAST_COPY] = &dg2_xy_fast_copy,
>  		[XY_BLOCK_COPY] = &dg2_xy_block_copy,
> +		[XY_COLOR_BLT] = &gen6_xy_color_blt,
>  	}
>  };
>  
> diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> index 1db8709f8..91d0f15ec 100644
> --- a/lib/intel_cmds_info.h
> +++ b/lib/intel_cmds_info.h
> @@ -23,6 +23,7 @@ enum blt_cmd_type {
>  	XY_SRC_COPY,
>  	XY_FAST_COPY,
>  	XY_BLOCK_COPY,
> +	XY_COLOR_BLT,
>  	__BLT_MAX_CMD
>  };
>  
> -- 
> 2.25.1
> 
