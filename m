Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB7C10E17D
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 11:51:54 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 May 2022 17:19:50 +0530
Message-Id: <20220517114950.24140-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_rmfb: Create dynamic subtests
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

Modified kms_rmfb to include dynamic test cases.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_rmfb.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index fcd5cdad..45ab5f8d 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -146,19 +146,31 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 }
 
 static void
-run_rmfb_test(struct rmfb_data *data, bool reopen)
+run_rmfb_test(struct rmfb_data *data, bool reopen, const char *testname)
 {
 	igt_output_t *output;
 	enum pipe pipe;
 
-	for_each_pipe_with_single_output(&data->display, pipe, output)
+	for_each_pipe_with_single_output(&data->display, pipe, output) {
+		igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(pipe),
+			      igt_output_name(output), testname)
 		test_rmfb(data, output, pipe, reopen);
+	}
 }
 
 igt_main
 {
+	int i;
 	struct rmfb_data data = {};
 
+	const struct {
+		bool flags;
+		const char *name;
+	} tests[] = {
+		{ true, "rmfb-ioctl" },
+		{ false, "close-fd" },
+	};
+
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
@@ -168,15 +180,16 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
-	igt_describe("RMFB is supposed to free the framebuffers from any and all "
-		     "planes so test this and make sure it works.");
-	igt_subtest_f("rmfb-ioctl")
-		run_rmfb_test(&data, false);
+	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+
+		igt_describe("RMFB is supposed to free the framebuffers from any and all "
+			     "planes so test this and make sure it works with rmfb-ioctl,"
+			     "fd close and reopen. ");
+		igt_subtest_with_dynamic(tests[i].name) {
+			run_rmfb_test(&data, tests[i].flags, tests[i].name);
 
-	igt_describe("RMFB is supposed to free the framebuffers from any and all planes "
-		     "so test this and make sure it works with fd close and reopen.");
-	igt_subtest_f("close-fd")
-		run_rmfb_test(&data, true);
+		}
+	}
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.25.1
