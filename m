Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA2E12B6B2
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:19 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:28 +0530
Message-Id: <20220814180908.2553394-12-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 11/51] tests/kms_content_protection: Add support
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_content_protection.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3041f1cd..9134e1ca 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -338,6 +338,15 @@ static void test_content_protection_on_output(igt_output_t *output,
 		if (!igt_pipe_is_free(display, pipe))
 			continue;
 
+		igt_output_set_pipe(output, pipe);
+		if (!igt_test_constraint(display)) {
+			igt_output_set_pipe(output, PIPE_NONE);
+			continue;
+		}
+
+		igt_info("Using (pipe %s + %s) to run the subtest.\n",
+			 kmstest_pipe_name(pipe), igt_output_name(output));
+
 		modeset_with_fb(pipe, output, s);
 		test_cp_enable_with_retry(output, s, 3, content_type, false,
 					  false);
@@ -610,6 +619,14 @@ test_content_protection_mst(int content_type)
 		igt_assert_f(igt_pipe_connector_valid(pipe, output), "Output-pipe combination invalid\n");
 
 		igt_output_set_pipe(output, pipe);
+		if (!igt_test_constraint(display)){
+			igt_output_set_pipe(output, PIPE_NONE);
+			continue;
+		}
+
+		igt_info("Using (pipe %s + %s) to run the subtest.\n",
+			 kmstest_pipe_name(pipe), igt_output_name(output));
+
 		prepare_modeset_on_mst_output(output);
 		mst_output[dp_mst_outputs++] = output;
 
-- 
2.35.1
