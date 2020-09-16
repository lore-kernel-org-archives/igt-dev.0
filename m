Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454B56E375
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2020 08:41:56 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed, 16 Sep 2020 11:41:45 +0300
Message-Id: <20200916084145.2199347-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5] tests/kms_ccs: CCS Clear Color test
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

Clear Color testing is performed with Clear Color DRM format modifier
and with YUV format only.

v2: Modify _gen9_render_copyfunc to support fast clear (Matt)
    Enable fast clear bit on 3D sequence (Matt)
    Add helper function to figure out clear color modifier (Matt)
v3: Remove unrelated line additions/removes
v4: Fast clear with color (Imre)
v5: Write raw 32-bit color values to register (Imre)
    Require 32-bit color format

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 lib/gen8_render.h       |  1 +
 lib/intel_batchbuffer.c | 10 ++++++
 lib/intel_batchbuffer.h |  7 ++++
 lib/rendercopy.h        |  6 ++++
 lib/rendercopy_gen9.c   | 62 ++++++++++++++++++++++++++++------
 tests/kms_ccs.c         | 75 ++++++++++++++++++++++++++++++++++++++---
 6 files changed, 146 insertions(+), 15 deletions(-)

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
index 99c2e148..c63a2199 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1094,6 +1094,16 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
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
index a69fffd8..de285586 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -368,6 +368,13 @@ typedef void (*igt_vebox_copyfunc_t)(struct intel_batchbuffer *batch,
 
 igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid);
 
+typedef void (*igt_render_clearfunc_t)(struct intel_batchbuffer *batch,
+				       drm_intel_context *context,
+				       const struct igt_buf *dst, unsigned int dst_x, unsigned int dst_y,
+				       unsigned int width, unsigned int height,
+				       uint32_t r, uint32_t g, uint32_t b);
+igt_render_clearfunc_t igt_get_render_clearfunc(int devid);
+
 /**
  * igt_fillfunc_t:
  * @i915: drm fd
diff --git a/lib/rendercopy.h b/lib/rendercopy.h
index e0577cac..31dc6265 100644
--- a/lib/rendercopy.h
+++ b/lib/rendercopy.h
@@ -23,6 +23,12 @@ static inline void emit_vertex_normalized(struct intel_batchbuffer *batch,
 	OUT_BATCH(u.ui);
 }
 
+void gen12_render_clearfunc(struct intel_batchbuffer *batch,
+                            drm_intel_context *context,
+                            const struct igt_buf *dst, unsigned int dst_x, unsigned int dst_y,
+                            unsigned int width, unsigned int height,
+			    uint32_t r, uint32_t g, uint32_t b);
+
 void gen12_render_copyfunc(struct intel_batchbuffer *batch,
 			   drm_intel_context *context,
 			   const struct igt_buf *src, unsigned src_x, unsigned src_y,
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 85ae4cab..c13f6307 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -303,7 +303,9 @@ gen8_bind_surfaces(struct intel_batchbuffer *batch,
 			     offset, 8);
 
 	binding_table[0] = gen8_bind_buf(batch, dst, 1);
-	binding_table[1] = gen8_bind_buf(batch, src, 0);
+
+	if (src != NULL)
+		binding_table[1] = gen8_bind_buf(batch, src, 0);
 
 	return offset;
 }
@@ -370,16 +372,25 @@ gen7_fill_vertex_buffer_data(struct intel_batchbuffer *batch,
 	start = batch->ptr;
 
 	emit_vertex_2s(batch, dst_x + width, dst_y + height);
-	emit_vertex_normalized(batch, src_x + width, igt_buf_width(src));
-	emit_vertex_normalized(batch, src_y + height, igt_buf_height(src));
+
+	if (src != NULL) {
+		emit_vertex_normalized(batch, src_x + width, igt_buf_width(src));
+		emit_vertex_normalized(batch, src_y + height, igt_buf_height(src));
+	}
 
 	emit_vertex_2s(batch, dst_x, dst_y + height);
-	emit_vertex_normalized(batch, src_x, igt_buf_width(src));
-	emit_vertex_normalized(batch, src_y + height, igt_buf_height(src));
+
+	if (src != NULL) {
+		emit_vertex_normalized(batch, src_x, igt_buf_width(src));
+		emit_vertex_normalized(batch, src_y + height, igt_buf_height(src));
+	}
 
 	emit_vertex_2s(batch, dst_x, dst_y);
-	emit_vertex_normalized(batch, src_x, igt_buf_width(src));
-	emit_vertex_normalized(batch, src_y, igt_buf_height(src));
+
+	if (src != NULL) {
+		emit_vertex_normalized(batch, src_x, igt_buf_width(src));
+		emit_vertex_normalized(batch, src_y, igt_buf_height(src));
+	}
 
 	offset = intel_batchbuffer_subdata_offset(batch, start);
 	annotation_add_state(&aub_annotations, AUB_TRACE_VERTEX_BUFFER,
@@ -843,7 +854,7 @@ gen8_emit_sf(struct intel_batchbuffer *batch)
 }
 
 static void
-gen8_emit_ps(struct intel_batchbuffer *batch, uint32_t kernel) {
+gen8_emit_ps(struct intel_batchbuffer *batch, uint32_t kernel, bool fast_clear) {
 	const int max_threads = 63;
 
 	OUT_BATCH(GEN6_3DSTATE_WM | (2 - 2));
@@ -871,6 +882,10 @@ gen8_emit_ps(struct intel_batchbuffer *batch, uint32_t kernel) {
 		  2 << GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
 	OUT_BATCH(0); /* scratch space stuff */
 	OUT_BATCH(0); /* scratch hi */
