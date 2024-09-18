Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB80CCD19D
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 11:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FEA10E259;
	Wed, 18 Sep 2024 11:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n1hgnhuB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AC910E259
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726657812; x=1758193812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2RQzgfVI7QgVVebL0GN1nj1uQ3EdqlWQb0iJY/kJneE=;
 b=n1hgnhuBWXSB8FA8vvkUtr3AnYchJGKHU+sBVNs32TnCNlck2abTppU3
 KBbkHlq3myO/0EPCkKCsEk35I7SU5PjFuKQdJsaJNJ3k0aBbAgicMkVBx
 zLBmbD/IspkTfzgPW9cHRRyrbM8fNjqFdUgHxuiE1gKTCCDtbR4lP/80d
 6b5SUarq4q3NXYEj58gkVKjT4h55EDrWDAVKONjJqTybT7x6RNVpeh60a
 oaah0fkrxmV5db0Rfd1ZZ5fwW+XYDJXrhBTSJfrIiwfPkYXT5+MAHPnm3
 hWtO5ciiLMqQW3rA47Hvn51AqUaiDX0J1/sXjKpPeCQU/ozodrDePJKeG A==;
X-CSE-ConnectionGUID: 7Ys3hgCxRRucMo7U9NQjLg==
X-CSE-MsgGUID: zK2i3GfxRwOkAM6E7jpW7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25682186"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25682186"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:10:12 -0700
X-CSE-ConnectionGUID: o8PYljqgRauBl/Bp+aVgvg==
X-CSE-MsgGUID: D/fqQa8rSemnoVUc2rZaww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69499953"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:10:09 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 kunal1.joshi@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v4 3/3] tests/kms_joiner: Add subtests for force
 ultrajoiner validation
Date: Wed, 18 Sep 2024 16:37:54 +0530
Message-Id: <20240918110754.26140-4-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240918110754.26140-1-karthik.b.s@intel.com>
References: <20240918110754.26140-1-karthik.b.s@intel.com>
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

v4: Add DSC check for force ultrajoiner

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 123 +++++++++++++++++++++++++++++++++------
 1 file changed, 104 insertions(+), 19 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index e193f9071..508e82ce3 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -35,6 +35,8 @@
  */
 
 #include "igt.h"
+#include "xe/xe_query.h"
+#include "kms_dsc_helper.c"
 
 /**
  * SUBTEST: invalid-modeset-big-joiner
@@ -51,15 +53,24 @@
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
 
@@ -111,6 +122,19 @@ static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
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
+		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector, JOINED_PIPES_ULTRA_JOINER);
+		igt_assert_f(status, "Failed to toggle force joiner\n");
+	}
+}
+
 static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask)
 {
 	if ((data->master_pipes & available_pipe_mask) == 0)
@@ -297,23 +321,36 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
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
@@ -374,14 +411,15 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display)
 
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
@@ -397,6 +435,11 @@ igt_main
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
@@ -415,7 +458,7 @@ igt_main
 
 			if (ultrajoiner_found)
 				data.ultra_joiner_output[data.ultra_joiner_output_count++] = output;
-			else if (force_joiner_supported)
+			else if (force_joiner_supported && is_dsc_supported_by_sink(data.drm_fd, output))
 				data.non_ultra_joiner_output[data.non_ultra_joiner_output_count++] = output;
 
 			if (bigjoiner_found)
@@ -461,7 +504,7 @@ igt_main
 			igt_require_f(data.n_pipes > 3,
 				      "Minimum 4 pipes required\n");
 			igt_dynamic_f("single-joiner")
-				test_ultra_joiner(&data, false, false);
+				test_ultra_joiner(&data, false, false, false);
 	}
 
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
@@ -487,15 +530,15 @@ igt_main
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
@@ -516,7 +559,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_with_dynamic("invalid-modeset-force-joiner") {
+	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
 		igt_require_f(force_joiner_supported,
 			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(data.non_big_joiner_output_count > 0,
@@ -539,6 +582,48 @@ igt_main
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
+		if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
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

