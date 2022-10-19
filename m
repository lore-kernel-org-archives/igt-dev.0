Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED0A10E9AC
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 16:30:33 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Oct 2022 19:30:27 +0300
Message-Id: <20221019163029.19301-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/3] lib/crc:
 s/INTEL_PIPE_CRC_SOURCE_AUTO/IGT_PIPE_CRC_SOURCE_AUTO/
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The "auto" crc source should be a drm wide thing by now.
Replace the INTEL_ prefix with IGT_.

v2: Convert more things

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_debugfs.c                     | 4 ++--
 lib/igt_debugfs.h                     | 2 +-
 tests/amdgpu/amd_color.c              | 2 +-
 tests/amdgpu/amd_max_bpc.c            | 2 +-
 tests/i915/gem_pxp.c                  | 3 ++-
 tests/i915/i915_pipe_stress.c         | 2 +-
 tests/i915/kms_big_fb.c               | 4 ++--
 tests/i915/kms_ccs.c                  | 3 ++-
 tests/i915/kms_draw_crc.c             | 2 +-
 tests/i915/kms_fbcon_fbt.c            | 2 +-
 tests/i915/kms_flip_scaled_crc.c      | 2 +-
 tests/i915/kms_flip_tiling.c          | 3 ++-
 tests/i915/kms_frontbuffer_tracking.c | 3 ++-
 tests/i915/kms_mmap_write_crc.c       | 2 +-
 tests/i915/kms_pwrite_crc.c           | 2 +-
 tests/kms_async_flips.c               | 2 +-
 tests/kms_atomic.c                    | 2 +-
 tests/kms_atomic_transition.c         | 3 ++-
 tests/kms_color.c                     | 2 +-
 tests/kms_cursor_crc.c                | 2 +-
 tests/kms_cursor_edge_walk.c          | 2 +-
 tests/kms_cursor_legacy.c             | 6 ++++--
 tests/kms_display_modes.c             | 4 ++--
 tests/kms_hdr.c                       | 2 +-
 tests/kms_multipipe_modeset.c         | 2 +-
 tests/kms_pipe_crc_basic.c            | 8 +++++---
 tests/kms_plane.c                     | 3 ++-
 tests/kms_plane_alpha_blend.c         | 3 ++-
 tests/kms_plane_cursor.c              | 2 +-
 tests/kms_plane_lowres.c              | 2 +-
 tests/kms_plane_multiple.c            | 3 ++-
 tests/kms_prime.c                     | 3 ++-
 tests/kms_rotation_crc.c              | 5 +++--
 tests/kms_universal_plane.c           | 3 ++-
 tools/intel_display_crc.c             | 3 ++-
 35 files changed, 58 insertions(+), 42 deletions(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index fa1e3b699730..fc4697b0af4a 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -761,7 +761,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
  *
  * Returns: A pipe CRC object for the given @pipe and @source. The library
  * assumes that the source is always available since recent kernels support at
- * least INTEL_PIPE_CRC_SOURCE_AUTO everywhere.
+ * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
  */
 igt_pipe_crc_t *
 igt_pipe_crc_new(int fd, enum pipe pipe, const char *source)
@@ -779,7 +779,7 @@ igt_pipe_crc_new(int fd, enum pipe pipe, const char *source)
  *
  * Returns: A pipe CRC object for the given @pipe and @source. The library
  * assumes that the source is always available since recent kernels support at
- * least INTEL_PIPE_CRC_SOURCE_AUTO everywhere.
+ * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
  */
 igt_pipe_crc_t *
 igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source)
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 37e85067b60b..05d29f171610 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -97,7 +97,7 @@ typedef struct {
 	uint32_t crc[DRM_MAX_CRC_NR];
 } igt_crc_t;
 
-#define INTEL_PIPE_CRC_SOURCE_AUTO "auto"
+#define IGT_PIPE_CRC_SOURCE_AUTO "auto"
 #define AMDGPU_PIPE_CRC_SOURCE_DPRX "dprx"
 
 bool igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int *index);
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 6d313bae74b5..defe57bd4fb8 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -192,7 +192,7 @@ static void test_init(data_t *data)
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
 
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
index 982a91e294c8..effe830a29d0 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -83,7 +83,7 @@ static void test_init(data_t *data)
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
 
diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 65618556b03c..a75275217743 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -1110,7 +1110,8 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
 		pipe = &display->pipes[output->pending_pipe];
