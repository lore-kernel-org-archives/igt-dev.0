Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E24010E50D
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jul 2022 21:40:04 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 03:03:05 +0530
Message-Id: <20220714213306.70050-2-mohammed.thasleem@intel.com>
In-Reply-To: <20220714213306.70050-1-mohammed.thasleem@intel.com>
References: <20220714213306.70050-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v6 1/2] tests/i915/kms_mmap_write_crc: Create
 dynamic subtests
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

Modified kms_mmap_write_crc to include dynamic test cases.

v2: Moved for loop to after igt_subtest_with_dynamic.
v3: Added break and moved for loop back in igt_dynamic_f.
v4: Removed run_test and moved igt_info in to igt_dynamic_f.
v5: Minor changes.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/kms_mmap_write_crc.c | 46 +++++++++++++++------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index b17e5fdb..4e5b8146 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -211,27 +211,6 @@ static void cleanup_crtc(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb[1]);
 }
 
-static void run_test(data_t *data)
-{
-	igt_display_t *display = &data->display;
-	igt_output_t *output;
-	enum pipe pipe;
-
-	for_each_pipe_with_valid_output(display, pipe, output) {
-		data->output = output;
-		data->pipe = pipe;
-
-		prepare_crtc(data);
-		test(data);
-		cleanup_crtc(data);
-
-		/* once is enough */
-		return;
-	}
-
-	igt_skip("no valid crtc/connector combinations found\n");
-}
-
 struct igt_helper_process hog;
 
 /**
@@ -270,6 +249,8 @@ static data_t data;
 igt_main_args("n", NULL, NULL, opt_handler, NULL)
 {
 	int i;
+	igt_output_t *output;
+	enum pipe pipe;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
@@ -286,10 +267,25 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 	}
 
 	igt_describe("Tests that caching mode has become UC/WT and flushed using mmap write");
-	igt_subtest("main") {
-		igt_info("Using %d rounds for the test\n", ROUNDS);
-		for (i = 0; i < ROUNDS; i++)
-			run_test(&data);
+
+	igt_subtest_with_dynamic("main") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+				      igt_output_name(output)) {
+				data.output = output;
+				data.pipe = pipe;
+
+				igt_info("Using %d rounds for each pipe in the test\n", ROUNDS);
+				prepare_crtc(&data);
+
+				for (i = 0; i < ROUNDS; i++)
+					test(&data);
+
+				cleanup_crtc(&data);
+			}
+			/* once is enough */
+			break;
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1
