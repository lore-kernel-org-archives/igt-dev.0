Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6541189CF5
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2019 13:23:46 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Mon, 30 Dec 2019 13:23:41 +0000
Message-ID: <0aa8d36c27cbf08642c1bab65e60db27bd38bd4a.camel@intel.com>
References: <20191230034040.21943-1-imre.deak@intel.com>
 <20191230034040.21943-5-imre.deak@intel.com>
In-Reply-To: <20191230034040.21943-5-imre.deak@intel.com>
Content-Language: en-US
Content-ID: <4189D58496AB1B4A944CB55607C1A577@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 04/10] lib: Add engine copy support for
 YUV formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Deak,
 Imre" <imre.deak@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 2019-12-30 at 05:40 +0200, Imre Deak wrote:
> Add the missing bits to the Vebox copy and AUX pagetable helpers for
> copying YUV FBs with the Vebox engine.
> 
> Cc: Mika Kahola <mika.kahola@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> ---
>  lib/igt_fb.c            |  79 ++++++++++++++++++++++++--
>  lib/intel_aux_pgtable.c | 121 ++++++++++++++++++++++++++++++++++++
> ----
>  lib/intel_batchbuffer.h |   4 ++
>  lib/veboxcopy_gen12.c   |  58 ++++++++++++++++---
>  4 files changed, 238 insertions(+), 24 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index cc0fb373..e6a3ff07 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -359,6 +359,13 @@ static const struct format_desc_struct
> *lookup_drm_format(uint32_t drm_format)
>  	return NULL;
>  }
>  
> +static bool igt_format_is_yuv_semiplanar(uint32_t format)
> +{
> +	const struct format_desc_struct *f = lookup_drm_format(format);
> +
> +	return igt_format_is_yuv(format) && f->num_planes == 2;
> +}
> +
>  /**
>   * igt_get_fb_tile_size:
>   * @fd: the DRM file descriptor
> @@ -1967,19 +1974,56 @@ static bool use_blitter(const struct igt_fb
> *fb)
>  		blitter_ok(fb);
>  }
>  
> +static void init_buf_ccs(struct igt_buf *buf, int ccs_idx,
> +			 uint32_t offset, uint32_t stride)
> +{
> +	buf->ccs[ccs_idx].offset = offset;
> +	buf->ccs[ccs_idx].stride = stride;
> +}
> +
> +static void init_buf_surface(struct igt_buf *buf, int surface_idx,
> +			     uint32_t offset, uint32_t stride, uint32_t
> size)
> +{
> +	buf->surface[surface_idx].offset = offset;
> +	buf->surface[surface_idx].stride = stride;
> +	buf->surface[surface_idx].size = size;
> +}
> +
> +static int yuv_semiplanar_bpp(uint32_t drm_format)
> +{
> +	switch (drm_format) {
> +	case DRM_FORMAT_NV12:
> +		return 8;
> +	case DRM_FORMAT_P010:
> +		return 10;
> +	case DRM_FORMAT_P012:
> +		return 12;
> +	case DRM_FORMAT_P016:
> +		return 16;
> +	default:
> +		igt_assert_f(0, "Unsupported format: %08x\n",
> drm_format);
> +	}
> +}
> +
>  static void init_buf(struct fb_blit_upload *blit,
>  		     struct igt_buf *buf,
>  		     const struct igt_fb *fb,
>  		     const char *name)
>  {
> +	int num_surfaces;
> +	int i;
> +
>  	igt_assert_eq(fb->offsets[0], 0);
>  
>  	buf->bo = gem_handle_to_libdrm_bo(blit->bufmgr, blit->fd,
>  					  name, fb->gem_handle);
>  	buf->tiling = igt_fb_mod_to_tiling(fb->modifier);
> -	buf->surface[0].stride = fb->strides[0];
>  	buf->bpp = fb->plane_bpp[0];
> -	buf->surface[0].size = fb->size;
> +	buf->format_is_yuv = igt_format_is_yuv(fb->drm_format);
> +	buf->format_is_yuv_semiplanar =
> +		igt_format_is_yuv_semiplanar(fb->drm_format);
> +	if (buf->format_is_yuv_semiplanar)
> +		buf->yuv_semiplanar_bpp = yuv_semiplanar_bpp(fb-
> >drm_format);
>  
>  	if (is_ccs_modifier(fb->modifier)) {
>  		igt_assert_eq(fb->strides[0] & 127, 0);
> @@ -1994,8 +2038,24 @@ static void init_buf(struct fb_blit_upload
> *blit,
>  		else
>  			buf->compression = I915_COMPRESSION_RENDER;
>  
> -		buf->ccs[0].offset = fb->offsets[1];
> -		buf->ccs[0].stride = fb->strides[1];
> +		num_surfaces = fb->num_planes / 2;
> +		for (i = 0; i < num_surfaces; i++)
> +			init_buf_ccs(buf, i,
> +				     fb->offsets[num_surfaces + i],
> +				     fb->strides[num_surfaces + i]);
> +	} else {
> +		num_surfaces = fb->num_planes;
> +	}
> +
> +	igt_assert(fb->offsets[0] == 0);
> +	for (i = 0; i < num_surfaces; i++) {
> +		uint32_t end =
> +			i == fb->num_planes - 1 ? fb->size : fb-
> >offsets[i + 1];
> +
> +		init_buf_surface(buf, i,
> +				 fb->offsets[i],
> +				 fb->strides[i],
> +				 end - fb->offsets[i]);
>  	}
>  
>  	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
> @@ -2007,6 +2067,15 @@ static void fini_buf(struct igt_buf *buf)
>  	drm_intel_bo_unreference(buf->bo);
>  }
>  
> +static bool use_vebox_copy(const struct igt_fb *src_fb,
> +			   const struct igt_fb *dst_fb)
> +{
> +
> +	return is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
> +	       igt_format_is_yuv(src_fb->drm_format) ||
> +	       igt_format_is_yuv(dst_fb->drm_format);
> +}
> +
>  /**
>   * copy_with_engine:
>   * @blit: context for the copy operation
> @@ -2029,7 +2098,7 @@ static void copy_with_engine(struct
> fb_blit_upload *blit,
>  	igt_render_copyfunc_t render_copy = NULL;
>  	igt_vebox_copyfunc_t vebox_copy = NULL;
>  
> -	if (is_gen12_mc_ccs_modifier(dst_fb->modifier))
> +	if (use_vebox_copy(src_fb, dst_fb))
>  		vebox_copy =
> igt_get_vebox_copyfunc(intel_get_drm_devid(blit->fd));
>  	else
>  		render_copy =
> igt_get_render_copyfunc(intel_get_drm_devid(blit->fd));
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index 5addb2e2..fcd24f08 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -33,6 +33,12 @@
>  
>  #define max(a, b)		((a) > (b) ? (a) : (b))
>  
> +#define AUX_FORMAT_YCRCB	0x03
> +#define AUX_FORMAT_P010		0x07
> +#define AUX_FORMAT_P016		0x08
> +#define AUX_FORMAT_ARGB_8B	0x0A
> +#define AUX_FORMAT_NV12_21	0x0F
> +
>  struct pgtable_level_desc {
>  	int idx_shift;
>  	int idx_bits;
> @@ -55,6 +61,23 @@ struct pgtable {
>  	drm_intel_bo *bo;
>  };
>  
> +static uint64_t last_buf_surface_end(const struct igt_buf *buf)
> +{
> +	uint64_t end_offset = 0;
> +	int num_surfaces = buf->format_is_yuv_semiplanar ? 2 : 1;
> +	int i;
> +
> +	for (i = 0; i < num_surfaces; i++) {
> +		uint64_t surface_end = buf->surface[i].offset +
> +				       buf->surface[i].size;
> +
> +		if (surface_end > end_offset)
> +			end_offset = surface_end;
> +	}
> +
> +	return end_offset;
> +}
> +
>  static int
>  pgt_table_count(int address_bits, const struct igt_buf **bufs, int
> buf_count)
>  {
> @@ -77,7 +100,7 @@ pgt_table_count(int address_bits, const struct
> igt_buf **bufs, int buf_count)
>  		/* Avoid double counting for overlapping aligned bufs.
> */
>  		start = max(start, end);
>  
> -		end = ALIGN(buf->bo->offset64 + buf->surface[0].size,
> +		end = ALIGN(buf->bo->offset64 +
> last_buf_surface_end(buf),
>  			    1UL << address_bits);
>  		igt_assert(end >= start);
>  
> @@ -189,7 +212,29 @@ pgt_set_l1_entry(struct pgtable *pgt, uint64_t
> l1_table,
>  	*l1_entry_ptr = ptr | flags;
>  }
>  
> -static uint64_t pgt_get_l1_flags(const struct igt_buf *buf)
> +#define DEPTH_VAL_RESERVED	3
> +
> +static int bpp_to_depth_val(int bpp)
> +{
> +	switch (bpp) {
> +	case 8:
> +		return 4;
> +	case 10:
> +		return 1;
> +	case 12:
> +		return 2;
> +	case 16:
> +		return 0;
> +	case 32:
> +		return 5;
> +	case 64:
> +		return 6;
> +	default:
> +		igt_assert_f(0, "invalid bpp %d\n", bpp);
> +	}
> +}
> +
> +static uint64_t pgt_get_l1_flags(const struct igt_buf *buf, int
> surface_idx)
>  {
>  	/*
>  	 * The offset of .tile_mode isn't specifed by bspec, it's what
> Mesa
> @@ -213,8 +258,6 @@ static uint64_t pgt_get_l1_flags(const struct
> igt_buf *buf)
>  		.e = {
>  			.valid = 1,
>  			.tile_mode = buf->tiling == I915_TILING_Y ? 1 :
> 0,
> -			.depth = 5,		/* 32bpp */
> -			.format = 0xA,		/* B8G8R8A8_UNORM */
>  		}
>  	};
>  
> @@ -227,7 +270,49 @@ static uint64_t pgt_get_l1_flags(const struct
> igt_buf *buf)
>  		   buf->tiling == I915_TILING_Yf ||
>  		   buf->tiling == I915_TILING_Ys);
>  
> -	igt_assert(buf->bpp == 32);
> +	entry.e.ycr = surface_idx > 0;
> +
> +	if (buf->format_is_yuv_semiplanar) {
> +		entry.e.depth = bpp_to_depth_val(buf->bpp);
> +		switch (buf->yuv_semiplanar_bpp) {
> +		case 8:
> +			entry.e.format = AUX_FORMAT_NV12_21;
> +			entry.e.depth = DEPTH_VAL_RESERVED;
> +			break;
> +		case 10:
> +			entry.e.format = AUX_FORMAT_P010;
> +			entry.e.depth = bpp_to_depth_val(10);
> +			break;
> +		case 12:
> +			entry.e.format = AUX_FORMAT_P016;
> +			entry.e.depth = bpp_to_depth_val(12);
> +			break;
> +		case 16:
> +			entry.e.format = AUX_FORMAT_P016;
> +			entry.e.depth = bpp_to_depth_val(16);
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
> +	} else if (buf->format_is_yuv) {
> +		switch (buf->bpp) {
> +		case 16:
> +			entry.e.format = AUX_FORMAT_YCRCB;
> +			entry.e.depth = DEPTH_VAL_RESERVED;
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
> +	} else {
> +		switch (buf->bpp) {
> +		case 32:
> +			entry.e.format = AUX_FORMAT_ARGB_8B;
> +			entry.e.depth = bpp_to_depth_val(32);
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
> +	}
>  
>  	return entry.l;
>  }
> @@ -253,14 +338,21 @@ static uint64_t pgt_get_lx_flags(void)
>  static void
>  pgt_populate_entries_for_buf(struct pgtable *pgt,
>  			       const struct igt_buf *buf,
> -			       uint64_t top_table)
> +			       uint64_t top_table,
> +			       int surface_idx)
>  {
> -	uint64_t surface_addr = buf->bo->offset64;
> -	uint64_t surface_end = surface_addr + buf->surface[0].size;
> -	uint64_t aux_addr = buf->bo->offset64 + buf->ccs[0].offset;
> -	uint64_t l1_flags = pgt_get_l1_flags(buf);
> +	uint64_t surface_addr = buf->bo->offset64 +
> +				buf->surface[surface_idx].offset;
> +	uint64_t surface_end = surface_addr +
> +			       buf->surface[surface_idx].size;
> +	uint64_t aux_addr = buf->bo->offset64 + buf-
> >ccs[surface_idx].offset;
> +	uint64_t l1_flags = pgt_get_l1_flags(buf, surface_idx);
>  	uint64_t lx_flags = pgt_get_lx_flags();
>  
> +	igt_assert(!(buf->surface[surface_idx].stride % 512));
> +	igt_assert_eq(buf->ccs[surface_idx].stride,
> +		      buf->surface[surface_idx].stride / 512 * 64);
> +
>  	for (; surface_addr < surface_end;
>  	     surface_addr += MAIN_SURFACE_BLOCK_SIZE,
>  	     aux_addr += AUX_CCS_BLOCK_SIZE) {
> @@ -292,8 +384,13 @@ static void pgt_populate_entries(struct pgtable
> *pgt,
>  	/* Top level table must be at offset 0. */
>  	igt_assert(top_table == 0);
>  
> -	for (i = 0; i < buf_count; i++)
> -		pgt_populate_entries_for_buf(pgt, bufs[i], top_table);
> +	for (i = 0; i < buf_count; i++) {
> +		igt_assert_eq(bufs[i]->surface[0].offset, 0);
> +
> +		pgt_populate_entries_for_buf(pgt, bufs[i], top_table,
> 0);
> +		if (bufs[i]->format_is_yuv_semiplanar)
> +			pgt_populate_entries_for_buf(pgt, bufs[i],
> top_table, 1);
> +	}
>  }
>  
>  static struct pgtable *
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index 69580839..fd7ef03f 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -235,8 +235,12 @@ struct igt_buf {
>  	uint32_t tiling;
>  	enum i915_compression compression;
>  	uint32_t bpp;
> +	uint32_t yuv_semiplanar_bpp;
>  	uint32_t *data;
> +	bool format_is_yuv:1;
> +	bool format_is_yuv_semiplanar:1;
>  	struct {
> +		uint32_t offset;
>  		uint32_t stride;
>  		uint32_t size;
>  	} surface[2];
> diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
> index 2f017514..237c43f2 100644
> --- a/lib/veboxcopy_gen12.c
> +++ b/lib/veboxcopy_gen12.c
> @@ -26,7 +26,10 @@
>  #include "intel_aux_pgtable.h"
>  #include "veboxcopy.h"
>  
> +#define YCRCB_NORMAL	0
> +#define PLANAR_420_8	4
>  #define R8G8B8A8_UNORM	8
> +#define PLANAR_420_16	12
>  
>  struct vebox_surface_state {
>  	struct {
> @@ -129,10 +132,23 @@ struct vebox_tiling_convert {
>  	};
>  } __attribute__((packed));
>  
> +static bool format_is_interleaved_yuv(int format)
> +{
> +	switch (format) {
> +	case YCRCB_NORMAL:
> +	case PLANAR_420_8:
> +	case PLANAR_420_16:
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static void emit_surface_state_cmd(struct intel_batchbuffer *batch,
>  				   int surface_id,
>  				   int width, int height, int bpp,
> -				   int pitch, uint32_t tiling, int
> format)
> +				   int pitch, uint32_t tiling, int
> format,
> +				   uint32_t uv_offset)
>  {
>  	struct vebox_surface_state *ss;
>  
> @@ -149,11 +165,15 @@ static void emit_surface_state_cmd(struct
> intel_batchbuffer *batch,
>  	ss->ss2.width = width - 1;
>  
>  	ss->ss3.surface_format = format;
> +	if (format_is_interleaved_yuv(format))
> +		ss->ss3.chroma_interleave = 1;
>  	ss->ss3.surface_pitch = pitch - 1;
>  	ss->ss3.tile_walk = (tiling == I915_TILING_Y) ||
>  			    (tiling == I915_TILING_Yf);
>  	ss->ss3.tiled_surface = tiling != I915_TILING_NONE;
>  
> +	ss->ss4.u_y_offset = uv_offset / pitch;
> +
>  	ss->ss7.derived_surface_pitch = pitch - 1;
>  }
>  
> @@ -226,8 +246,7 @@ void gen12_vebox_copyfunc(struct
> intel_batchbuffer *batch,
>  {
>  	struct aux_pgtable_info aux_pgtable_info = { };
>  	uint32_t aux_pgtable_state;
> -
> -	igt_assert(src->bpp == dst->bpp);
> +	int format;
>  
>  	intel_batchbuffer_flush_on_ring(batch, I915_EXEC_VEBOX);
>  
> @@ -245,18 +264,43 @@ void gen12_vebox_copyfunc(struct
> intel_batchbuffer *batch,
>  
>  	gen12_emit_aux_pgtable_state(batch, aux_pgtable_state, false);
>  
> +	/* The tiling convert command can't convert formats. */
> +	igt_assert_eq(src->format_is_yuv, dst->format_is_yuv);
> +	igt_assert_eq(src->format_is_yuv_semiplanar,
> +		      dst->format_is_yuv_semiplanar);
> +	igt_assert_eq(src->bpp, dst->bpp);
> +
>  	/* TODO: add support for more formats */
> -	igt_assert(src->bpp == 32);
> +	switch (src->bpp) {
> +	case 8:
> +		igt_assert(src->format_is_yuv_semiplanar);
> +		format = PLANAR_420_8;
> +		break;
> +	case 16:
> +		igt_assert(src->format_is_yuv);
> +		format = src->format_is_yuv_semiplanar ? PLANAR_420_16
> :
> +							 YCRCB_NORMAL;
> +		break;
> +	case 32:
> +		igt_assert(!src->format_is_yuv &&
> +			   !src->format_is_yuv_semiplanar);
> +		format = R8G8B8A8_UNORM;
> +		break;
> +	default:
> +		igt_assert_f(0, "Unsupported bpp: %u\n", src->bpp);
> +	}
> +
> +	igt_assert(!src->format_is_yuv_semiplanar ||
> +		   (src->surface[1].offset && dst->surface[1].offset));
>  	emit_surface_state_cmd(batch, VEBOX_SURFACE_INPUT,
>  			       width, height, src->bpp,
>  			       src->surface[0].stride,
> -			       src->tiling, R8G8B8A8_UNORM);
> +			       src->tiling, format, src-
> >surface[1].offset);
>  
> -	igt_assert(dst->bpp == 32);
>  	emit_surface_state_cmd(batch, VEBOX_SURFACE_OUTPUT,
>  			       width, height, dst->bpp,
>  			       dst->surface[0].stride,
> -			       dst->tiling, R8G8B8A8_UNORM);
> +			       dst->tiling, format, dst-
> >surface[1].offset);
>  
>  	emit_tiling_convert_cmd(batch,
>  				src->bo, src->tiling, src->compression,
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
