Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB0410E140
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 07:24:27 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Nov 2023 13:04:24 +0530
Message-Id: <20231120073424.994-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking.c:
 Execute FBC test on all pipes
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

FBC in now valid for all pipes, extend
kms_frontbuffer_tracking@plane-fbc-rte subtest to
execute it on all pipes with valid output.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 32 +++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 213069947..39354dfc8 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -46,7 +46,7 @@
 
 /**
  * SUBTEST: plane-fbc-rte
- * Description: Sanity test to enable FBC on a plane.
+ * Description: Sanity test to enable FBC on a plane for each pipe.
  * Driver requirement: i915, xe
  * Functionality: fbc
  * Mega feature: General Display Features
@@ -5016,6 +5016,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct test_mode t;
 	int devid;
+	enum pipe pipe;
+	igt_output_t *output;
 
 	igt_fixture {
 		setup_environment();
@@ -5052,8 +5054,32 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	t.flip = -1;
 	t.tiling = opt.tiling;
 
-	igt_subtest_f("plane-fbc-rte") {
-		plane_fbc_rte_subtest(&t);
+	igt_subtest_with_dynamic("plane-fbc-rte") {
+
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
+				plane_fbc_rte_subtest(&t);
+			}
+		}
 	}
 
 	TEST_MODE_ITER_BEGIN(t)
-- 
2.39.0
