Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19E210EA04
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 11:08:41 +0000 (UTC)
Date: Fri, 20 Jan 2023 12:08:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230120110836.6ibqkik3ni7cr2l2@zkempczy-mobl2>
References: <cover.1674208534.git.karolina.stolarek@intel.com>
 <de7c559274989b8971c5a447d6c42e1ee87323b6.1674208534.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de7c559274989b8971c5a447d6c42e1ee87323b6.1674208534.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v7 4/9] i915/lib: Add new library for
 blitter and tiling formats
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

On Fri, Jan 20, 2023 at 11:14:04AM +0100, Karolina Stolarek wrote:
> Add structs to describe what blitter commands and tiling formats
> are supported per platform. Move blt_tiling enum to the newly
> created library and update its definition.

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  lib/i915/i915_blt.h          | 10 +---
>  lib/i915/intel_tiling_info.c | 88 ++++++++++++++++++++++++++++++++++++
>  lib/i915/intel_tiling_info.h | 47 +++++++++++++++++++
>  lib/meson.build              |  5 +-
>  4 files changed, 140 insertions(+), 10 deletions(-)
>  create mode 100644 lib/i915/intel_tiling_info.c
>  create mode 100644 lib/i915/intel_tiling_info.h
> 
> diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
> index bc375aba..9837dcac 100644
> --- a/lib/i915/i915_blt.h
> +++ b/lib/i915/i915_blt.h
> @@ -47,6 +47,7 @@
>  #include <malloc.h>
>  #include "drm.h"
>  #include "igt.h"
> +#include "intel_tiling_info.h"
>  
>  #define CCS_RATIO 256
>  
> @@ -59,15 +60,6 @@ enum blt_color_depth {
>  	CD_128bit,
>  };
>  
> -enum blt_tiling_type {
> -	T_LINEAR,
> -	T_XMAJOR,
> -	T_YMAJOR,
> -	T_TILE4,
> -	T_TILE64,
> -	T_YFMAJOR,
> -};
> -
>  enum blt_compression {
>  	COMPRESSION_DISABLED,
>  	COMPRESSION_ENABLED,
> diff --git a/lib/i915/intel_tiling_info.c b/lib/i915/intel_tiling_info.c
> new file mode 100644
> index 00000000..ab1d21d9
> --- /dev/null
> +++ b/lib/i915/intel_tiling_info.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <stdint.h>
> +#include "intel_chipset.h"
> +#include "i915/intel_tiling_info.h"
> +
> +#define BLT_INFO(_cmd, _tiling)  { \
> +		.blt_cmd_type = _cmd, \
> +		.supported_tiling = _tiling \
> +	}
> +
> +static const struct blt_tiling_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
> +static const struct blt_tiling_info
> +		pre_gen8_xy_src_copy = BLT_INFO(XY_SRC_COPY,
> +						BIT(T_LINEAR) |
> +						BIT(T_XMAJOR));
> +static const struct blt_tiling_info
> +		gen8_xy_src_copy = BLT_INFO(XY_SRC_COPY,
> +					    BIT(T_LINEAR) |
> +					    BIT(T_XMAJOR) |
> +					    BIT(T_YMAJOR));
> +static const struct blt_tiling_info
> +		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> +					      BIT(T_LINEAR)  |
> +					      BIT(T_YMAJOR)  |
> +					      BIT(T_YFMAJOR) |
> +					      BIT(T_TILE64));
> +static const struct blt_tiling_info
> +		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> +					      BIT(T_LINEAR) |
> +					      BIT(T_YMAJOR) |
> +					      BIT(T_TILE4)  |
> +					      BIT(T_TILE64));
> +static const struct blt_tiling_info
> +		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> +					    BIT(T_LINEAR) |
> +					    BIT(T_XMAJOR) |
> +					    BIT(T_TILE4)  |
> +					    BIT(T_TILE64));
> +static const struct blt_tiling_info
> +		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
> +					       BIT(T_LINEAR) |
> +					       BIT(T_YMAJOR));
> +static const struct blt_tiling_info
> +		dg2_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
> +					     BIT(T_LINEAR) |
> +					     BIT(T_XMAJOR) |
> +					     BIT(T_TILE4)  |
> +					     BIT(T_TILE64));
> +
> +const struct blt_cmd_info pre_gen8_blt_info = {
> +	.supported_cmds = {
> +		[SRC_COPY] = &src_copy,
> +		[XY_SRC_COPY] = &pre_gen8_xy_src_copy
> +	}
> +};
> +
> +const struct blt_cmd_info gen8_blt_info = {
> +	.supported_cmds = {
> +		[XY_SRC_COPY] = &gen8_xy_src_copy,
> +	}
> +};
> +
> +const struct blt_cmd_info gen11_blt_info = {
> +	.supported_cmds = {
> +		[XY_SRC_COPY] = &gen8_xy_src_copy,
> +		[XY_FAST_COPY] = &gen11_xy_fast_copy,
> +	}
> +};
> +
> +const struct blt_cmd_info gen12_blt_info = {
> +	.supported_cmds = {
> +		[XY_SRC_COPY] = &gen8_xy_src_copy,
> +		[XY_FAST_COPY] = &gen12_xy_fast_copy,
> +		[XY_BLOCK_COPY] = &gen12_xy_block_copy,
> +	}
> +};
> +
> +const struct blt_cmd_info gen12_dg2_blt_info = {
> +	.supported_cmds = {
> +		[XY_SRC_COPY] = &gen8_xy_src_copy,
> +		[XY_FAST_COPY] = &dg2_xy_fast_copy,
> +		[XY_BLOCK_COPY] = &dg2_xy_block_copy,
> +	}
> +};
> diff --git a/lib/i915/intel_tiling_info.h b/lib/i915/intel_tiling_info.h
> new file mode 100644
> index 00000000..21ed8761
> --- /dev/null
> +++ b/lib/i915/intel_tiling_info.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef __INTEL_TILING_INFO_H
> +#define __INTEL_TILING_INFO_H
> +
> +#include <stdint.h>
> +
> +enum blt_tiling_type {
> +	T_LINEAR,
> +	T_XMAJOR,
> +	T_YMAJOR,
> +	T_TILE4,
> +	T_TILE64,
> +	T_YFMAJOR,
> +	__BLT_MAX_TILING
> +};
> +
> +enum blt_cmd_type {
> +	SRC_COPY,
> +	XY_SRC_COPY,
> +	XY_FAST_COPY,
> +	XY_BLOCK_COPY,
> +	__BLT_MAX_CMD
> +};
> +
> +struct blt_tiling_info {
> +	enum blt_cmd_type blt_cmd_type;
> +	uint32_t supported_tiling;
> +};
> +
> +struct blt_cmd_info {
> +	struct blt_tiling_info const *supported_cmds[__BLT_MAX_CMD];
> +};
> +
> +extern const struct blt_cmd_info pre_gen8_blt_info;
> +extern const struct blt_cmd_info gen8_blt_info;
> +extern const struct blt_cmd_info gen11_blt_info;
> +extern const struct blt_cmd_info gen12_blt_info;
> +extern const struct blt_cmd_info gen12_dg2_blt_info;
> +
> +#define for_each_tiling(__tiling) \
> +	for (__tiling = T_LINEAR; __tiling < __BLT_MAX_TILING; __tiling++)
> +
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index cc784686..22069440 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -14,6 +14,7 @@ lib_sources = [
>  	'i915/intel_decode.c',
>  	'i915/intel_memory_region.c',
>  	'i915/intel_mocs.c',
> +	'i915/intel_tiling_info.c',
>  	'i915/i915_blt.c',
>  	'i915/i915_crc.c',
>  	'igt_collection.c',
> @@ -216,7 +217,8 @@ igt_deps = [ lib_igt ] + lib_deps
>  
>  lin_igt_chipset_build = static_library('igt_chipset',
>                                         ['intel_chipset.c',
> -                                        'intel_device_info.c'],
> +					'intel_device_info.c',
> +					'i915/intel_tiling_info.c'],
>                                         include_directories : inc)
>  
>  lib_igt_chipset = declare_dependency(link_with : lin_igt_chipset_build,
> @@ -239,6 +241,7 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
>  	'igt_list.c',
>  	'igt_tools_stub.c',
>  	'intel_device_info.c',
> +	'i915/intel_tiling_info.c',
>  	],
>  	dependencies : scan_dep,
>  	include_directories : inc)
> -- 
> 2.25.1
> 
