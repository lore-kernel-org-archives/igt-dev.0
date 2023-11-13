Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED1210E166
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 08:29:25 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 13 Nov 2023 13:49:26 +0530
Message-Id: <20231113081930.1189688-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20231113081930.1189688-1-bhanuprakash.modem@intel.com>
References: <20231113081930.1189688-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/5] tests:
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

V2, V3, V4: - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c                          | 4 ++--
 lib/igt_kms.h                          | 2 +-
 tests/intel/kms_big_fb.c               | 2 +-
 tests/intel/kms_busy.c                 | 2 +-
 tests/intel/kms_ccs.c                  | 2 +-
 tests/intel/kms_cdclk.c                | 4 ++--
 tests/intel/kms_draw_crc.c             | 2 +-
 tests/intel/kms_dsc.c                  | 2 +-
 tests/intel/kms_fb_coherency.c         | 2 +-
 tests/intel/kms_fence_pin_leak.c       | 2 +-
 tests/intel/kms_flip_scaled_crc.c      | 4 ++--
 tests/intel/kms_flip_tiling.c          | 2 +-
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 tests/intel/kms_mmap_write_crc.c       | 2 +-
 tests/intel/kms_psr.c                  | 2 +-
 tests/intel/kms_psr2_sf.c              | 2 +-
 tests/intel/kms_psr2_su.c              | 2 +-
 tests/intel/kms_psr_stress_test.c      | 2 +-
 tests/intel/kms_pwrite_crc.c           | 2 +-
 tests/kms_async_flips.c                | 2 +-
 tests/kms_atomic.c                     | 2 +-
 tests/kms_atomic_interruptible.c       | 2 +-
 tests/kms_atomic_transition.c          | 6 +++---
 tests/kms_color_helper.c               | 2 +-
 tests/kms_concurrent.c                 | 2 +-
 tests/kms_content_protection.c         | 2 +-
 tests/kms_cursor_crc.c                 | 2 +-
 tests/kms_cursor_edge_walk.c           | 2 +-
 tests/kms_cursor_legacy.c              | 2 +-
 tests/kms_display_modes.c              | 4 ++--
 tests/kms_flip_event_leak.c            | 2 +-
 tests/kms_invalid_mode.c               | 2 +-
 tests/kms_lease.c                      | 2 +-
 tests/kms_pipe_crc_basic.c             | 2 +-
 tests/kms_plane.c                      | 2 +-
 tests/kms_plane_alpha_blend.c          | 2 +-
 tests/kms_plane_cursor.c               | 2 +-
 tests/kms_plane_lowres.c               | 2 +-
 tests/kms_plane_multiple.c             | 2 +-
 tests/kms_plane_scaling.c              | 4 ++--
 tests/kms_prime.c                      | 2 +-
 tests/kms_properties.c                 | 6 +++---
 tests/kms_rmfb.c                       | 2 +-
 tests/kms_rotation_crc.c               | 6 +++---
 tests/kms_scaling_modes.c              | 2 +-
 tests/kms_sequence.c                   | 2 +-
 tests/kms_tiled_display.c              | 2 +-
 tests/kms_universal_plane.c            | 2 +-
 tests/kms_vblank.c                     | 2 +-
 tests/kms_vrr.c                        | 2 +-
 50 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 453103f90..55496218f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6204,7 +6204,7 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
 }
 
 /**
- * i915_pipe_output_combo_valid:
+ * intel_pipe_output_combo_valid:
  * @display: a pointer to an #igt_display_t structure
  *
  * Every individual test must use igt_output_set_pipe() before calling this
@@ -6222,7 +6222,7 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
  *
  * Returns: True if a valid pipe/output mode combo found, else false
  */
