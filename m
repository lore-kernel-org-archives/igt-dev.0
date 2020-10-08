Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F158C6EA2F
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2020 06:32:09 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu,  8 Oct 2020 09:32:02 +0300
Message-Id: <20201008063202.3439128-3-mika.kahola@intel.com>
In-Reply-To: <20201008063202.3439128-1-mika.kahola@intel.com>
References: <20201008063202.3439128-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 2/2] tests/kms_ccs: CCS Clear Color test
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The patch proposes a method to test CCS with clear color
capability.

The test paints a solid color on primary fb and a small sprite fb.
These are cleared with fast clear feature. A crc is captured and
compared against the reference.

v2: Modify _gen9_render_copyfunc to support fast clear (Matt)
    Enable fast clear bit on 3D sequence (Matt)
    Add helper function to figure out clear color modifier (Matt)
v3: Remove unrelated line additions/removes
v4: Fast clear with color (Imre)
v5: Write raw 32-bit color values to register (Imre)
    Require 32-bit color format
v6: Rebase to use batchbuffer without libdrm dependency

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 lib/gen8_render.h       |  1 +
 lib/intel_batchbuffer.c | 10 +++++
 lib/intel_batchbuffer.h |  6 +++
 lib/rendercopy.h        |  4 ++
 lib/rendercopy_gen9.c   | 72 ++++++++++++++++++++++++++-----
 tests/kms_ccs.c         | 94 ++++++++++++++++++++++++++++++++++++++---
 6 files changed, 171 insertions(+), 16 deletions(-)

diff --git a/lib/gen8_render.h b/lib/gen8_render.h
index 31dc01bc..1b0f527e 100644
--- a/lib/gen8_render.h
+++ b/lib/gen8_render.h
@@ -26,6 +26,7 @@
 
 # define GEN8_VS_FLOATING_POINT_MODE_ALTERNATE          (1 << 16)
 
+#define GEN8_3DSTATE_FAST_CLEAR_ENABLE		(1 << 8)
 #define GEN8_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP	\
 						GEN4_3D(3, 0, 0x21)
 #define GEN8_3DSTATE_PS_BLEND			GEN4_3D(3, 0, 0x4d)
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 60dbfe26..b8084297 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1096,6 +1096,16 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
 	return copy;
 }
 
+igt_render_clearfunc_t igt_get_render_clearfunc(int devid)
+{
+	igt_render_clearfunc_t clear = NULL;
+
+	if (IS_GEN12(devid))
+		clear = gen12_render_clearfunc;
+
+	return clear;
+}
+
 /**
  * igt_get_media_fillfunc:
  * @devid: pci device id
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index d20b4e66..f501b615 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -372,6 +372,12 @@ typedef void (*igt_vebox_copyfunc_t)(struct intel_bb *ibb,
 
 igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid);
 
+typedef void (*igt_render_clearfunc_t)(struct intel_bb *ibb,
+				       struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
+				       unsigned int width, unsigned int height,
+				       uint32_t r, uint32_t g, uint32_t b);
+igt_render_clearfunc_t igt_get_render_clearfunc(int devid);
+
 /**
  * igt_fillfunc_t:
  * @i915: drm fd
diff --git a/lib/rendercopy.h b/lib/rendercopy.h
index 7d5f0802..394fc94e 100644
--- a/lib/rendercopy.h
+++ b/lib/rendercopy.h
@@ -23,6 +23,10 @@ static inline void emit_vertex_normalized(struct intel_bb *ibb,
 	intel_bb_out(ibb, u.ui);
 }
 
+void gen12_render_clearfunc(struct intel_bb *ibb,
+                            struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
+                            unsigned int width, unsigned int height,
+			    uint32_t r, uint32_t g, uint32_t b);
 void gen12_render_copyfunc(struct intel_bb *ibb,
 			   struct intel_buf *src, uint32_t src_x, uint32_t src_y,
 			   uint32_t width, uint32_t height,
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index ef6855c9..4db0f455 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -218,7 +218,9 @@ gen8_bind_surfaces(struct intel_bb *ibb,
 	binding_table_offset = intel_bb_ptr_add_return_prev_offset(ibb, 32);
 
 	binding_table[0] = gen8_bind_buf(ibb, dst, 1);
-	binding_table[1] = gen8_bind_buf(ibb, src, 0);
+
+	if (src != NULL)
+		binding_table[1] = gen8_bind_buf(ibb, src, 0);
 
 	return binding_table_offset;
 }
@@ -274,16 +276,25 @@ gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
 	offset = intel_bb_offset(ibb);
 
 	emit_vertex_2s(ibb, dst_x + width, dst_y + height);
-	emit_vertex_normalized(ibb, src_x + width, intel_buf_width(src));
-	emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
+
+	if (src != NULL) {
+		emit_vertex_normalized(ibb, src_x + width, intel_buf_width(src));
+		emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
+	}
 
 	emit_vertex_2s(ibb, dst_x, dst_y + height);
-	emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
-	emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
+
+	if (src != NULL) {
+		emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
+		emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
+	}
 
 	emit_vertex_2s(ibb, dst_x, dst_y);
-	emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
-	emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
+
+	if (src != NULL) {
+		emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
+		emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
+	}
 
 	return offset;
 }
@@ -729,7 +740,7 @@ gen8_emit_sf(struct intel_bb *ibb)
 }
 
 static void
-gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel) {
+gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	const int max_threads = 63;
 
 	intel_bb_out(ibb, GEN6_3DSTATE_WM | (2 - 2));
@@ -757,6 +768,10 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel) {
 		     2 << GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
 	intel_bb_out(ibb, 0); /* scratch space stuff */
 	intel_bb_out(ibb, 0); /* scratch hi */
