Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF0610E12D
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 11:14:07 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 17 Oct 2021 15:29:28 +0530
Message-Id: <20211017095928.96637-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_mmap_write_crc : Create
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

Create dynamic subtests with valid crtc/connector combinations.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/kms_mmap_write_crc.c | 38 +++++++++++++++------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index f8825284..680aaf11 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -215,23 +215,9 @@ static void cleanup_crtc(data_t *data)
 
 static void run_test(data_t *data)
 {
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
+	prepare_crtc(data);
+	test(data);
+	cleanup_crtc(data);
 }
 
 struct igt_helper_process hog;
@@ -272,6 +258,8 @@ static data_t data;
 igt_main_args("n", NULL, NULL, opt_handler, NULL)
 {
 	int i;
+	igt_output_t *output;
+	enum pipe pipe;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
@@ -288,10 +276,18 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 	}
 
 	igt_describe("Tests that caching mode has become UC/WT and flushed using mmap write");
-	igt_subtest("main") {
-		igt_info("Using %d rounds for the test\n", ROUNDS);
-		for (i = 0; i < ROUNDS; i++)
-			run_test(&data);
+	igt_info("Using %d rounds for each pipe in the test\n", ROUNDS);
+
+	igt_subtest_with_dynamic("main") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output),
+					kmstest_pipe_name(pipe)) {
+				data.output = output;
+				data.pipe = pipe;
+				for (i = 0; i < ROUNDS; i++)
+					run_test(&data);
+			}
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1
