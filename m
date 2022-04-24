Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC8110E1CF
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Mar 2023 18:34:04 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 24 Apr 2022 06:27:37 +0530
Message-Id: <20220424005737.228759-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_backlight: Brightness
 test during DPMS on and off
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

Set brightness by deviding max brightness, store and read it back.
The actual brightness should be same during DPMS on and off cycle.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/i915_pm_backlight.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index 82960662..3961f4fc 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -188,6 +188,32 @@ check_suspend(igt_output_t *output)
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 }
 
+static void check_dpms_cycle(igt_display_t *display, igt_output_t *output, struct context *context)
+{
+	int max, val_1, val_2;
+
+	backlight_read(&max, "max_brightness", context);
+	igt_assert(max);
+
+	backlight_write(max / 2, "brightness", context);
+	backlight_read(&val_1, "actual_brightness", context);
+
+	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
+
+	kmstest_set_connector_dpms(output->display->drm_fd,
+				   output->config.connector,
+				   DRM_MODE_DPMS_OFF);
+	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	kmstest_set_connector_dpms(output->display->drm_fd,
+				   output->config.connector,
+				   DRM_MODE_DPMS_ON);
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
+
+	backlight_read(&val_2, "actual_brightness", context);
+	igt_assert_eq(val_1, val_2);
+}
+
 static void test_cleanup(igt_display_t *display, igt_output_t *output)
 {
 	igt_output_set_pipe(output, PIPE_NONE);
@@ -325,6 +351,17 @@ igt_main
 		}
 	}
 
+	igt_describe("test brightness with dpms on and off cycle");
+	igt_subtest_with_dynamic("brightness-with-dpms") {
+		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
+			test_setup(display, &contexts->output[j]);
+			igt_dynamic_f("%s", igt_output_name(contexts[j].output)) {
+				check_dpms_cycle(&display, &contexts->output[j], &contexts[j]);
+				test_cleanup(&display, &contexts->output[j]);
+			}
+		}
+	}
+
 	igt_fixture {
 		/* Restore old brightness */
 		for (i = 0; i < (dual_edp ? 2 : 1); i++)
-- 
2.25.1
