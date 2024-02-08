Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0827DC48260
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 14:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4A610E843;
	Thu,  8 Feb 2024 14:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+ktBRPC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B063510E843
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707403499; x=1738939499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ymzsIS6ZEJRLH/Q3o8vIm4xdhXpE2snRaevpgL4Ks4k=;
 b=P+ktBRPCPc6+CIBm7Kz7JLLJldezeVJSapClu3pIrET2qFQlPaS+E3B9
 fnPLN+Y9IctgM1Rc31GevA/aovBpSKJMJM0YDEQ8EwBu5xZbaBoqZf4Db
 53Ua0Q4vCV2soGcpTcn2JKr2meTDOGZd5cY5OfXAOsyRLy47yKDYZqO5m
 lsiq4CyoTvLgw7PDbRE6EbHMRY9960PIgB+Kks9B54ZD8PfK7Fys/Ua6v
 eZtl/v9czLq+txBSI0fvmuomZ41ApNmEh1tp0o0mjSLcNFQbiqK+Fq17f
 YT3o+jECmLBxgS/SAj0XqAl35MpWLQfL8Q6Z2hGPkEQjdF5l2j8RO3oDh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="436365216"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="436365216"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:44:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="32736954"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:44:58 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: extend tests for panel
 replay sf
Date: Thu,  8 Feb 2024 20:24:25 +0530
Message-Id: <20240208145425.1940941-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240208145425.1940941-1-kunal1.joshi@intel.com>
References: <20240208145425.1940941-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Extend the tests to cover panel replay selective fetch feature.

From kms_psr2_sf test point of view we have check_pr_psr2_sel_fetch_support
function to check if PR/PSR2 selective fetch is supported for an output
if output supports selective fetch then we check we enter DEEP_SLEEP mode
in run function

v2: fixed dynamic test name
v3: use check_psr2_support (Jouni)
v4: correct order of checks in check_pr_psr2_sel_fetch_support (Jouni)
    use appropriate psr mode in psr_wait_entry (Jouni)

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_psr2_sf.c | 147 +++++++++++++++++++++++++++++++-------
 1 file changed, 120 insertions(+), 27 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 8e6a9e02c..0595c1f11 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -172,6 +172,7 @@ typedef struct {
 	uint32_t screen_changes;
 	int cur_x, cur_y;
 	enum pipe pipe;
+	enum psr_mode psr_mode;
 	enum {
 		FEATURE_NONE  = 0,
 		FEATURE_DSC   = 1,
@@ -179,6 +180,34 @@ typedef struct {
 	} coexist_feature;
 } data_t;
 
+static enum psr_mode get_sel_fetch_mode_for_output(data_t *data, igt_output_t *output)
+{
+	enum psr_mode mode = PSR_DISABLED;
+
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd,
+						 PR_MODE_SEL_FETCH, output))
+		mode = PR_MODE_SEL_FETCH;
+	else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
+							  PSR_MODE_2, output))
+		mode = PSR_MODE_2;
+	else
+		igt_info("selective fetch not supported on output %s\n", output->name);
+
+	return mode;
+}
+
+static const char *get_psr_mode_str_for_output(data_t *data, igt_output_t *output)
+{
+	const char *psr_mode = NULL;
+
+	if (get_sel_fetch_mode_for_output(data, output) == PR_MODE_SEL_FETCH)
+		psr_mode = "pr-";
+	else if (get_sel_fetch_mode_for_output(data, output) == PSR_MODE_2)
+		psr_mode = "psr2-";
+	igt_assert_f(psr_mode, "Invalid psr mode\n");
+	return psr_mode;
+}
+
 static const char *op_str(enum operations op)
 {
 	static const char * const name[] = {
@@ -688,7 +717,7 @@ static void damaged_plane_move(data_t *data)
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode, data->output));
 
 	expected_output(data);
 }
@@ -788,7 +817,7 @@ static void plane_move_continuous(data_t *data)
 {
 	int target_x, target_y;
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode, data->output));
 
 	get_target_coords(data, &target_x, &target_y);
 
@@ -865,7 +894,7 @@ static void damaged_plane_update(data_t *data)
 	igt_plane_set_position(data->test_plane, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode, data->output));
 
 	expected_output(data);
 }
@@ -874,7 +903,7 @@ static void run(data_t *data)
 {
 	int i;
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode, data->output));
 
 	if (data->fbc_flag == true && data->op_fbc_mode == FBC_ENABLED)
 		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
@@ -952,14 +981,24 @@ static void cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb_test);
 }
 
-static int check_psr2_support(data_t *data)
+static bool check_pr_psr2_sel_fetch_support(data_t *data)
 {
-	int status;
+	bool status = false;
+	enum psr_mode psr_mode;
+
+	/* Check sink supports PR/PSR2 selective fetch */
+	psr_mode = get_sel_fetch_mode_for_output(data, data->output);
+	if (psr_mode == PSR_DISABLED)
+		return false;
+
+	/* Check if selective fetch can be enabled */
+	if (!selective_fetch_check(data->debugfs_fd, data->output))
+		igt_assert("Selective fetch is not enabled even though panel should support it\n");
 
 	prepare(data);
-	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL);
+	/* We enter into DEEP_SLEEP for both PSR2 and PR sel fetch */
+	status = psr_wait_entry(data->debugfs_fd, psr_mode, data->output);
 	cleanup(data);