+
+	if (fast_clear)
+		intel_bb_out(ibb, GEN8_3DSTATE_FAST_CLEAR_ENABLE);
+
 	intel_bb_out(ibb, (max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
 		     GEN6_3DSTATE_WM_16_DISPATCH_ENABLE);
 	intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT);
@@ -890,13 +905,20 @@ void _gen9_render_copyfunc(struct intel_bb *ibb,
 	uint32_t scissor_state;
 	uint32_t vertex_buffer;
 	uint32_t aux_pgtable_state;
+	bool fast_clear = src != NULL ? false : true;
+
+	if (src != NULL)
+		igt_assert(src->bpp == dst->bpp);
 
-	igt_assert(src->bpp == dst->bpp);
+	if (!fast_clear)
+		igt_assert(src->bpp == dst->bpp);
 
 	intel_bb_flush_render(ibb);
 
 	intel_bb_add_intel_buf(ibb, dst, true);
-	intel_bb_add_intel_buf(ibb, src, false);
+
+	if (!fast_clear)
+		intel_bb_add_intel_buf(ibb, src, false);
 
 	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
 
@@ -949,11 +971,13 @@ void _gen9_render_copyfunc(struct intel_bb *ibb,
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
 
+	gen8_emit_ps(ibb, ps_kernel_off, fast_clear);
+
 	gen7_emit_clip(ibb);
 
 	gen8_emit_sf(ibb);
 
-	gen8_emit_ps(ibb, ps_kernel_off);
+	gen8_emit_ps(ibb, ps_kernel_off, fast_clear);
 
 	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_PS);
 	intel_bb_out(ibb, ps_binding_table);
@@ -1027,3 +1051,29 @@ void gen12_render_copyfunc(struct intel_bb *ibb,
 
 	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
 }
+
+void gen12_render_clearfunc(struct intel_bb *ibb,
+			    struct intel_buf *dst,
+			    unsigned int dst_x, unsigned int dst_y,
+			    unsigned int width, unsigned int height,
+			    uint32_t r, uint32_t g, uint32_t b)
+{
+	struct aux_pgtable_info pgtable_info = { };
+
+	gen12_aux_pgtable_init(&pgtable_info, ibb, NULL, dst);
+
+	/* BSpec 21136 */
+	intel_bb_ptr_set(ibb, dst->cc.offset);
+	intel_bb_out(ibb, r);
+	intel_bb_out(ibb, b);
+	intel_bb_out(ibb, g);
+	intel_bb_out(ibb, 0xffffffff);
+
+	_gen9_render_copyfunc(ibb, NULL, 0, 0,
+			  width, height, dst, dst_x, dst_y,
+			  pgtable_info.pgtable_buf,
+			  gen12_render_copy,
+			  sizeof(gen12_render_copy));
+
+	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
+}
diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 53abecce..fac1ed4e 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -50,10 +50,12 @@ enum test_fb_flags {
 	FB_MISALIGN_AUX_STRIDE		= 1 << 2,
 	FB_SMALL_AUX_STRIDE		= 1 << 3,
 	FB_ZERO_AUX_STRIDE		= 1 << 4,
+	FB_CLEAR_COLOR			= 1 << 5,
 };
 
 typedef struct {
 	int drm_fd;
+	int devid;
 	igt_display_t display;
 	igt_output_t *output;
 	enum pipe pipe;
@@ -62,6 +64,11 @@ typedef struct {
 	igt_pipe_crc_t *pipe_crc;
 	uint32_t format;
 	uint64_t ccs_modifier;
+	struct igt_fb primary_fb;
+	igt_plane_t *primary;
+	igt_render_clearfunc_t fast_clear;
+	struct buf_ops *bops;
+	struct intel_bb *ibb;
 } data_t;
 
 static const struct {
@@ -120,6 +127,16 @@ static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
 	}
 }
 
+static bool is_ccs_cc_modifier(uint64_t modifier)
+{
+	switch (modifier) {
+	case LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /*
  * The CCS planes of compressed framebuffers contain non-zero bytes if the
  * engine compressed effectively the framebuffer. The actual encoding of these
@@ -290,6 +307,32 @@ static igt_plane_t *compatible_main_plane(data_t *data)
 	return igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 }
 
+static struct intel_buf *init_buf(data_t *data, const struct igt_fb *fb, const char *buf_name)
+{
+	struct intel_buf *buf;
+	uint32_t name, handle, tiling, stride, width, height, bpp, size;
+
+	igt_assert_eq(fb->offsets[0], 0);
+	tiling = igt_fb_mod_to_tiling(fb->modifier);
+	stride = fb->strides[0];
+	bpp = fb->plane_bpp[0];
+	size = fb->size;
+	width = stride / (bpp / 8);
+	height = size / stride;
+	name = gem_flink(data->drm_fd, fb->gem_handle);
+	handle = gem_open(data->drm_fd, name);
+	buf = intel_buf_create_using_handle(data->bops, handle, width, height, bpp, 0, tiling, 0);
+        intel_buf_set_name(buf, buf_name);
+        intel_buf_set_ownership(buf, true);
+
+        return buf;
+}
+
+static void fini_buf(struct intel_buf *buf)
+{
+	intel_buf_destroy(buf);
+}
+
 static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 		       igt_crc_t *crc)
 {
@@ -349,6 +392,37 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	if (data->flags & TEST_BAD_ROTATION_90)
 		igt_plane_set_rotation(primary, IGT_ROTATION_90);
 
+	if (fb_flags & FB_CLEAR_COLOR) {
+		struct intel_buf *dst;
+
+		/* require 32-bit bpp for a fast clear test */
+		igt_skip_on(data->primary_fb.plane_bpp[0] != 32);
+
+		data->ibb = intel_bb_create(data->drm_fd, 4096);
+		data->bops = buf_ops_create(data->drm_fd);
+
+		dst = init_buf(data, &data->primary_fb, "fast clear dst");
+		gem_set_domain(data->drm_fd, data->primary_fb.gem_handle,
+			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+
+		/*
+		 * We expect the kernel to limit the max fb
+		 * size/stride to something that can still
+		 * rendered with the blitter/render engine.
+		 */
+		data->fast_clear(data->ibb, dst, 0, 0,
+				 data->primary_fb.width,
+				 data->primary_fb.height,
+				 colors[0].r*UINT32_MAX,
+				 colors[0].g*UINT32_MAX,
+				 colors[0].b*UINT32_MAX);
+
+		fini_buf(dst);
+		intel_bb_reset(data->ibb, true);
+
+		return true;
+	}
+
 	ret = igt_display_try_commit2(display, commit);
 	if (data->flags & TEST_BAD_ROTATION_90) {
 		igt_assert_eq(ret, -EINVAL);
@@ -386,10 +460,18 @@ static int test_ccs(data_t *data)
 	if (data->flags & TEST_CRC) {
 		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
 
-		if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
-		    try_config(data, fb_flags, &crc)) {
-			igt_assert_crc_equal(&crc, &ref_crc);
-			valid_tests++;
+		if (is_ccs_cc_modifier(data->ccs_modifier)) {
+			if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
+			    try_config(data, fb_flags | FB_COMPRESSED | FB_CLEAR_COLOR, &crc)) {
+				igt_assert_crc_equal(&crc, &ref_crc);
+				valid_tests++;
+			}
+		} else {
+			if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
+			    try_config(data, fb_flags, &crc)) {
+				igt_assert_crc_equal(&crc, &ref_crc);
+				valid_tests++;
+			}
 		}
 
 		igt_pipe_crc_free(data->pipe_crc);
@@ -471,11 +553,13 @@ igt_main_args("c", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 
-		igt_require(intel_gen(intel_get_drm_devid(data.drm_fd)) >= 9);
+		data.devid = intel_gen(intel_get_drm_devid(data.drm_fd));
+		igt_require(data.devid >= 9);
 		kmstest_set_vt_graphics_mode();
 		igt_require_pipe_crc(data.drm_fd);
 
 		igt_display_require(&data.display, data.drm_fd);
+		data.fast_clear = igt_get_render_clearfunc(data.devid);
 	}
 
 	for_each_pipe_static(pipe) {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
