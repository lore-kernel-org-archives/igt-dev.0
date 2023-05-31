Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D4410E4F2
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 15:50:47 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso6930148e87.2
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 08:50:47 -0700 (PDT)
Message-ID: <dcb5cf93-2d1f-2171-e8c8-ec6553088c9a@gmail.com>
Date: Wed, 31 May 2023 18:50:39 +0300
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230328183043.16258-1-juhapekka.heikkila@gmail.com>
 <20230328183043.16258-3-juhapekka.heikkila@gmail.com>
 <20230403061753.6bu3tprz5j4e3bdk@zkempczy-mobl2>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230403061753.6bu3tprz5j4e3bdk@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_fb: switch blitcopy to use
 lib/i915/i915_blt functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 3.4.2023 9.17, Zbigniew Kempczyński wrote:
> On Tue, Mar 28, 2023 at 09:30:42PM +0300, Juha-Pekka Heikkila wrote:
>> reduce code duplication
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/igt_fb.c | 214 +++++++++++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 191 insertions(+), 23 deletions(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index ba89e1f60..7668fc553 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -35,6 +35,8 @@
>>   #include "drmtest.h"
>>   #include "i915/gem_create.h"
>>   #include "i915/gem_mman.h"
>> +#include "i915/i915_blt.h"
>> +#include "i915/intel_mocs.h"
>>   #include "igt_aux.h"
>>   #include "igt_color_encoding.h"
>>   #include "igt_fb.h"
>> @@ -2680,12 +2682,132 @@ static void copy_with_engine(struct fb_blit_upload *blit,
>>   	fini_buf(src);
>>   }
>>   
>> +static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>> +					   uint32_t plane, uint32_t memregion)
>> +{
>> +	uint32_t name, handle;
>> +	struct blt_copy_object *blt;
>> +	enum blt_tiling_type blt_tile;
>> +	uint64_t stride;
>> +
>> +	blt = malloc(sizeof(*blt));
>> +	igt_assert(blt);
>> +
>> +	name = gem_flink(fb->fd, fb->gem_handle);
>> +	handle = gem_open(fb->fd, name);
>> +
>> +	switch (igt_fb_mod_to_tiling(fb->modifier)) {
>> +	case I915_TILING_X:
>> +		blt_tile = T_XMAJOR;
>> +		stride = fb->strides[plane] / 4;
>> +		break;
>> +	case I915_TILING_Y:
>> +		blt_tile = T_YMAJOR;
>> +		stride = fb->strides[plane] / 4;
>> +		break;
>> +	case I915_TILING_4:
>> +		blt_tile = T_TILE4;
>> +		stride = fb->strides[plane] / 4;
>> +		break;
>> +	case I915_TILING_NONE:
>> +	default:
>> +		blt_tile = T_LINEAR;
>> +		stride = fb->strides[plane];
>> +		break;
>> +	}
>> +
>> +	blt_set_object(blt, handle, fb->size, memregion,
>> +		       intel_get_uc_mocs(fb->fd),
>> +		       blt_tile,
>> +		       is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
>> +		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
>> +
>> +	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
>> +
>> +	blt->offset = fb->offsets[plane];
>> +
>> +	blt->ptr = gem_mmap__device_coherent(fb->fd, handle, 0, fb->size,
>> +					     PROT_READ | PROT_WRITE);
>> +	return blt;
>> +}
>> +
>> +static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
>> +{
>> +	switch (fb->plane_bpp[0]) {
>> +	case 8:
>> +		return CD_8bit;
>> +	case 16:
>> +		return CD_16bit;
>> +	case 32:
>> +		return CD_32bit;
>> +	case 64:
>> +		return CD_64bit;
>> +	case 96:
>> +		return CD_96bit;
>> +	case 128:
>> +		return CD_128bit;
>> +	default:
>> +		igt_assert(0);
>> +	}
>> +}
>> +
>> +#define BLT_TARGET_RC(x) (x.compression == COMPRESSION_ENABLED && \
>> +			  x.compression_type == COMPRESSION_TYPE_3D)
>> +
>> +#define BLT_TARGET_MC(x) (x.compression == COMPRESSION_ENABLED && \
>> +			  x.compression_type == COMPRESSION_TYPE_MEDIA)
>> +
>> +static uint32_t blt_compression_format(struct blt_copy_data *blt,
>> +				       const struct igt_fb *fb)
>> +{
>> +	if (blt->src.compression == COMPRESSION_DISABLED &&
>> +	    blt->dst.compression == COMPRESSION_DISABLED)
>> +		return 0;
>> +
>> +	if (BLT_TARGET_RC(blt->src) || BLT_TARGET_RC(blt->dst)) {
>> +		switch (blt->color_depth) {
>> +		case CD_32bit:
>> +			return 8;
>> +		default:
>> +			igt_assert_f(0, "COMPRESSION_TYPE_3D unknown color depth\n");
>> +		}
>> +	}
>> +
>> +	if (BLT_TARGET_MC(blt->src) || BLT_TARGET_MC(blt->dst)) {
>> +		switch (fb->drm_format) {
>> +		case DRM_FORMAT_XRGB8888:
>> +			return 8;
>> +		case DRM_FORMAT_XYUV8888:
>> +			return 9;
>> +		case DRM_FORMAT_NV12:
>> +			return 9;
>> +		case DRM_FORMAT_P010:
>> +		case DRM_FORMAT_P012:
>> +		case DRM_FORMAT_P016:
>> +			return 8;
>> +		default:
>> +			igt_assert_f(0, "COMPRESSION_TYPE_MEDIA unknown format\n");
>> +		}
>> +	} else {
>> +		igt_assert_f(0, "unknown compression\n");
>> +	}
>> +}
>> +
>>   static void blitcopy(const struct igt_fb *dst_fb,
>>   		     const struct igt_fb *src_fb)
>>   {
>>   	uint32_t src_tiling, dst_tiling;
>>   	uint32_t ctx = 0;
>>   	uint64_t ahnd = 0;
>> +	const intel_ctx_t *ictx = intel_ctx_create_all_physical(src_fb->fd);
>> +	struct intel_execution_engine2 *e;
>> +	uint32_t bb;
>> +	uint64_t bb_size = 4096;
>> +	struct blt_copy_data blt = {};
>> +	struct blt_copy_object *src, *dst;
>> +	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
>> +	uint32_t mem_region = HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))
>> +			   ? REGION_LMEM(0) : REGION_SMEM;
>>   
>>   	igt_assert_eq(dst_fb->fd, src_fb->fd);
>>   	igt_assert_eq(dst_fb->num_planes, src_fb->num_planes);
>> @@ -2697,36 +2819,81 @@ static void blitcopy(const struct igt_fb *dst_fb,
>>   		igt_require(gem_has_contexts(dst_fb->fd));
>>   		ctx = gem_context_create(dst_fb->fd);
>>   		ahnd = get_reloc_ahnd(dst_fb->fd, ctx);
>> +
>> +		igt_assert(__gem_create_in_memory_regions(src_fb->fd,
>> +							  &bb,
>> +							  &bb_size,
>> +							  mem_region) == 0);
>> +
>> +		for_each_ctx_engine(src_fb->fd, ictx, e) {
>> +			if (gem_engine_can_block_copy(src_fb->fd, e))
>> +				break;
> 
> Hmm, this means we need to be careful when using cmds_info. As
> not all engines support block-copy simple information from the
> library (blt_has_block_copy()) is not enough.

Thanks for the comments Zbigniew, I fell out from this work for a while 
with Covid and now finally reached to state with all other things I can 
continue with this.

I wasn't certain what you meant with above comment? There would be 
better way to find correct engine for doing block copy? As is I'm 
testing new version of this set where these parts are bit changed, I'll 
probably today/tomorrow send another version for ci to show what I still 
missed.

My final target with all this is blitter path would do rc ccs and I'd 
need Vebox only for compressing mc ccs.

/Juha-Pekka

> 
>> +		}
>>   	}
>>   
>>   	for (int i = 0; i < dst_fb->num_planes; i++) {
>>   		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
>>   		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
>>   		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);
>> -		/*
>> -		 * On GEN12+ X-tiled format support is removed from the fast
>> -		 * blit command, so use the XY_SRC blit command for it
>> -		 * instead.
>> -		 */
>> -		if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
>> -			igt_blitter_fast_copy__raw(dst_fb->fd,
>> -						   ahnd, ctx, NULL,
>> -						   src_fb->gem_handle,
>> -						   src_fb->offsets[i],
>> -						   src_fb->strides[i],
>> -						   src_tiling,
>> -						   0, 0, /* src_x, src_y */
>> -						   src_fb->size,
>> -						   dst_fb->plane_width[i],
>> -						   dst_fb->plane_height[i],
>> -						   dst_fb->plane_bpp[i],
>> -						   dst_fb->gem_handle,
>> -						   dst_fb->offsets[i],
>> -						   dst_fb->strides[i],
>> -						   dst_tiling,
>> -						   0, 0 /* dst_x, dst_y */,
>> -						   dst_fb->size);
>> +
>> +		if (ahnd && fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
>> +			memset(&blt, 0, sizeof(blt));
>> +			blt.color_depth = blt_get_bpp(src_fb);
>> +
>> +			src = blt_fb_init(src_fb, i, mem_region);
>> +			dst = blt_fb_init(dst_fb, i, mem_region);
>> +
>> +			blt_set_copy_object(&blt.src, src);
>> +			blt_set_copy_object(&blt.dst, dst);
>> +
>> +			blt_set_batch(&blt.bb, bb, bb_size, mem_region);
>> +
>> +			blt_fast_copy(src_fb->fd, ictx, e, ahnd, &blt);
> 
> Do we require block-copy engine here?
> 
>> +			gem_sync(src_fb->fd, blt.dst.handle);
>> +
>> +			blt_destroy_object(src_fb->fd, src);
>> +			blt_destroy_object(dst_fb->fd, dst);
>> +		} else if (ahnd && blt_has_block_copy(src_fb->fd)) {
>> +			/*
>> +			* On GEN12+ X-tiled format support is removed from
>> +			* the fast blit command, so use the block copy blit
>> +			* command for it instead.
>> +			*/
>> +			src = blt_fb_init(src_fb, i, mem_region);
>> +			dst = blt_fb_init(dst_fb, i, mem_region);
>> +
>> +			memset(&blt, 0, sizeof(blt));
>> +			blt.print_bb = true;
>> +			blt.color_depth = blt_get_bpp(src_fb);
>> +			blt_set_copy_object(&blt.src, src);
>> +			blt_set_copy_object(&blt.dst, dst);
>> +
>> +			if (HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))) {
>> +				blt_set_object_ext(&ext.src,
>> +						   blt_compression_format(&blt, src_fb),
>> +						   src_fb->width, src_fb->height,
>> +						   SURFACE_TYPE_2D);
>> +
>> +				blt_set_object_ext(&ext.dst,
>> +						   blt_compression_format(&blt, dst_fb),
>> +						   dst_fb->width, dst_fb->height,
>> +						   SURFACE_TYPE_2D);
>> +
>> +				pext = &ext;
>> +			}
>> +
>> +			blt_set_batch(&blt.bb, bb, bb_size, mem_region);
>> +
>> +			blt_block_copy(src_fb->fd, ictx, e, ahnd, &blt, pext);
> 
> I think to prepend with:
> 
> igt_assert(e);
> 
> for potential situation there's no block-copy capable engine.
> 
> --
> Zbigniew
> 
>> +			gem_sync(src_fb->fd, blt.dst.handle);
>> +
>> +			blt_destroy_object(src_fb->fd, src);
>> +			blt_destroy_object(dst_fb->fd, dst);
>>   		} else {
>> +			/*
>> +			 * If on legacy hardware where relocations are supported
>> +			 * we'll use XY_SRC blit command instead
>> +			 */
>>   			igt_blitter_src_copy(dst_fb->fd,
>>   					     ahnd, ctx, NULL,
>>   					     src_fb->gem_handle,
>> @@ -2750,6 +2917,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
>>   	if (ctx)
>>   		gem_context_destroy(dst_fb->fd, ctx);
>>   	put_ahnd(ahnd);
>> +	intel_ctx_destroy(src_fb->fd, ictx);
>>   }
>>   
>>   static void free_linear_mapping(struct fb_blit_upload *blit)
>> -- 
>> 2.39.0
>>
