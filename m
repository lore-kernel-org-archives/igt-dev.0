Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A34AC48BF8
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 16:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054F810E3E6;
	Mon, 19 Feb 2024 16:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6KblMr3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73EE10E40B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 16:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708359847; x=1739895847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vi6XCFWN0TQ4Dyw60rj+WCQZ/vqHZbk2nOPcJDPlmZE=;
 b=K6KblMr3c9d4xH8vLgDV9dpLyL3NHDmlM0BdbCdNdd/qT0RAGTljtU/q
 zEVJbuiPdK/wWtvCOZLT6fyJrVEKhDs5qw+dsGT42nR9/py1PVGQxDovS
 EikXOg2C5uXFCFB0Ac0cToG85AHhxbw16oscN9jHZ7m5h0rcDpUerPKj/
 jBVDS3+ujum3Vqnm8C+9N/SnHN9avbEq4yXAPyiTnHJG3MuzAiWQBe7NZ
 /JQ+73d/ZcVCqld4L2jryK6pI8i2Lsgyej8biTC/pdfkQIX0Mtiavt5hw
 ACTiefZwJlO2/k+c6RJt6qr4kOh6mATIXv+QgE/MdeFuRvzCi3KP9ANUd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="12994807"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="12994807"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 08:24:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4439368"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 08:24:05 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_psr2_sf: extend tests for panel
 replay sf
Date: Mon, 19 Feb 2024 22:03:33 +0530
Message-Id: <20240219163333.2339647-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240219163333.2339647-1-kunal1.joshi@intel.com>
References: <20240219163333.2339647-1-kunal1.joshi@intel.com>
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
if output supports selective fetch then we check we if enter DEEP_SLEEP mode
in run function

v2: fixed dynamic test name
v3: use check_psr2_support (Jouni)
v4: correct order of checks in check_pr_psr2_sel_fetch_support (Jouni)
    use appropriate psr mode in psr_wait_entry (Jouni)
v5: modify get_sel_fetch_mode_for_output to use member data (Jouni)

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_psr2_sf.c | 191 +++++++++++++++++++++++++++-----------
 1 file changed, 138 insertions(+), 53 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 0fb300161..15046fd67 100644
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
@@ -179,6 +171,39 @@ typedef struct {
 	} coexist_feature;
 } data_t;
 
+static bool get_sel_fetch_mode_for_output(data_t *data)
+{
+	bool supported = false;
+
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd,
+						 PR_MODE_SEL_FETCH, data->output)) {
+		supported = true;
+		data->psr_mode = PR_MODE_SEL_FETCH;
+	} else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
+							  PSR_MODE_2, data->output)) {
+		supported = true;
+		data->psr_mode = PSR_MODE_2;
+	} else
+		igt_info("selective fetch not supported on output %s\n", data->output->name);
+
+	return supported;
+}
+
+static const char *get_psr_mode_str_for_output(data_t *data)
+{
+	static const char *psr_mode;
+
+	if (get_sel_fetch_mode_for_output(data)) {
+		if (data->psr_mode == PSR_MODE_2)
+			psr_mode = "psr2";
+		else if (data->psr_mode == PR_MODE_SEL_FETCH)
+			psr_mode = "pr";
+		else
+			igt_assert_f(false, "Invalid psr mode\n");
+	}
+	return psr_mode;
+}
+
 static const char *op_str(enum operations op)
 {
 	static const char * const name[] = {
@@ -688,7 +722,7 @@ static void damaged_plane_move(data_t *data)
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode, data->output));
 
 	expected_output(data);
 }
@@ -788,7 +822,7 @@ static void plane_move_continuous(data_t *data)
 {
 	int target_x, target_y;
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode, data->output));
 
 	get_target_coords(data, &target_x, &target_y);
 
@@ -865,7 +899,7 @@ static void damaged_plane_update(data_t *data)
 	igt_plane_set_position(data->test_plane, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode, data->output));
 
 	expected_output(data);
 }
@@ -874,7 +908,7 @@ static void run(data_t *data)
 {
 	int i;
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode, data->output));
 
 	if (data->fbc_flag == true && data->op_fbc_mode == FBC_ENABLED)
 		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
@@ -952,14 +986,22 @@ static void cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb_test);
 }
 
-static int check_psr2_support(data_t *data)
+static bool check_pr_psr2_sel_fetch_support(data_t *data)
 {
-	int status;
+	bool status = false;
+
+	/* Check sink supports PR/PSR2 selective fetch */
+	if (!get_sel_fetch_mode_for_output(data))
+		return false;
+
+	/* Check if selective fetch can be enabled */
+	if (!selective_fetch_check(data->debugfs_fd, data->output))
+		igt_assert("Selective fetch is not enabled even though panel should support it\n");
 
 	prepare(data);
-	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL);
+	/* We enter into DEEP_SLEEP for both PSR2 and PR sel fetch */
+	status = psr_wait_entry(data->debugfs_fd, data->psr_mode, data->output);
 	cleanup(data);
-
 	return status;
 }
 
