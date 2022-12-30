Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3FE10E483
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 17:52:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Dec 2022 23:18:03 +0530
Message-Id: <20221230174825.3016716-29-bhanuprakash.modem@intel.com>
In-Reply-To: <20221230174825.3016716-1-bhanuprakash.modem@intel.com>
References: <20221230174825.3016716-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v6 28/50] tests/kms_rmfb: Add support for Bigjoiner
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
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_rmfb.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 7e43e1bd..50df4295 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -155,8 +155,15 @@ run_rmfb_test(struct rmfb_data *data, bool reopen)
 {
 	igt_output_t *output;
 	enum pipe pipe;
+	igt_display_t *display = &data->display;
+
+	for_each_pipe_with_single_output(display, pipe, output) {
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, pipe);
+		if (!i915_pipe_output_combo_valid(display))
+			continue;
 
-	for_each_pipe_with_single_output(&data->display, pipe, output) {
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
 			      igt_output_name(output))
 			test_rmfb(data, output, pipe, reopen);
@@ -192,7 +199,6 @@ igt_main
 		igt_describe(tests[i].description);
 		igt_subtest_with_dynamic(tests[i].name) {
 			run_rmfb_test(&data, tests[i].reopen);
-
 		}
 	}
 
-- 
2.39.0