-
 	return status;
 }
 
@@ -981,6 +1020,8 @@ pipe_output_combo_valid(igt_display_t *display,
 
 igt_main
 {
+	bool output_supports_pr_psr2_sel_fetch = false;
+	bool pr_psr2_sel_fetch_supported = false;
 	data_t data = {};
 	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
 	int i, j, k, y;
@@ -1000,11 +1041,6 @@ igt_main
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 
-		igt_require_f(psr_sink_support(data.drm_fd,
-					       data.debugfs_fd, PSR_MODE_2,
-					       NULL),
-			      "Sink does not support PSR2\n");
-
 		display_init(&data);
 
 		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20) &&
@@ -1023,7 +1059,8 @@ igt_main
 
 		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
 			coexist_features[n_pipes] = 0;
-			if (check_psr2_support(&data)) {
+			output_supports_pr_psr2_sel_fetch = check_pr_psr2_sel_fetch_support(&data);
+			if (output_supports_pr_psr2_sel_fetch) {
 				pipes[n_pipes] = data.pipe;
 				outputs[n_pipes] = data.output;
 
@@ -1032,7 +1069,10 @@ igt_main
 
 				n_pipes++;
 			}
+			pr_psr2_sel_fetch_supported |= output_supports_pr_psr2_sel_fetch;
 		}
+		igt_require_f(pr_psr2_sel_fetch_supported,
+					  "No output supports selective fetch\n");
 	}
 
 	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
@@ -1053,13 +1093,17 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 						data.coexist_feature = j;
+						data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+						igt_assert_f(data.psr_mode != PSR_DISABLED,
+									 "Invalid psr mode\n");
 						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
 							data.damage_area_count = k;
 							prepare(&data);
@@ -1086,7 +1130,8 @@ igt_main
 					for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 						if (j != FEATURE_NONE && !(coexist_features[i] & j))
 							continue;
-						igt_dynamic_f("pipe-%s-%s%s",
+						igt_dynamic_f("%s-pipe-%s-%s%s",
+								  get_psr_mode_str_for_output(&data, outputs[i]),
 							      kmstest_pipe_name(pipes[i]),
 							      igt_output_name(outputs[i]),
 							      coexist_feature_str(j)) {
@@ -1094,6 +1139,9 @@ igt_main
 							data.output = outputs[i];
 							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 							data.coexist_feature = j;
+							data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+							igt_assert_f(data.psr_mode != PSR_DISABLED,
+										 "Invalid psr mode\n");
 							for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
 								data.damage_area_count = k;
 								prepare(&data);
@@ -1118,13 +1166,17 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
+						data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+						igt_assert_f(data.psr_mode != PSR_DISABLED,
+									 "Invalid psr mode\n");
 						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
 							data.damage_area_count = k;
 							prepare(&data);
@@ -1148,13 +1200,17 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 						data.coexist_feature = j;
+						data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+						igt_assert_f(data.psr_mode != PSR_DISABLED,
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1174,13 +1230,17 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 						data.coexist_feature = j;
+						data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+						igt_assert_f(data.psr_mode != PSR_DISABLED,
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1201,13 +1261,17 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 						data.coexist_feature = j;
+						data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+						igt_assert_f(data.psr_mode != PSR_DISABLED,
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1228,13 +1292,17 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 						data.coexist_feature = j;
+						data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+						igt_assert_f(data.psr_mode != PSR_DISABLED,
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1256,13 +1324,18 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s",
+							  get_psr_mode_str_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
+						data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+						igt_assert_f(data.psr_mode != PSR_DISABLED,
+									 "Invalid psr mode\n");
 						for (k = POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT ; k++) {
 							data.pos = k;
 							prepare(&data);
@@ -1285,13 +1358,17 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
 					data.output = outputs[i];
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 					data.coexist_feature = j;
+					data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+					igt_assert_f(data.psr_mode != PSR_DISABLED,
+								 "Invalid psr mode\n");
 					prepare(&data);
 					run(&data);
 					cleanup(&data);
@@ -1312,13 +1389,17 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
+						data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+						igt_assert_f(data.psr_mode != PSR_DISABLED,
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1339,13 +1420,17 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
+						data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+						igt_assert_f(data.psr_mode != PSR_DISABLED,
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1367,7 +1452,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+							  get_psr_mode_str_for_output(&data, outputs[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
@@ -1376,6 +1462,9 @@ igt_main
 							data.damage_area_count = k;
 							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 							data.coexist_feature = j;
+							data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+							igt_assert_f(data.psr_mode != PSR_DISABLED,
+										 "Invalid psr mode\n");
 							prepare(&data);
 							run(&data);
 							cleanup(&data);
@@ -1400,7 +1489,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
@@ -1412,6 +1502,9 @@ igt_main
 							data.primary_format = DRM_FORMAT_NV12;
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
+						data.psr_mode = get_sel_fetch_mode_for_output(&data, data.output);
+						igt_assert_f(data.psr_mode != PSR_DISABLED,
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
-- 
2.25.1

