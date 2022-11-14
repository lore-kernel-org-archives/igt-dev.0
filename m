Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E0110E268
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Nov 2022 06:36:08 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 14 Nov 2022 12:10:43 +0530
Message-Id: <1668408044-618-2-git-send-email-nidhi1.gupta@intel.com>
In-Reply-To: <1668408044-618-1-git-send-email-nidhi1.gupta@intel.com>
References: <1668408044-618-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [PATCH 1/2] tests/i915/i915_pm_backlight: Add new subtest
 to validate dual panel backlight
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Since driver can now support multiple eDPs and Debugfs structure for
backlight changed per connector the test should then iterate through
all eDP connectors.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/i915_pm_backlight.c | 208 +++++++++++++++++++++++++++++------------
 1 file changed, 148 insertions(+), 60 deletions(-)

diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index cafae7f..fdf1315 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -34,29 +34,39 @@
 #include <errno.h>
 #include <unistd.h>
 #include <time.h>
+#include "igt_device.h"
+#include "igt_device_scan.h"
 
 struct context {
 	int max;
+	igt_output_t *output;
+	char path[PATH_MAX];
 };
 
+enum {
+	TEST_NONE = 0,
+	TEST_DPMS,
+	TEST_SUSPEND,
+};
 
 #define TOLERANCE 5 /* percent */
-#define BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
+#define BACKLIGHT_PATH "/sys/class/backlight"
 
 #define FADESTEPS 10
 #define FADESPEED 100 /* milliseconds between steps */
 
+#define NUM_EDP_OUTPUTS 2
+
 IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
 
-static int backlight_read(int *result, const char *fname)
+static int backlight_read(int *result, const char *fname, struct context *context)
 {
 	int fd;
 	char full[PATH_MAX];
-	char dst[64];
+	char dst[512];
 	int r, e;
 
-	igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, fname) < PATH_MAX);
-
+	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname) < PATH_MAX);
 	fd = open(full, O_RDONLY);
 	if (fd == -1)
 		return -errno;
@@ -73,14 +83,14 @@ static int backlight_read(int *result, const char *fname)
 	return errno;
 }
 
-static int backlight_write(int value, const char *fname)
+static int backlight_write(int value, const char *fname, struct context *context)
 {
 	int fd;
 	char full[PATH_MAX];
 	char src[64];
 	int len;
 
-	igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, fname) < PATH_MAX);
+	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname) < PATH_MAX);
 	fd = open(full, O_WRONLY);
 	if (fd == -1)
 		return -errno;
@@ -100,12 +110,12 @@ static void test_and_verify(struct context *context, int val)
 	const int tolerance = val * TOLERANCE / 100;
 	int result;
 
-	igt_assert_eq(backlight_write(val, "brightness"), 0);
-	igt_assert_eq(backlight_read(&result, "brightness"), 0);
+	igt_assert_eq(backlight_write(val, "brightness", context), 0);
+	igt_assert_eq(backlight_read(&result, "brightness", context), 0);
 	/* Check that the exact value sticks */
 	igt_assert_eq(result, val);
 
-	igt_assert_eq(backlight_read(&result, "actual_brightness"), 0);
+	igt_assert_eq(backlight_read(&result, "actual_brightness", context), 0);
 	/* Some rounding may happen depending on hw */
 	igt_assert_f(result >= max(0, val - tolerance) &&
 		     result <= min(context->max, val + tolerance),
@@ -124,16 +134,16 @@ static void test_bad_brightness(struct context *context)
 {
 	int val;
 	/* First write some sane value */
-	backlight_write(context->max / 2, "brightness");
+	backlight_write(context->max / 2, "brightness", context);
 	/* Writing invalid values should fail and not change the value */
-	igt_assert_lt(backlight_write(-1, "brightness"), 0);
-	backlight_read(&val, "brightness");
+	igt_assert_lt(backlight_write(-1, "brightness", context), 0);
+	backlight_read(&val, "brightness", context);
 	igt_assert_eq(val, context->max / 2);
-	igt_assert_lt(backlight_write(context->max + 1, "brightness"), 0);
-	backlight_read(&val, "brightness");
+	igt_assert_lt(backlight_write(context->max + 1, "brightness", context), 0);
+	backlight_read(&val, "brightness", context);
 	igt_assert_eq(val, context->max / 2);
-	igt_assert_lt(backlight_write(INT_MAX, "brightness"), 0);
-	backlight_read(&val, "brightness");
+	igt_assert_lt(backlight_write(INT_MAX, "brightness", context), 0);
+	backlight_read(&val, "brightness", context);
 	igt_assert_eq(val, context->max / 2);
 }
 
@@ -179,21 +189,57 @@ test_fade_with_suspend(struct context *context, igt_output_t *output)
 	test_fade(context);
 }
 
