Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C35A896EC
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Oct 2021 09:09:47 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 20 Oct 2021 12:09:43 +0300
Message-Id: <20211020090944.29201-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/crc:
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The "auto" crc source should be a drm wide thing by now.
Replace the INTEL_ prefix with IGT_.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_debugfs.c                     | 4 ++--
 lib/igt_debugfs.h                     | 2 +-
 tests/amdgpu/amd_color.c              | 2 +-
 tests/amdgpu/amd_max_bpc.c            | 2 +-
 tests/i915/gem_pxp.c                  | 3 ++-
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
 33 files changed, 55 insertions(+), 39 deletions(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a5bb95ca32f7..5ead8aa55e03 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -715,7 +715,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
  *
  * Returns: A pipe CRC object for the given @pipe and @source. The library
  * assumes that the source is always available since recent kernels support at
- * least INTEL_PIPE_CRC_SOURCE_AUTO everywhere.
+ * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
  */
 igt_pipe_crc_t *
 igt_pipe_crc_new(int fd, enum pipe pipe, const char *source)
@@ -733,7 +733,7 @@ igt_pipe_crc_new(int fd, enum pipe pipe, const char *source)
  *
  * Returns: A pipe CRC object for the given @pipe and @source. The library
  * assumes that the source is always available since recent kernels support at
- * least INTEL_PIPE_CRC_SOURCE_AUTO everywhere.
+ * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
  */
 igt_pipe_crc_t *
 igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source)
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index d43ba6c6c7a3..cef456587641 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -83,7 +83,7 @@ typedef struct {
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
index 4eb759ee219a..8d2520b23512 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -126,7 +126,7 @@ static void test_init(data_t *data)
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
 
diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 5f269bab9041..0678476827fd 100644
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
diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 8665903827d8..e7a7eb16d576 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -453,7 +453,7 @@ static bool test_pipe(data_t *data)
 			    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
 		ret = test_plane(data);
@@ -510,7 +510,7 @@ max_hw_stride_async_flip_test(data_t *data)
 	generate_pattern(data, &data->big_fb_flip[1], 640, 480);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_pipe_crc_start(data->pipe_crc);
 
 	igt_set_timeout(5, "Async pageflipping loop got stuck!\n");
diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
index 716be5b6539b..0ae64378f517 100644
--- a/tests/i915/kms_ccs.c
+++ b/tests/i915/kms_ccs.c
@@ -532,7 +532,8 @@ static int test_ccs(data_t *data)
 	enum test_fb_flags fb_flags = 0;
 
 	if (data->flags & TEST_CRC) {
-		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
+						  IGT_PIPE_CRC_SOURCE_AUTO);
 
 		if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
 		    try_config(data, fb_flags, &crc)) {
diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 82c368e1dc39..7433b334c335 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -274,7 +274,7 @@ static void setup_environment(void)
 
 	find_modeset_params();
 	pipe_crc = igt_pipe_crc_new(drm_fd, kmstest_get_crtc_idx(drm_res, ms.crtc_id),
-				    INTEL_PIPE_CRC_SOURCE_AUTO);
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 }
 
 static void teardown_environment(void)
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
index 24ca12241be1..8fce41151ce0 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -215,7 +215,7 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
 		igt_pipe_crc_free(data->pipe_crc);
 	}
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for (int i = 0; i < output->config.connector->count_modes; i++) {
 		if (output->config.connector->modes[i].hdisplay == data->attemptmodewidth &&
diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index 913657993a21..4528459ce5bf 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -57,7 +57,8 @@ static void pipe_crc_new(data_t *data, int pipe)
 	if (data->pipe_crc)
 		return;
 
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_assert(data->pipe_crc);
 	igt_pipe_crc_start(data->pipe_crc);
 }
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index d6a884926c48..3805ebbaa625 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -1223,7 +1223,8 @@ static void init_blue_crc(enum pixel_format format, enum tiling_type tiling)
 	igt_display_commit(&drm.display);
 
 	if (!pipe_crc) {
-		pipe_crc = igt_pipe_crc_new(drm.fd, prim_mode_params.pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+		pipe_crc = igt_pipe_crc_new(drm.fd, prim_mode_params.pipe,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_assert(pipe_crc);
 	}
 
diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index b17e5fdb6fb7..74b8942ed10e 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -188,7 +188,7 @@ static void prepare_crtc(data_t *data)
 		igt_pipe_crc_free(data->pipe_crc);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc for the white fb */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index 44fcfadbe6f5..2e33e5996e6d 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -125,7 +125,7 @@ static void prepare_crtc(data_t *data)
 		igt_pipe_crc_free(data->pipe_crc);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc for the white fb */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 4ff7a196a725..95669c8655a4 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -488,7 +488,7 @@ static void test_crc(data_t *data)
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
 					  kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id),
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_pipe_crc_start(data->pipe_crc);
 	igt_pipe_crc_get_single(data->pipe_crc, &data->ref_crc);
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 1657624e93a8..c10fb2bcded8 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -407,7 +407,7 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 
 	/* create the pipe_crc object for this pipe */
 	pipe_crc = igt_pipe_crc_new(pipe->display->drm_fd, pipe->pipe,
-				    INTEL_PIPE_CRC_SOURCE_AUTO);
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc */
 	igt_pipe_crc_start(pipe_crc);
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 4be24f9e3091..a9f2be7bd9ae 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -817,7 +817,8 @@ retry:
 		j += 1;
 
 		if (is_i915_device(data->drm_fd))
-			pipe_crcs[i] = igt_pipe_crc_new(data->drm_fd, i, INTEL_PIPE_CRC_SOURCE_AUTO);
+			pipe_crcs[i] = igt_pipe_crc_new(data->drm_fd, i,
+							IGT_PIPE_CRC_SOURCE_AUTO);
 
 		for_each_valid_output_on_pipe(&data->display, i, output) {
 			if (output->pending_pipe != PIPE_NONE)
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 775f35964f61..90e94f19e2db 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -683,7 +683,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 
 		data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
 						  primary->pipe->pipe,
-						  INTEL_PIPE_CRC_SOURCE_AUTO);
+						  IGT_PIPE_CRC_SOURCE_AUTO);
 
 		igt_display_require_output_on_pipe(&data->display, p);
 	}
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 513c97153e63..8bc767cde0b0 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -493,7 +493,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* x/y position where the cursor is still fully visible */
 	data->left = 0;
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index cce562e0e7eb..29ff216767fd 100644
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
index 8136280701e6..c6402690c06f 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1281,7 +1281,8 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe,
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	set_cursor_on_pipe(display, pipe, &cursor_fb);
 	igt_display_commit2(display, COMMIT_UNIVERSAL);
