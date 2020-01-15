Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE306EAE8
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2020 15:33:42 +0000 (UTC)
Date: Wed, 15 Jan 2020 17:33:36 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200115153336.GD18295@ideak-desk.fi.intel.com>
References: <20200115143813.28958-1-mika.kahola@intel.com>
 <20200115143813.28958-2-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115143813.28958-2-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/rendercopy: Enable render
 target Fast Clear for GEN12
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

On Wed, Jan 15, 2020 at 04:38:12PM +0200, Mika Kahola wrote:
> To test Clear Color plane content, we need to enable
> render target for fast clear.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  lib/gen12_render.h      |   9 ++
>  lib/igt_fb.c            |  13 +++
>  lib/intel_batchbuffer.c |  10 +++
>  lib/intel_batchbuffer.h |   1 +
>  lib/rendercopy.h        |   5 ++
>  lib/rendercopy_gen9.c   | 191 +++++++++++++++++++++++++++++++++++++++-
>  6 files changed, 228 insertions(+), 1 deletion(-)
>  create mode 100644 lib/gen12_render.h
> 
> diff --git a/lib/gen12_render.h b/lib/gen12_render.h
> new file mode 100644
> index 00000000..e70f4c25
> --- /dev/null
> +++ b/lib/gen12_render.h
> @@ -0,0 +1,9 @@
> +#ifndef GEN12_RENDER_H
> +#define GEN12_RENDER_H
> +
> +#include "gen9_render.h"
> +
> +#define GEN12_PS_FAST_CLEAR_ENABLE                     (1 << 8)
> +#define GEN12_PS_FAST_CLEAR_RESOLVE                    (2 << 6)
> +
> +#endif
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index c81b9de8..332f98d8 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -480,6 +480,11 @@ static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
>  	return modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS;
>  }
>  
> +static bool is_gen12_cc_ccs_modifier(uint64_t modifier)
> +{
> +	return modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
> +}
> +
>  static bool is_gen12_ccs_modifier(uint64_t modifier)
>  {
>  	return is_gen12_mc_ccs_modifier(modifier) ||
> @@ -2091,6 +2096,12 @@ static bool use_vebox_copy(const struct igt_fb *src_fb,
>  	       igt_format_is_yuv(dst_fb->drm_format);
>  }
>  
> +static bool use_clear_color_copy(const struct igt_fb *src_fb,
> +				 const struct igt_fb *dst_fb)
> +{
> +	return is_gen12_cc_ccs_modifier(dst_fb->modifier);
> +}
> +
>  /**
>   * copy_with_engine:
>   * @blit: context for the copy operation
> @@ -2115,6 +2126,8 @@ static void copy_with_engine(struct fb_blit_upload *blit,
>  
>  	if (use_vebox_copy(src_fb, dst_fb))
>  		vebox_copy = igt_get_vebox_copyfunc(intel_get_drm_devid(blit->fd));
> +	else if (use_clear_color_copy(src_fb, dst_fb))
> +		render_copy = igt_get_render_cc_copyfunc(intel_get_drm_devid(blit->fd));

We'd need a separate clear function that only clears the FB with a given
color. This is what we need for a RC-CC test in kms_ccs.

For a render copy test we need to add support to the existing render
copy func to read a fast color cleared FB. A test for this can be added
then to gem_render_copy.

>  	else
>  		render_copy = igt_get_render_copyfunc(intel_get_drm_devid(blit->fd));
>  
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 3dc89024..227e854c 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -851,6 +851,16 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int devid)
>  	return copy;
>  }
>  
> +igt_render_copyfunc_t igt_get_render_cc_copyfunc(int devid)
> +{
> +	igt_render_copyfunc_t copy = NULL;
> +
> +	if (IS_GEN12(devid))
> +		copy = gen12_render_cc_copyfunc;
> +
> +	return copy;
> +}
> +
>  igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
>  {
>  	igt_vebox_copyfunc_t copy = NULL;
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index fd7ef03f..d979c9f2 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -320,6 +320,7 @@ typedef void (*igt_render_copyfunc_t)(struct intel_batchbuffer *batch,
>  				      const struct igt_buf *dst, unsigned dst_x, unsigned dst_y);
>  
>  igt_render_copyfunc_t igt_get_render_copyfunc(int devid);
> +igt_render_copyfunc_t igt_get_render_cc_copyfunc(int devid);
>  
>  
>  /**
> diff --git a/lib/rendercopy.h b/lib/rendercopy.h
> index e0577cac..17f5fa94 100644
> --- a/lib/rendercopy.h
> +++ b/lib/rendercopy.h
> @@ -23,6 +23,11 @@ static inline void emit_vertex_normalized(struct intel_batchbuffer *batch,
>  	OUT_BATCH(u.ui);
>  }
>  
> +void gen12_render_cc_copyfunc(struct intel_batchbuffer *batch,
> +			      drm_intel_context * context,
> +			      const struct igt_buf *src, unsigned int src_x, unsigned int src_y,
> +			      unsigned int width, unsigned int height,
> +			      const struct igt_buf *dst, unsigned int dst_x, unsigned int dst_y);
>  void gen12_render_copyfunc(struct intel_batchbuffer *batch,
>  			   drm_intel_context *context,
>  			   const struct igt_buf *src, unsigned src_x, unsigned src_y,
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 835c8d80..af95d2ee 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -20,7 +20,7 @@
>  #include "intel_batchbuffer.h"
>  #include "intel_io.h"
>  #include "rendercopy.h"
> -#include "gen9_render.h"
> +#include "gen12_render.h"
>  #include "intel_reg.h"
>  #include "igt_aux.h"
>  
> @@ -958,6 +958,54 @@ static void gen8_emit_primitive(struct intel_batchbuffer *batch, uint32_t offset
>  	OUT_BATCH(0);	/* index buffer offset, ignored */
>  }
>  
> +static void
> +gen12_emit_ps_cc(struct intel_batchbuffer *batch, uint32_t kernel)
> +{
> +	const int max_threads = 63;
> +
> +	OUT_BATCH(GEN6_3DSTATE_WM | (2 - 2));
> +	OUT_BATCH(/* XXX: I don't understand the BARYCENTRIC stuff, but it
> +		   * appears we need it to put our setup data in the place we
> +		   * expect (g6, see below) */
> +		  GEN8_3DSTATE_PS_PERSPECTIVE_PIXEL_BARYCENTRIC);
> +
> +	OUT_BATCH(GEN6_3DSTATE_CONSTANT_PS | (11-2));
> +	OUT_BATCH(0);
> +	OUT_BATCH(0);
> +	OUT_BATCH(0);
> +	OUT_BATCH(0);
> +	OUT_BATCH(0);
> +	OUT_BATCH(0);
> +	OUT_BATCH(0);
> +	OUT_BATCH(0);
> +	OUT_BATCH(0);
> +	OUT_BATCH(0);
> +
> +	OUT_BATCH(GEN7_3DSTATE_PS | (12-2));
> +	OUT_BATCH(kernel);

A shader kernel isn't used for a fast clear. Would be good to share more
with gen12_emit_ps().

> +	OUT_BATCH(0); /* kernel hi */
> +	OUT_BATCH(1 << GEN6_3DSTATE_WM_SAMPLER_COUNT_SHIFT |
> +		  2 << GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
> +	OUT_BATCH(0); /* scratch space stuff */
> +	OUT_BATCH(0); /* scratch hi */
> +	OUT_BATCH((max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
> +		  GEN6_3DSTATE_WM_16_DISPATCH_ENABLE);
> +	OUT_BATCH(6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT);
> +	OUT_BATCH(0); // kernel 1
> +	OUT_BATCH(0); /* kernel 1 hi */
> +	OUT_BATCH(0); // kernel 2
> +	OUT_BATCH(0); /* kernel 2 hi */
> +	OUT_BATCH(GEN12_PS_FAST_CLEAR_ENABLE);
> +	OUT_BATCH(GEN12_PS_FAST_CLEAR_RESOLVE);
> +
> +	OUT_BATCH(GEN8_3DSTATE_PS_BLEND | (2 - 2));
> +	OUT_BATCH(GEN8_PS_BLEND_HAS_WRITEABLE_RT);
> +
> +	OUT_BATCH(GEN8_3DSTATE_PS_EXTRA | (2 - 2));
> +	OUT_BATCH(GEN8_PSX_PIXEL_SHADER_VALID | GEN8_PSX_ATTRIBUTE_ENABLE);
> +
> +}
> +
>  /* The general rule is if it's named gen6 it is directly copied from
>   * gen6_render_copyfunc.
>   *
> @@ -990,6 +1038,127 @@ static void gen8_emit_primitive(struct intel_batchbuffer *batch, uint32_t offset
>  
>  #define BATCH_STATE_SPLIT 2048
>  
> +static
> +void _gen12_render_cc_copyfunc(struct intel_batchbuffer *batch,
> +			       drm_intel_context *context,
> +			       const struct igt_buf *src, unsigned int src_x,
> +			       unsigned int src_y, unsigned int width, unsigned int height,
> +			       const struct igt_buf *dst, unsigned int dst_x,
> +			       unsigned int dst_y,
> +			       drm_intel_bo *aux_pgtable_bo,
> +			       const uint32_t ps_kernel[][4],
> +			       uint32_t ps_kernel_size)

Would be good to share more with gen12_render_copyfunc() and the clear
color must be passed in and programmed somewhere, maybe in the
gen9_surface_state struct clear color fields.

> +{
> +	uint32_t ps_sampler_state, ps_kernel_off, ps_binding_table;
> +	uint32_t scissor_state;
> +	uint32_t vertex_buffer;
> +	uint32_t batch_end;
> +	uint32_t aux_pgtable_state;
> +
> +	igt_assert(src->bpp == dst->bpp);
> +	intel_batchbuffer_flush_with_context(batch, context);
> +
> +	intel_batchbuffer_align(batch, 8);
> +
> +	batch->ptr = &batch->buffer[BATCH_STATE_SPLIT];
> +
> +	annotation_init(&aub_annotations);
> +
> +	ps_binding_table  = gen8_bind_surfaces(batch, src, dst);
> +	ps_sampler_state  = gen8_create_sampler(batch);
> +	ps_kernel_off = gen8_fill_ps(batch, ps_kernel, ps_kernel_size);
> +	vertex_buffer = gen7_fill_vertex_buffer_data(batch, src,
> +						     src_x, src_y,
> +						     dst_x, dst_y,
> +						     width, height);
> +	cc.cc_state = gen6_create_cc_state(batch);
> +	cc.blend_state = gen8_create_blend_state(batch);
> +	viewport.cc_state = gen6_create_cc_viewport(batch);
> +	viewport.sf_clip_state = gen7_create_sf_clip_viewport(batch);
> +	scissor_state = gen6_create_scissor_rect(batch);
> +
> +	aux_pgtable_state = gen12_create_aux_pgtable_state(batch,
> +							   aux_pgtable_bo);
> +
> +	/* TODO: theree is other state which isn't setup */
> +
> +	assert(batch->ptr < &batch->buffer[4095]);
> +
> +	batch->ptr = batch->buffer;
> +
> +	/* Start emitting the commands. The order roughly follows the mesa blorp
> +	 * order */
> +	OUT_BATCH(G4X_PIPELINE_SELECT | PIPELINE_SELECT_3D |
> +				GEN9_PIPELINE_SELECTION_MASK);
> +
> +	gen12_emit_aux_pgtable_state(batch, aux_pgtable_state, true);
> +
> +	gen8_emit_sip(batch);
> +
> +	gen7_emit_push_constants(batch);
> +
> +	gen9_emit_state_base_address(batch);
> +
> +	OUT_BATCH(GEN7_3DSTATE_VIEWPORT_STATE_POINTERS_CC);
> +	OUT_BATCH(viewport.cc_state);
> +	OUT_BATCH(GEN8_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP);
> +	OUT_BATCH(viewport.sf_clip_state);
> +
> +	gen7_emit_urb(batch);
> +
> +	gen8_emit_cc(batch);
> +
> +	gen8_emit_multisample(batch);
> +
> +	gen8_emit_null_state(batch);
> +
> +	OUT_BATCH(GEN7_3DSTATE_STREAMOUT | (5 - 2));
> +	OUT_BATCH(0);
> +	OUT_BATCH(0);
> +	OUT_BATCH(0);
> +	OUT_BATCH(0);
> +
> +	gen7_emit_clip(batch);
> +
> +	gen8_emit_sf(batch);
> +
> +	gen12_emit_ps_cc(batch, ps_kernel_off);
> +
> +	OUT_BATCH(GEN7_3DSTATE_BINDING_TABLE_POINTERS_PS);
> +	OUT_BATCH(ps_binding_table);
> +
> +	OUT_BATCH(GEN7_3DSTATE_SAMPLER_STATE_POINTERS_PS);
> +	OUT_BATCH(ps_sampler_state);
> +
> +	OUT_BATCH(GEN8_3DSTATE_SCISSOR_STATE_POINTERS);
> +	OUT_BATCH(scissor_state);
> +
> +	gen9_emit_depth(batch);
> +
> +	gen7_emit_clear(batch);
> +
> +	gen6_emit_drawing_rectangle(batch, dst);
> +
> +	gen7_emit_vertex_buffer(batch, vertex_buffer);
> +	gen6_emit_vertex_elements(batch);
> +
> +	gen8_emit_vf_topology(batch);
> +	gen8_emit_primitive(batch, vertex_buffer);
> +
> +	OUT_BATCH(MI_BATCH_BUFFER_END);
> +
> +	batch_end = intel_batchbuffer_align(batch, 8);
> +	assert(batch_end < BATCH_STATE_SPLIT);
> +	annotation_add_batch(&aub_annotations, batch_end);
> +
> +	dump_batch(batch);
> +
> +	annotation_flush(&aub_annotations, batch);
> +
> +	gen6_render_flush(batch, context, batch_end);
> +	intel_batchbuffer_reset(batch);
> +}
> +
>  static
>  void _gen9_render_copyfunc(struct intel_batchbuffer *batch,
>  			  drm_intel_context *context,
> @@ -1154,3 +1323,23 @@ void gen12_render_copyfunc(struct intel_batchbuffer *batch,
>  
>  	gen12_aux_pgtable_cleanup(&pgtable_info);
>  }
> +
> +void gen12_render_cc_copyfunc(struct intel_batchbuffer *batch,
> +			      drm_intel_context *context,
> +			      const struct igt_buf *src, unsigned int src_x, unsigned int src_y,
> +			      unsigned int width, unsigned int height,
> +			      const struct igt_buf *dst, unsigned int dst_x, unsigned int dst_y)
> +
> +{
> +	struct aux_pgtable_info pgtable_info = { };
> +
> +	gen12_aux_pgtable_init(&pgtable_info, batch->bufmgr, src, dst);
> +
> +	_gen12_render_cc_copyfunc(batch, context, src, src_x, src_y,
> +				  width, height, dst, dst_x, dst_y,
> +				  pgtable_info.pgtable_bo,
> +				  gen12_render_copy,
> +				  sizeof(gen12_render_copy));
> +
> +	gen12_aux_pgtable_cleanup(&pgtable_info);
> +}
> -- 
> 2.17.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
