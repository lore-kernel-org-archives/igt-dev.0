Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530CC10E073
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 17:01:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 22:25:58 +0530
Message-Id: <20230516165558.4061781-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests:
 s/i915_pipe_output_combo_valid/intel_pipe_output_combo_valid/
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

As i915_pipe_output_combo_valid() is no more i915 specific, and
it supports both i915 & XE then rename the helper.

s/i915_pipe_output_combo_valid/intel_pipe_output_combo_valid/

V2: - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c                         | 4 ++--
 lib/igt_kms.h                         | 2 +-
 tests/i915/kms_big_fb.c               | 2 +-
 tests/i915/kms_busy.c                 | 2 +-
 tests/i915/kms_ccs.c                  | 2 +-
 tests/i915/kms_cdclk.c                | 4 ++--
 tests/i915/kms_draw_crc.c             | 2 +-
 tests/i915/kms_dsc.c                  | 2 +-
 tests/i915/kms_fence_pin_leak.c       | 2 +-
 tests/i915/kms_flip_scaled_crc.c      | 4 ++--
 tests/i915/kms_flip_tiling.c          | 2 +-
 tests/i915/kms_frontbuffer_tracking.c | 2 +-
 tests/i915/kms_mmap_write_crc.c       | 2 +-
 tests/i915/kms_psr.c                  | 2 +-
 tests/i915/kms_psr2_sf.c              | 2 +-
 tests/i915/kms_psr2_su.c              | 2 +-
 tests/i915/kms_psr_stress_test.c      | 2 +-
 tests/i915/kms_pwrite_crc.c           | 2 +-
 tests/kms_async_flips.c               | 2 +-
 tests/kms_atomic.c                    | 2 +-
 tests/kms_atomic_interruptible.c      | 2 +-
 tests/kms_atomic_transition.c         | 6 +++---
 tests/kms_color_helper.c              | 2 +-
 tests/kms_concurrent.c                | 2 +-
 tests/kms_content_protection.c        | 2 +-
 tests/kms_cursor_crc.c                | 2 +-
 tests/kms_cursor_edge_walk.c          | 2 +-
 tests/kms_cursor_legacy.c             | 2 +-
 tests/kms_display_modes.c             | 2 +-
 tests/kms_dp_tiled_display.c          | 2 +-
 tests/kms_flip_event_leak.c           | 2 +-
 tests/kms_invalid_mode.c              | 2 +-
 tests/kms_lease.c                     | 2 +-
 tests/kms_pipe_crc_basic.c            | 2 +-
 tests/kms_plane.c                     | 2 +-
 tests/kms_plane_alpha_blend.c         | 2 +-
 tests/kms_plane_cursor.c              | 2 +-
 tests/kms_plane_lowres.c              | 2 +-
 tests/kms_plane_multiple.c            | 2 +-
 tests/kms_plane_scaling.c             | 4 ++--
 tests/kms_prime.c                     | 2 +-
 tests/kms_properties.c                | 6 +++---
 tests/kms_rmfb.c                      | 2 +-
 tests/kms_rotation_crc.c              | 6 +++---
 tests/kms_scaling_modes.c             | 2 +-
 tests/kms_sequence.c                  | 2 +-
 tests/kms_universal_plane.c           | 2 +-
 tests/kms_vblank.c                    | 6 +++---
 tests/kms_vrr.c                       | 2 +-
 49 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c54841486..fcafcb66e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5993,7 +5993,7 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
 }
 
 /*
- * i915_pipe_output_combo_valid:
+ * intel_pipe_output_combo_valid:
  * @display: a pointer to an #igt_display_t structure
  *
  * Every individual test must use igt_output_set_pipe() before calling this
@@ -6011,7 +6011,7 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
  *
  * Returns: true if a valid pipe/output mode combo found, else false
  */
