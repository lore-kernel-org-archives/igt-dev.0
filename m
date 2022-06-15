Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9590610E138
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jun 2022 10:56:33 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 16:23:32 +0530
Message-Id: <20220615105333.70867-2-mohammed.thasleem@intel.com>
In-Reply-To: <20220615105333.70867-1-mohammed.thasleem@intel.com>
References: <20220615105333.70867-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_rmfb: Create dynamic subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Modified kms_rmfb to include dynamic test cases.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_rmfb.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index fcd5cdad..53172ded 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -151,14 +151,26 @@ run_rmfb_test(struct rmfb_data *data, bool reopen)
 	igt_output_t *output;
 	enum pipe pipe;
 
-	for_each_pipe_with_single_output(&data->display, pipe, output)
+	for_each_pipe_with_single_output(&data->display, pipe, output) {
+		igt_dynamic_f("%s-pipe-%s", igt_output_name(output),
+			      kmstest_pipe_name(pipe))
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
+		{ false, "rmfb-ioctl" },
+		{ true, "close-fd" },
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
+			     "fd close and reopen.");
+		igt_subtest_with_dynamic(tests[i].name) {
+			run_rmfb_test(&data, tests[i].flags);
 
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
