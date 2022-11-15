Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC2C10E15A
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 17:10:24 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 22:38:24 +0530
Message-Id: <20221115170855.196572-22-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v5 21/52] tests/kms_pipe_crc_basic: Add support
 for Bigjoiner
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

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_pipe_crc_basic.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 91a1b8ab..ffc77eb3 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -274,6 +274,21 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
+static bool pipe_output_combo_valid(igt_display_t *display,
+				    enum pipe pipe, igt_output_t *output)
+{
+	bool ret = true;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(output, pipe);
+	if (!i915_pipe_output_combo_valid(display))
+		ret = false;
+	igt_output_set_pipe(output, PIPE_NONE);
+
+	return ret;
+}
+
 data_t data = {0, };
 
 igt_main
@@ -322,6 +337,9 @@ igt_main
 		igt_describe(tests[i].desc);
 		igt_subtest_with_dynamic(tests[i].name) {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				if(!pipe_output_combo_valid(&data.display, pipe, output))
+					continue;
+
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
 					if (tests[i].flags & TEST_SUSPEND) {
 						test_read_crc(&data, pipe, output, 0);
@@ -350,6 +368,9 @@ igt_main
 		     "does not cause issues.");
 	igt_subtest_with_dynamic("disable-crc-after-crtc") {
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if(!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_disable_crc_after_crtc(&data, pipe, output);
 		}
@@ -358,6 +379,9 @@ igt_main
 	igt_describe("Basic sanity check for CRC mismatches");
 	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if(!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_compare_crc(&data, pipe, output);
 		}
-- 
2.38.0
