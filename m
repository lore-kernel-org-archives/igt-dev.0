Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E062A10E36F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 06:11:31 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 11:46:02 +0530
Message-Id: <1668492962-3418-4-git-send-email-nidhi1.gupta@intel.com>
In-Reply-To: <1668492962-3418-1-git-send-email-nidhi1.gupta@intel.com>
References: <1668492962-3418-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [PATCH 3/3] tests/i915/i915_pm_backlight: Create dynamic
 subtests
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

-Modified the test to include dynamic subtests.
-Replaced all asserts and igt_require inside
 dynamic subtests, as skip is not allowed in
 dynamic structure.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/i915_pm_backlight.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index 41ec215..ab2787c 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -165,20 +165,25 @@ static void test_fade(struct context *context)
 	}
 }
 
-static void
+static int
 check_dpms(igt_output_t *output)
 {
-	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
+	if ((igt_setup_runtime_pm(output->display->drm_fd)) == 0)
+		return -errno;
 
 	kmstest_set_connector_dpms(output->display->drm_fd,
 				   output->config.connector,
 				   DRM_MODE_DPMS_OFF);
-	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	if ((igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)) == 0)
+		return -errno;
 
 	kmstest_set_connector_dpms(output->display->drm_fd,
 				   output->config.connector,
 				   DRM_MODE_DPMS_ON);
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
+	if ((igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE)) == 0)
+		return -errno;
+
+	return 1;
 }
 
 static void
@@ -227,7 +232,7 @@ static void test_setup(igt_display_t display, igt_output_t *output)
 igt_main
 {
 	int old[NUM_EDP_OUTPUTS], fd;
-	int i = 0;
+	int i = 0, ret = 0;
 	igt_display_t display;
 	igt_output_t *output;
 	char file_path_n[PATH_MAX] = "";
@@ -303,24 +308,29 @@ igt_main
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_describe(tests[i].desc);
-		igt_subtest(tests[i].name) {
+		igt_subtest_with_dynamic(tests[i].name) {
 			for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
 				test_setup(display, &contexts->output[j]);
 
 				if (backlight_read(&old[j], "brightness", &contexts[j]))
 					continue;
 
-				if (tests[i].flags == TEST_DPMS)
-					check_dpms(contexts[j].output);
+				if (tests[i].flags == TEST_DPMS) {
+					ret = check_dpms(contexts[j].output);
+					if (ret == 0)
+						continue;
+				}
 
 				if (tests[i].flags == TEST_SUSPEND)
 					check_suspend(contexts[j].output);
 
-				igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
-				tests[i].test_t(&contexts[j]);
+				igt_dynamic_f("%s", igt_output_name(contexts[j].output)) {
+					igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
+					tests[i].test_t(&contexts[j]);
+				}
+				test_cleanup(&display, output);
 			}
-
-			test_cleanup(&display, output);
+			/* TODO: Add tests for dual eDP. */
 		}
 	}
 
-- 
1.9.1