+
+	if (fast_clear)
+		OUT_BATCH(GEN8_3DSTATE_FAST_CLEAR_ENABLE);
+
 	OUT_BATCH((max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
 		  GEN6_3DSTATE_WM_16_DISPATCH_ENABLE);
 	OUT_BATCH(6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT);
@@ -1005,8 +1020,11 @@ void _gen9_render_copyfunc(struct intel_batchbuffer *batch,
 	uint32_t vertex_buffer;
 	uint32_t batch_end;
 	uint32_t aux_pgtable_state;
+	bool fast_clear = src != NULL ? false : true;
+
+	if (src != NULL)
+		igt_assert(src->bpp == dst->bpp);
 
-	igt_assert(src->bpp == dst->bpp);
 	intel_batchbuffer_flush_with_context(batch, context);
 
 	intel_batchbuffer_align(batch, 8);
@@ -1073,7 +1091,7 @@ void _gen9_render_copyfunc(struct intel_batchbuffer *batch,
 
 	gen8_emit_sf(batch);
 
-	gen8_emit_ps(batch, ps_kernel_off);
+	gen8_emit_ps(batch, ps_kernel_off, fast_clear);
 
 	OUT_BATCH(GEN7_3DSTATE_BINDING_TABLE_POINTERS_PS);
 	OUT_BATCH(ps_binding_table);
@@ -1153,3 +1171,27 @@ void gen12_render_copyfunc(struct intel_batchbuffer *batch,
 
 	gen12_aux_pgtable_cleanup(&pgtable_info);
 }
+
+void gen12_render_clearfunc(struct intel_batchbuffer *batch,
+			    drm_intel_context *context,
+			    const struct igt_buf *dst, unsigned int dst_x, unsigned int dst_y,
+			    unsigned int width, unsigned int height,
+			    uint32_t r, uint32_t g, uint32_t b)
+{
+	struct aux_pgtable_info pgtable_info = { };
+
+	gen12_aux_pgtable_init(&pgtable_info, batch->bufmgr, NULL, dst);
+
+	dst->data[dst->bo->offset64 + dst->cc.offset + 0 ] = r;
+	dst->data[dst->bo->offset64 + dst->cc.offset + 4 ] = b;
+	dst->data[dst->bo->offset64 + dst->cc.offset + 8 ] = g;
+	dst->data[dst->bo->offset64 + dst->cc.offset + 12] = 0xffffffff;
+
+	_gen9_render_copyfunc(batch, context, NULL, 0, 0,
+			  width, height, dst, dst_x, dst_y,
+			  pgtable_info.pgtable_bo,
+			  gen12_render_copy,
+			  sizeof(gen12_render_copy));
+
+	gen12_aux_pgtable_cleanup(&pgtable_info);
+}
diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 53abecce..80f892f6 100644
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
@@ -62,6 +64,9 @@ typedef struct {
 	igt_pipe_crc_t *pipe_crc;
 	uint32_t format;
 	uint64_t ccs_modifier;
+	struct igt_fb primary_fb;
+	igt_plane_t *primary;
+	igt_render_clearfunc_t fast_clear;
 } data_t;
 
 static const struct {
@@ -120,6 +125,16 @@ static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
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
@@ -290,6 +305,17 @@ static igt_plane_t *compatible_main_plane(data_t *data)
 	return igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 }
 
+static void scratch_buf_init(data_t *data, drm_intel_bo *drmibo,
+			     struct igt_buf *igtbo)
+{
+	igtbo->bo = drmibo;
+	igtbo->surface[0].stride = data->primary_fb.strides[0];
+	igtbo->tiling = data->primary_fb.modifier;
+	igtbo->surface[0].size = data->primary_fb.size;
+	igtbo->bpp = data->primary_fb.plane_bpp[0];
+}
+
+
 static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 		       igt_crc_t *crc)
 {
@@ -299,6 +325,11 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	int fb_width = drm_mode->hdisplay;
 	enum igt_commit_style commit;
 	struct igt_fb fb, fb_sprite;
+	drm_intel_bufmgr *bufmgr = NULL;
+	drm_intel_bo *drmibo;
+	struct intel_batchbuffer *batch;
+	struct igt_buf igtbo;
+	drm_intel_context *ctx;
 	int ret;
 
 	if (data->display.is_atomic)
@@ -349,6 +380,30 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	if (data->flags & TEST_BAD_ROTATION_90)
 		igt_plane_set_rotation(primary, IGT_ROTATION_90);
 
+	if (fb_flags & FB_CLEAR_COLOR) {
+		drmibo = gem_handle_to_libdrm_bo(bufmgr, data->drm_fd, "",
+						 data->primary_fb.gem_handle);
+		igt_assert(drmibo);
+
+		igt_skip_on(data->primary_fb.plane_bpp[0] != 32);
+
+		scratch_buf_init(data, drmibo, &igtbo);
+
+		batch = intel_batchbuffer_alloc(bufmgr, data->devid);
+		igt_assert(batch);
+
+                ctx = drm_intel_gem_context_create(bufmgr);
+                igt_assert(ctx);
+
+		/* use fast clear */
+		data->fast_clear(batch, ctx, &igtbo, 0, 0,
+				 data->primary_fb.width,
+				 data->primary_fb.height,
+				 colors[0].r*UINT32_MAX,
+				 colors[0].g*UINT32_MAX,
+				 colors[0].b*UINT32_MAX);
+	}
+
 	ret = igt_display_try_commit2(display, commit);
 	if (data->flags & TEST_BAD_ROTATION_90) {
 		igt_assert_eq(ret, -EINVAL);
@@ -386,10 +441,18 @@ static int test_ccs(data_t *data)
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
@@ -471,11 +534,13 @@ igt_main_args("c", NULL, help_str, opt_handler, NULL)
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
