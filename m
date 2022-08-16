Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDF111A264
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Aug 2022 11:55:45 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 Aug 2022 17:21:04 +0530
Message-Id: <20220816115104.31163-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] kms_flip_event_leak: Create dynamic
 subtests
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

Converting the existing subtests to dynamic subtests.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_flip_event_leak.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index ac201293..0acf93c3 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -89,21 +89,28 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
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
 
 	igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
-- 
2.36.0
