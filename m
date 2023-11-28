Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2D910E46D
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 09:21:01 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Nov 2023 15:01:08 +0530
Message-Id: <20231128093108.31801-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5] tests/intel/kms_frontbuffer_tracking:
 Add new subtest to test FBC on each pipe
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
It will execute on each pipe with valid output and check if FBC is
enabled or not.

v2: Change the test design to reuse the existing
    rte_subtest() code for each pipe (Bhanu)

v3: Use igt_fixture to restore the default
    parameters (Bhanu)

v4: fixed nitpicks (Bhanu)

v5: create igt_subtest_group and move igt_fixture
    inside the group (Bhanu)

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 51 ++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 259dfd136..405a8a178 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -57,6 +57,10 @@
  * Description: Sanity test to enable FBC on a plane.
  * Functionality: fbc
  *
+ * SUBTEST: pipe-fbc-rte
+ * Description: Sanity test to enable FBC on each pipe.
+ * Functionality: fbc
+ *
  * SUBTEST: drrs-%dp-rte
  * Description: Sanity test to enable DRRS with %arg[1] panels.
  * Functionality: fbt, drrs
@@ -4459,7 +4463,10 @@ struct option long_options[] = {
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct test_mode t;
+	struct modeset_params default_mode_params;
 	int devid;
+	enum pipe pipe;
+	igt_output_t *output;
 
 	igt_fixture {
 		setup_environment();
@@ -4500,6 +4507,50 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		plane_fbc_rte_subtest(&t);
 	}
 
+	igt_subtest_group {
+		igt_subtest_with_dynamic("pipe-fbc-rte") {
+
+			t.pipes = PIPE_SINGLE;
+			t.feature = FEATURE_FBC;
+			t.screen = SCREEN_PRIM;
+			t.fbs = FBS_INDIVIDUAL;
+			t.format = FORMAT_DEFAULT;
+			t.method = IGT_DRAW_BLT;
+			/* Make sure nothing is using these values. */
+			t.flip = -1;
+			t.tiling = opt.tiling;
+
+			default_mode_params.pipe = prim_mode_params.pipe;
+
+			for_each_pipe(&drm.display, pipe) {
+
+				if (pipe == default_mode_params.pipe) {
+					igt_info("pipe-%s: FBC validated in other subtest\n", kmstest_pipe_name(pipe));
+					continue;
+				}
+
+				if (!intel_fbc_supported_on_chipset(drm.fd, pipe)) {
+					igt_info("Can't test FBC: not supported on pipe-%s\n", kmstest_pipe_name(pipe));
+					continue;
+				}
+
+				for_each_valid_output_on_pipe(&drm.display, pipe, output) {
+					init_mode_params(&prim_mode_params, output, pipe);
+					setup_fbc();
+
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+						      igt_output_name(output))
+						rte_subtest(&t);
+
+					break; /* One output is enough. */
+				}
+			}
+		}
+
+		igt_fixture
+			init_modeset_cached_params();
+	}
+
 	TEST_MODE_ITER_BEGIN(t)
 
 		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
-- 
2.39.0