+static void test_cleanup(igt_display_t *display, igt_output_t *output)
+{
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+	igt_pm_restore_sata_link_power_management();
+}
+
+static void test_setup(igt_display_t display, igt_output_t *output)
+{
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	struct igt_fb fb;
+	enum pipe pipe;
+
+	igt_display_reset(&display);
+
+	for_each_pipe(&display, pipe) {
+		if (!igt_pipe_connector_valid(pipe, output))
+			continue;
+
+		igt_output_set_pipe(output, pipe);
+		mode = igt_output_get_mode(output);
+
+		igt_create_pattern_fb(display.drm_fd,
+				      mode->hdisplay, mode->vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &fb);
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(primary, &fb);
+
+		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+		igt_pm_enable_sata_link_power_management();
+
+		break;
+	}
+}
+
 igt_main
 {
-	struct context context = {0};
-	int old;
+	int old, fd;
+	int i = 0;
 	igt_display_t display;
 	igt_output_t *output;
-	struct igt_fb fb;
+	char file_path_n[PATH_MAX] = "";
+	bool dual_edp = false;
+	struct context contexts[NUM_EDP_OUTPUTS];
 
 	igt_fixture {
-		enum pipe pipe;
 		bool found = false;
 		char full_name[32] = {};
 		char *name;
-		drmModeModeInfo *mode;
-		igt_plane_t *primary;
 
 		/*
 		 * Backlight tests requires the output to be enabled,
@@ -202,56 +248,98 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&display, drm_open_driver(DRIVER_INTEL));
 
-		/* Get the max value and skip the whole test if sysfs interface not available */
-		igt_skip_on(backlight_read(&old, "brightness"));
-		igt_assert(backlight_read(&context.max, "max_brightness") > -1);
+		for_each_connected_output(&display, output) {
+			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+				continue;
 
-		/* should be ../../cardX-$output */
-		igt_assert_lt(12, readlink(BACKLIGHT_PATH "/device", full_name, sizeof(full_name) - 1));
-		name = basename(full_name);
+			if (found)
+				snprintf(file_path_n, PATH_MAX, "%s/card%i-%s-backlight/brightness",
+					 BACKLIGHT_PATH, igt_device_get_card_index(display.drm_fd),
+					 igt_output_name(output));
+			else
+				snprintf(file_path_n, PATH_MAX, "%s/intel_backlight/brightness", BACKLIGHT_PATH);
 
-		for_each_pipe_with_valid_output(&display, pipe, output) {
-			if (strcmp(name + 6, output->name))
+			fd = open(file_path_n, O_RDONLY);
+			if (fd == -1) {
 				continue;
-			found = true;
-			break;
+			}
+			if (found)
+				snprintf(contexts[i].path, PATH_MAX, "card%i-%s-backlight",
+					 igt_device_get_card_index(display.drm_fd),
+					 igt_output_name(output));
+			else
+				snprintf(contexts[i].path, PATH_MAX, "intel_backlight");
+
+			close(fd);
+
+			/* should be ../../cardX-$output */
+			snprintf(file_path_n, PATH_MAX, "%s/%s/device", BACKLIGHT_PATH, contexts[i].path);
+			igt_assert_lt(16, readlink(file_path_n, full_name, sizeof(full_name) - 1));
+			name = basename(full_name);
+
+			if (!strcmp(name + 6, output->name)) {
+				contexts[i++].output = output;
+
+				if (found)
+					dual_edp = true;
+				else
+					found = true;
+			}
 		}
+		igt_require_f(found, "No valid output found.\n");
+	}
 
-		igt_require_f(found,
-			      "Could not map backlight for \"%s\" to connected output\n",
-			      name);
-
-		igt_output_set_pipe(output, pipe);
-		mode = igt_output_get_mode(output);
-
-		igt_create_pattern_fb(display.drm_fd,
-				      mode->hdisplay, mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR, &fb);
-		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-		igt_plane_set_fb(primary, &fb);
+	igt_subtest("basic-brightness") {
+		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
+			test_setup(display, &contexts->output[j]);
+			igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
+			test_brightness(&contexts[j]);
+			test_cleanup(&display, output);
+		}
+	}
 
-		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
-		igt_pm_enable_sata_link_power_management();
+	igt_subtest("bad-brightness") {
+		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
+			test_setup(display, &contexts->output[j]);
+			igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
+			test_bad_brightness(&contexts[j]);
+			test_cleanup(&display, output);
+		}
+	}
+	igt_subtest("fade") {
+		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
+			test_setup(display, &contexts->output[j]);
+			igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
+			test_fade(&contexts[j]);
+			test_cleanup(&display, output);
+		}
 	}
+	igt_subtest("fade_with_dpms") {
+		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
+			test_setup(display, &contexts->output[j]);
+			igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
+			test_fade_with_dpms(&contexts[j], output);
+			test_cleanup(&display, output);
+		}
+	}
+	igt_subtest("fade_with_suspend") {
+		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
+			test_setup(display, &contexts->output[j]);
+			igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
+			test_fade_with_suspend(&contexts[j], output);
+			test_cleanup(&display, output);
+		}
+	}
+
 
-	igt_subtest("basic-brightness")
-		test_brightness(&context);
-	igt_subtest("bad-brightness")
-		test_bad_brightness(&context);
-	igt_subtest("fade")
-		test_fade(&context);
-	igt_subtest("fade_with_dpms")
-		test_fade_with_dpms(&context, output);
-	igt_subtest("fade_with_suspend")
-		test_fade_with_suspend(&context, output);
 
 	igt_fixture {
 		/* Restore old brightness */
-		backlight_write(old, "brightness");
+		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
+			backlight_write(old, "brightness", &contexts[j]);
+		}
 
 		igt_display_fini(&display);
-		igt_remove_fb(display.drm_fd, &fb);
 		igt_pm_restore_sata_link_power_management();
 		close(display.drm_fd);
 	}
-- 
1.9.1
