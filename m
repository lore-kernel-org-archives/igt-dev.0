Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5188412B6B2
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:18 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:27 +0530
Message-Id: <20220814180908.2553394-11-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 10/51] tests/kms_concurrent: Add support for
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
 tests/kms_concurrent.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 6f8ffd4a..a6b9189e 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -330,9 +330,17 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
 		     "resolution.");
 	igt_subtest_with_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
+		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+			igt_display_reset(&data->display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!igt_test_constraint(&data->display))
+				continue;
+
+			igt_output_set_pipe(output, PIPE_NONE);
 			igt_dynamic_f("%s", igt_output_name(output))
 				run_test(data, pipe, output);
+		}
 	}
 }
 
-- 
2.35.1
