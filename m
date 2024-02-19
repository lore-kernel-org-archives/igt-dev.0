Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A1DC54766
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 10:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB5F10E292;
	Mon, 19 Feb 2024 10:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LP7Slg5v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097DD10E0A7
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 10:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708337609; x=1739873609;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XXeeTHhfwo0Hf82WBVnpwkJex5j+XxLgb//Scm7rQWQ=;
 b=LP7Slg5vOMu9XiEc3YP4kaACDi6WdT+CASb4/5lg3vYqw0mBolkG8acs
 LgNvpToj7w6vrjaA5KXJjj3jiLgezintRvnu/Uh47c6ceZkAGXwI1HS2i
 KxV5IB8aCZLjZlWcI/X2KccNY32kPyKW2pHy0p8WuIya/32oZvMeJuMPX
 mXBggzuZlMG98owL5GJ+mD/X0xHEd3WD8W4R5uXA+IzEnFCL2/ox1TFTg
 4dwuBecdygIkwczuLmtdfsyAxkl7IKhOAaeIvzWaOJw2vl188gjERPAe7
 GZWtFkj1BKTyD8/FAU/cSA1sqPLTm2REYnrgwT7I+nP9zr51AcUO5FIkN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2271954"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2271954"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 02:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4808099"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 02:13:27 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com,
	Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_ccs: Convert subtests to dynamic subtests
