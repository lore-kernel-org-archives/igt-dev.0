Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36020113DE0
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:32 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:38 +0530
Message-Id: <20220814180908.2553394-22-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 21/51] tests/kms_pipe_crc_basic: Add support for
 Bigjoiner
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

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_pipe_crc_basic.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 2ff40f72..176fb702 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -271,6 +271,21 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
+static bool is_valid_combo(igt_display_t *display,
+			   enum pipe pipe, igt_output_t *output)
+{
+	bool ret = true;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(output, pipe);
+	if (!igt_test_constraint(display))
+		ret = false;
+	igt_output_set_pipe(output, pipe);
+
+	return ret;
+}
+
 data_t data = {0, };
 
 igt_main
@@ -319,6 +334,9 @@ igt_main
 		igt_describe(tests[i].desc);
 		igt_subtest_with_dynamic(tests[i].name) {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				if(!is_valid_combo(&data.display, pipe, output))
+					continue;
+
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
 					if (tests[i].flags & TEST_SUSPEND) {
 						test_read_crc(&data, pipe, output, 0);
@@ -347,6 +365,9 @@ igt_main
 		     "does not cause issues.");
 	igt_subtest_with_dynamic("disable-crc-after-crtc") {
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if(!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_disable_crc_after_crtc(&data, pipe, output);
 		}
@@ -355,6 +376,9 @@ igt_main
 	igt_describe("Basic sanity check for CRC mismatches");
 	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if(!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_compare_crc(&data, pipe, output);
 		}
-- 
2.35.1
