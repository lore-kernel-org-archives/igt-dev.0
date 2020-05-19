Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E3689C83
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 09:48:16 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Tue, 19 May 2020 12:48:03 +0300
Message-Id: <20200519094803.8687-3-mika.kahola@intel.com>
In-Reply-To: <20200519094803.8687-1-mika.kahola@intel.com>
References: <20200519094803.8687-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_ccs: CCS Clear Color test
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

This is a RFC patch that proposes to test CCS clear color
capability.

The test paints a solid color on primary fb and a small sprite fb.
These are cleared with fast clear feature. A crc is captured and
compared against the reference.

Clear Color testing is performed with Clear Color DRM format modifier
and with YUV format only.

Any comments/proposals to improve the test are warmly welcomed.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 lib/intel_batchbuffer.c |  10 +++
 lib/intel_batchbuffer.h |   5 ++
 lib/rendercopy.h        |   3 +
 lib/rendercopy_gen9.c   | 131 ++++++++++++++++++++++++++++++++++++++++
 tests/kms_ccs.c         |  56 +++++++++++++++--
 5 files changed, 199 insertions(+), 6 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index f1a45b47..fb5b49a4 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1090,6 +1090,16 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
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
index 442f3a18..b378b97c 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -367,6 +367,11 @@ typedef void (*igt_vebox_copyfunc_t)(struct intel_batchbuffer *batch,
 
 igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid);
 
