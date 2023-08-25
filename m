Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B3610E62D
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 08:33:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Date: Fri, 25 Aug 2023 13:55:37 +0530
Message-Id: <20230825082541.905799-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825082541.905799-1-bhanuprakash.modem@intel.com>
References: <20230825082541.905799-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 1/5] tests:
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

V2, V3: - Rebase

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
 tests/i915/kms_fb_coherency.c         | 2 +-
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
 tests/kms_display_modes.c             | 4 ++--
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
 tests/kms_tiled_display.c             | 2 +-
 tests/kms_universal_plane.c           | 2 +-
 tests/kms_vblank.c                    | 6 +++---
 tests/kms_vrr.c                       | 2 +-
 50 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e0959ccff..2b83d56ac 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5997,7 +5997,7 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
 }
 
 /*
- * i915_pipe_output_combo_valid:
+ * intel_pipe_output_combo_valid:
  * @display: a pointer to an #igt_display_t structure
  *
  * Every individual test must use igt_output_set_pipe() before calling this
@@ -6015,7 +6015,7 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
  *
  * Returns: true if a valid pipe/output mode combo found, else false
  */
-bool i915_pipe_output_combo_valid(igt_display_t *display)
+bool intel_pipe_output_combo_valid(igt_display_t *display)
 {
 	int combo = 0;
 	igt_output_t *output;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 91355c910..a6bc67123 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1012,6 +1012,6 @@ int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
-bool i915_pipe_output_combo_valid(igt_display_t *display);
+bool intel_pipe_output_combo_valid(igt_display_t *display);
 
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 33008c40a..baf68e2ee 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -716,7 +716,7 @@ static void test_scanout(data_t *data)
 		igt_display_reset(&data->display);
 
 		igt_output_set_pipe(data->output, data->pipe);
-		if (!i915_pipe_output_combo_valid(&data->display))
+		if (!intel_pipe_output_combo_valid(&data->display))
 			continue;
 
 		if (data->async_flip_test) {
diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index a1f517758..dcdb801c1 100644
--- a/tests/i915/kms_busy.c
+++ b/tests/i915/kms_busy.c
@@ -380,7 +380,7 @@ pipe_output_combo_valid(igt_display_t *dpy,
 	igt_display_reset(dpy);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(dpy))
+	if (!intel_pipe_output_combo_valid(dpy))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
index 976aedb06..dfd77cbf4 100644
--- a/tests/i915/kms_ccs.c
+++ b/tests/i915/kms_ccs.c
@@ -727,7 +727,7 @@ static void test_output(data_t *data, const int testnum)
 			igt_display_reset(&data->display);
 
 			igt_output_set_pipe(data->output, data->pipe);
-			if (i915_pipe_output_combo_valid(&data->display)) {
+			if (intel_pipe_output_combo_valid(&data->display)) {
 				found = true;
 				break;
 			}
diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index 237f28f00..e6e09c47d 100644
--- a/tests/i915/kms_cdclk.c
+++ b/tests/i915/kms_cdclk.c
@@ -298,7 +298,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		igt_output_override_mode(output, mode_hi);
 		i++;
 	}
-	igt_require(i915_pipe_output_combo_valid(display));
+	igt_require(intel_pipe_output_combo_valid(display));
 	igt_display_reset(display);
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
@@ -384,7 +384,7 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display)) {
+		if (!intel_pipe_output_combo_valid(display)) {
 			igt_output_set_pipe(output, PIPE_NONE);
 			continue;
 		}
diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index ddd025455..552e4f21f 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -66,7 +66,7 @@ static void find_modeset_params(void)
 		igt_display_reset(&display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(&display))
+		if (!intel_pipe_output_combo_valid(&display))
 			continue;
 
 		mode = igt_output_get_mode(output);
diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 41e1d9519..6b796309a 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -203,7 +203,7 @@ static void update_display(data_t *data, uint32_t test_type)
 
 		igt_output_override_mode(output, mode);
 
-		if (!i915_pipe_output_combo_valid(display)) {
+		if (!intel_pipe_output_combo_valid(display)) {
 			if (data->output_format == DSC_FORMAT_RGB) {
 				igt_info("No valid pipe/output/mode found.\n");
 
diff --git a/tests/i915/kms_fb_coherency.c b/tests/i915/kms_fb_coherency.c
index c772ddcdc..c732449c5 100644
--- a/tests/i915/kms_fb_coherency.c
+++ b/tests/i915/kms_fb_coherency.c
@@ -214,7 +214,7 @@ static void select_valid_pipe_output_combo(data_t *data)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(data->output, data->pipe);
-		if (i915_pipe_output_combo_valid(display))
+		if (intel_pipe_output_combo_valid(display))
 			return;
 	}
 
diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
index 3db5767af..d27720b5b 100644
--- a/tests/i915/kms_fence_pin_leak.c
+++ b/tests/i915/kms_fence_pin_leak.c
@@ -215,7 +215,7 @@ static void run_test(data_t *data)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, p);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		run_single_test(data, p, output);
diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index ad68f2474..ccff4557b 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -851,7 +851,7 @@ igt_main
 					igt_output_set_pipe(output, pipe);
 					igt_output_override_mode(output, modetoset);
 
-					if (modetoset && i915_pipe_output_combo_valid(&data.display)) {
+					if (modetoset && intel_pipe_output_combo_valid(&data.display)) {
 						found = true;
 						igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
 							run_tests(&data, index, pipe, output, modetoset);
@@ -863,7 +863,7 @@ igt_main
 						igt_display_reset(&data.display);
 
 						igt_output_set_pipe(output, pipe);
-						if (!i915_pipe_output_combo_valid(&data.display))
+						if (!intel_pipe_output_combo_valid(&data.display))
 							continue;
 
 						modetoset = NULL;
diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index ada4f5e0d..b191fda77 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -212,7 +212,7 @@ igt_main
 			pipe_crc_free(&data);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(&data.display))
+			if (!intel_pipe_output_combo_valid(&data.display))
 				continue;
 
 			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 136426204..f0a40096b 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -420,7 +420,7 @@ static bool find_connector(bool edp_only, bool pipe_a,
 
 		igt_output_set_pipe(output, pipe);
 		igt_output_override_mode(output, connector_get_mode(output));
-		if (i915_pipe_output_combo_valid(&drm.display)) {
+		if (intel_pipe_output_combo_valid(&drm.display)) {
 			*ret_output = output;
 			*ret_pipe = pipe;
 			return true;
diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index 73676bc06..69afa0954 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -297,7 +297,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 			igt_display_reset(&data.display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(&data.display))
+			if (!intel_pipe_output_combo_valid(&data.display))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
index 9e0e5c4a0..bb487d3ae 100644
--- a/tests/i915/kms_psr.c
+++ b/tests/i915/kms_psr.c
@@ -319,7 +319,7 @@ static void setup_output(data_t *data)
 
 		igt_display_reset(display);
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		data->crtc_id = output->config.crtc->crtc_id;
diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 6f71504b3..b3f1b85c6 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -964,7 +964,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 39bb20ded..2a5756696 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -133,7 +133,7 @@ static void setup_output(data_t *data)
 
 		igt_display_reset(display);
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		data->output = output;
diff --git a/tests/i915/kms_psr_stress_test.c b/tests/i915/kms_psr_stress_test.c
index e8cec7807..fca579b9f 100644
--- a/tests/i915/kms_psr_stress_test.c
+++ b/tests/i915/kms_psr_stress_test.c
@@ -96,7 +96,7 @@ static void setup_output(data_t *data)
 
 		igt_display_reset(display);
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display)) {
+		if (!intel_pipe_output_combo_valid(display)) {
 			igt_output_set_pipe(output, PIPE_NONE);
 			continue;
 		}
diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index b08997a8d..380108f92 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -176,7 +176,7 @@ static void run_test(data_t *data)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(data->output, data->pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		prepare_crtc(data);
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 2a317a9ef..58b42d1df 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -621,7 +621,7 @@ static void run_test(data_t *data, void (*test)(data_t *))
 		igt_display_reset(display);
 
 		igt_output_set_pipe(data->output, data->pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		test_init(data);
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 3289219f9..5714a9f80 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1410,7 +1410,7 @@ igt_main
 			igt_display_reset(&display);
 
 			igt_output_set_pipe(output, pipe);
-			if (i915_pipe_output_combo_valid(&display)) {
+			if (intel_pipe_output_combo_valid(&display)) {
 				valid_config = true;
 				break;
 			}
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index c8a8ba447..f182becba 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -337,7 +337,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a470eb88c..d3e2c8e36 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -851,7 +851,7 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 				continue;
 
 			igt_output_set_pipe(output, pipe);
-			if (i915_pipe_output_combo_valid(&data->display)) {
+			if (intel_pipe_output_combo_valid(&data->display)) {
 				mode = igt_output_get_mode(output);
 				break;
 			} else {
@@ -941,7 +941,7 @@ retry:
 				continue;
 
 			igt_output_set_pipe(output, i);
-			if (i915_pipe_output_combo_valid(&data->display)) {
+			if (intel_pipe_output_combo_valid(&data->display)) {
 				mode = igt_output_get_mode(output);
 
 				igt_info("(pipe %s + %s), mode:",
@@ -1113,7 +1113,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 69cf2362e..143dff43e 100644
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
index a37b7d2fb..763639ee3 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -360,7 +360,7 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 			igt_display_reset(&data->display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(&data->display))
+			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
 
 			igt_output_set_pipe(output, PIPE_NONE);
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 59c617493..97d2cc493 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -574,7 +574,7 @@ test_content_protection(enum igt_commit_style s, int content_type)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			modeset_with_fb(pipe, output, s);
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 7151ccf80..a1a740e37 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -763,7 +763,7 @@ static bool valid_pipe_output_combo(data_t *data)
 	igt_display_reset(display);
 	igt_output_set_pipe(data->output, data->pipe);
 
-	if (i915_pipe_output_combo_valid(display))
+	if (intel_pipe_output_combo_valid(display))
 		ret = true;
 
 	igt_output_set_pipe(data->output, PIPE_NONE);
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 8cc986fc8..fc1ec4454 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -402,7 +402,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 					igt_display_reset(&data.display);
 					igt_output_set_pipe(data.output, data.pipe);
-					if (!i915_pipe_output_combo_valid(&data.display))
+					if (!intel_pipe_output_combo_valid(&data.display))
 						continue;
 
 					igt_output_set_pipe(data.output, PIPE_NONE);
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 3fc2ece88..95de7b51a 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -281,7 +281,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 				continue;
 
 			igt_output_set_pipe(*output, pipe);
-			if (i915_pipe_output_combo_valid(display)) {
+			if (intel_pipe_output_combo_valid(display)) {
 				found = true;
 
 				if (second) {
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 5dbf0a88d..694a0e874 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -268,7 +268,7 @@ static void run_extendedmode_test(data_t *data) {
 					igt_output_set_pipe(output1, pipe1);
 					igt_output_set_pipe(output2, pipe2);
 
-					if (!i915_pipe_output_combo_valid(display))
+					if (!intel_pipe_output_combo_valid(display))
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
@@ -332,7 +332,7 @@ static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
 	igt_output_override_mode(data->mst_output[0], &data->mode_mst[0]);
 	igt_output_override_mode(data->mst_output[1], &data->mode_mst[1]);
 
-	igt_require(i915_pipe_output_combo_valid(display));
+	igt_require(intel_pipe_output_combo_valid(display));
 	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
 	igt_assert(ret != 0 && errno == ENOSPC);
 }
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index d638a4495..22d09097a 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -123,7 +123,7 @@ igt_main
 			igt_display_reset(&data.display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(&data.display))
+			if (!intel_pipe_output_combo_valid(&data.display))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 306fa972f..d451c30f1 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -315,7 +315,7 @@ igt_main
 				igt_display_reset(&data.display);
 
 				igt_output_set_pipe(output, pipe);
-				if (!i915_pipe_output_combo_valid(&data.display))
+				if (!intel_pipe_output_combo_valid(&data.display))
 					continue;
 
 				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe)) {
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index fcdb2dbe6..538ff15de 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1407,7 +1407,7 @@ igt_main
 					igt_display_reset(display);
 
 					igt_output_set_pipe(output, data.pipe);
-					if (!i915_pipe_output_combo_valid(display))
+					if (!intel_pipe_output_combo_valid(display))
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe),
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index c085fb971..998268e1b 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -385,7 +385,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 721d3b533..59a326a71 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1313,7 +1313,7 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 		igt_display_reset(&data->display);
 
 		igt_output_set_pipe(data->output, pipe);
-		if (!i915_pipe_output_combo_valid(&data->display))
+		if (!intel_pipe_output_combo_valid(&data->display))
 			continue;
 
 		igt_output_set_pipe(data->output, PIPE_NONE);
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index d4458ac69..bf6845f5b 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -710,7 +710,7 @@ static void run_subtests(data_t *data)
 				igt_display_reset(&data->display);
 
 				igt_output_set_pipe(output, pipe);
-				if (!i915_pipe_output_combo_valid(&data->display))
+				if (!intel_pipe_output_combo_valid(&data->display))
 					continue;
 
 				prepare_crtc(data, output, pipe);
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 319a8ecaa..6cbb0e8ba 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -339,7 +339,7 @@ igt_main
 				igt_display_reset(display);
 
 				igt_output_set_pipe(output, pipe);
-				if (!i915_pipe_output_combo_valid(display))
+				if (!intel_pipe_output_combo_valid(display))
 					continue;
 
 				test_init(&data, pipe, output);
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 5ff06c417..fba05ff01 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -312,7 +312,7 @@ static void run_test(data_t *data, uint64_t modifier)
 			igt_display_reset(&data->display);
 			igt_output_set_pipe(data->output, data->pipe);
 
-			if (!i915_pipe_output_combo_valid(&data->display))
+			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
 
 			data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index c381d2e5a..027cdd60f 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -419,7 +419,7 @@ static void run_test(data_t *data, uint64_t modifier)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 89e5e6d3d..16cd3ea94 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -790,7 +790,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 				continue;
 
 			igt_output_set_pipe(*output, pipe);
-			if (i915_pipe_output_combo_valid(display)) {
+			if (intel_pipe_output_combo_valid(display)) {
 				found = true;
 
 				if (second) {
@@ -1348,7 +1348,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index a14006147..f58df0094 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -127,7 +127,7 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, *pipe);
-		if (i915_pipe_output_combo_valid(display)) {
+		if (intel_pipe_output_combo_valid(display)) {
 			found = true;
 			break;
 		}
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 50ffa91b5..47442531c 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -270,7 +270,7 @@ static void plane_properties(igt_display_t *display, bool atomic)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			found_any = found = true;
@@ -299,7 +299,7 @@ static void crtc_properties(igt_display_t *display, bool atomic)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			found_any_valid_pipe = found = true;
@@ -331,7 +331,7 @@ static void connector_properties(igt_display_t *display, bool atomic)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			found = true;
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index a4628129c..7e63f1d8a 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -185,7 +185,7 @@ run_rmfb_test(struct rmfb_data *data, bool reopen)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index b80cf695e..0512e67fb 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -220,7 +220,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	cleanup_crtc(data);
 
 	igt_output_set_pipe(output, pipe);
-	igt_require(i915_pipe_output_combo_valid(display));
+	igt_require(intel_pipe_output_combo_valid(display));
 
 	igt_plane_set_rotation(plane, IGT_ROTATION_0);
 
@@ -601,7 +601,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		found = true;
@@ -961,7 +961,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		found = true;
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index d32e02dac..e9ecd7cc6 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -119,7 +119,7 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 			continue;
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 1c825784e..a17d98109 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -324,7 +324,7 @@ igt_main
 					igt_display_reset(&data.display);
 
 					igt_output_set_pipe(output, p);
-					if (!i915_pipe_output_combo_valid(&data.display))
+					if (!intel_pipe_output_combo_valid(&data.display))
 						continue;
 
 					igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(p)) {
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index fbca3890d..8359dfb8f 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -290,7 +290,7 @@ static void setup_mode(data_t *data)
 		igt_output_override_mode(output, mode);
 		data->linetime_us = mode_linetime_us(mode);
 	}
-	igt_require(i915_pipe_output_combo_valid(&data->display));
+	igt_require(intel_pipe_output_combo_valid(&data->display));
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 09d7a7646..ca5b21b37 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -861,7 +861,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 0cc21bb5f..c321396a0 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -343,7 +343,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
@@ -366,7 +366,7 @@ static void crtc_id_subtest(data_t *data, int fd)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, p);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		igt_info("Using (pipe %s + %s) to run the subtest.\n",
@@ -692,7 +692,7 @@ static void invalid_subtest(data_t *data, int fd)
 	data->output = output;
 
 	igt_output_set_pipe(output, pipe);
-	igt_require(i915_pipe_output_combo_valid(display));
+	igt_require(intel_pipe_output_combo_valid(display));
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(pipe), igt_output_name(output));
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d7ede6513..0d59d06a6 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -525,7 +525,7 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 				igt_display_reset(&data->display);
 
 				igt_output_set_pipe(output, pipe);
-				if (!i915_pipe_output_combo_valid(&data->display))
+				if (!intel_pipe_output_combo_valid(&data->display))
 					continue;
 
 				igt_dynamic_f("pipe-%s-%s",
-- 
2.40.0
