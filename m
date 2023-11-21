Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117C010E2A7
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Nov 2023 11:14:25 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Nov 2023 16:54:21 +0530
Message-Id: <20231121112421.16563-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Add
 new subtest to test FBC on each pipe
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

Added a new subtest as kms_frontbuffer_tracking@pipe-fbc-rte.
It will execute on each pipe with valid output and check if
FBC is enabled or not.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 77 ++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 213069947..68448d1a8 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -53,6 +53,15 @@
  * Test category: functionality test
  */
 
+/**
+ * SUBTEST: pipe-fbc-rte
+ * Description: Sanity test to enable FBC on each pipe.
+ * Driver requirement: i915, xe
+ * Functionality: fbc
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 #define TIME SLOW_QUICK(1000, 10000)
 
 IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
@@ -2047,6 +2056,42 @@ static void plane_fbc_rte_subtest(const struct test_mode *t)
 	igt_display_reset(&drm.display);
 }
 
+/**
+ * pipe-fbc-rte - the basic sanity test
+ *
+ * METHOD
+ *   Just disable primary screen, assert everything is disabled, then
+ *   enable single screen on each pipe and assert that the tested fbc is
+ *   enabled for the particular pipe.
+ *
+ * EXPECTED RESULTS
+ *   FBC feature enabled.
+ *
+ * FAILURES
+ *   A failure here means that fbc is not getting enabled for requested pipe. It means
+ *   kernel is not able to enable fbc on the requested pipe.
+ */
+
+static void pipe_fbc_rte_subtest(const struct test_mode *t)
+{
+	int ver;
+
+	ver = intel_display_ver(intel_get_drm_devid(drm.fd));
+	igt_require_f((ver >= 20), "Can't test fbc for each pipe\n");
+
+	prepare_subtest_data(t, NULL);
+	unset_all_crtcs();
+	do_assertions(ASSERT_FBC_DISABLED | DONT_ASSERT_CRC);
+
+	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+	set_mode_for_params(&prim_mode_params);
+
+	do_assertions(ASSERT_FBC_ENABLED | DONT_ASSERT_CRC);
+
+	igt_display_reset(&drm.display);
+}
+
 static void update_wanted_crc(const struct test_mode *t, igt_crc_t *crc)
 {
 	if (t->screen == SCREEN_PRIM)
@@ -5016,6 +5061,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct test_mode t;
 	int devid;
+	enum pipe pipe;
+	igt_output_t *output;
 
 	igt_fixture {
 		setup_environment();
@@ -5056,6 +5103,36 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		plane_fbc_rte_subtest(&t);
 	}
 
+	igt_subtest_with_dynamic("pipe-fbc-rte") {
+
+		t.pipes = PIPE_SINGLE;
+		t.feature = FEATURE_FBC;
+		t.screen = SCREEN_PRIM;
+		t.fbs = FBS_INDIVIDUAL;
+		t.format = FORMAT_DEFAULT;
+		/* Make sure nothing is using these values. */
+		t.flip = -1;
+		t.method = -1;
+		t.tiling = opt.tiling;
+
+		for_each_pipe_with_valid_output(&drm.display, pipe, output) {
+
+			igt_output_set_pipe(output, pipe);
+			igt_output_override_mode(output, connector_get_mode(output));
+
+			if (!intel_pipe_output_combo_valid(&drm.display))
+				continue;
+
+			init_mode_params(&prim_mode_params, output, pipe);
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+					igt_output_name(output)) {
+				init_mode_params(&prim_mode_params, output, pipe);
+				pipe_fbc_rte_subtest(&t);
+			}
+		}
+	}
+
 	TEST_MODE_ITER_BEGIN(t)
 
 		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
-- 
2.39.0