-bool i915_pipe_output_combo_valid(igt_display_t *display)
+bool intel_pipe_output_combo_valid(igt_display_t *display)
 {
 	int combo = 0;
 	igt_output_t *output;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9028ab9be..7e41ba9b3 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1194,7 +1194,7 @@ int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
-bool i915_pipe_output_combo_valid(igt_display_t *display);
+bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(int drm_fd, enum pipe pipe);
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 2c7b24fca..035c936d9 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -719,7 +719,7 @@ static void test_scanout(data_t *data)
 		igt_display_reset(&data->display);
 
 		igt_output_set_pipe(data->output, data->pipe);
-		if (!i915_pipe_output_combo_valid(&data->display))
+		if (!intel_pipe_output_combo_valid(&data->display))
 			continue;
 
 		if (data->async_flip_test) {
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index 50616513c..fe450160f 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -375,7 +375,7 @@ pipe_output_combo_valid(igt_display_t *dpy,
 	igt_display_reset(dpy);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(dpy))
+	if (!intel_pipe_output_combo_valid(dpy))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 93e837b84..f677a4659 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -738,7 +738,7 @@ static void test_output(data_t *data, const int testnum)
 			igt_display_reset(&data->display);
 
 			igt_output_set_pipe(data->output, data->pipe);
-			if (i915_pipe_output_combo_valid(&data->display)) {
+			if (intel_pipe_output_combo_valid(&data->display)) {
 				found = true;
 				break;
 			}
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 71d827dac..74bb254b9 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -297,7 +297,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		igt_output_override_mode(output, mode_hi);
 		i++;
 	}
-	igt_require(i915_pipe_output_combo_valid(display));
+	igt_require(intel_pipe_output_combo_valid(display));
 	igt_display_reset(display);
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
@@ -381,7 +381,7 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display)) {
+		if (!intel_pipe_output_combo_valid(display)) {
 			igt_output_set_pipe(output, PIPE_NONE);
 			continue;
 		}
diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index 086f64dc8..4bde8fa59 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -66,7 +66,7 @@ static void find_modeset_params(void)
 		igt_display_reset(&display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(&display))
+		if (!intel_pipe_output_combo_valid(&display))
 			continue;
 
 		mode = igt_output_get_mode(output);
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index c7dfb509a..84dc02bcb 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -202,7 +202,7 @@ static void update_display(data_t *data, uint32_t test_type)
 
 		igt_output_override_mode(output, mode);
 
-		if (!i915_pipe_output_combo_valid(display)) {
+		if (!intel_pipe_output_combo_valid(display)) {
 			if (data->output_format == DSC_FORMAT_RGB) {
 				igt_info("No valid pipe/output/mode found.\n");
 
diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index a92174bde..cd6b5da4b 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -218,7 +218,7 @@ static void select_valid_pipe_output_combo(data_t *data)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(data->output, data->pipe);
-		if (i915_pipe_output_combo_valid(display))
+		if (intel_pipe_output_combo_valid(display))
 			return;
 	}
 
diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
index 03f3990c4..47808800f 100644
--- a/tests/intel/kms_fence_pin_leak.c
+++ b/tests/intel/kms_fence_pin_leak.c
@@ -214,7 +214,7 @@ static void run_test(data_t *data)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, p);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		run_single_test(data, p, output);
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 2997b63fa..d3489c478 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -826,7 +826,7 @@ igt_main
 					igt_output_set_pipe(output, pipe);
 					igt_output_override_mode(output, modetoset);
 
-					if (modetoset && i915_pipe_output_combo_valid(&data.display)) {
+					if (modetoset && intel_pipe_output_combo_valid(&data.display)) {
 						found = true;
 						igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
 							run_tests(&data, index, pipe, output, modetoset);
@@ -838,7 +838,7 @@ igt_main
 						igt_display_reset(&data.display);
 
 						igt_output_set_pipe(output, pipe);
-						if (!i915_pipe_output_combo_valid(&data.display))
+						if (!intel_pipe_output_combo_valid(&data.display))
 							continue;
 
 						modetoset = NULL;
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index 295f097ec..a6c6514a6 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -211,7 +211,7 @@ igt_main
 			pipe_crc_free(&data);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(&data.display))
+			if (!intel_pipe_output_combo_valid(&data.display))
 				continue;
 
 			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index be340a997..3ecd535d7 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -432,7 +432,7 @@ static bool find_connector(bool edp_only, bool pipe_a,
 
 		igt_output_set_pipe(output, pipe);
 		igt_output_override_mode(output, connector_get_mode(output));
-		if (i915_pipe_output_combo_valid(&drm.display)) {
+		if (intel_pipe_output_combo_valid(&drm.display)) {
 			*ret_output = output;
 			*ret_pipe = pipe;
 			return true;
diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index 17d72ee32..c8ff39ef0 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -296,7 +296,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 			igt_display_reset(&data.display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(&data.display))
+			if (!intel_pipe_output_combo_valid(&data.display))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index ffecc5222..ec0ca8198 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -303,7 +303,7 @@ static void setup_output(data_t *data)
 
 		igt_display_reset(display);
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		data->crtc_id = output->config.crtc->crtc_id;
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index d7a746211..442e161d5 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -956,7 +956,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 834fec1ec..11cc44255 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -131,7 +131,7 @@ static void setup_output(data_t *data)
 
 		igt_display_reset(display);
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		data->output = output;
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index b6759eece..cafedc369 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -94,7 +94,7 @@ static void setup_output(data_t *data)
 
 		igt_display_reset(display);
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display)) {
+		if (!intel_pipe_output_combo_valid(display)) {
 			igt_output_set_pipe(output, PIPE_NONE);
 			continue;
 		}
diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index 50df18aa3..ee6b4f3e4 100644
--- a/tests/intel/kms_pwrite_crc.c
+++ b/tests/intel/kms_pwrite_crc.c
@@ -175,7 +175,7 @@ static void run_test(data_t *data)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(data->output, data->pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		prepare_crtc(data);
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 6c97558be..f29c46645 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -615,7 +615,7 @@ static void run_test(data_t *data, void (*test)(data_t *))
 		igt_display_reset(display);
 
 		igt_output_set_pipe(data->output, data->pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		test_init(data);
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index c7190c6bd..a47539e48 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1404,7 +1404,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 1a104106a..c86db7149 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -332,7 +332,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index f5f21f925..1ec96ce5e 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -849,7 +849,7 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 				continue;
 
 			igt_output_set_pipe(output, pipe);
-			if (i915_pipe_output_combo_valid(&data->display)) {
+			if (intel_pipe_output_combo_valid(&data->display)) {
 				mode = igt_output_get_mode(output);
 				break;
 			} else {
@@ -939,7 +939,7 @@ retry:
 				continue;
 
 			igt_output_set_pipe(output, i);
-			if (i915_pipe_output_combo_valid(&data->display)) {
+			if (intel_pipe_output_combo_valid(&data->display)) {
 				mode = igt_output_get_mode(output);
 
 				igt_info("(pipe %s + %s), mode:",
@@ -1110,7 +1110,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
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
index d2a781e35..d1a83d14e 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -342,7 +342,7 @@ run_tests_for_pipe(data_t *data)
 			igt_display_reset(&data->display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(&data->display))
+			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
 
 			igt_require(data->display.pipes[pipe].n_planes > 0);
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index ea0c4a0ab..9a0583d96 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -568,7 +568,7 @@ test_content_protection(enum igt_commit_style s, int content_type)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			modeset_with_fb(pipe, output, s);
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index e3259e147..d2f10356b 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -773,7 +773,7 @@ static bool valid_pipe_output_combo(data_t *data)
 	igt_display_reset(display);
 	igt_output_set_pipe(data->output, data->pipe);
 
-	if (i915_pipe_output_combo_valid(display))
+	if (intel_pipe_output_combo_valid(display))
 		ret = true;
 
 	igt_output_set_pipe(data->output, PIPE_NONE);
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 1e233306d..e284fc4d8 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -401,7 +401,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 					igt_display_reset(&data.display);
 					igt_output_set_pipe(data.output, data.pipe);
-					if (!i915_pipe_output_combo_valid(&data.display))
+					if (!intel_pipe_output_combo_valid(&data.display))
 						continue;
 
 					igt_output_set_pipe(data.output, PIPE_NONE);
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 861581c93..d0d752e5e 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -280,7 +280,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 				continue;
 
 			igt_output_set_pipe(*output, pipe);
-			if (i915_pipe_output_combo_valid(display)) {
+			if (intel_pipe_output_combo_valid(display)) {
 				found = true;
 
 				if (second) {
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index f44d452b7..aff2a93bc 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -236,7 +236,7 @@ static void run_extendedmode_test(data_t *data) {
 					igt_output_set_pipe(output1, pipe1);
 					igt_output_set_pipe(output2, pipe2);
 
-					if (!i915_pipe_output_combo_valid(display))
+					if (!intel_pipe_output_combo_valid(display))
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
@@ -299,7 +299,7 @@ static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
 	igt_output_override_mode(data->mst_output[0], &data->mode_mst[0]);
 	igt_output_override_mode(data->mst_output[1], &data->mode_mst[1]);
 
-	igt_require(i915_pipe_output_combo_valid(display));
+	igt_require(intel_pipe_output_combo_valid(display));
 	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
 	igt_assert(ret != 0 && errno == ENOSPC);
 }
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index 57f6f64f7..f526a0ca9 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -122,7 +122,7 @@ igt_main
 			igt_display_reset(&data.display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(&data.display))
+			if (!intel_pipe_output_combo_valid(&data.display))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index db7b703c0..55b7fea8f 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -314,7 +314,7 @@ igt_main
 				igt_display_reset(&data.display);
 
 				igt_output_set_pipe(output, pipe);
-				if (!i915_pipe_output_combo_valid(&data.display))
+				if (!intel_pipe_output_combo_valid(&data.display))
 					continue;
 
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index a704601f5..5c5a23fed 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1365,7 +1365,7 @@ igt_main
 					igt_display_reset(display);
 
 					igt_output_set_pipe(output, data.pipe);
-					if (!i915_pipe_output_combo_valid(display))
+					if (!intel_pipe_output_combo_valid(display))
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe),
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index d980c3786..94252415b 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -376,7 +376,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 24df7e8ca..c561bf6ba 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1325,7 +1325,7 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 		igt_display_reset(&data->display);
 
 		igt_output_set_pipe(data->output, pipe);
-		if (!i915_pipe_output_combo_valid(&data->display))
+		if (!intel_pipe_output_combo_valid(&data->display))
 			continue;
 
 		igt_output_set_pipe(data->output, PIPE_NONE);
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index bff624ebe..f023fae74 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -706,7 +706,7 @@ static void run_subtests(data_t *data)
 				igt_display_reset(&data->display);
 
 				igt_output_set_pipe(output, pipe);
-				if (!i915_pipe_output_combo_valid(&data->display))
+				if (!intel_pipe_output_combo_valid(&data->display))
 					continue;
 
 				prepare_crtc(data, output, pipe);
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 22c5a709d..bc89414d8 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -336,7 +336,7 @@ igt_main
 				igt_display_reset(display);
 
 				igt_output_set_pipe(output, pipe);
-				if (!i915_pipe_output_combo_valid(display))
+				if (!intel_pipe_output_combo_valid(display))
 					continue;
 
 				test_init(&data, pipe, output);
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index d9a175c9b..3bb92cdd9 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -307,7 +307,7 @@ static void run_test(data_t *data, uint64_t modifier)
 			igt_display_reset(&data->display);
 			igt_output_set_pipe(data->output, data->pipe);
 
-			if (!i915_pipe_output_combo_valid(&data->display))
+			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
 
 			data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index b1ae35161..28791560f 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -417,7 +417,7 @@ static void run_test(data_t *data, uint64_t modifier)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 720e82d38..67da91b1e 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -774,7 +774,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 				continue;
 
 			igt_output_set_pipe(*output, pipe);
-			if (i915_pipe_output_combo_valid(display)) {
+			if (intel_pipe_output_combo_valid(display)) {
 				found = true;
 
 				if (second) {
@@ -1328,7 +1328,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 14e44869d..b06365cbc 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -124,7 +124,7 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, *pipe);
-		if (i915_pipe_output_combo_valid(display)) {
+		if (intel_pipe_output_combo_valid(display)) {
 			found = true;
 			break;
 		}
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 328436622..1a58717e1 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -269,7 +269,7 @@ static void plane_properties(igt_display_t *display, bool atomic)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			found_any = found = true;
@@ -298,7 +298,7 @@ static void crtc_properties(igt_display_t *display, bool atomic)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			found_any_valid_pipe = found = true;
@@ -330,7 +330,7 @@ static void connector_properties(igt_display_t *display, bool atomic)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			found = true;
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 6c6cdffba..5281370f0 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -183,7 +183,7 @@ run_rmfb_test(struct rmfb_data *data, bool reopen)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index c48e0d672..864ab7b03 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -220,7 +220,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	cleanup_crtc(data);
 
 	igt_output_set_pipe(output, pipe);
-	igt_require(i915_pipe_output_combo_valid(display));
+	igt_require(intel_pipe_output_combo_valid(display));
 
 	igt_plane_set_rotation(plane, IGT_ROTATION_0);
 
@@ -594,7 +594,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		found = true;
@@ -952,7 +952,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		found = true;
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index c1a8f5c60..eb10f7386 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -118,7 +118,7 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 			continue;
 
 		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 6716d3860..011733bc8 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -317,7 +317,7 @@ igt_main
 					igt_display_reset(&data.display);
 
 					igt_output_set_pipe(output, p);
-					if (!i915_pipe_output_combo_valid(&data.display))
+					if (!intel_pipe_output_combo_valid(&data.display))
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), igt_output_name(output)) {
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 519c3754c..bb29a4ca7 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -288,7 +288,7 @@ static void setup_mode(data_t *data)
 		igt_output_override_mode(output, mode);
 		data->linetime_us = mode_linetime_us(mode);
 	}
-	igt_require(i915_pipe_output_combo_valid(&data->display));
+	igt_require(intel_pipe_output_combo_valid(&data->display));
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 2e8c0cc17..7178bebc0 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -809,7 +809,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 25b17b25c..549a959ad 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -274,7 +274,7 @@ pipe_output_combo_valid(igt_display_t *display,
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-	if (!i915_pipe_output_combo_valid(display))
+	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_pipe(output, PIPE_NONE);
 
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index e203fd4d5..f26adbccf 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -520,7 +520,7 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 				igt_display_reset(&data->display);
 
 				igt_output_set_pipe(output, pipe);
-				if (!i915_pipe_output_combo_valid(&data->display))
+				if (!intel_pipe_output_combo_valid(&data->display))
 					continue;
 
 				igt_dynamic_f("pipe-%s-%s",
-- 
2.40.0
