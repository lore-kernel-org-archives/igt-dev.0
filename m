Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D035510E43D
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 17:10:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 22:38:43 +0530
Message-Id: <20221115170855.196572-41-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v5 40/52] tests/i915/kms_ccs: Add support for
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

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_ccs.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
index 9be3fa25..40f05278 100644
--- a/tests/i915/kms_ccs.c
+++ b/tests/i915/kms_ccs.c
@@ -590,12 +590,21 @@ static int test_ccs(data_t *data)
 static void test_output(data_t *data, const int testnum)
 {
 	igt_fixture {
+		bool found = false;
+
 		data->flags = tests[testnum].flags;
 
-		data->output = igt_get_single_output_for_pipe(&data->display,
-							      data->pipe);
-		igt_require(data->output);
-		igt_output_set_pipe(data->output, data->pipe);
+		for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
+			igt_display_reset(&data->display);
+
+			igt_output_set_pipe(data->output, data->pipe);
+			if (i915_pipe_output_combo_valid(&data->display)) {
+				found = true;
+				break;
+			}
+
+		}
+		igt_require_f(found, "No valid pipe/output combo found.\n");
 	}
 
 	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
@@ -611,7 +620,6 @@ static void test_output(data_t *data, const int testnum)
 		igt_subtest_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
 			      tests[testnum].testname, ccs_modifiers[i].str) {
 			int valid_tests = 0;
-			igt_require(data->output);
 
 			if (data->flags == TEST_RANDOM)
 				igt_info("Testing with seed %d\n", data->seed);
-- 
2.38.0