@@ -1341,7 +1342,8 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe,
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	set_cursor_on_pipe(display, pipe, &cursor_fb);
 	igt_display_commit2(display, COMMIT_UNIVERSAL);
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 273263db3672..70bcc855fed5 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -165,7 +165,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
 
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
index 0861c46dbd9b..ebfa68d4c1be 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -104,7 +104,8 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 		if (flags & TEST_NONBLOCK) {
 			igt_pipe_crc_t *pipe_crc;
 
-			pipe_crc = igt_pipe_crc_new_nonblock(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+			pipe_crc = igt_pipe_crc_new_nonblock(data->drm_fd, pipe,
+							     IGT_PIPE_CRC_SOURCE_AUTO);
 			igt_wait_for_vblank(data->drm_fd, display->pipes[pipe].crtc_offset);
 			igt_pipe_crc_start(pipe_crc);
 
@@ -119,7 +120,8 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 		} else {
 			igt_pipe_crc_t *pipe_crc;
 
-			pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+			pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+						    IGT_PIPE_CRC_SOURCE_AUTO);
 			igt_pipe_crc_start(pipe_crc);
 
 			n_crcs = igt_pipe_crc_get_crcs(pipe_crc, N_CRCS, &crcs);
@@ -203,7 +205,7 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
 	igt_display_commit(display);
 
 	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
-				    INTEL_PIPE_CRC_SOURCE_AUTO);
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 
 	/* Flip FB1 with the Primary plane & compare the CRC with ref CRC. */
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 405d4c2180a6..0773cbb4e135 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -74,7 +74,8 @@ static color_t blue  = { 0.0f, 0.0f, 1.0f };
  */
 static void test_init(data_t *data, enum pipe pipe)
 {
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 }
 
 static void test_fini(data_t *data)
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 9e4ee22b43af..afbe0b1b1fd3 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -162,7 +162,8 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	/* create the pipe_crc object for this pipe */
 	igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	mode = igt_output_get_mode(output);
 	w = mode->hdisplay;
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 9bda47466446..aeaf3e1e1e22 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -77,7 +77,7 @@ static void test_init(data_t *data, enum pipe pipe_id)
 	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
 
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 6c0fce86e56e..9bc860435f5c 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -192,7 +192,7 @@ test_planes_on_pipe_with_output(data_t *data, igt_plane_t *plane, uint64_t modif
 	create_ref_fb(data, modifier, &mode_lowres, &data->ref_lowres.fb);
 
 	pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-				    INTEL_PIPE_CRC_SOURCE_AUTO);
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_override_mode(data->output, &mode_lowres);
 	igt_plane_set_fb(primary, &data->ref_lowres.fb);
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index ece00097e87b..3833fc2cadf0 100644
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
index 1ad4b3a638f5..4cd52c69f88b 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -206,7 +206,8 @@ static void test_crc(int exporter_fd, int importer_fd)
 	output = setup_display(importer_fd, &display, &pipe);
 
 	mode = igt_output_get_mode(output);
-	pipe_crc = igt_pipe_crc_new(importer_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new(importer_fd, pipe,
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for (i = 0; i < ARRAY_SIZE(colors); i++) {
 		prepare_scratch(exporter_fd, &scratch, mode, colors[i].color);
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index ae477b6044a2..620fd58001a1 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -208,7 +208,8 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	 */
 	if (!is_amdgpu_device(data->gfx_fd))
 		igt_display_commit2(display, COMMIT_ATOMIC);
-	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
+				          IGT_PIPE_CRC_SOURCE_AUTO);
 
 	if (!is_amdgpu_device(data->gfx_fd) && start_crc)
 		igt_pipe_crc_start(data->pipe_crc);
@@ -710,7 +711,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		p[1].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
 
 		data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
-						  INTEL_PIPE_CRC_SOURCE_AUTO);
+						  IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_start(data->pipe_crc);
 
 		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 2e8958979dd6..0ad2f57485bf 100644
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
2.32.0
