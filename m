Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC207CCD187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 07:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936C810E177;
	Wed, 18 Sep 2024 07:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NUszVBeK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2EE10E557
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 07:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726644991; x=1758180991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Umqm06ri5xyReRWhMT6acScTT/FxoautPwnQ//Qcys=;
 b=NUszVBeKmr5+SuPdQHICoy+R+04rYAtE/CGjBXoahmsitvt++gmTrOHZ
 grAN0GGzUvznvZYe0eb4yE7d1AfHjmIO+oTuBeG34sQfqMIwkrv8to/lG
 9qahG5MctKx1UM1YgScCPI2GsptziVnimkxLeBtCylU7C5nUdktfmXTSs
 9C2bGm3Kbn5uGQsxShG+WSjdeuvE7zyIKPC2k6DeCr+JGS3oX97iIOL16
 FAArQz1sWrj5NhJtLfMIMJ3wcouOc09BDIkEqX+ZgFkHkCg1Zmexomffk
 kDcrMEeDxs4JK+5WUnOnHMci6wxQ8qsj5KJ6d2i7nkAmllY+GVNqinInK g==;
X-CSE-ConnectionGUID: IqD4eQbQRnCbAZzmRBigvA==
X-CSE-MsgGUID: ndN2s1/DQ4uxv1Q3DYKBVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25359026"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25359026"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:36:31 -0700
X-CSE-ConnectionGUID: l2SR2HjwSpekyJ3+/W7aoA==
X-CSE-MsgGUID: QjYMD0rOQLOMW1/CzPyh7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="73806744"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:36:29 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 kunal1.joshi@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 3/3] tests/kms_joiner: Add subtests for force
 ultrajoiner validation
Date: Wed, 18 Sep 2024 13:04:13 +0530
Message-Id: <20240918073413.28598-4-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240918073413.28598-1-karthik.b.s@intel.com>
References: <20240918073413.28598-1-karthik.b.s@intel.com>
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

Extend the ultrajoiner subtests to validate ultrajoiner on a non
ultrajoiner supported display using force joiner.

v2: Rebase

v3: Add display version check for ultrajoiner

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 120 +++++++++++++++++++++++++++++++++------
 1 file changed, 102 insertions(+), 18 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index e193f9071..e498ac542 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -35,6 +35,7 @@
  */
 
 #include "igt.h"
+#include "xe/xe_query.h"
 
 /**
  * SUBTEST: invalid-modeset-big-joiner
@@ -51,15 +52,24 @@
  * SUBTEST: basic-ultra-joiner
  * Description: Verify the basic modeset on ultra joiner mode on all pipes
  *
- * SUBTEST: invalid-modeset-force-joiner
- * Description: Verify if modeset on adjacent pipe is declined when force joiner modeset is active.
- *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs,
+ * SUBTEST: invalid-modeset-force-big-joiner
+ * Description: Verify if modeset on adjacent pipe is declined when force big joiner modeset is active.
+ *		Force big joiner applies bigjoiner functionality to non-bigjoiner outputs,
  *		so test exclusively targets non-bigjoiner outputs.
  *
- * SUBTEST: basic-force-joiner
- * Description: Verify basic modeset in force joiner mode across all pipes.
+ * SUBTEST: basic-force-big-joiner
+ * Description: Verify basic big joiner modeset in force joiner mode across all pipes.
  *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
  *		the test exclusively targets non-bigjoiner outputs.
+ *
+ * SUBTEST: basic-force-ultra-joiner
+ * Description: Verify basic ultra joiner modeset in force joiner mode across all pipes.
+ *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
+ *		the test exclusively targets non-bigjoiner outputs.
+ *
+ * SUBTEST: invalid-modeset-force-ultra-joiner
+ * Description: Verify if the modeset on the other pipes are rejected when
+ *              the pipe A is active with force ultra joiner modeset.
  */
 IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
@@ -111,6 +121,19 @@ static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
 	}
 }
 
+static void enable_force_joiner_on_all_non_ultra_joiner_outputs(data_t *data)
+{
+	bool status;
+	igt_output_t *output;
+	int i;
+
+	for (i = 0; i < data->non_ultra_joiner_output_count; i++) {
+		output = data->non_ultra_joiner_output[i];
+		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector, 4);
+		igt_assert_f(status, "Failed to toggle force joiner\n");
+	}
+}
+
 static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask)
 {
 	if ((data->master_pipes & available_pipe_mask) == 0)
@@ -297,23 +320,36 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 	}
 }
 
