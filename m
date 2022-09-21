Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C107110E8DA
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 09:03:23 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 21 Sep 2022 14:28:06 +0530
Message-Id: <20220921085806.7223-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC,
 i-g-t] tests/i915/i915_pm_backlight: Add new subtest to validate
 dual panel backlight
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

-Since driver can now support multiple eDPs and Debugfs structure for
backlight changed per connector the test should then iterate through
all eDP connectors.
-backlight with dpms cycle of on and off with all the eDP connected.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/i915_pm_backlight.c | 204 +++++++++++++++++++++++++--------
 1 file changed, 156 insertions(+), 48 deletions(-)

diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index cafae7f7..951ee048 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -36,19 +36,77 @@
 #include <time.h>
 
 struct context {
+	int drm_fd;
+	igt_display_t display;
 	int max;
 };
 
+//typedef struct data {
+//	igt_display_t display;
+//	int drm_fd;
+//} data_t;
+
 
 #define TOLERANCE 5 /* percent */
 #define BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
-
+#define BACKLIGHT_BRIGHTNESS "brightness"
+#define BACKLIGHT_ACTUAL_BRIGHTNESS "actual_brightness"
 #define FADESTEPS 10
 #define FADESPEED 100 /* milliseconds between steps */
 
 IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
 
-static int backlight_read(int *result, const char *fname)
+static int backlight_read(int *result, int drm_fd, char *connector_name)
+{
+	char buf[20];
+	int fd, e, r;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+
+	if (fd < 0) {
+		igt_info("Couldn't open connector %s debugfs directory\n",
+			 connector_name);
+		return false;
+	}
+
+	r = igt_debugfs_simple_read(fd, BACKLIGHT_BRIGHTNESS, buf, sizeof(buf));
+	e = errno;
+	close(fd);
+
+	if (r < 0)
+		return -e;
+
+	errno = 0;
+	*result = strtol(buf, NULL, 0);
+	return errno = 0;
+}
+
+static int read_actual_backlight(int *result, int drm_fd, char *connector_name)
+{
+	char buf[20];
+	int fd, e, r;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+
+	if (fd < 0) {
+		igt_info("Couldn't open connector %s debugfs directory\n",
+			 connector_name);
+		return false;
+	}
+
+	r = igt_debugfs_simple_read(fd, BACKLIGHT_ACTUAL_BRIGHTNESS, buf, sizeof(buf));
+	e = errno;
+	close(fd);
+
+	if (r < 0)
+		return -e;
+
+	errno = 0;
+	*result = strtol(buf, NULL, 0);
+	return errno;
+}
+
+/*static int backlight_read(int *result, const char *fname)
 {
 	int fd;
 	char full[PATH_MAX];
@@ -72,6 +130,7 @@ static int backlight_read(int *result, const char *fname)
 	*result = strtol(dst, NULL, 10);
 	return errno;
 }
+*/
 
 static int backlight_write(int value, const char *fname)
 {
@@ -99,18 +158,25 @@ static void test_and_verify(struct context *context, int val)
 {
 	const int tolerance = val * TOLERANCE / 100;
 	int result;
-
-	igt_assert_eq(backlight_write(val, "brightness"), 0);
-	igt_assert_eq(backlight_read(&result, "brightness"), 0);
-	/* Check that the exact value sticks */
-	igt_assert_eq(result, val);
-
-	igt_assert_eq(backlight_read(&result, "actual_brightness"), 0);
-	/* Some rounding may happen depending on hw */
-	igt_assert_f(result >= max(0, val - tolerance) &&
-		     result <= min(context->max, val + tolerance),
-		     "actual_brightness [%d] did not match expected brightness [%d +- %d]\n",
-		     result, val, tolerance);
+	igt_output_t *output;
+	enum pipe pipe;
+
+	for_each_pipe_with_valid_output(&context->display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		igt_assert_eq(backlight_write(val, "brightness"), 0);
+		igt_assert_eq(backlight_read(&result, context->drm_fd, output->name), 0);
+		/* Check that the exact value sticks */
+		igt_assert_eq(result, val);
+
+		igt_assert_eq(read_actual_backlight(&result, context->drm_fd, output->name), 0);
+		/* Some rounding may happen depending on hw */
+		igt_assert_f(result >= max(0, val - tolerance) &&
+			     result <= min(context->max, val + tolerance),
+			     "actual_brightness [%d] did not match expected brightness [%d +- %d]\n",
+			      result, val, tolerance);
+	}
 }
 
 static void test_brightness(struct context *context)
@@ -123,52 +189,68 @@ static void test_brightness(struct context *context)
 static void test_bad_brightness(struct context *context)
 {
 	int val;
-	/* First write some sane value */
-	backlight_write(context->max / 2, "brightness");
-	/* Writing invalid values should fail and not change the value */
-	igt_assert_lt(backlight_write(-1, "brightness"), 0);
-	backlight_read(&val, "brightness");
-	igt_assert_eq(val, context->max / 2);
-	igt_assert_lt(backlight_write(context->max + 1, "brightness"), 0);
-	backlight_read(&val, "brightness");
-	igt_assert_eq(val, context->max / 2);
-	igt_assert_lt(backlight_write(INT_MAX, "brightness"), 0);
-	backlight_read(&val, "brightness");
-	igt_assert_eq(val, context->max / 2);
+	igt_output_t *output;
+	enum pipe pipe;
+
+	for_each_pipe_with_valid_output(&context->display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+		/* First write some sane value */
+		backlight_write(context->max / 2, "brightness");
+		/* Writing invalid values should fail and not change the value */
+		igt_assert_lt(backlight_write(-1, "brightness"), 0);
+		backlight_read(&val, context->drm_fd, output->name);
+		igt_assert_eq(val, context->max / 2);
+		igt_assert_lt(backlight_write(context->max + 1, "brightness"), 0);
+		backlight_read(&val, context->drm_fd, output->name);
+		igt_assert_eq(val, context->max / 2);
+		igt_assert_lt(backlight_write(INT_MAX, "brightness"), 0);
+		backlight_read(&val, context->drm_fd, output->name);
+		igt_assert_eq(val, context->max / 2);
+	}
 }
 
 static void test_fade(struct context *context)
 {
 	int i;
 	static const struct timespec ts = { .tv_sec = 0, .tv_nsec = FADESPEED*1000000 };
+	igt_output_t *output;
+	enum pipe pipe;
 
-	/* Fade out, then in */
-	for (i = context->max; i > 0; i -= context->max / FADESTEPS) {
-		test_and_verify(context, i);
-		nanosleep(&ts, NULL);
-	}
-	for (i = 0; i <= context->max; i += context->max / FADESTEPS) {
-		test_and_verify(context, i);
-		nanosleep(&ts, NULL);
+	for_each_pipe_with_valid_output(&context->display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		/* Fade out, then in */
+		for (i = context->max; i > 0; i -= context->max / FADESTEPS) {
+			test_and_verify(context, i);
+			nanosleep(&ts, NULL);
+		}
+		for (i = 0; i <= context->max; i += context->max / FADESTEPS) {
+			test_and_verify(context, i);
+			nanosleep(&ts, NULL);
+		}
 	}
 }
 
 static void
 test_fade_with_dpms(struct context *context, igt_output_t *output)
 {
-	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
 
-	kmstest_set_connector_dpms(output->display->drm_fd,
-				   output->config.connector,
-				   DRM_MODE_DPMS_OFF);
-	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+		igt_require(igt_setup_runtime_pm(output->display->drm_fd));
 
-	kmstest_set_connector_dpms(output->display->drm_fd,
-				   output->config.connector,
-				   DRM_MODE_DPMS_ON);
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
+		kmstest_set_connector_dpms(output->display->drm_fd,
+					   output->config.connector,
+					   DRM_MODE_DPMS_OFF);
+		igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+		kmstest_set_connector_dpms(output->display->drm_fd,
+					   output->config.connector,
+					   DRM_MODE_DPMS_ON);
+		igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
+
+		test_fade(context);
 
-	test_fade(context);
 }
 
 static void
@@ -179,9 +261,32 @@ test_fade_with_suspend(struct context *context, igt_output_t *output)
 	test_fade(context);
 }
 
+static void test_backlight_dpms_cycle(struct context *context, igt_output_t *output)
+{
+	int result;
+	enum pipe pipe;
+
+	for_each_pipe_with_valid_output(output->display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		igt_info("Testing backlight dpms on %s\n", output->name);
+
+		backlight_write(context->max / 2, "brightness");
+		usleep(100000);
+		backlight_read(&result, context->drm_fd, output->name);
+
+		kmstest_set_connector_dpms(output->display->drm_fd, output->config.connector, DRM_MODE_DPMS_OFF);
+		kmstest_set_connector_dpms(output->display->drm_fd, output->config.connector, DRM_MODE_DPMS_ON);
+		usleep(100000);
+
+		igt_assert_eq(read_actual_backlight(&result, context->drm_fd, output->name), 0);
+	}
+}
+
 igt_main
 {
-	struct context context = {0};
+	struct context context;
 	int old;
 	igt_display_t display;
 	igt_output_t *output;
@@ -200,11 +305,12 @@ igt_main
 		 * try to enable all.
 		 */
 		kmstest_set_vt_graphics_mode();
-		igt_display_require(&display, drm_open_driver(DRIVER_INTEL));
+		//igt_display_require(&display, drm_open_driver(DRIVER_INTEL));
+		igt_display_require(&context.display, context.drm_fd);
 
 		/* Get the max value and skip the whole test if sysfs interface not available */
-		igt_skip_on(backlight_read(&old, "brightness"));
-		igt_assert(backlight_read(&context.max, "max_brightness") > -1);
+		igt_skip_on(backlight_read(&old, context.drm_fd, output->name));
+		igt_assert(backlight_read(&context.max, context.drm_fd, output->name) > -1);
 
 		/* should be ../../cardX-$output */
 		igt_assert_lt(12, readlink(BACKLIGHT_PATH "/device", full_name, sizeof(full_name) - 1));
@@ -245,6 +351,8 @@ igt_main
 		test_fade_with_dpms(&context, output);
 	igt_subtest("fade_with_suspend")
 		test_fade_with_suspend(&context, output);
+	igt_subtest("backlight_dpms_cycle")
+		test_backlight_dpms_cycle(&context, output);
 
 	igt_fixture {
 		/* Restore old brightness */
-- 
2.36.0
