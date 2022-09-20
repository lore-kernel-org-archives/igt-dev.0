Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C7310E144
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Sep 2022 08:02:54 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Sep 2022 13:27:37 +0530
Message-Id: <20220920075737.7187-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] kms_flip_event_leak: Create dynamic
 subtests
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

Converting the existing subtests to dynamic subtests.

v2: Add igt_dispaly_require_output and igt_display_reset and update the
test name. (Bhanu)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_flip_event_leak.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index ac201293..99b1e345 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -48,6 +48,7 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 	struct igt_fb fb[2];
 	int fd, ret;
 
+	igt_display_reset(&data->display);
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, pipe);
 
@@ -89,24 +90,30 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_remove_fb(data->drm_fd, &fb[0]);
 }
 
-igt_simple_main
+igt_main
 {
 	data_t data = {};
 	igt_output_t *output;
-	int valid_tests = 0;
 	enum pipe pipe;
 
-	data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-	kmstest_set_vt_graphics_mode();
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		kmstest_set_vt_graphics_mode();
 
-	igt_display_require(&data.display, data.drm_fd);
-
-	for_each_pipe_with_valid_output(&data.display, pipe, output) {
-		test(&data, pipe, output);
-		valid_tests++;
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
 	}
 
-	igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
 
-	igt_display_fini(&data.display);
+	igt_subtest_with_dynamic("kms_flip_event_leak_basic") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				test(&data, pipe, output);
+			}
+		}
+	}
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+	}
 }
-- 
2.36.0
