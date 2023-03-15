Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B7010E96D
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 08:32:05 +0000 (UTC)
Date: Wed, 15 Mar 2023 09:32:00 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230315083200.ytzkugb2tmvr7x5s@zkempczy-mobl2>
References: <cover.1678804829.git.karolina.stolarek@intel.com>
 <4aa556441ffe2c43f0a272093ed44e34efca66de.1678804829.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4aa556441ffe2c43f0a272093ed44e34efca66de.1678804829.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/8] lib/i915_blt: Add helpers to
 check XY_SRC_COPY support
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

On Tue, Mar 14, 2023 at 03:44:33PM +0100, Karolina Stolarek wrote:
> Add predicates that check if the command with a specific
> tiling format is supported on the current platform.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/i915/i915_blt.c | 33 +++++++++++++++++++++++++++++++++
>  lib/i915/i915_blt.h |  2 ++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> index 63eba4ac..13105820 100644
> --- a/lib/i915/i915_blt.c
> +++ b/lib/i915/i915_blt.c
> @@ -295,6 +295,22 @@ bool blt_has_fast_copy(int i915)
>  	return blt_supports_command(cmds_info, XY_FAST_COPY);
>  }
>  
> +/**
> + * blt_has_xy_src_copy
> + * @i915: drm fd
> + *
> + * Check if XY src copy is supported by @i915 device
> + *
> + * Returns:
> + * true if it does, false otherwise.
> + */
> +bool blt_has_xy_src_copy(int i915)
> +{
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
> +
> +	return blt_supports_command(cmds_info, XY_SRC_COPY);
> +}
> +
>  /**
>   * blt_fast_copy_supports_tiling
>   * @i915: drm fd
> @@ -329,6 +345,23 @@ bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
>  	return blt_cmd_supports_tiling(cmds_info, XY_BLOCK_COPY, tiling);
>  }
>  
> +/**
> + * blt_xy_src_copy_supports_tiling
> + * @i915: drm fd
> + * @tiling: tiling format
> + *
> + * Check if XY src copy provided by @i915 device supports @tiling format
> + *
> + * Returns:
> + * true if it does, false otherwise.
> + */
> +bool blt_xy_src_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
> +{
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
> +
> +	return blt_cmd_supports_tiling(cmds_info, XY_SRC_COPY, tiling);
> +}
> +
>  /**
>   * blt_block_copy_supports_compression
>   * @i915: drm fd
> diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
> index 63951db7..a5f0edd1 100644
> --- a/lib/i915/i915_blt.h
> +++ b/lib/i915/i915_blt.h
> @@ -168,9 +168,11 @@ bool blt_cmd_has_property(const struct intel_cmds_info *cmds_info,
>  
>  bool blt_has_block_copy(int i915);
>  bool blt_has_fast_copy(int i915);
> +bool blt_has_xy_src_copy(int i915);
>  
>  bool blt_fast_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
>  bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
> +bool blt_xy_src_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
>  bool blt_block_copy_supports_compression(int i915);
>  bool blt_uses_extended_block_copy(int i915);
>  
> -- 
> 2.25.1
>

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 
