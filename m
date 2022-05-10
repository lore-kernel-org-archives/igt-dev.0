Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C95510F216
 for <igt-dev@lists.freedesktop.org>; Tue, 10 May 2022 08:04:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 10 May 2022 13:31:58 +0530
Message-Id: <20220510080203.3319182-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220510080203.3319182-1-bhanuprakash.modem@intel.com>
References: <20220510080203.3319182-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 1/6] tests/kms_pipe_crc_basic: Convert tests to
 dynamic
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

Convert the existing subtests to dynamic subtests at pipe level.

V2:
* Fix typos: s/hand/hang/, s/TEST_NONE/TEST_BASIC, etc..

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_pipe_crc_basic.c | 111 ++++++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 46 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 0861c46d..9b3fecee 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -59,8 +59,13 @@ static void test_bad_source(data_t *data)
 
 #define N_CRCS	3
 
-#define TEST_SEQUENCE (1<<0)
-#define TEST_NONBLOCK (1<<1)
+enum {
+	TEST_BASIC = 0,
+	TEST_SEQUENCE = 1 << 0,
+	TEST_NONBLOCK = 1 << 1,
+	TEST_SUSPEND = 1 << 2,
+	TEST_HANG = 1 << 3,
+};
 
 static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 {
@@ -270,6 +275,25 @@ data_t data = {0, };
 igt_main
 {
 	enum pipe pipe;
+	struct {
+		const char *name;
+		unsigned flags;
+		const char *desc;
+	} tests[] = {
+		{ "read-crc", TEST_BASIC,
+			"Test for pipe CRC reads." },
+		{ "read-crc-frame-sequence", TEST_SEQUENCE,
+			"Tests the pipe CRC read and ensure frame sequence." },
+		{ "nonblocking-crc", TEST_NONBLOCK,
+			"Test for O_NONBLOCK CRC reads." },
+		{ "nonblocking-crc-frame-sequence", TEST_SEQUENCE | TEST_NONBLOCK,
+			"Test for O_NONBLOCK CRC reads and ensure frame sequence." },
+		{ "suspend-read-crc", TEST_SUSPEND,
+			"Suspend test for pipe CRC reads." },
+		{ "hang-read-crc", TEST_HANG,
+			"Hang test for pipe CRC read." },
+	};
+	int i;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -286,54 +310,49 @@ igt_main
 	igt_subtest("bad-source")
 		test_bad_source(&data);
 
-	for_each_pipe_static(pipe) {
-		igt_describe("Test for pipe CRC reads.");
-		igt_subtest_f("read-crc-pipe-%s", kmstest_pipe_name(pipe))
-			test_read_crc(&data, pipe, 0);
-
-		igt_describe("Tests the pipe CRC read and ensure frame sequence.");
-		igt_subtest_f("read-crc-pipe-%s-frame-sequence", kmstest_pipe_name(pipe))
-			test_read_crc(&data, pipe, TEST_SEQUENCE);
-
-		igt_describe("Test for O_NONBLOCK CRC reads.");
-		igt_subtest_f("nonblocking-crc-pipe-%s", kmstest_pipe_name(pipe))
-			test_read_crc(&data, pipe, TEST_NONBLOCK);
-
-		igt_describe("Test for O_NONBLOCK CRC reads and ensure frame sequence.");
-		igt_subtest_f("nonblocking-crc-pipe-%s-frame-sequence", kmstest_pipe_name(pipe))
-			test_read_crc(&data, pipe, TEST_SEQUENCE | TEST_NONBLOCK);
-
-		igt_describe("Suspend test for pipe CRC reads");
-		igt_subtest_f("suspend-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
-			test_read_crc(&data, pipe, 0);
-
-			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-						      SUSPEND_TEST_NONE);
-
-			test_read_crc(&data, pipe, 0);
+	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		igt_describe(tests[i].desc);
+		igt_subtest_with_dynamic(tests[i].name) {
+			for_each_pipe(&data.display, pipe) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					if (tests[i].flags & TEST_SUSPEND) {
+						test_read_crc(&data, pipe, 0);
+
+						igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+									      SUSPEND_TEST_NONE);
+
+						test_read_crc(&data, pipe, 0);
+					} else if (tests[i].flags & TEST_SUSPEND) {
+						igt_hang_t hang = igt_allow_hang(data.drm_fd, 0, 0);
+
+						test_read_crc(&data, pipe, 0);
+						igt_force_gpu_reset(data.drm_fd);
+						test_read_crc(&data, pipe, 0);
+
+						igt_disallow_hang(data.drm_fd, hang);
+					} else {
+						test_read_crc(&data, pipe, tests[i].flags);
+					}
+				}
+			}
 		}
+	}
 
-		igt_describe("Check that disabling CRCs on a CRTC after having disabled the CRTC "
-			     "does not cause issues.");
-		igt_subtest_f("disable-crc-after-crtc-pipe-%s", kmstest_pipe_name(pipe))
-			test_disable_crc_after_crtc(&data, pipe);
-
-		igt_describe("Hang test for pipe CRC read");
-		igt_subtest_f("hang-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
-			igt_hang_t hang = igt_allow_hang(data.drm_fd, 0, 0);
-
-			test_read_crc(&data, pipe, 0);
-
-			igt_force_gpu_reset(data.drm_fd);
-
-			test_read_crc(&data, pipe, 0);
-
-			igt_disallow_hang(data.drm_fd, hang);
+	igt_describe("Check that disabling CRCs on a CRTC after having disabled the CRTC "
+		     "does not cause issues.");
+	igt_subtest_with_dynamic("disable-crc-after-crtc") {
+		for_each_pipe(&data.display, pipe) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				test_disable_crc_after_crtc(&data, pipe);
 		}
+	}
 
-		igt_describe("Basic sanity check for CRC mismatches");
-		igt_subtest_f("compare-crc-sanitycheck-pipe-%s", kmstest_pipe_name(pipe))
-			test_compare_crc(&data, pipe);
+	igt_describe("Basic sanity check for CRC mismatches");
+	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
+		for_each_pipe(&data.display, pipe) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				test_compare_crc(&data, pipe);
+		}
 	}
 
 	igt_fixture {
-- 
2.35.1
