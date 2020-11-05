Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADF76ED27
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2020 13:34:00 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Thu, 5 Nov 2020 13:33:57 +0000
Message-ID: <d600c631c0c0478ab43d96a40d8e4d59@intel.com>
References: <20201023130526.3983076-1-mika.kahola@intel.com>
 <20201023130526.3983076-3-mika.kahola@intel.com>
 <20201102172705.GA3914202@ideak-desk.fi.intel.com>
In-Reply-To: <20201102172705.GA3914202@ideak-desk.fi.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v7 2/2] tests/kms_ccs: CCS Clear Color
 test
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
To: "Deak, Imre" <imre.deak@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Monday, November 2, 2020 7:27 PM
> To: Kahola, Mika <mika.kahola@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t v7 2/2] tests/kms_ccs: CCS Clear Color test
> 
> On Fri, Oct 23, 2020 at 04:05:26PM +0300, Mika Kahola wrote:
> > The patch proposes a method to test CCS with clear color capability.
> >
> > The test paints a solid color on primary fb and a small sprite fb.
> > These are cleared with fast clear feature. A crc is captured and
> > compared against the reference.
> >
> > v2: Modify _gen9_render_copyfunc to support fast clear (Matt)
> >     Enable fast clear bit on 3D sequence (Matt)
> >     Add helper function to figure out clear color modifier (Matt)
> > v3: Remove unrelated line additions/removes
> > v4: Fast clear with color (Imre)
> > v5: Write raw 32-bit color values to register (Imre)
> >     Require 32-bit color format
> > v6: Rebase to use batchbuffer without libdrm dependency
> > v7: Enable clear color (Nanley)
> >
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >  lib/gen8_render.h       |  1 +
> >  lib/gen9_render.h       |  6 ++-
> >  lib/intel_batchbuffer.c | 10 +++++
> >  lib/intel_batchbuffer.h |  6 +++
> >  lib/rendercopy.h        |  4 ++
> >  lib/rendercopy_gen9.c   | 79 ++++++++++++++++++++++++++++------
> >  tests/kms_ccs.c         | 94 ++++++++++++++++++++++++++++++++++++++---
> >  7 files changed, 181 insertions(+), 19 deletions(-)
> >
> > diff --git a/lib/gen8_render.h b/lib/gen8_render.h index
> > 31dc01bc..1b0f527e 100644
> > --- a/lib/gen8_render.h
> > +++ b/lib/gen8_render.h
> > @@ -26,6 +26,7 @@
> >
> >  # define GEN8_VS_FLOATING_POINT_MODE_ALTERNATE          (1 << 16)
> >
> > +#define GEN8_3DSTATE_FAST_CLEAR_ENABLE		(1 << 8)
> >  #define GEN8_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP	\
> >  						GEN4_3D(3, 0, 0x21)
> >  #define GEN8_3DSTATE_PS_BLEND			GEN4_3D(3, 0, 0x4d)
> > diff --git a/lib/gen9_render.h b/lib/gen9_render.h index
> > 6274e902..b4cdf18a 100644
> > --- a/lib/gen9_render.h
> > +++ b/lib/gen9_render.h
> > @@ -131,7 +131,11 @@ struct gen9_surface_state {
> >  	} ss10;
> >
> >  	struct {
> > -		uint32_t aux_base_addr_hi;
> > +		uint32_t aux_base_addr_hi:20;
> > +		uint32_t procedual_texture:1;
> > +		uint32_t clearvalue_addr_enable:1;
> > +		uint32_t quilt_height:5;
> > +		uint32_t quilt_width:5;
> >  	} ss11;
> 
> These are in ss10.
> 
> >
> >  	/* register can be used for either
> > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c index
> > fc73495c..905f69ff 100644
> > --- a/lib/intel_batchbuffer.c
> > +++ b/lib/intel_batchbuffer.c
> > @@ -1096,6 +1096,16 @@ igt_vebox_copyfunc_t
> igt_get_vebox_copyfunc(int devid)
> >  	return copy;
> >  }
> >
> > +igt_render_clearfunc_t igt_get_render_clearfunc(int devid) {
> > +	igt_render_clearfunc_t clear = NULL;
> > +
> > +	if (IS_GEN12(devid))
> > +		clear = gen12_render_clearfunc;
> > +
> > +	return clear;
> > +}
> > +
> >  /**
> >   * igt_get_media_fillfunc:
> >   * @devid: pci device id
> > diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h index
> > ab1b0c28..4f0b33ee 100644
> > --- a/lib/intel_batchbuffer.h
> > +++ b/lib/intel_batchbuffer.h
> > @@ -374,6 +374,12 @@ typedef void (*igt_vebox_copyfunc_t)(struct
> > intel_bb *ibb,
> >
> >  igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid);
> >
> > +typedef void (*igt_render_clearfunc_t)(struct intel_bb *ibb,
> > +				       struct intel_buf *dst, unsigned int dst_x,
> unsigned int dst_y,
> > +				       unsigned int width, unsigned int height,
> > +				       uint32_t r, uint32_t g, uint32_t b);
> 
> The clear value needs to be in float format, so let's pass that in a float[4]
> array.
> 
> > +igt_render_clearfunc_t igt_get_render_clearfunc(int devid);
> > +
> >  /**
> >   * igt_fillfunc_t:
> >   * @i915: drm fd
> > diff --git a/lib/rendercopy.h b/lib/rendercopy.h index
> > 7d5f0802..394fc94e 100644
> > --- a/lib/rendercopy.h
> > +++ b/lib/rendercopy.h
> > @@ -23,6 +23,10 @@ static inline void emit_vertex_normalized(struct
> intel_bb *ibb,
> >  	intel_bb_out(ibb, u.ui);
> >  }
> >
> > +void gen12_render_clearfunc(struct intel_bb *ibb,
> > +                            struct intel_buf *dst, unsigned int dst_x, unsigned int
> dst_y,
> > +                            unsigned int width, unsigned int height,
> > +			    uint32_t r, uint32_t g, uint32_t b);
> >  void gen12_render_copyfunc(struct intel_bb *ibb,
> >  			   struct intel_buf *src, uint32_t src_x, uint32_t src_y,
> >  			   uint32_t width, uint32_t height, diff --git
> > a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c index
> > ef6855c9..fb6f6ba3 100644
> > --- a/lib/rendercopy_gen9.c
> > +++ b/lib/rendercopy_gen9.c
> > @@ -117,7 +117,7 @@ static const uint32_t gen12_render_copy[][4] = {
> >
> >  /* Mostly copy+paste from gen6, except height, width, pitch moved */
> > static uint32_t -gen8_bind_buf(struct intel_bb *ibb, const struct
> > intel_buf *buf, int is_dst) {
> > +gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int
> > +is_dst, bool fast_clear) {
> 
> No need for fast_clear, we need to program the color params whenever
> buf->cc.offset is set (and that's not only for fast clear).
> 
> >  	struct gen9_surface_state *ss;
> >  	uint32_t write_domain, read_domain;
> >  	uint64_t address;
> > @@ -190,6 +190,9 @@ gen8_bind_buf(struct intel_bb *ibb, const struct
> intel_buf *buf, int is_dst) {
> >  							   buf->addr.offset);
> >  		ss->ss10.aux_base_addr = (address + buf->ccs[0].offset);
> >  		ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset)
> >> 32;
> > +
> > +		if (fast_clear)
> > +			ss->ss11.clearvalue_addr_enable = 1;
> >  	}
> >
> >  	if (buf->cc.offset) {
> 
> Let's move this whole cc.offset address programming under the
> I915_COMPRESSION_RENDER branch, where this is actually relevant.
> 
> > @@ -217,8 +220,10 @@ gen8_bind_surfaces(struct intel_bb *ibb,
> >  	binding_table = intel_bb_ptr_align(ibb, 32);
> >  	binding_table_offset = intel_bb_ptr_add_return_prev_offset(ibb,
> 32);
> >
> > -	binding_table[0] = gen8_bind_buf(ibb, dst, 1);
> > -	binding_table[1] = gen8_bind_buf(ibb, src, 0);
> > +	binding_table[0] = gen8_bind_buf(ibb, dst, 1, 1);
> > +
> > +	if (src != NULL)
> > +		binding_table[1] = gen8_bind_buf(ibb, src, 1, 0);
> >
> >  	return binding_table_offset;
> >  }
> > @@ -274,16 +279,25 @@ gen7_fill_vertex_buffer_data(struct intel_bb
> *ibb,
> >  	offset = intel_bb_offset(ibb);
> >
> >  	emit_vertex_2s(ibb, dst_x + width, dst_y + height);
> > -	emit_vertex_normalized(ibb, src_x + width, intel_buf_width(src));
> > -	emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
> > +
> > +	if (src != NULL) {
> > +		emit_vertex_normalized(ibb, src_x + width,
> intel_buf_width(src));
> > +		emit_vertex_normalized(ibb, src_y + height,
> intel_buf_height(src));
> > +	}
> 
> For the !src case you also need to emit the two source vertex elements to
> keep the VUE format we defined in gen6_emit_vertex_elements().

In this case we don't have src, what should we define as source vertex element? Are those src_*, width/height and intel_buf_width/height() just zeros?

Cheers,
Mika


> 
> >
> >  	emit_vertex_2s(ibb, dst_x, dst_y + height);
> > -	emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
> > -	emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
> > +
> > +	if (src != NULL) {
> > +		emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
> > +		emit_vertex_normalized(ibb, src_y + height,
> intel_buf_height(src));
> > +	}
> >
> >  	emit_vertex_2s(ibb, dst_x, dst_y);
> > -	emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
> > -	emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
> > +
> > +	if (src != NULL) {
> > +		emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
> > +		emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
> > +	}
> >
> >  	return offset;
> >  }
> > @@ -729,7 +743,7 @@ gen8_emit_sf(struct intel_bb *ibb)  }
> >
> >  static void
> > -gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel) {
> > +gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear)
> > +{
> >  	const int max_threads = 63;
> >
> >  	intel_bb_out(ibb, GEN6_3DSTATE_WM | (2 - 2)); @@ -757,6 +771,10
> @@
> > gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel) {
> >  		     2 <<
> GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
> 
> There is only 1 table entry in case of a fast clear, and sampler count should
> be also set to 0.
> 
> >  	intel_bb_out(ibb, 0); /* scratch space stuff */
> >  	intel_bb_out(ibb, 0); /* scratch hi */
> > +
> > +	if (fast_clear)
> > +		intel_bb_out(ibb, GEN8_3DSTATE_FAST_CLEAR_ENABLE);
> 
> This flag is set in the next dword.
> 
> > +
> >  	intel_bb_out(ibb, (max_threads - 1) <<
> GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
> >  		     GEN6_3DSTATE_WM_16_DISPATCH_ENABLE);
> >  	intel_bb_out(ibb, 6 <<
> GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT);
> >
> > @@ -890,13 +908,20 @@ void _gen9_render_copyfunc(struct intel_bb
> *ibb,
> 
> Would make sense to rename this to stg like gen9_render_op() as it can be
> either a copy or a fast clear now.
> 
> >  	uint32_t scissor_state;
> >  	uint32_t vertex_buffer;
> >  	uint32_t aux_pgtable_state;
> > +	bool fast_clear = src != NULL ? false : true;
> 
> It's just
> 	bool fast_clear = src != NULL;
> 
> >
> > -	igt_assert(src->bpp == dst->bpp);
> > +	if (src != NULL)
> > +		igt_assert(src->bpp == dst->bpp);
> > +
> > +	if (!fast_clear)
> > +		igt_assert(src->bpp == dst->bpp);
> 
> Redundant check.
> 
> >
> >  	intel_bb_flush_render(ibb);
> >
> >  	intel_bb_add_intel_buf(ibb, dst, true);
> > -	intel_bb_add_intel_buf(ibb, src, false);
> > +
> > +	if (!fast_clear)
> > +		intel_bb_add_intel_buf(ibb, src, false);
> >
> >  	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
> >
> > @@ -949,11 +974,13 @@ void _gen9_render_copyfunc(struct intel_bb
> *ibb,
> >  	intel_bb_out(ibb, 0);
> >  	intel_bb_out(ibb, 0);
> >
> > +	gen8_emit_ps(ibb, ps_kernel_off, fast_clear);
> > +
> >  	gen7_emit_clip(ibb);
> >
> >  	gen8_emit_sf(ibb);
> >
> > -	gen8_emit_ps(ibb, ps_kernel_off);
> > +	gen8_emit_ps(ibb, ps_kernel_off, fast_clear);
> >
> >  	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_PS);
> >  	intel_bb_out(ibb, ps_binding_table); @@ -1027,3 +1054,29 @@ void
> > gen12_render_copyfunc(struct intel_bb *ibb,
> >
> >  	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);  }
> 
> Before returning we also need PIPE_CONTROL(render_target_cache_flush,
> l3_fabric_flush and depth_stall) see BSpec/47112.
> 
> > +
> > +void gen12_render_clearfunc(struct intel_bb *ibb,
> > +			    struct intel_buf *dst,
> > +			    unsigned int dst_x, unsigned int dst_y,
> > +			    unsigned int width, unsigned int height,
> > +			    uint32_t r, uint32_t g, uint32_t b) {
> > +	struct aux_pgtable_info pgtable_info = { };
> > +
> > +	gen12_aux_pgtable_init(&pgtable_info, ibb, NULL, dst);
> 
> The above expects both src and dst to be set, so you need to add support for
> the dst only case there.
> 
> > +
> > +	/* BSpec 21136 */
> > +	intel_bb_ptr_set(ibb, dst->cc.offset);
> 
> The above sets a pointer inside the ibb, but cc.offset is an offset in dst. Also
> these emitted values would be overwritten by the following batchbuffer
> initing in _gen9_render_copyfunc() and it's missing the reloc info.
> 
> Let's pass the float[4] clear value to _gen9_render_copyfunc() and do an
> MI_STORE_DWORD_IMM+reloc emit for each of the clear value members
> after gen12_emit_aux_pgtable_state() in _gen9_render_copyfunc().
> 
> > +	intel_bb_out(ibb, r);
> > +	intel_bb_out(ibb, b);
> > +	intel_bb_out(ibb, g);
> > +	intel_bb_out(ibb, 0xffffffff);
> > +
> > +	_gen9_render_copyfunc(ibb, NULL, 0, 0,
> > +			  width, height, dst, dst_x, dst_y,
> > +			  pgtable_info.pgtable_buf,
> > +			  gen12_render_copy,
> > +			  sizeof(gen12_render_copy));
> > +
> > +	gen12_aux_pgtable_cleanup(ibb, &pgtable_info); }
> > diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c index
> > 53abecce..fac1ed4e 100644
> > --- a/tests/kms_ccs.c
> > +++ b/tests/kms_ccs.c
> > @@ -50,10 +50,12 @@ enum test_fb_flags {
> >  	FB_MISALIGN_AUX_STRIDE		= 1 << 2,
> >  	FB_SMALL_AUX_STRIDE		= 1 << 3,
> >  	FB_ZERO_AUX_STRIDE		= 1 << 4,
> > +	FB_CLEAR_COLOR			= 1 << 5,
> 
> No need for a new flag, we can pick the fast clear path based on the RC-CC
> modifier.
> 
> >  };
> >
> >  typedef struct {
> >  	int drm_fd;
> > +	int devid;
> >  	igt_display_t display;
> >  	igt_output_t *output;
> >  	enum pipe pipe;
> > @@ -62,6 +64,11 @@ typedef struct {
> >  	igt_pipe_crc_t *pipe_crc;
> >  	uint32_t format;
> >  	uint64_t ccs_modifier;
> > +	struct igt_fb primary_fb;
> > +	igt_plane_t *primary;
> > +	igt_render_clearfunc_t fast_clear;
> > +	struct buf_ops *bops;
> > +	struct intel_bb *ibb;
> 
> Th above don't need to be cached here, we'll do a fast clear at a single spot,
> so can get all these values there locally.
> 
> >  } data_t;
> >
> >  static const struct {
> > @@ -120,6 +127,16 @@ static void addfb_init(struct igt_fb *fb, struct
> drm_mode_fb_cmd2 *f)
> >  	}
> >  }
> >
> > +static bool is_ccs_cc_modifier(uint64_t modifier) {
> > +	switch (modifier) {
> > +	case LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> >  /*
> >   * The CCS planes of compressed framebuffers contain non-zero bytes if
> the
> >   * engine compressed effectively the framebuffer. The actual encoding
> > of these @@ -290,6 +307,32 @@ static igt_plane_t
> *compatible_main_plane(data_t *data)
> >  	return igt_output_get_plane_type(data->output,
> > DRM_PLANE_TYPE_PRIMARY);  }
> >
> > +static struct intel_buf *init_buf(data_t *data, const struct igt_fb
> > +*fb, const char *buf_name) {
> > +	struct intel_buf *buf;
> > +	uint32_t name, handle, tiling, stride, width, height, bpp, size;
> > +
> > +	igt_assert_eq(fb->offsets[0], 0);
> > +	tiling = igt_fb_mod_to_tiling(fb->modifier);
> > +	stride = fb->strides[0];
> > +	bpp = fb->plane_bpp[0];
> > +	size = fb->size;
> > +	width = stride / (bpp / 8);
> > +	height = size / stride;
> > +	name = gem_flink(data->drm_fd, fb->gem_handle);
> > +	handle = gem_open(data->drm_fd, name);
> > +	buf = intel_buf_create_using_handle(data->bops, handle, width,
> > +height, bpp, 0, tiling, 0);
> 
> This won't setup any of the compression state, so instead of init_buf() let's
> instead add a fast_clear_fb() func here and call a new exported
> 
> 	struct intel_buf *
> 	igt_fb_create_intel_buf(int drm_fd, struct buf_ops *,
> 				const struct igt_fb *, const char *name);
> 
> function from lib/igt_fb.c, which calls lib/igt_fb.c/crate_buf() internally.
> 
> 
> > +        intel_buf_set_name(buf, buf_name);
> > +        intel_buf_set_ownership(buf, true);
> > +
> > +        return buf;
> > +}
> > +
> > +static void fini_buf(struct intel_buf *buf) {
> > +	intel_buf_destroy(buf);
> > +}
> > +
> >  static bool try_config(data_t *data, enum test_fb_flags fb_flags,
> >  		       igt_crc_t *crc)
> >  {
> > @@ -349,6 +392,37 @@ static bool try_config(data_t *data, enum
> test_fb_flags fb_flags,
> >  	if (data->flags & TEST_BAD_ROTATION_90)
> >  		igt_plane_set_rotation(primary, IGT_ROTATION_90);
> >
> > +	if (fb_flags & FB_CLEAR_COLOR) {
> > +		struct intel_buf *dst;
> > +
> > +		/* require 32-bit bpp for a fast clear test */
> > +		igt_skip_on(data->primary_fb.plane_bpp[0] != 32);
> 
> This should be just a
> 
> 	if (!ccs_cc_modifier && format != XRGB8888)
> 		return false;
> 
> early return to avoid the overhead up to this point in the func.
> 
> > +
> > +		data->ibb = intel_bb_create(data->drm_fd, 4096);
> > +		data->bops = buf_ops_create(data->drm_fd);
> > +
> > +		dst = init_buf(data, &data->primary_fb, "fast clear dst");
> > +		gem_set_domain(data->drm_fd, data-
> >primary_fb.gem_handle,
> > +			       I915_GEM_DOMAIN_GTT,
> I915_GEM_DOMAIN_GTT);
> > +
> > +		/*
> > +		 * We expect the kernel to limit the max fb
> > +		 * size/stride to something that can still
> > +		 * rendered with the blitter/render engine.
> > +		 */
> > +		data->fast_clear(data->ibb, dst, 0, 0,
> > +				 data->primary_fb.width,
> > +				 data->primary_fb.height,
> > +				 colors[0].r*UINT32_MAX,
> > +				 colors[0].g*UINT32_MAX,
> > +				 colors[0].b*UINT32_MAX);
> > +
> > +		fini_buf(dst);
> > +		intel_bb_reset(data->ibb, true);
> 
> All the above belongs to generate_fb() as an alternative path for the cairo fill
> there (in the !TEST_BAD_PIXEL_FORMAT branch for the RC-CC modifier case).
> 
> > +
> > +		return true;
> 
> Stray return.
> 
> > +	}
> > +
> >  	ret = igt_display_try_commit2(display, commit);
> >  	if (data->flags & TEST_BAD_ROTATION_90) {
> >  		igt_assert_eq(ret, -EINVAL);
> > @@ -386,10 +460,18 @@ static int test_ccs(data_t *data)
> >  	if (data->flags & TEST_CRC) {
> >  		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data-
> >pipe,
> > INTEL_PIPE_CRC_SOURCE_AUTO);
> >
> > -		if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
> > -		    try_config(data, fb_flags, &crc)) {
> > -			igt_assert_crc_equal(&crc, &ref_crc);
> > -			valid_tests++;
> > +		if (is_ccs_cc_modifier(data->ccs_modifier)) {
> > +			if (try_config(data, fb_flags | FB_COMPRESSED,
> &ref_crc) &&
> > +			    try_config(data, fb_flags | FB_COMPRESSED |
> FB_CLEAR_COLOR, &crc)) {
> > +				igt_assert_crc_equal(&crc, &ref_crc);
> > +				valid_tests++;
> > +			}
> > +		} else {
> > +			if (try_config(data, fb_flags | FB_COMPRESSED,
> &ref_crc) &&
> > +			    try_config(data, fb_flags, &crc)) {
> > +				igt_assert_crc_equal(&crc, &ref_crc);
> > +				valid_tests++;
> > +			}
> 
> We can keep this function as-is, and just depend on the RC-CC modifier the
> pick the fast clear path in try_config().
> 
> 
> Please also add a check_ccs_cc_plane() which will check if the fast_clear
> func() programmed the clear values properly and that the render engine
> generated the native surface format value 16 bytes above the dst.cc_offset
> area. The check should be something like
> 
> 	uint32_t *cc_val = cc_map;
> 
> 	igt_assert(color->r == cc_map[0] &&
> 	           color->g == cc_map[1] &&
> 		   color->b == cc_map[2]);
> 
> 	native_color = (uint8_t)(color->r * 0xff) << 16 |
> 		       (uint8_t)(color->g * 0xff) << 8 |
> 		       (uint8_t)(color->b * 0xff);
> 
> 	igt_assert(native_color == cc_map[4]);
> 
> >  		}
> >
> >  		igt_pipe_crc_free(data->pipe_crc);
> > @@ -471,11 +553,13 @@ igt_main_args("c", NULL, help_str, opt_handler,
> NULL)
> >  	igt_fixture {
> >  		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> >
> > -		igt_require(intel_gen(intel_get_drm_devid(data.drm_fd)) >=
> 9);
> > +		data.devid = intel_gen(intel_get_drm_devid(data.drm_fd));
> > +		igt_require(data.devid >= 9);
> >  		kmstest_set_vt_graphics_mode();
> >  		igt_require_pipe_crc(data.drm_fd);
> >
> >  		igt_display_require(&data.display, data.drm_fd);
> > +		data.fast_clear = igt_get_render_clearfunc(data.devid);
> 
> No need to cache this in data, we can use it locally at the single spot it's
> needed.
> 
> >  	}
> >
> >  	for_each_pipe_static(pipe) {
> > --
> > 2.25.1
> >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