@@ -981,6 +1023,8 @@ pipe_output_combo_valid(igt_display_t *display,
 
 igt_main
 {
+	bool output_supports_pr_psr2_sel_fetch = false;
+	bool pr_psr2_sel_fetch_supported = false;
 	data_t data = {};
 	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
 	int i, j, k, y;
@@ -1000,11 +1044,6 @@ igt_main
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 
-		igt_require_f(psr_sink_support(data.drm_fd,
-					       data.debugfs_fd, PSR_MODE_2,
-					       NULL),
-			      "Sink does not support PSR2\n");
-
 		display_init(&data);
 
 		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20) &&
@@ -1028,7 +1067,8 @@ igt_main
 
 		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
 			coexist_features[n_pipes] = 0;
-			if (check_psr2_support(&data)) {
+			output_supports_pr_psr2_sel_fetch = check_pr_psr2_sel_fetch_support(&data);
+			if (output_supports_pr_psr2_sel_fetch) {
 				pipes[n_pipes] = data.pipe;
 				outputs[n_pipes] = data.output;
 
@@ -1037,7 +1077,10 @@ igt_main
 
 				n_pipes++;
 			}
+			pr_psr2_sel_fetch_supported |= output_supports_pr_psr2_sel_fetch;
 		}
+		igt_require_f(pr_psr2_sel_fetch_supported,
+					  "No output supports selective fetch\n");
 	}
 
 	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
@@ -1054,17 +1097,20 @@ igt_main
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
-						data.pipe = pipes[i];
-						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 						data.coexist_feature = j;
+						igt_assert_f(get_sel_fetch_mode_for_output(&data),
+									 "Invalid psr mode\n");
 						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
 							data.damage_area_count = k;
 							prepare(&data);
@@ -1087,18 +1133,21 @@ igt_main
 					if (!pipe_output_combo_valid(&data.display, pipes[i],
 								     outputs[i]))
 						continue;
+					data.pipe = pipes[i];
+					data.output = outputs[i];
 
 					for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 						if (j != FEATURE_NONE && !(coexist_features[i] & j))
 							continue;
-						igt_dynamic_f("pipe-%s-%s%s",
+						igt_dynamic_f("%s-pipe-%s-%s%s",
+								  get_psr_mode_str_for_output(&data),
 							      kmstest_pipe_name(pipes[i]),
 							      igt_output_name(outputs[i]),
 							      coexist_feature_str(j)) {
-							data.pipe = pipes[i];
-							data.output = outputs[i];
 							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 							data.coexist_feature = j;
+							igt_assert_f(get_sel_fetch_mode_for_output(&data),
+										 "Invalid psr mode\n");
 							for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
 								data.damage_area_count = k;
 								prepare(&data);
@@ -1119,17 +1168,20 @@ igt_main
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
-						data.pipe = pipes[i];
-						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
+						igt_assert_f(get_sel_fetch_mode_for_output(&data),
+									 "Invalid psr mode\n");
 						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
 							data.damage_area_count = k;
 							prepare(&data);
@@ -1149,17 +1201,20 @@ igt_main
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
-						data.pipe = pipes[i];
-						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 						data.coexist_feature = j;
+						igt_assert_f(get_sel_fetch_mode_for_output(&data),
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1175,17 +1230,20 @@ igt_main
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
-						data.pipe = pipes[i];
-						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 						data.coexist_feature = j;
+						igt_assert_f(get_sel_fetch_mode_for_output(&data),
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1202,17 +1260,20 @@ igt_main
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
-						data.pipe = pipes[i];
-						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 						data.coexist_feature = j;
+						igt_assert_f(get_sel_fetch_mode_for_output(&data),
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1229,17 +1290,20 @@ igt_main
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
-						data.pipe = pipes[i];
-						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 						data.coexist_feature = j;
+						igt_assert_f(get_sel_fetch_mode_for_output(&data),
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1257,17 +1321,21 @@ igt_main
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s",
+							  get_psr_mode_str_for_output(&data),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
-						data.pipe = pipes[i];
-						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
+						igt_assert_f(get_sel_fetch_mode_for_output(&data),
+									 "Invalid psr mode\n");
 						for (k = POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT ; k++) {
 							data.pos = k;
 							prepare(&data);
@@ -1286,17 +1354,20 @@ igt_main
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
-					data.pipe = pipes[i];
-					data.output = outputs[i];
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 					data.coexist_feature = j;
+					igt_assert_f(get_sel_fetch_mode_for_output(&data),
+								"Invalid psr mode\n");
 					prepare(&data);
 					run(&data);
 					cleanup(&data);
@@ -1313,17 +1384,20 @@ igt_main
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
-						data.pipe = pipes[i];
-						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
+						igt_assert_f(get_sel_fetch_mode_for_output(&data),
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1340,17 +1414,20 @@ igt_main
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
-						data.pipe = pipes[i];
-						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
+						igt_assert_f(get_sel_fetch_mode_for_output(&data),
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1368,19 +1445,22 @@ igt_main
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+							  get_psr_mode_str_for_output(&data),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
-						data.pipe = pipes[i];
-						data.output = outputs[i];
 						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
 							data.damage_area_count = k;
 							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 							data.coexist_feature = j;
+							igt_assert_f(get_sel_fetch_mode_for_output(&data),
+										 "Invalid psr mode\n");
 							prepare(&data);
 							run(&data);
 							cleanup(&data);
@@ -1401,15 +1481,16 @@ igt_main
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
-						data.pipe = pipes[i];
-						data.output = outputs[i];
 						data.damage_area_count = 1;
 						if (data.op_fbc_mode == FBC_ENABLED)
 							data.primary_format = DRM_FORMAT_XRGB8888;
@@ -1417,6 +1498,8 @@ igt_main
 							data.primary_format = DRM_FORMAT_NV12;
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
+						igt_assert_f(get_sel_fetch_mode_for_output(&data),
+									 "Invalid psr mode\n");
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
-- 
2.25.1

