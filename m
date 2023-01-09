Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D694B10E4A9
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 15:27:21 +0000 (UTC)
Date: Mon, 9 Jan 2023 16:27:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230109152717.hh7wlrimuvci6eye@zkempczy-mobl2>
References: <cover.1671793169.git.karolina.stolarek@intel.com>
 <aa208f148e62fd724a03ed62e4f50fa424252e3a.1671793169.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa208f148e62fd724a03ed62e4f50fa424252e3a.1671793169.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/6] lib/i915_blt: Check for Tile-YF
 in fast_copy
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

On Fri, Dec 23, 2022 at 12:13:48PM +0100, Karolina Stolarek wrote:
> In older gens Tile4 is not available, we have Tile-YF instead. Check for
> both tilings when setting up the fast_copy command.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  lib/i915/i915_blt.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> index 00cf7470..23ee2218 100644
> --- a/lib/i915/i915_blt.c
> +++ b/lib/i915/i915_blt.c
> @@ -327,6 +327,11 @@ static enum blt_aux_mode __aux_mode(const struct blt_copy_object *obj)
>  	return AM_AUX_NONE;
>  }
>  
> +static bool __new_tile_y_type(enum blt_tiling_type tiling)
> +{
> +	return tiling == T_TILE4 || tiling == T_YFMAJOR;
> +}
> +
>  static void fill_data(struct gen12_block_copy_data *data,
>  		      const struct blt_copy_data *blt,
>  		      uint64_t src_offset, uint64_t dst_offset,
> @@ -1013,8 +1018,8 @@ uint64_t emit_blt_fast_copy(int i915,
>  	data.dw01.color_depth = __fast_color_depth(blt->color_depth);
>  	data.dw01.dst_memory = __memory_type(blt->dst.region);
>  	data.dw01.src_memory = __memory_type(blt->src.region);
> -	data.dw01.dst_type_y = blt->dst.tiling == T_TILE4 ? 1 : 0;
> -	data.dw01.src_type_y = blt->src.tiling == T_TILE4 ? 1 : 0;
> +	data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
> +	data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;

Looks ok for me,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  
>  	data.dw02.dst_x1 = blt->dst.x1;
>  	data.dw02.dst_y1 = blt->dst.y1;
> -- 
> 2.25.1
> 
