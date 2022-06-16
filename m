Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6195D10F76A
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 18:03:23 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jun 2022 23:30:23 +0530
Message-Id: <20220616180024.98304-2-mohammed.thasleem@intel.com>
In-Reply-To: <20220616180024.98304-1-mohammed.thasleem@intel.com>
References: <20220616180024.98304-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_mmap_write_crc: Create
 dynamic subtests
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

Modified kms_mmap_write_crc to include dynamic test cases.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/kms_mmap_write_crc.c | 38 +++++++++++++++------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index b17e5fdb..b7a3b9de 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -213,23 +213,9 @@ static void cleanup_crtc(data_t *data)
 
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
@@ -270,6 +256,8 @@ static data_t data;
 igt_main_args("n", NULL, NULL, opt_handler, NULL)
 {
 	int i;
+	igt_output_t *output;
+	enum pipe pipe;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
@@ -286,10 +274,18 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
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
+				      kmstest_pipe_name(pipe)) {
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
