Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A486E038
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 16:38:30 +0000 (UTC)
Date: Wed, 11 Nov 2020 18:38:23 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20201111163823.GA469155@ideak-desk.fi.intel.com>
References: <20201111141840.432429-1-mika.kahola@intel.com>
 <20201111141840.432429-3-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111141840.432429-3-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v8 2/2] tests/kms_ccs: CCS Clear Color
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 04:18:40PM +0200, Mika Kahola wrote:
> The patch proposes a method to test CCS with clear color
> capability.
> 
> The test paints a solid color on primary fb and a small sprite fb.
> These are cleared with fast clear feature. A crc is captured and
> compared against the reference.
> 
> v2: Modify _gen9_render_copyfunc to support fast clear (Matt)
>     Enable fast clear bit on 3D sequence (Matt)
>     Add helper function to figure out clear color modifier (Matt)
> v3: Remove unrelated line additions/removes
> v4: Fast clear with color (Imre)
> v5: Write raw 32-bit color values to register (Imre)
>     Require 32-bit color format
> v6: Rebase to use batchbuffer without libdrm dependency
> v7: Enable clear color (Nanley)
> v8: Various cleanups (Imre)

Too many changes in one patch, please split them to

- lib/intel_aux_pgtable: Add support for creating pagetables for a single buffer
- lib/rendercopy_gen9: Add support for fast clear
- kms_ccs: Add RC-CC subtest

> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  lib/gen8_render.h       |   1 +
>  lib/gen9_render.h       |   6 +-
>  lib/igt_fb.c            |  20 ++++--
>  lib/igt_fb.h            |   3 +
>  lib/intel_batchbuffer.c |  10 +++
>  lib/intel_batchbuffer.h |   6 ++
>  lib/rendercopy.h        |   4 ++
>  lib/rendercopy_gen9.c   | 146 ++++++++++++++++++++++++++++------------
>  tests/kms_ccs.c         |  64 ++++++++++++++++--
>  9 files changed, 203 insertions(+), 57 deletions(-)
> 
> diff --git a/lib/gen8_render.h b/lib/gen8_render.h
> index 31dc01bc..1b0f527e 100644
> --- a/lib/gen8_render.h
> +++ b/lib/gen8_render.h
> @@ -26,6 +26,7 @@
>  
>  # define GEN8_VS_FLOATING_POINT_MODE_ALTERNATE          (1 << 16)
>  
> +#define GEN8_3DSTATE_FAST_CLEAR_ENABLE		(1 << 8)
>  #define GEN8_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP	\
>  						GEN4_3D(3, 0, 0x21)
>  #define GEN8_3DSTATE_PS_BLEND			GEN4_3D(3, 0, 0x4d)
> diff --git a/lib/gen9_render.h b/lib/gen9_render.h
> index 6274e902..cf5bd2d9 100644
> --- a/lib/gen9_render.h
> +++ b/lib/gen9_render.h
> @@ -127,7 +127,11 @@ struct gen9_surface_state {
>  	} ss9;
>  
>  	struct {
> -		uint32_t aux_base_addr;
> +		uint32_t aux_base_addr:20;
> +		uint32_t procedual_texture:1;
> +		uint32_t clearvalue_addr_enable:1;
> +		uint32_t quilt_height:5;
> +		uint32_t quilt_width:5;
>  	} ss10;
>  
>  	struct {
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 43f8c475..422a9e06 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2141,9 +2141,10 @@ static int yuv_semiplanar_bpp(uint32_t drm_format)
>  	}
>  }
>  
> -static struct intel_buf *create_buf(struct fb_blit_upload *blit,
> -				   const struct igt_fb *fb,
> -				   const char *name)
> +struct intel_buf *
> +igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
> +			const struct igt_fb *fb,
> +			const char *name)
>  {
>  	struct intel_buf *buf;
>  	uint32_t bo_name, handle, compression;
> @@ -2169,10 +2170,10 @@ static struct intel_buf *create_buf(struct fb_blit_upload *blit,
>  		compression = I915_COMPRESSION_NONE;
>  	}
>  
> -	bo_name = gem_flink(blit->fd, fb->gem_handle);
> -	handle = gem_open(blit->fd, bo_name);
> +	bo_name = gem_flink(fd, fb->gem_handle);
> +	handle = gem_open(fd, bo_name);
>  
> -	buf = intel_buf_create_using_handle(blit->bops, handle,
> +	buf = intel_buf_create_using_handle(bops, handle,
>  					    fb->width, fb->height,
>  					    fb->plane_bpp[0], 0,
>  					    igt_fb_mod_to_tiling(fb->modifier),
> @@ -2213,6 +2214,13 @@ static struct intel_buf *create_buf(struct fb_blit_upload *blit,
>  	return buf;
>  }
>  
> +static struct intel_buf *create_buf(struct fb_blit_upload *blit,
> +				   const struct igt_fb *fb,
> +				   const char *name)
> +{
> +	return igt_fb_create_intel_buf(blit->fd, blit->bops, fb, name);
> +}
> +
>  static void fini_buf(struct intel_buf *buf)
>  {
>  	intel_buf_destroy(buf);
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index b36db965..bc5b8fa0 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -39,6 +39,7 @@
>  
>  #include "igt_color_encoding.h"
>  #include "igt_debugfs.h"
> +#include "intel_bufops.h"
>  
>  /*
>   * Internal format to denote a buffer compatible with pixman's
> @@ -129,6 +130,8 @@ igt_create_fb_with_bo_size(int fd, int width, int height,
>  			   enum igt_color_range color_range,
>  			   struct igt_fb *fb, uint64_t bo_size,
>  			   unsigned bo_stride);
> +struct intel_buf *igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
> +					  const struct igt_fb *fb, const char *name);
>  unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
>  			   uint64_t modifier, struct igt_fb *fb);
>  unsigned int igt_create_color_fb(int fd, int width, int height,
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index fc73495c..905f69ff 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1096,6 +1096,16 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
>  	return copy;
>  }
>  
> +igt_render_clearfunc_t igt_get_render_clearfunc(int devid)
> +{
> +	igt_render_clearfunc_t clear = NULL;

No need for a variable.

> +
> +	if (IS_GEN12(devid))
> +		clear = gen12_render_clearfunc;
> +
> +	return clear;
> +}
> +
>  /**
>   * igt_get_media_fillfunc:
>   * @devid: pci device id
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index ab1b0c28..5d996ddf 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -374,6 +374,12 @@ typedef void (*igt_vebox_copyfunc_t)(struct intel_bb *ibb,
>  
>  igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid);
>  
> +typedef void (*igt_render_clearfunc_t)(struct intel_bb *ibb,
> +				       struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
> +				       unsigned int width, unsigned int height,
> +				       float cc_color[4]);
> +igt_render_clearfunc_t igt_get_render_clearfunc(int devid);
> +
>  /**
>   * igt_fillfunc_t:
>   * @i915: drm fd
> diff --git a/lib/rendercopy.h b/lib/rendercopy.h
> index 7d5f0802..dd2e1c43 100644
> --- a/lib/rendercopy.h
> +++ b/lib/rendercopy.h
> @@ -23,6 +23,10 @@ static inline void emit_vertex_normalized(struct intel_bb *ibb,
>  	intel_bb_out(ibb, u.ui);
>  }
>  
> +void gen12_render_clearfunc(struct intel_bb *ibb,
> +			    struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
> +			    unsigned int width, unsigned int height,
> +			    float clear_color[4]);
>  void gen12_render_copyfunc(struct intel_bb *ibb,
>  			   struct intel_buf *src, uint32_t src_x, uint32_t src_y,
>  			   uint32_t width, uint32_t height,
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index ef6855c9..73272085 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -188,20 +188,12 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst) {
>  							   buf->ccs[0].offset,
>  							   intel_bb_offset(ibb) + 4 * 10,
>  							   buf->addr.offset);
> -		ss->ss10.aux_base_addr = (address + buf->ccs[0].offset);
> -		ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
> -	}
> -
> -	if (buf->cc.offset) {
> -		igt_assert(buf->compression == I915_COMPRESSION_RENDER);
> +		if (buf->cc.offset) {
> +			ss->ss10.aux_base_addr = (address + buf->ccs[0].offset);

aux needs to get setup for the !buf->cc.offset case as well.

> +			ss->ss10.clearvalue_addr_enable = 1;

This will also need to get or'd into the aux addr relocation delta.

> +			ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
>  
> -		address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> -							   read_domain, write_domain,
> -							   buf->cc.offset,
> -							   intel_bb_offset(ibb) + 4 * 12,
> -							   buf->addr.offset);
> -		ss->ss12.clear_address = address + buf->cc.offset;
> -		ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;

The above shouldn't be removed.

> +		}
>  	}
>  
>  	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*ss));
> @@ -218,7 +210,9 @@ gen8_bind_surfaces(struct intel_bb *ibb,
>  	binding_table_offset = intel_bb_ptr_add_return_prev_offset(ibb, 32);
>  
>  	binding_table[0] = gen8_bind_buf(ibb, dst, 1);
> -	binding_table[1] = gen8_bind_buf(ibb, src, 0);
> +
> +	if (src != NULL)
> +		binding_table[1] = gen8_bind_buf(ibb, src, 1);
>  
>  	return binding_table_offset;
>  }
> @@ -274,16 +268,39 @@ gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
>  	offset = intel_bb_offset(ibb);
>  
>  	emit_vertex_2s(ibb, dst_x + width, dst_y + height);

Missing scaling for the fast clear case.

> -	emit_vertex_normalized(ibb, src_x + width, intel_buf_width(src));
> -	emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
> +
> +	if (src == NULL) {
> +		dst_x /= 64;
> +		dst_y /= 16;
> +	}

Correcty you need to scale the whole sum of dst_y + height for instance,
also rounding up when needed. Probably better to emit all the vertices
in one if branch for the copy case and all the scaled vertices and 0
place holders for the fast clear case in the else branch.  Please also
add a comment that src == NULL is a fast clear.

> +
> +	if (src != NULL) {
> +		emit_vertex_normalized(ibb, src_x + width, intel_buf_width(src));
> +		emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
> +	} else {
> +		emit_vertex_normalized(ibb, 0, 0);

Just emit_vertex(ibb, 0);

> +		emit_vertex_normalized(ibb, 0, 0);
> +	}
>  
>  	emit_vertex_2s(ibb, dst_x, dst_y + height);
> -	emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
> -	emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
> +
> +	if (src != NULL) {
> +		emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
> +		emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
> +	} else {
> +		emit_vertex_normalized(ibb, 0, 0);
> +		emit_vertex_normalized(ibb, 0, 0);
> +	}
>  
>  	emit_vertex_2s(ibb, dst_x, dst_y);
> -	emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
> -	emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
> +
> +	if (src != NULL) {
> +		emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
> +		emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
> +	} else {
> +		emit_vertex_normalized(ibb, 0, 0);
> +		emit_vertex_normalized(ibb, 0, 0);
> +	}
>  
>  	return offset;
>  }
> @@ -729,7 +746,7 @@ gen8_emit_sf(struct intel_bb *ibb)
>  }
>  
>  static void
> -gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel) {
> +gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
>  	const int max_threads = 63;
>  
>  	intel_bb_out(ibb, GEN6_3DSTATE_WM | (2 - 2));
> @@ -753,10 +770,16 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel) {
>  	intel_bb_out(ibb, GEN7_3DSTATE_PS | (12-2));
>  	intel_bb_out(ibb, kernel);
>  	intel_bb_out(ibb, 0); /* kernel hi */
> -	intel_bb_out(ibb, 1 << GEN6_3DSTATE_WM_SAMPLER_COUNT_SHIFT |
> -		     2 << GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
> +
> +	if (fast_clear)
> +		intel_bb_out(ibb, 1)

				1 << GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT

> +	else
> +		intel_bb_out(ibb, 1 << GEN6_3DSTATE_WM_SAMPLER_COUNT_SHIFT |
> +			     2 << GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
> +
>  	intel_bb_out(ibb, 0); /* scratch space stuff */
>  	intel_bb_out(ibb, 0); /* scratch hi */
> +

Extra w/s.

>  	intel_bb_out(ibb, (max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
>  		     GEN6_3DSTATE_WM_16_DISPATCH_ENABLE);
>  	intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT);
> @@ -765,6 +788,9 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel) {
>  	intel_bb_out(ibb, 0); // kernel 2
>  	intel_bb_out(ibb, 0); /* kernel 2 hi */
>  
> +	if (fast_clear)
> +		intel_bb_out(ibb, GEN8_3DSTATE_FAST_CLEAR_ENABLE);

Still in the wrong dword, should be or'd to the
max_threads/wm_16_dispatch enabling value.

> +
>  	intel_bb_out(ibb, GEN8_3DSTATE_PS_BLEND | (2 - 2));
>  	intel_bb_out(ibb, GEN8_PS_BLEND_HAS_WRITEABLE_RT);
>  
> @@ -876,27 +902,31 @@ static void gen8_emit_primitive(struct intel_bb *ibb, uint32_t offset)
>  #define BATCH_STATE_SPLIT 2048
>  
>  static
> -void _gen9_render_copyfunc(struct intel_bb *ibb,
> -			   struct intel_buf *src,
> -			   unsigned int src_x, unsigned int src_y,
> -			   unsigned int width, unsigned int height,
> -			   struct intel_buf *dst,
> -			   unsigned int dst_x, unsigned int dst_y,
> -			   struct intel_buf *aux_pgtable_buf,
> -			   const uint32_t ps_kernel[][4],
> -			   uint32_t ps_kernel_size)
> +void _gen9_render_op(struct intel_bb *ibb,
> +		     struct intel_buf *src,
> +		     unsigned int src_x, unsigned int src_y,
> +		     unsigned int width, unsigned int height,
> +		     struct intel_buf *dst,
> +		     unsigned int dst_x, unsigned int dst_y,
> +		     struct intel_buf *aux_pgtable_buf,
> +		     const uint32_t ps_kernel[][4],
> +		     uint32_t ps_kernel_size)
>  {
>  	uint32_t ps_sampler_state, ps_kernel_off, ps_binding_table;
>  	uint32_t scissor_state;
>  	uint32_t vertex_buffer;
>  	uint32_t aux_pgtable_state;
> +	bool fast_clear = src != NULL;

	bool fast_clear = !src;

>  
> -	igt_assert(src->bpp == dst->bpp);
> +	if (src != NULL)
> +		igt_assert(src->bpp == dst->bpp);
>  
>  	intel_bb_flush_render(ibb);
>  
>  	intel_bb_add_intel_buf(ibb, dst, true);
> -	intel_bb_add_intel_buf(ibb, src, false);
> +
> +	if (!fast_clear)
> +		intel_bb_add_intel_buf(ibb, src, false);
>  
>  	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
>  
> @@ -949,11 +979,13 @@ void _gen9_render_copyfunc(struct intel_bb *ibb,
>  	intel_bb_out(ibb, 0);
>  	intel_bb_out(ibb, 0);
>  
> +	gen8_emit_ps(ibb, ps_kernel_off, fast_clear);

This isn't needed.

> +
>  	gen7_emit_clip(ibb);
>  
>  	gen8_emit_sf(ibb);
>  
> -	gen8_emit_ps(ibb, ps_kernel_off);
> +	gen8_emit_ps(ibb, ps_kernel_off, fast_clear);
>  
>  	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_PS);
>  	intel_bb_out(ibb, ps_binding_table);
> @@ -991,9 +1023,9 @@ void gen9_render_copyfunc(struct intel_bb *ibb,
>  			  unsigned int dst_x, unsigned int dst_y)
>  
>  {
> -	_gen9_render_copyfunc(ibb, src, src_x, src_y,
> -			  width, height, dst, dst_x, dst_y, NULL,
> -			  ps_kernel_gen9, sizeof(ps_kernel_gen9));
> +	_gen9_render_op(ibb, src, src_x, src_y,
> +			width, height, dst, dst_x, dst_y, NULL,
> +			ps_kernel_gen9, sizeof(ps_kernel_gen9));
>  }
>  
>  void gen11_render_copyfunc(struct intel_bb *ibb,
> @@ -1003,9 +1035,9 @@ void gen11_render_copyfunc(struct intel_bb *ibb,
>  			   struct intel_buf *dst,
>  			   unsigned int dst_x, unsigned int dst_y)
>  {
> -	_gen9_render_copyfunc(ibb, src, src_x, src_y,
> -			  width, height, dst, dst_x, dst_y, NULL,
> -			  ps_kernel_gen11, sizeof(ps_kernel_gen11));
> +	_gen9_render_op(ibb, src, src_x, src_y,
> +			width, height, dst, dst_x, dst_y, NULL,
> +			ps_kernel_gen11, sizeof(ps_kernel_gen11));
>  }
>  
>  void gen12_render_copyfunc(struct intel_bb *ibb,
> @@ -1019,11 +1051,37 @@ void gen12_render_copyfunc(struct intel_bb *ibb,
>  
>  	gen12_aux_pgtable_init(&pgtable_info, ibb, src, dst);
>  
> -	_gen9_render_copyfunc(ibb, src, src_x, src_y,
> -			  width, height, dst, dst_x, dst_y,
> -			  pgtable_info.pgtable_buf,
> +	_gen9_render_op(ibb, src, src_x, src_y,
> +			width, height, dst, dst_x, dst_y,
> +			pgtable_info.pgtable_buf,
>  			  gen12_render_copy,
>  			  sizeof(gen12_render_copy));
>  
>  	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
>  }
> +
> +void gen12_render_clearfunc(struct intel_bb *ibb,
> +			    struct intel_buf *dst,
> +			    unsigned int dst_x, unsigned int dst_y,
> +			    unsigned int width, unsigned int height,
> +			    float clear_color[4])
> +{
> +	struct aux_pgtable_info pgtable_info = { };
> +
> +	gen12_aux_pgtable_init(&pgtable_info, ibb, NULL, dst);

Still missing the required change for this in gen12_aux_pgtable_init().

> +
> +	/* BSpec 21136 */
> +	intel_bb_ptr_set(ibb, dst->cc.offset);
> +	intel_bb_out(ibb, clear_color[0]);
> +	intel_bb_out(ibb, clear_color[2]);
> +	intel_bb_out(ibb, clear_color[1]);
> +	intel_bb_out(ibb, clear_color[4]);

This is still not ok, please check the previous review.

> +
> +	_gen9_render_op(ibb, NULL, 0, 0,
> +			width, height, dst, dst_x, dst_y,
> +			pgtable_info.pgtable_buf,
> +			gen12_render_copy,
> +			sizeof(gen12_render_copy));
> +
> +	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
> +}
> diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> index 53abecce..d34bf428 100644
> --- a/tests/kms_ccs.c
> +++ b/tests/kms_ccs.c
> @@ -120,6 +120,16 @@ static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
>  	}
>  }
>  
> +static bool is_ccs_cc_modifier(uint64_t modifier)
> +{
> +	switch (modifier) {
> +	case LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
> +		return true;
> +	default:
> +		return false;
> +	}

No need for a switch for this.

> +}
> +
>  /*
>   * The CCS planes of compressed framebuffers contain non-zero bytes if the
>   * engine compressed effectively the framebuffer. The actual encoding of these
> @@ -134,6 +144,8 @@ static void check_ccs_plane(int drm_fd, igt_fb_t *fb, int plane)
>  	void *ccs_p;
>  	size_t ccs_size;
>  	int i;
> +	uint32_t cc_map[4];
> +	uint32_t native_color;

We don't want to check these for every plane, so needs a
check_ccs_cc_plane() func and called from check_all_ccs_planes() only if
plane == igt_fb_is_gen12_ccs_cc_plane() .


>  
>  	ccs_size = fb->strides[plane] * fb->plane_height[plane];
>  	igt_assert(ccs_size);
> @@ -148,6 +160,17 @@ static void check_ccs_plane(int drm_fd, igt_fb_t *fb, int plane)
>  		if (*(uint32_t *)(ccs_p + i))
>  			break;
>  
> +	memcpy(cc_map, map + fb->offsets[2], 4*sizeof(uint32_t));
> +	igt_assert(colors->r == cc_map[0] &&
> +		   colors->g == cc_map[1] &&
> +		   colors->b == cc_map[2]);

This will do an incorrect type conversion, need to compare float vs.
float. You can use for instance a float/uint32_t union map for both the
above and the native_color check.

Using the global colors ptr here is too arbitrary, it needs to get
passed in a proper func param.

> +
> +	native_color = (uint8_t)(colors->r * 0xff) << 16 |
> +		       (uint8_t)(colors->g * 0xff) << 8 |
> +		       (uint8_t)(colors->b * 0xff);
> +
> +	igt_assert(native_color == cc_map[3]);

It's cc_map[4] that contains the required value.

> +
>  	munmap(map, fb->size);
>  
>  	igt_assert_f(i < ccs_size,
> @@ -160,8 +183,7 @@ static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb)
>  	int i;
>  
>  	for (i = 0; i < fb->num_planes; i++) {
> -		if (igt_fb_is_ccs_plane(fb, i) &&
> -		    !igt_fb_is_gen12_ccs_cc_plane(fb, i))
> +		if (igt_fb_is_ccs_plane(fb, i))
>  			check_ccs_plane(drm_fd, fb, i);
>  	}
>  }
> @@ -176,6 +198,11 @@ static int get_ccs_plane_index(uint32_t format)
>  	return index;
>  }
>  
> +static struct intel_buf *fast_clear_fb(int drm_fd, struct buf_ops *bops, struct igt_fb *fb, const char *name)
> +{
> +	return igt_fb_create_intel_buf(drm_fd, bops, fb, name);
> +}
> +
>  static void generate_fb(data_t *data, struct igt_fb *fb,
>  			int width, int height,
>  			enum test_fb_flags fb_flags)
> @@ -246,10 +273,31 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>  	if (!(data->flags & TEST_BAD_PIXEL_FORMAT)) {
>  		int c = !!data->plane;
>  
> -		cr = igt_get_cairo_ctx(data->drm_fd, fb);
> -		igt_paint_color(cr, 0, 0, width, height,
> -				colors[c].r, colors[c].g, colors[c].b);
> -		igt_put_cairo_ctx(cr);
> +		if (is_ccs_cc_modifier(modifier)) {
> +			float cc_color[4] = {colors[0].r, colors[0].g, colors[0].b, 1.0};
> +			struct intel_bb *ibb = intel_bb_create(data->drm_fd, 4096);
> +			struct buf_ops *bops = buf_ops_create(data->drm_fd);
> +			struct intel_buf *dst = fast_clear_fb(data->drm_fd, bops, fb, "fast clear dst");
> +
> +			gem_set_domain(data->drm_fd, fb->gem_handle,
> +				       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> +
> +			/*
> +			 * We expect the kernel to limit the max fb
> +			 * size/stride to something that can still
> +			 * rendered with the blitter/render engine.
> +			 */

The above is a left-over comment.

> +			 gen12_render_clearfunc(ibb, dst, 0, 0,
> +						fb->width,
> +						fb->height,
> +						cc_color);

	igt_render_clearfunc_t fast_clear = igt_get_render_clearfunc();
	fast_clear(...)

> +			intel_bb_reset(ibb, true);

Instead of reset, we need an intel_bb_sync()/intel_bb_destroy(). Also
missing cleanup for bops and dst.

Please make all the above setup/cleanup be part of fast_clear_fb() as
well.

> +		} else {
> +			cr = igt_get_cairo_ctx(data->drm_fd, fb);
> +			igt_paint_color(cr, 0, 0, width, height,
> +					colors[c].r, colors[c].g, colors[c].b);
> +					igt_put_cairo_ctx(cr);

Wrong indent.

> +		}
>  	}
>  
>  	ret = drmIoctl(data->drm_fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f);
> @@ -349,6 +397,10 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
>  	if (data->flags & TEST_BAD_ROTATION_90)
>  		igt_plane_set_rotation(primary, IGT_ROTATION_90);
>  
> +	if (!is_ccs_cc_modifier(data->ccs_modifier)

	if (is_ccs_cc() && format != XRGB8888)

> +	   && data->format != DRM_FORMAT_XRGB8888)
> +		return false;
> +
>  	ret = igt_display_try_commit2(display, commit);
>  	if (data->flags & TEST_BAD_ROTATION_90) {
>  		igt_assert_eq(ret, -EINVAL);
> -- 
> 2.25.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
