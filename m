Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E80898BF
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 17:49:35 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id h9so553663ejs.4
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 10:49:35 -0700 (PDT)
References: <20210827145756.3342904-1-imre.deak@intel.com>
 <20210827145756.3342904-6-imre.deak@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <d67fea50-134b-b55a-8c78-5b035b641445@gmail.com>
Date: Tue, 31 Aug 2021 20:49:28 +0300
MIME-Version: 1.0
In-Reply-To: <20210827145756.3342904-6-imre.deak@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 5/6] lib/igt_fb: Add support for
 remapping CCS FBs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Look ok to me

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 27.8.2021 17.57, Imre Deak wrote:
> Having a kernel support for this, CCS framebuffer strides don't need to
> be power-of-two aligned, the kernel will auto-pad the stride.
> 
> Only the main surface tiles can be remapped and the AUX surface must be
> generated to align with the POT padded main surface stride. Add the
> required AUX pagetable programming for this.
> 
> Since the AUX pagetable has a granularity of 64 kbytes on the main
> surface, mapped by one AUX PTE, the main surface stride must be either 8
> tiles, or the stride must be aligned to 16 tiles.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   lib/igt_fb.c            | 24 ++++++++-------
>   lib/intel_aux_pgtable.c | 66 ++++++++++++++++++++++++++++++++++++-----
>   2 files changed, 72 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 2e53d9225..72291f4f7 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -780,23 +780,27 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
>   		return ALIGN(min_stride, align);
>   	} else {
>   		unsigned int tile_width, tile_height;
> -		uint32_t stride;
> +		int tile_align = 1;
>   
>   		igt_get_fb_tile_size(fb->fd, fb->modifier, fb->plane_bpp[plane],
>   				     &tile_width, &tile_height);
>   
>   		if (is_gen12_ccs_modifier(fb->modifier)) {
> -			stride = ALIGN(min_stride, tile_width * 4);
> -
> -			/* TODO: add support to kernel to POT align CCS format strides */
> -			if (is_i915_device(fb->fd) &&
> -			    IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)))
> -				stride = roundup_power_of_two(max(stride, tile_width * 8));
> -		} else {
> -			stride = ALIGN(min_stride, tile_width);
> +			if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)))
> +				/*
> +				 * The main surface stride must be aligned to the CCS AUX
> +				 * page table block size (covered by one AUX PTE). This
> +				 * block size is 64kb -> 16 tiles.
> +				 * We can do away padding an 8 tile stride to 16, since in
> +				 * this case one AUX PTE entry will cover 2 main surface
> +				 * tile rows.
> +				 */
> +				tile_align = (min_stride <= 8 * tile_width) ? 8 : 16;
> +			else
> +				tile_align = 4;
>   		}
>   
> -		return stride;
> +		return ALIGN(min_stride, tile_width * tile_align);
>   	}
>   }
>   
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index d89b0575a..fcc337b8d 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -7,6 +7,8 @@
>   #include "intel_bufops.h"
>   #include "ioctl_wrappers.h"
>   
> +#include "lib/intel_chipset.h"
> +
>   #include "i915/gem_mman.h"
>   
>   #define BITS_PER_LONG_LONG	(sizeof(long long) * 8)
> @@ -356,22 +358,70 @@ pgt_populate_entries_for_buf(struct pgtable *pgt,
>   	uint64_t aux_addr = buf->addr.offset + buf->ccs[surface_idx].offset;
>   	uint64_t l1_flags = pgt_get_l1_flags(buf, surface_idx);
>   	uint64_t lx_flags = pgt_get_lx_flags();
> +	int surface_tile_align;
> +	int surface_src_row_tiles = buf->surface[surface_idx].stride / 128;
> +	/*
> +	 * The span of tiles in the FB object mapped by one AUX PTE
> +	 * entry, which can be one or more tile rows.
> +	 */
> +	int surface_src_span_tiles = ALIGN(surface_src_row_tiles, 16);
> +	int surface_src_span_size = surface_src_span_tiles * 4096;
> +	/*
> +	 * The number of tiles in a tile row on the surface auto-padded by
> +	 * the kernel if necessary (to a power-of-two size on ADL-P).
> +	 */
> +	int surface_dst_row_tiles;
> +	/*
> +	 * The span of tiles on the auto-padded surface, including the
> +	 * tiles in the FB object accounted by surface_src_span_tiles and
> +	 * any padding tiles.
> +	 */
> +	int surface_dst_span_tiles;
> +	/*
> +	 * The size of CCS data mapping a surface_dst_span_tiles sized area
> +	 * on the main surface.
> +	 */
> +	int aux_dst_span_size;
> +	int surface_span_offset = 0;
> +	int aux_span_offset = 0;
>   
> -	igt_assert(!(buf->surface[surface_idx].stride % 512));
> -	igt_assert_eq(buf->ccs[surface_idx].stride,
> -		      buf->surface[surface_idx].stride / 512 * 64);
> +	if (IS_ALDERLAKE_P(buf->ibb->devid)) {
> +		surface_tile_align = surface_src_row_tiles <= 8 ? 8 : 16;
> +		surface_dst_row_tiles = roundup_power_of_two(surface_src_row_tiles);
> +		surface_dst_span_tiles = roundup_power_of_two(surface_src_span_tiles);
> +	} else {
> +		surface_tile_align = 4;
> +		surface_dst_row_tiles = surface_src_row_tiles;
> +		surface_dst_span_tiles = surface_src_span_tiles;
> +	}
>   
> -	for (; surface_addr < surface_end;
> -	     surface_addr += MAIN_SURFACE_BLOCK_SIZE,
> -	     aux_addr += AUX_CCS_BLOCK_SIZE) {
> +	aux_dst_span_size = surface_dst_span_tiles / 16 * AUX_CCS_BLOCK_SIZE;
> +
> +	igt_assert_eq(buf->surface[surface_idx].stride % (128 * surface_tile_align), 0);
> +	igt_assert_eq(buf->ccs[surface_idx].stride, surface_dst_row_tiles / 4 * 64);
> +
> +	while (surface_addr + surface_span_offset < surface_end) {
>   		uint64_t table = top_table;
>   		int level;
>   
>   		for (level = pgt->levels - 1; level >= 1; level--)
>   			table = pgt_get_child_table(pgt, table, level,
> -						    surface_addr, lx_flags);
> +						    surface_addr + surface_span_offset, lx_flags);
>   
> -		pgt_set_l1_entry(pgt, table, surface_addr, aux_addr, l1_flags);
> +		pgt_set_l1_entry(pgt, table,
> +				 surface_addr + surface_span_offset,
> +				 aux_addr + aux_span_offset, l1_flags);
> +
> +		surface_span_offset += MAIN_SURFACE_BLOCK_SIZE;
> +		aux_span_offset += AUX_CCS_BLOCK_SIZE;
> +
> +		if (surface_span_offset >= surface_src_span_size) {
> +			surface_addr += surface_src_span_size;
> +			surface_span_offset = 0;
> +
> +			aux_addr += aux_dst_span_size;
> +			aux_span_offset = 0;
> +		}
>   	}
>   }
>   
> 
