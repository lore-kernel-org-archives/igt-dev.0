Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACB310E104
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 05:14:20 +0000 (UTC)
Message-ID: <bae393e4-c52d-49aa-1c02-efb342ee4cc6@intel.com>
Date: Thu, 29 Jun 2023 10:44:03 +0530
Content-Language: en-US
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230628175830.12504-1-juhapekka.heikkila@gmail.com>
 <20230628175830.12504-3-juhapekka.heikkila@gmail.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230628175830.12504-3-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/igt_fb: include lib/intel_blt
 functions to blitter path
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


On Wed-28-06-2023 11:28 pm, Juha-Pekka Heikkila wrote:
> Use intel_blt functions on blitter path and on i915 devices with
> flat ccs use blitter instead of render copy.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   lib/igt_fb.c | 206 +++++++++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 185 insertions(+), 21 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 402fadf41..597f926d9 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -35,6 +35,8 @@
>   #include "drmtest.h"
>   #include "i915/gem_create.h"
>   #include "i915/gem_mman.h"
> +#include "intel_blt.h"
> +#include "intel_mocs.h"
>   #include "igt_aux.h"
>   #include "igt_color_encoding.h"
>   #include "igt_fb.h"
> @@ -2453,21 +2455,37 @@ struct fb_blit_upload {
>   	struct intel_bb *ibb;
>   };
>   
> -static bool fast_blit_ok(const struct igt_fb *fb)
> +static enum blt_tiling_type fb_tile_to_blt_tile(uint64_t tile)
>   {
> -	int dev_id = intel_get_drm_devid(fb->fd);
> -	int ver = intel_display_ver(dev_id);
> -
> -	if (ver < 9)
> -		return false;
> -
> -	if (ver < 12)
> -		return true;
> +	switch (igt_fb_mod_to_tiling(tile)) {
> +	case I915_TILING_NONE:
> +		return T_LINEAR;
> +	case I915_TILING_X:
> +		return T_XMAJOR;
> +	case I915_TILING_Y:
> +		return T_YMAJOR;
> +	case I915_TILING_4:
> +		return T_TILE4;
> +	case I915_TILING_Yf:
> +		return T_YFMAJOR;
> +	default:
> +		igt_assert_f(0, "Unknown tiling!\n");
> +	}
> +}
>   
> -	if (ver >= 13 && !IS_ALDERLAKE_P(dev_id))
> -		return true;
> +static bool fast_blit_ok(const struct igt_fb *fb)
> +{
> +	return blt_has_fast_copy(fb->fd) &&
> +		!is_ccs_modifier(fb->modifier) &&
> +		blt_fast_copy_supports_tiling(fb->fd,
> +					       fb_tile_to_blt_tile(fb->modifier));
> +}
>   
> -	return fb->modifier != I915_FORMAT_MOD_X_TILED;
> +static bool block_copy_ok(const struct igt_fb *fb)
> +{
> +	return blt_has_block_copy(fb->fd) &&
> +		blt_block_copy_supports_tiling(fb->fd,
> +					       fb_tile_to_blt_tile(fb->modifier));
>   }
>   
>   static bool blitter_ok(const struct igt_fb *fb)
> @@ -2475,7 +2493,9 @@ static bool blitter_ok(const struct igt_fb *fb)
>   	if (!is_i915_device(fb->fd))
>   		return false;
>   
> -	if (is_ccs_modifier(fb->modifier))
> +	if ((is_ccs_modifier(fb->modifier) &&
> +	     !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
> +	     || is_gen12_mc_ccs_modifier(fb->modifier))
>   		return false;
>   
>   	for (int i = 0; i < fb->num_planes; i++) {
> @@ -2510,8 +2530,8 @@ static bool use_enginecopy(const struct igt_fb *fb)
>   		return false;
>   
>   	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
> -	       is_ccs_modifier(fb->modifier) ||
> -	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
> +	       (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && is_ccs_modifier(fb->modifier)) ||
> +	       is_gen12_mc_ccs_modifier(fb->modifier);
>   }
>   
>   static bool use_blitter(const struct igt_fb *fb)
> @@ -2519,7 +2539,9 @@ static bool use_blitter(const struct igt_fb *fb)
>   	if (!blitter_ok(fb))
>   		return false;
>   
> -	return fb->modifier == I915_FORMAT_MOD_Y_TILED ||
> +	return fb->modifier == I915_FORMAT_MOD_4_TILED ||
> +	       fb->modifier == I915_FORMAT_MOD_X_TILED ||
> +	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
>   	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
>   	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
>   }
> @@ -2711,12 +2733,115 @@ static void copy_with_engine(struct fb_blit_upload *blit,
>   	fini_buf(src);
>   }
>   
> +static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
> +					   uint32_t plane, uint32_t memregion)
> +{
> +	uint32_t name, handle;
> +	struct blt_copy_object *blt;
> +	enum blt_tiling_type blt_tile;
> +	uint64_t stride;
> +
> +	blt = malloc(sizeof(*blt));
> +	igt_assert(blt);
> +
> +	name = gem_flink(fb->fd, fb->gem_handle);
> +	handle = gem_open(fb->fd, name);
> +
> +	blt_tile = fb_tile_to_blt_tile(fb->modifier);
> +	stride = blt_tile == T_LINEAR ? fb->strides[plane] : fb->strides[plane] / 4;
> +
> +	blt_set_object(blt, handle, fb->size, memregion,
> +		       intel_get_uc_mocs(fb->fd),
> +		       blt_tile,
> +		       is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
> +		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
> +
> +	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
> +
> +	blt->plane_offset = fb->offsets[plane];
> +
> +	blt->ptr = gem_mmap__device_coherent(fb->fd, handle, 0, fb->size,
> +					     PROT_READ | PROT_WRITE);
> +	return blt;
> +}
> +
> +static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
> +{
> +	switch (fb->plane_bpp[0]) {
> +	case 8:
> +		return CD_8bit;
> +	case 16:
> +		return CD_16bit;
> +	case 32:
> +		return CD_32bit;
> +	case 64:
> +		return CD_64bit;
> +	case 96:
> +		return CD_96bit;
> +	case 128:
> +		return CD_128bit;
> +	default:
> +		igt_assert(0);
> +	}
> +}
> +
> +#define BLT_TARGET_RC(x) (x.compression == COMPRESSION_ENABLED && \
> +			  x.compression_type == COMPRESSION_TYPE_3D)
> +
> +#define BLT_TARGET_MC(x) (x.compression == COMPRESSION_ENABLED && \
> +			  x.compression_type == COMPRESSION_TYPE_MEDIA)
> +
> +static uint32_t blt_compression_format(struct blt_copy_data *blt,
> +				       const struct igt_fb *fb)
> +{
> +	if (blt->src.compression == COMPRESSION_DISABLED &&
> +	    blt->dst.compression == COMPRESSION_DISABLED)
> +		return 0;
> +
> +	if (BLT_TARGET_RC(blt->src) || BLT_TARGET_RC(blt->dst)) {
> +		switch (blt->color_depth) {
> +		case CD_32bit:
> +			return 8;
> +		default:
> +			igt_assert_f(0, "COMPRESSION_TYPE_3D unknown color depth\n");
> +		}
> +	} else if (BLT_TARGET_MC(blt->src)) {
> +		switch (fb->drm_format) {
> +		case DRM_FORMAT_XRGB8888:
> +			return 8;
> +		case DRM_FORMAT_XYUV8888:
> +			return 9;
> +		case DRM_FORMAT_NV12:
> +			return 9;
> +		case DRM_FORMAT_P010:
> +		case DRM_FORMAT_P012:
> +		case DRM_FORMAT_P016:
> +			return 8;
> +		default:
> +			igt_assert_f(0, "COMPRESSION_TYPE_MEDIA unknown format\n");
> +		}
> +	} else if (BLT_TARGET_MC(blt->dst)) {
> +		igt_assert_f(0, "Destination compression not supported on mc ccs\n");
> +	} else {
> +		igt_assert_f(0, "unknown compression\n");
> +	}
> +}
> +
>   static void blitcopy(const struct igt_fb *dst_fb,
>   		     const struct igt_fb *src_fb)
>   {
>   	uint32_t src_tiling, dst_tiling;
>   	uint32_t ctx = 0;
>   	uint64_t ahnd = 0;
> +	const intel_ctx_t *ictx = NULL;
> +	struct intel_execution_engine2 *e;
> +	uint32_t bb;
> +	uint64_t bb_size = 4096;
> +	struct blt_copy_data blt = {};
> +	struct blt_copy_object *src, *dst;
> +	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
> +	uint32_t mem_region = HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))
> +			   ? REGION_LMEM(0) : REGION_SMEM;
>   
>   	igt_assert_eq(dst_fb->fd, src_fb->fd);
>   	igt_assert_eq(dst_fb->num_planes, src_fb->num_planes);
> @@ -2726,19 +2851,21 @@ static void blitcopy(const struct igt_fb *dst_fb,
>   
>   	if (is_i915_device(dst_fb->fd) && !gem_has_relocations(dst_fb->fd)) {
>   		igt_require(gem_has_contexts(dst_fb->fd));
> +		ictx = intel_ctx_create_all_physical(src_fb->fd);
>   		ctx = gem_context_create(dst_fb->fd);
>   		ahnd = get_reloc_ahnd(dst_fb->fd, ctx);
> +
> +		igt_assert(__gem_create_in_memory_regions(src_fb->fd,
> +							  &bb,
> +							  &bb_size,
> +							  mem_region) == 0);
>   	}
>   
>   	for (int i = 0; i < dst_fb->num_planes; i++) {
>   		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
>   		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
>   		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);
> -		/*
> -		 * On GEN12+ X-tiled format support is removed from the fast
> -		 * blit command, so use the XY_SRC blit command for it
> -		 * instead.
> -		 */
> +
>   		if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
>   			igt_blitter_fast_copy__raw(dst_fb->fd,
>   						   ahnd, ctx, NULL,
> @@ -2757,6 +2884,42 @@ static void blitcopy(const struct igt_fb *dst_fb,
>   						   dst_tiling,
>   						   0, 0 /* dst_x, dst_y */,
>   						   dst_fb->size);
> +		} else if (ahnd && block_copy_ok(src_fb) && block_copy_ok(dst_fb)) {
> +			for_each_ctx_engine(src_fb->fd, ictx, e) {
> +				if (gem_engine_can_block_copy(src_fb->fd, e))
> +					break;
> +			}
> +			igt_assert_f(e, "No block copy capable engine found!\n");
> +
> +			src = blt_fb_init(src_fb, i, mem_region);
> +			dst = blt_fb_init(dst_fb, i, mem_region);
> +
> +			memset(&blt, 0, sizeof(blt));
> +			blt.color_depth = blt_get_bpp(src_fb);
> +			blt_set_copy_object(&blt.src, src);
> +			blt_set_copy_object(&blt.dst, dst);
> +
> +			if (HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))) {
> +				blt_set_object_ext(&ext.src,
> +						   blt_compression_format(&blt, src_fb),
> +						   src_fb->width, src_fb->height,
> +						   SURFACE_TYPE_2D);
> +
> +				blt_set_object_ext(&ext.dst,
> +						   blt_compression_format(&blt, dst_fb),
> +						   dst_fb->width, dst_fb->height,
> +						   SURFACE_TYPE_2D);
> +
> +				pext = &ext;
> +			}
> +
> +			blt_set_batch(&blt.bb, bb, bb_size, mem_region);
> +
> +			blt_block_copy(src_fb->fd, ictx, e, ahnd, &blt, pext);
> +			gem_sync(src_fb->fd, blt.dst.handle);
> +
> +			blt_destroy_object(src_fb->fd, src);
> +			blt_destroy_object(dst_fb->fd, dst);
>   		} else {
>   			igt_blitter_src_copy(dst_fb->fd,
>   					     ahnd, ctx, NULL,
> @@ -2781,6 +2944,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
>   	if (ctx)
>   		gem_context_destroy(dst_fb->fd, ctx);
>   	put_ahnd(ahnd);
> +	intel_ctx_destroy(src_fb->fd, ictx);
>   }
>   
>   static void free_linear_mapping(struct fb_blit_upload *blit)
