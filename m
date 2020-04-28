Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5944589FAD
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2020 08:27:57 +0000 (UTC)
Date: Tue, 28 Apr 2020 11:24:40 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20200428082440.GA13964@intel.com>
References: <20200427080601.19785-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200427080601.19785-1-mika.kahola@intel.com>
Subject: Re: [igt-dev] [RFC PATCH i-g-t] tests/kms_ccs: CCS Clear Color test
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 27, 2020 at 11:06:01AM +0300, Mika Kahola wrote:
> This is a RFC patch that proposes to test CCS clear color
> capability.
> 
> Especially, comments related to clearing a solid color are
> welcomed as the clearfunc as it is presented here is inspired
> by rendercopy function and therefore the order might need some
> tweaking.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  lib/igt_fb.c            |  29 +++++++++
>  lib/intel_batchbuffer.c |  10 +++
>  lib/intel_batchbuffer.h |   6 ++
>  lib/rendercopy.h        |   4 ++
>  lib/rendercopy_gen9.c   | 132 ++++++++++++++++++++++++++++++++++++++++
>  tests/kms_ccs.c         |  16 ++++-
>  6 files changed, 196 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 5ed586e7..6d72b6cf 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -481,6 +481,11 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>  	}
>  }
>  
> +static bool is_gen12_cc_ccs_modifier(uint64_t modifier)
> +{
> +	return modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
> +}
> +
>  static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
>  {
>  	return modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS;
> @@ -2146,6 +2151,26 @@ static bool use_vebox_copy(const struct igt_fb *src_fb,
>  	       igt_format_is_yuv(dst_fb->drm_format);
>  }
>  
> +static void clear_fb_with_engine(const struct igt_fb *dst_fb, uint32_t color)
> +{
> +	struct igt_buf dst;
> +	drm_intel_bufmgr *bufmgr;
> +	struct intel_batchbuffer *batch;
> +	igt_render_clearfunc_t render_clear = NULL;
> +	int devid = intel_get_drm_devid(dst_fb->fd);
> +
> +	render_clear = igt_get_render_clearfunc(devid);
> +
> +	bufmgr = drm_intel_bufmgr_gem_init(dst_fb->fd, 4096);
> +	batch = intel_batchbuffer_alloc(bufmgr, devid);
> +
> +	render_clear(batch,
> +		     &dst,
> +		     0, 0,
> +		     dst_fb->plane_width[0], dst_fb->plane_height[0],
> +		     color);
> +}
> +
>  /**
>   * copy_with_engine:
>   * @blit: context for the copy operation
> @@ -2185,6 +2210,8 @@ static void copy_with_engine(struct fb_blit_upload *blit,
>  		vebox_copy(blit->batch, &src,
>  			   dst_fb->plane_width[0], dst_fb->plane_height[0],
>  			   &dst);
> +	else if (is_gen12_cc_ccs_modifier(dst_fb->modifier))
> +		clear_fb_with_engine(dst_fb, 0x0000ff);
>  	else
>  		render_copy(blit->batch, NULL,
>  			    &src,
> @@ -2337,6 +2364,8 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
>  
>  		if (blit->batch)
>  			copy_with_engine(blit, &linear->fb, fb);
> +		else if (is_gen12_cc_ccs_modifier(fb->modifier))
> +			clear_fb_with_engine(&linear->fb, 0x0000ff);
>  		else
>  			blitcopy(&linear->fb, fb);
>  
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index f1a45b47..fb5b49a4 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1090,6 +1090,16 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
>  	return copy;
>  }
>  
> +igt_render_clearfunc_t igt_get_render_clearfunc(int devid)
> +{
> +	igt_render_clearfunc_t clear = NULL;
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
> index 442f3a18..fe831575 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -367,6 +367,12 @@ typedef void (*igt_vebox_copyfunc_t)(struct intel_batchbuffer *batch,
>  
>  igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid);
>  
> +typedef void (*igt_render_clearfunc_t)(struct intel_batchbuffer *batch,
> +				       const struct igt_buf *dst, unsigned dst_x, unsigned dst_y,
> +				       unsigned width, unsigned height,
> +				       uint32_t color);
> +igt_render_clearfunc_t igt_get_render_clearfunc(int devid);
> +
>  /**
>   * igt_fillfunc_t:
>   * @batch: batchbuffer object
> diff --git a/lib/rendercopy.h b/lib/rendercopy.h
> index e0577cac..e75a1def 100644
> --- a/lib/rendercopy.h
> +++ b/lib/rendercopy.h
> @@ -23,6 +23,10 @@ static inline void emit_vertex_normalized(struct intel_batchbuffer *batch,
>  	OUT_BATCH(u.ui);
>  }
>  
> +void gen12_render_clearfunc(struct intel_batchbuffer *batch,
> +			    const struct igt_buf *dst, unsigned dst_x, unsigned dst_y,
> +			    unsigned width, unsigned height,
> +			    uint32_t color);
>  void gen12_render_copyfunc(struct intel_batchbuffer *batch,
>  			   drm_intel_context *context,
>  			   const struct igt_buf *src, unsigned src_x, unsigned src_y,
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 85ae4cab..b82b6c94 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -1110,6 +1110,120 @@ void _gen9_render_copyfunc(struct intel_batchbuffer *batch,
>  	intel_batchbuffer_reset(batch);
>  }
>  
> +static
> +void _gen12_render_clearfunc(struct intel_batchbuffer *batch,
> +			     drm_intel_context *context,
> +			     const struct igt_buf *dst, unsigned dst_x,
> +			     unsigned dst_y, unsigned width, unsigned height,
> +			     drm_intel_bo *aux_pgtable_bo,
> +			     const uint32_t ps_kernel[][4],
> +			     uint32_t ps_kernel_size)
> +{
> +	uint32_t ps_sampler_state, ps_kernel_off;
> +	uint32_t scissor_state;
> +	uint32_t vertex_buffer;
> +	uint32_t batch_end;
> +	uint32_t aux_pgtable_state;
> +
> +	intel_batchbuffer_flush_with_context(batch, context);
> +
> +	intel_batchbuffer_align(batch, 8);
> +
> +	batch->ptr = &batch->buffer[BATCH_STATE_SPLIT];
> +
> +	annotation_init(&aub_annotations);
> +
> +	ps_sampler_state  = gen8_create_sampler(batch);
> +	ps_kernel_off = gen8_fill_ps(batch, ps_kernel, ps_kernel_size);
> +	vertex_buffer = gen7_fill_vertex_buffer_data(batch, NULL,
> +						     0, 0,
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
> +	/* TODO: there is other state which isn't setup */
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
> +	gen8_emit_ps(batch, ps_kernel_off);
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
>  void gen9_render_copyfunc(struct intel_batchbuffer *batch,
>  			  drm_intel_context *context,
>  			  const struct igt_buf *src, unsigned src_x, unsigned src_y,
> @@ -1153,3 +1267,21 @@ void gen12_render_copyfunc(struct intel_batchbuffer *batch,
>  
>  	gen12_aux_pgtable_cleanup(&pgtable_info);
>  }
> +
> +void gen12_render_clearfunc(struct intel_batchbuffer *batch,
> +			    const struct igt_buf *dst, unsigned dst_x, unsigned dst_y,
> +			    unsigned width, unsigned height,
> +			    uint32_t color)
> +{
> +	struct aux_pgtable_info pgtable_info = { };
> +
> +	gen12_aux_pgtable_init(&pgtable_info, batch->bufmgr, NULL, dst);
> +
> +	_gen12_render_clearfunc(batch, NULL,
> +				dst, dst_x, dst_y, 0, 0,
> +				pgtable_info.pgtable_bo,
> +				gen12_render_copy,
> +				sizeof(gen12_render_copy));
> +
> +	gen12_aux_pgtable_cleanup(&pgtable_info);
> +}

Is it intentional or TODO that currently the color parameter is actually not used here,
despite being declared?

Stan

> diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> index bc34aec5..3d3a5b1b 100644
> --- a/tests/kms_ccs.c
> +++ b/tests/kms_ccs.c
> @@ -38,6 +38,7 @@ enum test_flags {
>  	TEST_NO_AUX_BUFFER		= 1 << 5,
>  	TEST_BAD_CCS_HANDLE		= 1 << 6,
>  	TEST_BAD_AUX_STRIDE		= 1 << 7,
> +	TEST_CLEAR_COLOR                = 1 << 8,
>  };
>  
>  #define TEST_FAIL_ON_ADDFB2 \
> @@ -249,6 +250,13 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>  		igt_put_cairo_ctx(data->drm_fd, fb, cr);
>  	}
>  
> +	if (data->flags & TEST_CLEAR_COLOR) {
> +		cr = igt_get_cairo_ctx(data->drm_fd, fb);
> +		igt_paint_color(cr, 0, 0, width, height,
> +				colors[0].r, colors[0].g, colors[0].b);
> +		igt_put_cairo_ctx(data->drm_fd, fb, cr);
> +	}
> +
>  	ret = drmIoctl(data->drm_fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f);
>  	if (data->flags & TEST_FAIL_ON_ADDFB2) {
>  		igt_assert_eq(ret, -1);
> @@ -380,7 +388,8 @@ static int test_ccs(data_t *data)
>  	igt_crc_t crc, ref_crc;
>  	enum test_fb_flags fb_flags = 0;
>  
> -	if (data->flags & TEST_CRC) {
> +	if (data->flags & TEST_CRC ||
> +	    data->flags & TEST_CLEAR_COLOR) {
>  		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
>  
>  		if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
> @@ -530,6 +539,11 @@ igt_main_args("c", NULL, help_str, opt_handler, NULL)
>  		igt_describe("Test with bad AUX stride with given CCS modifier");
>  		igt_subtest_f("pipe-%s-bad-aux-stride", pipe_name)
>  			test_output(&data);
> +
> +		data.flags = TEST_CLEAR_COLOR;
> +		igt_describe("Test clear color with solid red color");
> +		igt_subtest_f("pipe-%s-clear-color", pipe_name)
> +			test_output(&data);
>  	}
>  
>  	igt_fixture
> -- 
> 2.20.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