-		pipe_crc = igt_pipe_crc_new(i915, pipe->pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+		pipe_crc = igt_pipe_crc_new(i915, pipe->pipe,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
 		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
 		igt_output_set_pipe(output, pipe->pipe);
diff --git a/tests/i915/i915_pipe_stress.c b/tests/i915/i915_pipe_stress.c
index 3949d5c38363..6ce2ce1de23d 100644
--- a/tests/i915/i915_pipe_stress.c
+++ b/tests/i915/i915_pipe_stress.c
@@ -776,7 +776,7 @@ static void prepare_test(struct data *data)
 			igt_info("Using mode: \n");
 			kmstest_dump_mode(data->highest_mode[i]);
 			data->pipe_crc[i] = igt_pipe_crc_new(data->drm_fd, i,
-							     INTEL_PIPE_CRC_SOURCE_AUTO);
+							     IGT_PIPE_CRC_SOURCE_AUTO);
 		} else
 			data->pipe_crc[i] = NULL;
 
diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index eb40e9cdf110..0beba0e18fe3 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -455,7 +455,7 @@ static bool test_pipe(data_t *data)
 			    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
 		ret = test_plane(data);
@@ -516,7 +516,7 @@ max_hw_stride_async_flip_test(data_t *data)
 	generate_pattern(data, &data->big_fb_flip[1], 640, 480);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_pipe_crc_start(data->pipe_crc);
 
 	igt_plane_set_fb(primary, &data->big_fb);
diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
index 6721da493af5..9be3fa25267d 100644
--- a/tests/i915/kms_ccs.c
+++ b/tests/i915/kms_ccs.c
@@ -555,7 +555,8 @@ static int test_ccs(data_t *data)
 	enum test_fb_flags fb_flags = 0;
 
 	if (data->flags & TEST_CRC) {
-		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
+						  IGT_PIPE_CRC_SOURCE_AUTO);
 
 		if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
 		    try_config(data, fb_flags, &crc)) {
diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index b99f348d401e..c2ac4721de72 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -69,7 +69,7 @@ static void find_modeset_params(void)
 		if (!mode)
 			continue;
 
-		pipe_crc = igt_pipe_crc_new(drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+		pipe_crc = igt_pipe_crc_new(drm_fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
 		/*Only one pipe/output is enough*/
 		break;
 	}
diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
index 98c452c4f097..831ec867aefb 100644
--- a/tests/i915/kms_fbcon_fbt.c
+++ b/tests/i915/kms_fbcon_fbt.c
@@ -119,7 +119,7 @@ static bool fbc_check_cursor_blinking(struct drm_info *drm)
 	bool ret;
 	int i;
 
-	pipe_crc = igt_pipe_crc_new(drm->fd, PIPE_A, INTEL_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new(drm->fd, PIPE_A, IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_pipe_crc_start(pipe_crc);
 	igt_pipe_crc_drain(pipe_crc);
diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index 364f622ba699..10465ca757b1 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -537,7 +537,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 		igt_pipe_crc_free(data->pipe_crc);
 	}
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_plane_set_position(primary, 0, 0);
 	igt_plane_set_fb(primary, &data->small_fb);
diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index 0d8cc341c0b9..1183feb6333f 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -59,7 +59,8 @@ static void pipe_crc_new(data_t *data, int pipe)
 	if (data->pipe_crc)
 		return;
 
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_assert(data->pipe_crc);
 	igt_pipe_crc_start(data->pipe_crc);
 }
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index f2fd0352dcae..5b47999e879a 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -1259,7 +1259,8 @@ static void init_blue_crc(enum pixel_format format, enum tiling_type tiling)
 	igt_display_commit(&drm.display);
 
 	if (!pipe_crc) {
-		pipe_crc = igt_pipe_crc_new(drm.fd, prim_mode_params.pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+		pipe_crc = igt_pipe_crc_new(drm.fd, prim_mode_params.pipe,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_assert(pipe_crc);
 	}
 
diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index b693c276b2c3..c36547fced9c 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -193,7 +193,7 @@ static void prepare_crtc(data_t *data)
 		igt_pipe_crc_free(data->pipe_crc);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc for the white fb */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index 7df4b36924fa..c84a184d84cc 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -129,7 +129,7 @@ static void prepare_crtc(data_t *data)
 		igt_pipe_crc_free(data->pipe_crc);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc for the white fb */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 695aea74d4f3..7cb71f6b441a 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -504,7 +504,7 @@ static void test_crc(data_t *data)
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
 					  kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id),
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_pipe_crc_start(data->pipe_crc);
 	igt_pipe_crc_get_single(data->pipe_crc, &data->ref_crc);
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 831ba2587292..2a3fb74becec 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -418,7 +418,7 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 
 	/* create the pipe_crc object for this pipe */
 	pipe_crc = igt_pipe_crc_new(pipe->display->drm_fd, pipe->pipe,
-				    INTEL_PIPE_CRC_SOURCE_AUTO);
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc */
 	igt_pipe_crc_start(pipe_crc);
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 25757131de56..6d2ebbbff1d9 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -832,7 +832,8 @@ retry:
 		j += 1;
 
 		if (is_i915_device(data->drm_fd))
-			data->pipe_crcs[i] = igt_pipe_crc_new(data->drm_fd, i, INTEL_PIPE_CRC_SOURCE_AUTO);
+			data->pipe_crcs[i] = igt_pipe_crc_new(data->drm_fd, i,
+							      IGT_PIPE_CRC_SOURCE_AUTO);
 
 		for_each_valid_output_on_pipe(&data->display, i, output) {
 			if (output->pending_pipe != PIPE_NONE)
diff --git a/tests/kms_color.c b/tests/kms_color.c
index d5df98408c2b..e4dc2465ec9d 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -693,7 +693,7 @@ static void test_setup(data_t *data, enum pipe p)
 	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
 					  data->primary->pipe->pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_display_require_output_on_pipe(&data->display, p);
 	data->output = igt_get_single_output_for_pipe(&data->display, p);
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 2d6b43f764dc..d51c1f90a352 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -502,7 +502,7 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* x/y position where the cursor is still fully visible */
 	data->left = 0;
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 74187613276e..e653b9ab962d 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -255,7 +255,7 @@ static void prepare_crtc(data_t *data)
 
 	/* create the pipe_crc object for this pipe */
 	data->pipe_crc = igt_pipe_crc_new_nonblock(data->drm_fd, data->pipe,
-						   INTEL_PIPE_CRC_SOURCE_AUTO);
+						   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc w/o cursor */
 	igt_pipe_crc_start(data->pipe_crc);
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 1ad92eaae881..0a8a31976046 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1360,7 +1360,8 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe,
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
 	igt_display_commit2(display, COMMIT_UNIVERSAL);
@@ -1432,7 +1433,8 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe,
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
 	igt_display_commit2(display, COMMIT_UNIVERSAL);
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index eff30cbb1e69..e4191811e8ef 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -60,8 +60,8 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
 	mode[0] = igt_output_get_mode(extended_output[0]);
 	mode[1] = igt_output_get_mode(extended_output[1]);
 
-	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, INTEL_PIPE_CRC_SOURCE_AUTO);
-	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, INTEL_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_create_color_fb(data->drm_fd, mode[0]->hdisplay, mode[0]->vdisplay,
 			     DRM_FORMAT_XRGB8888, 0, 1, 0, 0, &fbs[0]);
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index c18acb60f99e..655c3e14f7ef 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -127,7 +127,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 6358d9306bc6..1fdfb9a9f7a2 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -67,7 +67,7 @@ static void run_test(data_t *data, int valid_outputs)
 		mode = NULL;
 
 		pipe_crcs[i] = igt_pipe_crc_new(display->drm_fd, i,
-						INTEL_PIPE_CRC_SOURCE_AUTO);
+						IGT_PIPE_CRC_SOURCE_AUTO);
 
 		igt_output_set_pipe(output, i);
 		mode = igt_output_get_mode(output);
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 2985de51c33c..13dd549bd602 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -107,7 +107,8 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 		if (flags & TEST_NONBLOCK) {
 			igt_pipe_crc_t *pipe_crc;
 
-			pipe_crc = igt_pipe_crc_new_nonblock(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+			pipe_crc = igt_pipe_crc_new_nonblock(data->drm_fd, pipe,
+							     IGT_PIPE_CRC_SOURCE_AUTO);
 			igt_wait_for_vblank(data->drm_fd, display->pipes[pipe].crtc_offset);
 			igt_pipe_crc_start(pipe_crc);
 
@@ -122,7 +123,8 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 		} else {
 			igt_pipe_crc_t *pipe_crc;
 
-			pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+			pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+						    IGT_PIPE_CRC_SOURCE_AUTO);
 			igt_pipe_crc_start(pipe_crc);
 
 			n_crcs = igt_pipe_crc_get_crcs(pipe_crc, N_CRCS, &crcs);
@@ -206,7 +208,7 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_display_commit(display);
 
 	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
-				    INTEL_PIPE_CRC_SOURCE_AUTO);
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 
 	/* Flip FB1 with the Primary plane & compare the CRC with ref CRC. */
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index eb943e13f408..8a54ba6645c8 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -76,7 +76,8 @@ static color_t blue  = { 0.0f, 0.0f, 1.0f };
 static void test_init(data_t *data, enum pipe pipe)
 {
 	igt_require(data->display.pipes[pipe].n_planes > 0);
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_display_reset(&data->display);
 }
 
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 31f1fd0d3ff2..ccf1d65796ef 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -176,7 +176,8 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	/* create the pipe_crc object for this pipe */
 	igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	mode = igt_output_get_mode(output);
 	w = mode->hdisplay;
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index e9abfd7888d6..f5dfd9bde9fe 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -87,7 +87,7 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
 
 	igt_require_pipe_crc(data->drm_fd);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* Overlay rectangle for a rect in the center of the screen */
 	data->or.x = data->mode->hdisplay / 4;
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index bb6cffac0911..6dfc147c270f 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -278,7 +278,7 @@ static void run_test(data_t *data, uint64_t modifier)
 			igt_output_set_pipe(data->output, data->pipe);
 
 			data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-							  INTEL_PIPE_CRC_SOURCE_AUTO);
+							  IGT_PIPE_CRC_SOURCE_AUTO);
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), data->output->name)
 				test_planes_on_pipe(data, modifier);
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 637d63f0bd4e..75659015942e 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -68,7 +68,8 @@ struct {
  */
 static void test_init(data_t *data, enum pipe pipe, int n_planes)
 {
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	data->plane = calloc(n_planes, sizeof(*data->plane));
 	igt_assert_f(data->plane != NULL, "Failed to allocate memory for planes\n");
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 3df690e0497e..097c2f2a5036 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -237,7 +237,8 @@ static void test_crc(int exporter_fd, int importer_fd)
 	output = setup_display(importer_fd, &display, &pipe);
 
 	mode = igt_output_get_mode(output);
-	pipe_crc = igt_pipe_crc_new(importer_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new(importer_fd, pipe,
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for (i = 0; i < ARRAY_SIZE(colors); i++) {
 		prepare_scratch(exporter_fd, &scratch, mode, colors[i].color);
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 740e01eb5f1d..72c20d5a42e6 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -225,7 +225,8 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	 */
 	if (!is_amdgpu_device(data->gfx_fd))
 		igt_display_commit2(display, COMMIT_ATOMIC);
-	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
+				          IGT_PIPE_CRC_SOURCE_AUTO);
 
 	if (!is_amdgpu_device(data->gfx_fd) && start_crc)
 		igt_pipe_crc_start(data->pipe_crc);
@@ -815,7 +816,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		p[1].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
 
 		data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
-						  INTEL_PIPE_CRC_SOURCE_AUTO);
+						  IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_start(data->pipe_crc);
 
 		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index e732b09a9a80..dd8fa19373a8 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -68,7 +68,8 @@ functional_test_init(functional_test_t *test, igt_output_t *output, enum pipe pi
 	data_t *data = test->data;
 	drmModeModeInfo *mode;
 
-	test->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	test->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_pipe(output, pipe);
 
diff --git a/tools/intel_display_crc.c b/tools/intel_display_crc.c
index d1b28ea77371..61291fc2aa88 100644
--- a/tools/intel_display_crc.c
+++ b/tools/intel_display_crc.c
@@ -67,7 +67,8 @@ static void print_crcs(display_crc_t *ctx)
 	char *crc_str;
 	int i;
 
-	pipe_crc = igt_pipe_crc_new(ctx->fd, ctx->pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new(ctx->fd, ctx->pipe,
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for (i = 0; i < ctx->n_crcs; i++) {
 		igt_pipe_crc_collect_crc(pipe_crc, &crc);
-- 
2.35.1