-bool i915_pipe_output_combo_valid(igt_display_t *display)
+bool intel_pipe_output_combo_valid(igt_display_t *display)
 {
 	int combo = 0;
 	igt_output_t *output;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1b6988c17..afa75b334 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1003,6 +1003,6 @@ int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
-bool i915_pipe_output_combo_valid(igt_display_t *display);
+bool intel_pipe_output_combo_valid(igt_display_t *display);
 
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index a0d5ef730..2ba88f2c3 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -608,7 +608,7 @@ static void test_scanout(data_t *data)
 		igt_display_reset(&data->display);
 
 		igt_output_set_pipe(data->output, data->pipe);
-		if (!i915_pipe_output_combo_valid(&data->display))
+		if (!intel_pipe_output_combo_valid(&data->display))
 			continue;
 
 		if (data->async_flip_test) {
diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index 20d3058fb..c7b74f0fb 100644
--- a/tests/i915/kms_busy.c
+++ b/tests/i915/kms_busy.c
@@ -319,7 +319,7 @@ pipe_output_combo_valid(igt_display_t *dpy,
 	igt_display_reset(dpy);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(dpy))
+	if (!intel_pipe_output_combo_valid(dpy))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
index 1b3462ea9..9e5968c09 100644
--- a/tests/i915/kms_ccs.c
+++ b/tests/i915/kms_ccs.c
@@ -596,7 +596,7 @@ static void test_output(data_t *data, const int testnum)
 			igt_display_reset(&data->display);
 
 			igt_output_set_pipe(data->output, data->pipe);
-			if (i915_pipe_output_combo_valid(&data->display)) {
+			if (intel_pipe_output_combo_valid(&data->display)) {
 				found = true;
 				break;
 			}
diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index 0f9b8dc58..9e8044062 100644
--- a/tests/i915/kms_cdclk.c
+++ b/tests/i915/kms_cdclk.c
@@ -283,7 +283,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		igt_output_override_mode(output, mode_hi);
 		i++;
 	}
-	igt_require(i915_pipe_output_combo_valid(display));
+	igt_require(intel_pipe_output_combo_valid(display));
 	igt_display_reset(display);
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
@@ -352,7 +352,7 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display)) {
+		if (!intel_pipe_output_combo_valid(display)) {
 			igt_output_set_pipe(output, PIPE_NONE);
 			continue;
 		}
diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index db6d71f2e..3f78bac8b 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -63,7 +63,7 @@ static void find_modeset_params(void)
 		igt_display_reset(&display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(&display))
+		if (!intel_pipe_output_combo_valid(&display))
 			continue;
 
 		mode = igt_output_get_mode(output);
diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 3ce28f848..5846159f7 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -156,7 +156,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 
 		igt_output_override_mode(output, mode);
 
-		if (!i915_pipe_output_combo_valid(display)) {
+		if (!intel_pipe_output_combo_valid(display)) {
 			if (data->output_format == DSC_FORMAT_RGB) {
 				igt_info("No valid pipe/output/mode found.\n");
 
diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
index 63657a742..6b678668e 100644
--- a/tests/i915/kms_fence_pin_leak.c
+++ b/tests/i915/kms_fence_pin_leak.c
@@ -202,7 +202,7 @@ static void run_test(data_t *data)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, p);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		run_single_test(data, p, output);
diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index f5dc430e3..987f5f54a 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -660,7 +660,7 @@ igt_main
 					igt_output_set_pipe(output, pipe);
 					igt_output_override_mode(output, modetoset);
 
-					if (modetoset && i915_pipe_output_combo_valid(&data.display)) {
+					if (modetoset && intel_pipe_output_combo_valid(&data.display)) {
 						found = true;
 						igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
 							run_tests(&data, index, pipe, output, modetoset);
@@ -672,7 +672,7 @@ igt_main
 						igt_display_reset(&data.display);
 
 						igt_output_set_pipe(output, pipe);
-						if (!i915_pipe_output_combo_valid(&data.display))
+						if (!intel_pipe_output_combo_valid(&data.display))
 							continue;
 
 						modetoset = NULL;
diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index a22f12382..01c27efef 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -199,7 +199,7 @@ igt_main
 			pipe_crc_free(&data);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(&data.display))
+			if (!intel_pipe_output_combo_valid(&data.display))
 				continue;
 
 			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 650e14a77..c7af27be4 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -415,7 +415,7 @@ static bool find_connector(bool edp_only, bool pipe_a,
 
 		igt_output_set_pipe(output, pipe);
 		igt_output_override_mode(output, connector_get_mode(output));
-		if (i915_pipe_output_combo_valid(&drm.display)) {
+		if (intel_pipe_output_combo_valid(&drm.display)) {
 			*ret_output = output;
 			*ret_pipe = pipe;
 			return true;
diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index bc51975f6..5f7750041 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -280,7 +280,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 			igt_display_reset(&data.display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(&data.display))
+			if (!intel_pipe_output_combo_valid(&data.display))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
index 6c89de45d..ec8cb8fe2 100644
--- a/tests/i915/kms_psr.c
+++ b/tests/i915/kms_psr.c
@@ -110,7 +110,7 @@ static void setup_output(data_t *data)
 
 		igt_display_reset(display);
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		data->crtc_id = output->config.crtc->crtc_id;
diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 4cf986440..d55b818ef 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -879,7 +879,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 65e67b8c9..43fed4241 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -106,7 +106,7 @@ static void setup_output(data_t *data)
 
 		igt_display_reset(display);
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		data->output = output;
diff --git a/tests/i915/kms_psr_stress_test.c b/tests/i915/kms_psr_stress_test.c
index a4cb3194e..0812bcdd1 100644
--- a/tests/i915/kms_psr_stress_test.c
+++ b/tests/i915/kms_psr_stress_test.c
@@ -74,7 +74,7 @@ static void setup_output(data_t *data)
 
 		igt_display_reset(display);
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display)) {
+		if (!intel_pipe_output_combo_valid(display)) {
 			igt_output_set_pipe(output, PIPE_NONE);
 			continue;
 		}
diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index 3278d876d..e8481b545 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -162,7 +162,7 @@ static void run_test(data_t *data)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(data->output, data->pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		prepare_crtc(data);
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 51ffa523a..1b13b04dd 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -554,7 +554,7 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 037db2d36..c2232bacb 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1312,7 +1312,7 @@ igt_main
 			igt_display_reset(&display);
 
 			igt_output_set_pipe(output, pipe);
-			if (i915_pipe_output_combo_valid(&display)) {
+			if (intel_pipe_output_combo_valid(&display)) {
 				valid_config = true;
 				break;
 			}
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 74b2e246a..a21830f26 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -277,7 +277,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 9f39d033d..cd6df6cf2 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -767,7 +767,7 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 				continue;
 
 			igt_output_set_pipe(output, pipe);
-			if (i915_pipe_output_combo_valid(&data->display)) {
+			if (intel_pipe_output_combo_valid(&data->display)) {
 				mode = igt_output_get_mode(output);
 				break;
 			} else {
@@ -857,7 +857,7 @@ retry:
 				continue;
 
 			igt_output_set_pipe(output, i);
-			if (i915_pipe_output_combo_valid(&data->display)) {
+			if (intel_pipe_output_combo_valid(&data->display)) {
 				mode = igt_output_get_mode(output);
 
 				igt_info("(pipe %s + %s), mode:",
@@ -1013,7 +1013,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index b01c38ef6..c756b280e 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -29,7 +29,7 @@ bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
 	bool ret = true;
 
 	igt_output_set_pipe(data->output, pipe);
-	if (!i915_pipe_output_combo_valid(&data->display))
+	if (!intel_pipe_output_combo_valid(&data->display))
 		ret = false;
 	igt_output_set_pipe(data->output, PIPE_NONE);
 
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index e1e581723..1ba2d11be 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -334,7 +334,7 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 			igt_display_reset(&data->display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(&data->display))
+			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
 
 			igt_output_set_pipe(output, PIPE_NONE);
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 344cac505..0b12d9c2f 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -509,7 +509,7 @@ test_content_protection(enum igt_commit_style s, int content_type)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			modeset_with_fb(pipe, output, s);
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 3a353a032..8e7f32aee 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -713,7 +713,7 @@ static bool valid_pipe_output_combo(data_t *data)
 	igt_display_reset(display);
 	igt_output_set_pipe(data->output, data->pipe);
 
-	if (i915_pipe_output_combo_valid(display))
+	if (intel_pipe_output_combo_valid(display))
 		ret = true;
 
 	igt_output_set_pipe(data->output, PIPE_NONE);
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 5f423a18f..e4323b18d 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -375,7 +375,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 					igt_display_reset(&data.display);
 					igt_output_set_pipe(data.output, data.pipe);
-					if (!i915_pipe_output_combo_valid(&data.display))
+					if (!intel_pipe_output_combo_valid(&data.display))
 						continue;
 
 					igt_output_set_pipe(data.output, PIPE_NONE);
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index f7a6202cf..2d74861d0 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -252,7 +252,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 				continue;
 
 			igt_output_set_pipe(*output, pipe);
-			if (i915_pipe_output_combo_valid(display)) {
+			if (intel_pipe_output_combo_valid(display)) {
 				found = true;
 
 				if (second) {
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index d69c7b931..9fbea228b 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -156,7 +156,7 @@ static void run_extendedmode_test(data_t *data) {
 					igt_output_set_pipe(output1, pipe1);
 					igt_output_set_pipe(output2, pipe2);
 
-					if (!i915_pipe_output_combo_valid(display))
+					if (!intel_pipe_output_combo_valid(display))
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
index 07b803a50..77d5352ac 100644
--- a/tests/kms_dp_tiled_display.c
+++ b/tests/kms_dp_tiled_display.c
@@ -272,7 +272,7 @@ static void setup_mode(data_t *data)
 		igt_require(found);
 		igt_output_override_mode(output, mode);
 	}
-	igt_require(i915_pipe_output_combo_valid(data->display));
+	igt_require(intel_pipe_output_combo_valid(data->display));
 	igt_display_commit_atomic(data->display, DRM_MODE_ATOMIC_ALLOW_MODESET,
 				  NULL);
 }
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index b79cd5030..84a83b544 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -110,7 +110,7 @@ igt_main
 			igt_display_reset(&data.display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(&data.display))
+			if (!intel_pipe_output_combo_valid(&data.display))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index ec0483055..271408ba1 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -283,7 +283,7 @@ igt_main
 				igt_display_reset(&data.display);
 
 				igt_output_set_pipe(output, pipe);
-				if (!i915_pipe_output_combo_valid(&data.display))
+				if (!intel_pipe_output_combo_valid(&data.display))
 					continue;
 
 				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe)) {
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 29a774ae8..52080f11f 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1227,7 +1227,7 @@ igt_main
 					igt_display_reset(display);
 
 					igt_output_set_pipe(output, data.pipe);
-					if (!i915_pipe_output_combo_valid(display))
+					if (!intel_pipe_output_combo_valid(display))
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe),
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 84c73fd7f..ece943c52 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -353,7 +353,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 10e16b638..3aa3bf6cb 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1206,7 +1206,7 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 		igt_display_reset(&data->display);
 
 		igt_output_set_pipe(data->output, pipe);
-		if (!i915_pipe_output_combo_valid(&data->display))
+		if (!intel_pipe_output_combo_valid(&data->display))
 			continue;
 
 		igt_output_set_pipe(data->output, PIPE_NONE);
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 0d03e178a..5444cd337 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -655,7 +655,7 @@ static void run_subtests(data_t *data)
 				igt_display_reset(&data->display);
 
 				igt_output_set_pipe(output, pipe);
-				if (!i915_pipe_output_combo_valid(&data->display))
+				if (!intel_pipe_output_combo_valid(&data->display))
 					continue;
 
 				prepare_crtc(data, output, pipe);
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 59b105c60..11fe77387 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -86,7 +86,7 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
 	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
-	igt_require(i915_pipe_output_combo_valid(display));
+	igt_require(intel_pipe_output_combo_valid(display));
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index db9f5a54c..2b1050413 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -280,7 +280,7 @@ static void run_test(data_t *data, uint64_t modifier)
 			igt_display_reset(&data->display);
 			igt_output_set_pipe(data->output, data->pipe);
 
-			if (!i915_pipe_output_combo_valid(&data->display))
+			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
 
 			data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 7dd9d586d..4ef3be3e4 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -386,7 +386,7 @@ static void run_test(data_t *data, uint64_t modifier)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 0e7cd4a2a..09c2855c5 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -647,7 +647,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 				continue;
 
 			igt_output_set_pipe(*output, pipe);
-			if (i915_pipe_output_combo_valid(display)) {
+			if (intel_pipe_output_combo_valid(display)) {
 				found = true;
 
 				if (second) {
@@ -1086,7 +1086,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index dd5ab993e..5f4d11993 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -92,7 +92,7 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, *pipe);
-		if (i915_pipe_output_combo_valid(display)) {
+		if (intel_pipe_output_combo_valid(display)) {
 			found = true;
 			break;
 		}
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 2fe8dfa66..3f66f364b 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -244,7 +244,7 @@ static void plane_properties(igt_display_t *display, bool atomic)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			found_any = found = true;
@@ -273,7 +273,7 @@ static void crtc_properties(igt_display_t *display, bool atomic)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			found_any_valid_pipe = found = true;
@@ -305,7 +305,7 @@ static void connector_properties(igt_display_t *display, bool atomic)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			found = true;
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 50df42953..0e10a536c 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -161,7 +161,7 @@ run_rmfb_test(struct rmfb_data *data, bool reopen)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 28b4fd27c..8169b165d 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -215,7 +215,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	cleanup_crtc(data);
 
 	igt_output_set_pipe(output, pipe);
-	igt_require(i915_pipe_output_combo_valid(display));
+	igt_require(intel_pipe_output_combo_valid(display));
 
 	igt_plane_set_rotation(plane, IGT_ROTATION_0);
 
@@ -502,7 +502,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		found = true;
@@ -824,7 +824,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		found = true;
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 906ae76de..50fb53109 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -99,7 +99,7 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 			continue;
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index c8a3d6bbd..c1ae8d1f4 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -288,7 +288,7 @@ igt_main
 					igt_display_reset(&data.display);
 
 					igt_output_set_pipe(output, p);
-					if (!i915_pipe_output_combo_valid(&data.display))
+					if (!intel_pipe_output_combo_valid(&data.display))
 						continue;
 
 					igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(p)) {
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 635a136ab..d45a57af5 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -793,7 +793,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index da0ada78e..09814b8ea 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -183,7 +183,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
@@ -206,7 +206,7 @@ static void crtc_id_subtest(data_t *data, int fd)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, p);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		igt_info("Using (pipe %s + %s) to run the subtest.\n",
@@ -532,7 +532,7 @@ static void invalid_subtest(data_t *data, int fd)
 	data->output = output;
 
 	igt_output_set_pipe(output, pipe);
-	igt_require(i915_pipe_output_combo_valid(display));
+	igt_require(intel_pipe_output_combo_valid(display));
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(pipe), igt_output_name(output));
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d2d79c4eb..cd136593c 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -477,7 +477,7 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 				igt_display_reset(&data->display);
 
 				igt_output_set_pipe(output, pipe);
-				if (!i915_pipe_output_combo_valid(&data->display))
+				if (!intel_pipe_output_combo_valid(&data->display))
 					continue;
 
 				igt_dynamic_f("pipe-%s-%s",
-- 
2.40.0