Date: Mon, 19 Feb 2024 15:43:19 +0530
Message-Id: <20240219101319.20569-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_ccs.c | 193 +++++++++++-------------------------------
 1 file changed, 50 insertions(+), 143 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 82714af93..b84c1e926 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -44,35 +44,16 @@
 #include "xe/xe_query.h"
 
 /**
- * SUBTEST: %s-%s-%s
- * Description: Test %arg[2] with given %arg[3] modifier
+ * SUBTEST: %s-%s
+ * Description: Test %arg[1] with given %arg[2] modifier
  *
  * arg[1]:
  *
- * @pipe-A:                    Pipe A
- * @pipe-B:                    Pipe B
- * @pipe-C:                    Pipe C
- * @pipe-D:                    Pipe D
- * @pipe-E:                    Pipe E
- * @pipe-F:                    Pipe F
- * @pipe-G:                    Pipe G
- * @pipe-H:                    Pipe H
- * @pipe-I:                    Pipe I
- * @pipe-J:                    Pipe J
- * @pipe-K:                    Pipe K
- * @pipe-L:                    Pipe L
- * @pipe-M:                    Pipe M
- * @pipe-N:                    Pipe N
- * @pipe-O:                    Pipe O
- * @pipe-P:                    Pipe P
- *
- * arg[2]:
- *
  * @bad-aux-stride:            Bad AUX stride
  * @ccs-on-another-bo:         CCS with different BO
  * @missing-ccs-buffer:        Missing CCS buffer
  *
- * arg[3]:
+ * arg[2]:
  *
  * @y-tiled-ccs:               Y tiled ccs
  * @y-tiled-gen12-mc-ccs:      Y tiled gen12 mc ccs
@@ -85,33 +66,14 @@
  */
 
 /**
- * SUBTEST: %s-%s-%s
- * Description: Test %arg[2] with %arg[3] modifier
+ * SUBTEST: %s-%s
+ * Description: Test %arg[1] with %arg[2] modifier
  *
  * arg[1]:
  *
- * @pipe-A:                      Pipe A
- * @pipe-B:                      Pipe B
- * @pipe-C:                      Pipe C
- * @pipe-D:                      Pipe D
- * @pipe-E:                      Pipe E
- * @pipe-F:                      Pipe F
- * @pipe-G:                      Pipe G
- * @pipe-H:                      Pipe H
- * @pipe-I:                      Pipe I
- * @pipe-J:                      Pipe J
- * @pipe-K:                      Pipe K
- * @pipe-L:                      Pipe L
- * @pipe-M:                      Pipe M
- * @pipe-N:                      Pipe N
- * @pipe-O:                      Pipe O
- * @pipe-P:                      Pipe P
- *
- * arg[2]:
- *
  * @bad-pixel-format:            Bad pixel format
  *
- * arg[3]:
+ * arg[2]:
  *
  * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
  * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
@@ -127,35 +89,16 @@
  */
 
 /**
- * SUBTEST: %s-%s-%s
- * Description: Test %arg[2] with %arg[3] modifier
+ * SUBTEST: %s-%s
+ * Description: Test %arg[1] with %arg[2] modifier
  *
  * arg[1]:
  *
- * @pipe-A:                      Pipe A
- * @pipe-B:                      Pipe B
- * @pipe-C:                      Pipe C
- * @pipe-D:                      Pipe D
- * @pipe-E:                      Pipe E
- * @pipe-F:                      Pipe F
- * @pipe-G:                      Pipe G
- * @pipe-H:                      Pipe H
- * @pipe-I:                      Pipe I
- * @pipe-J:                      Pipe J
- * @pipe-K:                      Pipe K
- * @pipe-L:                      Pipe L
- * @pipe-M:                      Pipe M
- * @pipe-N:                      Pipe N
- * @pipe-O:                      Pipe O
- * @pipe-P:                      Pipe P
- *
- * arg[2]:
- *
  * @crc-primary-basic:           Primary plane CRC compatibility
  * @crc-sprite-planes-basic:     Sprite plane CRC compatability
  * @random-ccs-data:             Random CCS data
  *
- * arg[3]:
+ * arg[2]:
  *
  * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
  * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
@@ -172,35 +115,16 @@
  */
 
 /**
- * SUBTEST: %s-%s-%s
- * Description: Test %arg[2] with %arg[3] modifier
+ * SUBTEST: %s-%s
+ * Description: Test %arg[1] with %arg[2] modifier
  * Functionality: ccs, rotation, tiling
  *
  * arg[1]:
  *
- * @pipe-A:                      Pipe A
- * @pipe-B:                      Pipe B
- * @pipe-C:                      Pipe C
- * @pipe-D:                      Pipe D
- * @pipe-E:                      Pipe E
- * @pipe-F:                      Pipe F
- * @pipe-G:                      Pipe G
- * @pipe-H:                      Pipe H
- * @pipe-I:                      Pipe I
- * @pipe-J:                      Pipe J
- * @pipe-K:                      Pipe K
- * @pipe-L:                      Pipe L
- * @pipe-M:                      Pipe M
- * @pipe-N:                      Pipe N
- * @pipe-O:                      Pipe O
- * @pipe-P:                      Pipe P
- *
- * arg[2]:
- *
  * @bad-rotation-90:             90 degree rotation
  * @crc-primary-rotation-180:    180 degree rotation
  *
- * arg[3]:
+ * arg[2]:
  *
  * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
  * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
@@ -956,24 +880,10 @@ static void test_output(data_t *data, const int testnum)
 {
 	uint16_t dev_id;
 
-	igt_fixture {
-		bool found = false;
+	igt_fixture
 		dev_id = intel_get_drm_devid(data->drm_fd);
 
-		data->flags = tests[testnum].flags;
-
-		for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
-			igt_display_reset(&data->display);
-
-			igt_output_set_pipe(data->output, data->pipe);
-			if (intel_pipe_output_combo_valid(&data->display)) {
-				found = true;
-				break;
-			}
-
-		}
-		igt_require_f(found, "No valid pipe/output combo found.\n");
-	}
+	data->flags = tests[testnum].flags;
 
 	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
 		if (((ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
@@ -987,10 +897,7 @@ static void test_output(data_t *data, const int testnum)
 		data->ccs_modifier = ccs_modifiers[i].modifier;
 
 		igt_describe(tests[testnum].description);
-		igt_subtest_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
-			      tests[testnum].testname, ccs_modifiers[i].str) {
-			int valid_tests = 0;
-
+		igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, ccs_modifiers[i].str) {
 			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED) {
 				igt_require_f(AT_LEAST_GEN(dev_id, 20),
 					      "Xe2 platform needed.\n");
@@ -999,37 +906,46 @@ static void test_output(data_t *data, const int testnum)
 					      "Older than Xe2 platform needed.\n");
 			}
 
-			if (data->flags == TEST_RANDOM)
-				igt_info("Testing with seed %d\n", data->seed);
-
-			if (data->flags & TEST_ALL_PLANES) {
-				igt_display_require_output_on_pipe(&data->display, data->pipe);
-
-				for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
-					for (int j = 0; j < ARRAY_SIZE(formats); j++) {
-						data->format = formats[j];
-						valid_tests += test_ccs(data);
+			for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
+				igt_display_reset(&data->display);
+
+				igt_output_set_pipe(data->output, data->pipe);
+				if (!intel_pipe_output_combo_valid(&data->display))
+					continue;
+
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe),
+					      ccs_modifiers[i].str) {
+					int valid_tests = 0;
+
+					if (data->flags == TEST_RANDOM)
+						igt_info("Testing with seed %d\n", data->seed);
+
+					if (data->flags & TEST_ALL_PLANES) {
+						igt_display_require_output_on_pipe(&data->display, data->pipe);
+
+						for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
+							for (int j = 0; j < ARRAY_SIZE(formats); j++) {
+								data->format = formats[j];
+								valid_tests += test_ccs(data);
+							}
+						}
+					} else {
+						for (int j = 0; j < ARRAY_SIZE(formats); j++) {
+							data->format = formats[j];
+							valid_tests += test_ccs(data);
+						}
 					}
-				}
-			} else {
-				for (int j = 0; j < ARRAY_SIZE(formats); j++) {
-					data->format = formats[j];
-					valid_tests += test_ccs(data);
+					igt_require_f(valid_tests > 0,
+						      "no valid tests for %s on pipe %s\n",
+						      ccs_modifiers[i].str,
+						      kmstest_pipe_name(data->pipe));
 				}
 			}
-			igt_require_f(valid_tests > 0,
-				      "no valid tests for %s on pipe %s\n",
-				      ccs_modifiers[i].str,
-				      kmstest_pipe_name(data->pipe));
 		}
 	}
 
-	igt_fixture {
-		igt_output_set_pipe(data->output, PIPE_NONE);
-		igt_display_commit2(&data->display, data->display.is_atomic ?
-				    COMMIT_ATOMIC : COMMIT_LEGACY);
+	igt_fixture
 		data->plane = NULL;
-	}
 }
 
 static int opt_handler(int opt, int opt_index, void *opt_data)
@@ -1060,8 +976,6 @@ static const char *help_str =
 
 igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 {
-	enum pipe pipe;
-
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
@@ -1076,15 +990,8 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 			data.seed = time(NULL);
 	}
 
-	for_each_pipe_static(pipe) {
-		data.pipe = pipe;
-
-		igt_subtest_group {
-			for (int c = 0; c < ARRAY_SIZE(tests); c++) {
-				test_output(&data, c);
-			}
-		}
-	}
+	for (int c = 0; c < ARRAY_SIZE(tests); c++)
+		test_output(&data, c);
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.39.1