+typedef void (*igt_render_clearfunc_t)(struct intel_batchbuffer *batch,
+				       const struct igt_buf *dst, unsigned int dst_x, unsigned int dst_y,
+				       unsigned int width, unsigned int height);
+igt_render_clearfunc_t igt_get_render_clearfunc(int devid);
+
 /**
  * igt_fillfunc_t:
  * @batch: batchbuffer object
diff --git a/lib/rendercopy.h b/lib/rendercopy.h
index e0577cac..8c14830c 100644
--- a/lib/rendercopy.h
+++ b/lib/rendercopy.h
@@ -23,6 +23,9 @@ static inline void emit_vertex_normalized(struct intel_batchbuffer *batch,
 	OUT_BATCH(u.ui);
 }
 
+void gen12_render_clearfunc(struct intel_batchbuffer *batch,
+			    const struct igt_buf *dst, unsigned int dst_x, unsigned int dst_y,
+			    unsigned int width, unsigned int height);
 void gen12_render_copyfunc(struct intel_batchbuffer *batch,
 			   drm_intel_context *context,
 			   const struct igt_buf *src, unsigned src_x, unsigned src_y,
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 85ae4cab..fa985fec 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -1110,6 +1110,120 @@ void _gen9_render_copyfunc(struct intel_batchbuffer *batch,
 	intel_batchbuffer_reset(batch);
 }
 
+static
+void _gen12_render_clearfunc(struct intel_batchbuffer *batch,
+			     drm_intel_context *context,
+			     const struct igt_buf *dst, unsigned int dst_x,
+			     unsigned int dst_y, unsigned int width, unsigned int height,
+			     drm_intel_bo *aux_pgtable_bo,
+			     const uint32_t ps_kernel[][4],
+			     uint32_t ps_kernel_size)
+{
+	uint32_t ps_sampler_state, ps_kernel_off;
+	uint32_t scissor_state;
+	uint32_t vertex_buffer;
+	uint32_t batch_end;
+	uint32_t aux_pgtable_state;
+
+	intel_batchbuffer_flush_with_context(batch, context);
+
+	intel_batchbuffer_align(batch, 8);
+
+	batch->ptr = &batch->buffer[BATCH_STATE_SPLIT];
+
+	annotation_init(&aub_annotations);
+
+	ps_sampler_state  = gen8_create_sampler(batch);
+	ps_kernel_off = gen8_fill_ps(batch, ps_kernel, ps_kernel_size);
+	vertex_buffer = gen7_fill_vertex_buffer_data(batch, NULL,
+						     0, 0,
+						     dst_x, dst_y,
+						     width, height);
+	cc.cc_state = gen6_create_cc_state(batch);
+	cc.blend_state = gen8_create_blend_state(batch);
+	viewport.cc_state = gen6_create_cc_viewport(batch);
+	viewport.sf_clip_state = gen7_create_sf_clip_viewport(batch);
+	scissor_state = gen6_create_scissor_rect(batch);
+
+	aux_pgtable_state = gen12_create_aux_pgtable_state(batch,
+							   aux_pgtable_bo);
+
+	/* TODO: there is other state which isn't setup */
+
+	assert(batch->ptr < &batch->buffer[4095]);
+
+	batch->ptr = batch->buffer;
+
+	/* Start emitting the commands. The order roughly follows the mesa blorp
+	 * order */
+	OUT_BATCH(G4X_PIPELINE_SELECT | PIPELINE_SELECT_3D |
+				GEN9_PIPELINE_SELECTION_MASK);
+
+	gen12_emit_aux_pgtable_state(batch, aux_pgtable_state, true);
+
+	gen8_emit_sip(batch);
+
+	gen7_emit_push_constants(batch);
+
+	gen9_emit_state_base_address(batch);
+
+	OUT_BATCH(GEN7_3DSTATE_VIEWPORT_STATE_POINTERS_CC);
+	OUT_BATCH(viewport.cc_state);
+	OUT_BATCH(GEN8_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP);
+	OUT_BATCH(viewport.sf_clip_state);
+
+	gen7_emit_urb(batch);
+
+	gen8_emit_cc(batch);
+
+	gen8_emit_multisample(batch);
+
+	gen8_emit_null_state(batch);
+
+	OUT_BATCH(GEN7_3DSTATE_STREAMOUT | (5 - 2));
+	OUT_BATCH(0);
+	OUT_BATCH(0);
+	OUT_BATCH(0);
+	OUT_BATCH(0);
+
+	gen7_emit_clip(batch);
+
+	gen8_emit_sf(batch);
+
+	gen8_emit_ps(batch, ps_kernel_off);
+
+	OUT_BATCH(GEN7_3DSTATE_SAMPLER_STATE_POINTERS_PS);
+	OUT_BATCH(ps_sampler_state);
+
+	OUT_BATCH(GEN8_3DSTATE_SCISSOR_STATE_POINTERS);
+	OUT_BATCH(scissor_state);
+
+	gen9_emit_depth(batch);
+
+	gen7_emit_clear(batch);
+
+	gen6_emit_drawing_rectangle(batch, dst);
+
+	gen7_emit_vertex_buffer(batch, vertex_buffer);
+	gen6_emit_vertex_elements(batch);
+
+	gen8_emit_vf_topology(batch);
+	gen8_emit_primitive(batch, vertex_buffer);
+
+	OUT_BATCH(MI_BATCH_BUFFER_END);
+
+	batch_end = intel_batchbuffer_align(batch, 8);
+	assert(batch_end < BATCH_STATE_SPLIT);
+	annotation_add_batch(&aub_annotations, batch_end);
+
+	dump_batch(batch);
+
+	annotation_flush(&aub_annotations, batch);
+
+	gen6_render_flush(batch, context, batch_end);
+	intel_batchbuffer_reset(batch);
+}
+
 void gen9_render_copyfunc(struct intel_batchbuffer *batch,
 			  drm_intel_context *context,
 			  const struct igt_buf *src, unsigned src_x, unsigned src_y,
@@ -1153,3 +1267,20 @@ void gen12_render_copyfunc(struct intel_batchbuffer *batch,
 
 	gen12_aux_pgtable_cleanup(&pgtable_info);
 }
+
+void gen12_render_clearfunc(struct intel_batchbuffer *batch,
+			    const struct igt_buf *dst, unsigned int dst_x, unsigned int dst_y,
+			    unsigned int width, unsigned int height)
+{
+	struct aux_pgtable_info pgtable_info = { };
+
+	gen12_aux_pgtable_init(&pgtable_info, batch->bufmgr, NULL, dst);
+
+	_gen12_render_clearfunc(batch, NULL,
+				dst, dst_x, dst_y, 0, 0,
+				pgtable_info.pgtable_bo,
+				gen12_render_copy,
+				sizeof(gen12_render_copy));
+
+	gen12_aux_pgtable_cleanup(&pgtable_info);
+}
diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index c23b4e44..c9a781bf 100644
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
@@ -290,6 +295,17 @@ static igt_plane_t *compatible_main_plane(data_t *data)
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
@@ -299,6 +315,10 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	int fb_width = drm_mode->hdisplay;
 	enum igt_commit_style commit;
 	struct igt_fb fb, fb_sprite;
+	drm_intel_bufmgr *bufmgr = NULL;
+	drm_intel_bo *drmibo;
+	struct intel_batchbuffer *batch;
+	struct igt_buf igtbo;
 	int ret;
 
 	if (data->display.is_atomic)
@@ -333,7 +353,6 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 
 	if (data->flags & TEST_FAIL_ON_ADDFB2)
 		return true;
-
 	igt_plane_set_position(primary, 0, 0);
 	igt_plane_set_size(primary, drm_mode->hdisplay, drm_mode->vdisplay);
 	igt_plane_set_fb(primary, &fb);
@@ -349,6 +368,22 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	if (data->flags & TEST_BAD_ROTATION_90)
 		igt_plane_set_rotation(primary, IGT_ROTATION_90);
 
+	if (fb_flags & FB_CLEAR_COLOR) {
+		drmibo = gem_handle_to_libdrm_bo(bufmgr, data->drm_fd, "",
+						 data->primary_fb.gem_handle);
+		igt_assert(drmibo);
+
+		scratch_buf_init(data, drmibo, &igtbo);
+
+		batch = intel_batchbuffer_alloc(bufmgr, data->devid);
+		igt_assert(batch);
+
+		/* use fast clear */
+		data->fast_clear(batch, &igtbo, 0, 0,
+				 data->primary_fb.width,
+				 data->primary_fb.height);
+	}
+
 	ret = igt_display_try_commit2(display, commit);
 	if (data->flags & TEST_BAD_ROTATION_90) {
 		igt_assert_eq(ret, -EINVAL);
@@ -370,6 +405,7 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 
 	igt_plane_set_fb(primary, NULL);
 	igt_plane_set_rotation(primary, IGT_ROTATION_0);
+
 	igt_display_commit2(display, commit);
 
 	if (data->flags & TEST_CRC)
@@ -386,12 +422,18 @@ static int test_ccs(data_t *data)
 	if (data->flags & TEST_CRC) {
 		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
 
-		if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
-		    try_config(data, fb_flags, &crc)) {
+		if (data->ccs_modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC &&
+		    data->format == DRM_FORMAT_YUYV) {
+			valid_tests += try_config(data, fb_flags | FB_COMPRESSED, &ref_crc);
+			valid_tests += try_config(data, fb_flags | FB_COMPRESSED | FB_CLEAR_COLOR, &crc);
 			igt_assert_crc_equal(&crc, &ref_crc);
-			valid_tests++;
+		} else {
+			if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
+			    try_config(data, fb_flags, &crc)) {
+				igt_assert_crc_equal(&crc, &ref_crc);
+				valid_tests++;
+			}
 		}
-
 		igt_pipe_crc_free(data->pipe_crc);
 		data->pipe_crc = NULL;
 	}
@@ -471,11 +513,13 @@ igt_main_args("c", NULL, help_str, opt_handler, NULL)
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
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