-static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display)
+static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display, bool force_joiner)
 {
-	int i, j, k, ret;
+	int i, j, k, ret, count;
 	igt_output_t *output, *non_ultra_joiner_output;
 	igt_plane_t *primary;
 	igt_output_t **outputs;
 	igt_fb_t fb;
 	drmModeModeInfo mode;
 
-	outputs = data->ultra_joiner_output;
+	if (force_joiner) {
+		outputs = data->non_ultra_joiner_output;
+		count = data->non_ultra_joiner_output_count;
+	} else {
+		outputs = data->ultra_joiner_output;
+		count = data->ultra_joiner_output_count;
+	}
+
 	igt_display_reset(&data->display);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	for (i = 0; i < data->ultra_joiner_output_count; i++) {
+	for (i = 0; i < count; i++) {
 		output = outputs[i];
-		igt_require(ultrajoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode));
-		igt_output_override_mode(output, &mode);
+
+		if (!force_joiner) {
+			igt_require(ultrajoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode));
+			igt_output_override_mode(output, &mode);
+		} else {
+			mode = *igt_output_get_mode(output);
+		}
+
 		for (j = 0; j < data->n_pipes; j++) {
 			/* Ultra joiner is only valid on PIPE_A */
 			if (invalid_pipe && j == PIPE_A)
@@ -374,14 +410,15 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display)
 
 igt_main
 {
-	bool force_joiner_supported;
-	int i, j;
+	bool force_joiner_supported, ultra_joiner_supported, is_dgfx;
+	int i, j, display_ver;
 	igt_output_t *output;
 	drmModeModeInfo mode;
 	data_t data;
 
 	igt_fixture {
 		force_joiner_supported = false;
+		ultra_joiner_supported = false;
 		data.big_joiner_output_count = 0;
 		data.ultra_joiner_output_count = 0;
 		data.non_big_joiner_output_count = 0;
@@ -397,6 +434,11 @@ igt_main
 		igt_require(data.display.is_atomic);
 		max_dotclock = igt_get_max_dotclock(data.drm_fd);
 
+		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
+		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
+		if ((is_dgfx && display_ver == 14) || (display_ver > 14))
+			ultra_joiner_supported = true;
+
 		for_each_connected_output(&data.display, output) {
 			bool ultrajoiner_found = false, bigjoiner_found = false;
 			drmModeConnector *connector = output->config.connector;
@@ -461,7 +503,7 @@ igt_main
 			igt_require_f(data.n_pipes > 3,
 				      "Minimum 4 pipes required\n");
 			igt_dynamic_f("single-joiner")
-				test_ultra_joiner(&data, false, false);
+				test_ultra_joiner(&data, false, false, false);
 	}
 
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
@@ -487,15 +529,15 @@ igt_main
 		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
 
 		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
-			test_ultra_joiner(&data, true, false);
+			test_ultra_joiner(&data, true, false, false);
 		if (data.non_ultra_joiner_output_count > 0) {
 			igt_dynamic_f("2x")
-				test_ultra_joiner(&data, false, true);
+				test_ultra_joiner(&data, false, true, false);
 		}
 	}
 
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
-	igt_subtest_with_dynamic("basic-force-joiner") {
+	igt_subtest_with_dynamic("basic-force-big-joiner") {
 		igt_require_f(force_joiner_supported,
 			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(data.non_big_joiner_output_count > 0,
@@ -516,7 +558,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_with_dynamic("invalid-modeset-force-joiner") {
+	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
 		igt_require_f(force_joiner_supported,
 			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(data.non_big_joiner_output_count > 0,
@@ -539,6 +581,48 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
+		igt_require_f(force_joiner_supported,
+			      "force joiner not supported on this platform or none of the connected output supports it\n");
+		igt_require_f(ultra_joiner_supported,
+			      "Ultra joiner not supported on this platform\n");
+		igt_require_f(data.non_ultra_joiner_output_count > 0,
+			      "No non ultra joiner output found\n");
+		igt_require_f(data.n_pipes > 3,
+			      "Minimum 4 pipes required\n");
+		igt_dynamic_f("single") {
+			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+			test_ultra_joiner(&data, false, false, true);
+			igt_reset_connectors();
+		}
+	}
+
+	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
+		igt_require_f(force_joiner_supported,
+			      "force joiner not supported on this platform or none of the connected output supports it\n");
+		igt_require_f(ultra_joiner_supported,
+			      "Ultra joiner not supported on this platform\n");
+		igt_require_f(data.non_ultra_joiner_output_count > 0,
+			      "Non ultra joiner output not found\n");
+		igt_require_f(data.n_pipes > 3,
+			      "Minimum of 3 pipes are required\n");
+
+		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
+			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+			test_ultra_joiner(&data, true, false, true);
+			igt_reset_connectors();
+		}
+
+		if (data.non_ultra_joiner_output_count > 1) {
+			igt_dynamic_f("2x") {
+				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+				test_ultra_joiner(&data, false, true, true);
+				igt_reset_connectors();
+			}
+		}
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.39.1

