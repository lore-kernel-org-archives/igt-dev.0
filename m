Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECB910E36F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 06:11:30 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 11:46:01 +0530
Message-Id: <1668492962-3418-3-git-send-email-nidhi1.gupta@intel.com>
In-Reply-To: <1668492962-3418-1-git-send-email-nidhi1.gupta@intel.com>
References: <1668492962-3418-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [PATCH 2/3] tests/i915/i915_pm_backlight: Add a common
 structure for all subtests
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

Create a common structure for all the subtests which
includes the test name, test description and flag
indicating whether the test is suspend test or dpms test.
And then create the array of the above structure and
iterate over it.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/i915_pm_backlight.c | 94 ++++++++++++++++++------------------------
 1 file changed, 41 insertions(+), 53 deletions(-)

diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index cf58f8b..41ec215 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -43,6 +43,12 @@ struct context {
 	char path[PATH_MAX];
 };
 
+enum {
+	TEST_NONE = 0,
+	TEST_DPMS,
+	TEST_SUSPEND,
+};
+
 #define TOLERANCE 5 /* percent */
 #define BACKLIGHT_PATH "/sys/class/backlight"
 
@@ -160,7 +166,7 @@ static void test_fade(struct context *context)
 }
 
 static void
-test_fade_with_dpms(struct context *context, igt_output_t *output)
+check_dpms(igt_output_t *output)
 {
 	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
 
@@ -173,16 +179,12 @@ test_fade_with_dpms(struct context *context, igt_output_t *output)
 				   output->config.connector,
 				   DRM_MODE_DPMS_ON);
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
-
-	test_fade(context);
 }
 
 static void
-test_fade_with_suspend(struct context *context, igt_output_t *output)
+check_suspend(igt_output_t *output)
 {
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
-
-	test_fade(context);
 }
 
 static void test_cleanup(igt_display_t *display, igt_output_t *output)
@@ -224,13 +226,25 @@ static void test_setup(igt_display_t display, igt_output_t *output)
 
 igt_main
 {
-	int old, fd;
+	int old[NUM_EDP_OUTPUTS], fd;
 	int i = 0;
 	igt_display_t display;
 	igt_output_t *output;
 	char file_path_n[PATH_MAX] = "";
 	bool dual_edp = false;
 	struct context contexts[NUM_EDP_OUTPUTS];
+	struct {
+		const char *name;
+		const char *desc;
+		void (*test_t) (struct context *);
+		int flags;
+	} tests[] = {
+		{ "basic-brightness", "test the basic brightness.", test_brightness, TEST_NONE },
+		{ "bad-brightness", "test the bad brightness.", test_bad_brightness, TEST_NONE },
+		{ "fade", "test basic fade.", test_fade, TEST_NONE },
+		{ "fade-with-dpms", "test the fade with DPMS.", test_fade, TEST_DPMS },
+		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
+	};
 
 	igt_fixture {
 		bool found = false;
@@ -287,59 +301,33 @@ igt_main
 		igt_require_f(found, "No valid output found.\n");
 	}
 
-	igt_subtest("basic-brightness") {
-		for (i = 0; i < (dual_edp ? 2 : 1); i++) {
-			test_setup(display, &contexts->output[i]);
-			igt_assert(backlight_read(&contexts[i].max,
-						"max_brightness", &contexts[i]) > -1);
-			test_brightness(&contexts[i]);
-			test_cleanup(&display, output);
-		}
-	}
+	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		igt_describe(tests[i].desc);
+		igt_subtest(tests[i].name) {
+			for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
+				test_setup(display, &contexts->output[j]);
+
+				if (backlight_read(&old[j], "brightness", &contexts[j]))
+					continue;
+
+				if (tests[i].flags == TEST_DPMS)
+					check_dpms(contexts[j].output);
+
+				if (tests[i].flags == TEST_SUSPEND)
+					check_suspend(contexts[j].output);
+
+				igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
+				tests[i].test_t(&contexts[j]);
+			}
 
-	igt_subtest("bad-brightness") {
-		for (i = 0; i < (dual_edp ? 2 : 1); i++) {
-			test_setup(display, &contexts->output[i]);
-			igt_assert(backlight_read(&contexts[i].max,
-						"max_brightness", &contexts[i]) > -1);
-			test_bad_brightness(&contexts[i]);
-			test_cleanup(&display, output);
-		}
-	}
-	igt_subtest("fade") {
-		for (i = 0; i < (dual_edp ? 2 : 1); i++) {
-			test_setup(display, &contexts->output[i]);
-			igt_assert(backlight_read(&contexts[i].max,
-						"max_brightness", &contexts[i]) > -1);
-			test_fade(&contexts[i]);
-			test_cleanup(&display, output);
-		}
-	}
-	igt_subtest("fade_with_dpms") {
-		for (i = 0; i < (dual_edp ? 2 : 1); i++) {
-			test_setup(display, &contexts->output[i]);
-			igt_assert(backlight_read(&contexts[i].max,
-						"max_brightness", &contexts[i]) > -1);
-			test_fade_with_dpms(&contexts[i], output);
-			test_cleanup(&display, output);
-		}
-	}
-	igt_subtest("fade_with_suspend") {
-		for (i = 0; i < (dual_edp ? 2 : 1); i++) {
-			test_setup(display, &contexts->output[i]);
-			igt_assert(backlight_read(&contexts[i].max,
-						"max_brightness", &contexts[i]) > -1);
-			test_fade_with_suspend(&contexts[i], output);
 			test_cleanup(&display, output);
 		}
 	}
 
-
-
 	igt_fixture {
 		/* Restore old brightness */
-		for (i = 0; i < (dual_edp ? 2 : 1); i++)
-			backlight_write(old, "brightness", &contexts[i]);
+		for (int j = 0; j < (dual_edp ? 2 : 1); j++)
+			backlight_write(old[j], "brightness", &contexts[j]);
 
 		igt_display_fini(&display);
 		igt_pm_restore_sata_link_power_management();
-- 
1.9.1
