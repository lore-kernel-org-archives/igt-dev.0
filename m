Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0F510EA18
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 07:18:25 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 12:44:01 +0530
Message-Id: <20220909071401.4938-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] kms_flip_event_leak: Create dynamic subtests
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_flip_event_leak.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index ac201293..33aa6ab3 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -89,24 +89,33 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_remove_fb(data->drm_fd, &fb[0]);
 }
 
-igt_simple_main
+igt_main
 {
 	data_t data = {};
 	igt_output_t *output;
 	int valid_tests = 0;
 	enum pipe pipe;
 
-	data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-	kmstest_set_vt_graphics_mode();
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.drm_fd);
+	}
 
-	igt_display_require(&data.display, data.drm_fd);
 
-	for_each_pipe_with_valid_output(&data.display, pipe, output) {
-		test(&data, pipe, output);
-		valid_tests++;
+	igt_subtest_with_dynamic("kms_flip_event_leak") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				test(&data, pipe, output);
+				valid_tests++;
+			}
+		}
 	}
 
-	igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
+	igt_fixture {
+		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
 
-	igt_display_fini(&data.display);
+		igt_display_fini(&data.display);
+	}
 }
-- 
2.36.0
