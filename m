Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5F8C4828F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 13:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C13B10E780;
	Wed,  7 Feb 2024 13:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNCGTy6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E446810ED84
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707313448; x=1738849448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tSSlJKKTSgf5Ya5Bqf4wH8esU9N9bGsjS14/jENOcWY=;
 b=SNCGTy6IzeQ519EjGiMVniWqtiMHPtIlyDZ3zfsXZE2GrbFL0ab2hN7w
 dXuQWmXrb3kGPPXMFR5cFW+Ft1qrN+8+PieV2cmo+Qc4XBBnRlgbdXaK4
 R+Ju6p/2r7CAkxTgJrOjHa8F2kRYLo9tNqiE2WA2QYIQ6RTdUPuc81PpE
 YquxFARUw3xcC9xlcmjWhCBOnKeRxsb0bMSNKZJcZgT6+emLQqJ3spPIl
 aDUeMDPhOgVPxeuIZsHcHaIqueEqJsp1kKBRwOiqLHOp44cUXaMkjrwRq
 XFI1yQGGRxyRIeA36Mxmf/M+id+v/U0Dh3Qr129Ph5n2YHP7sZl8Bg9V5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1133298"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1133298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 05:44:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="5973382"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 05:44:06 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_psr2_sf: extend tests for panel
 replay sf
Date: Wed,  7 Feb 2024 19:23:19 +0530
Message-Id: <20240207135319.1880229-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240207135319.1880229-1-kunal1.joshi@intel.com>
References: <20240207135319.1880229-1-kunal1.joshi@intel.com>
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

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_psr2_sf.c | 86 +++++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 25 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 8e6a9e02c..1f12659e2 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -207,6 +207,21 @@ static const char *coexist_feature_str(int coexist_feature)
 	}
 }
 
+static const char *get_psr_mode_for_output(data_t *data, igt_output_t *output)
+{
+	const char *psr_mode = NULL;
+
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE_SEL_FETCH,
+			     output))
+		psr_mode = "pr";
+	else if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2,
+				  output))
+		psr_mode = "psr2";
+	else
+		igt_assert_f(false, "PR/PSR2 selective fetch not supported\n");
+	return psr_mode;
+}
+
 static void display_init(data_t *data)
 {
 	igt_display_require(&data->display, data->drm_fd);
@@ -874,7 +889,7 @@ static void run(data_t *data)
 {
 	int i;
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
+	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, data->output));
 
 	if (data->fbc_flag == true && data->op_fbc_mode == FBC_ENABLED)
 		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
@@ -952,14 +967,20 @@ static void cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb_test);
 }
 
-static int check_psr2_support(data_t *data)
+static bool check_pr_psr2_sel_fetch_support(data_t *data)
 {
-	int status;
-
+	bool status = false;
+
+	if (!selective_fetch_check(data->debugfs_fd, data->output))
+		return false;
+	else if	(!(psr_sink_support(data->drm_fd, data->debugfs_fd,
+							   PR_MODE_SEL_FETCH, data->output) ||
+			 psr_sink_support(data->drm_fd, data->debugfs_fd,
+							   PSR_MODE_2_SEL_FETCH, data->output)))
+		return false;
 	prepare(data);
-	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL);
+	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2, data->output);
 	cleanup(data);
-
 	return status;
 }
 
@@ -981,6 +1002,8 @@ pipe_output_combo_valid(igt_display_t *display,
 
 igt_main
 {
+	bool output_supports_pr_psr2_sel_fetch = false;
+	bool pr_psr2_sel_fetch_supported = false;
 	data_t data = {};
 	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
 	int i, j, k, y;
@@ -1000,11 +1023,6 @@ igt_main
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 
-		igt_require_f(psr_sink_support(data.drm_fd,
-					       data.debugfs_fd, PSR_MODE_2,
-					       NULL),
-			      "Sink does not support PSR2\n");
-
 		display_init(&data);
 
 		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20) &&
@@ -1023,7 +1041,8 @@ igt_main
 
 		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
 			coexist_features[n_pipes] = 0;
-			if (check_psr2_support(&data)) {
+			output_supports_pr_psr2_sel_fetch = check_pr_psr2_sel_fetch_support(&data);
+			if (output_supports_pr_psr2_sel_fetch) {
 				pipes[n_pipes] = data.pipe;
 				outputs[n_pipes] = data.output;
 
@@ -1032,7 +1051,10 @@ igt_main
 
 				n_pipes++;
 			}
+			pr_psr2_sel_fetch_supported |= output_supports_pr_psr2_sel_fetch;
 		}
+		igt_require_f(pr_psr2_sel_fetch_supported,
+					  "No output supports selective fetch\n");
 	}
 
 	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
@@ -1053,7 +1075,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
@@ -1086,7 +1109,8 @@ igt_main
 					for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 						if (j != FEATURE_NONE && !(coexist_features[i] & j))
 							continue;
-						igt_dynamic_f("pipe-%s-%s%s",
+						igt_dynamic_f("%s-pipe-%s-%s%s",
+								  get_psr_mode_for_output(&data, outputs[i]),
 							      kmstest_pipe_name(pipes[i]),
 							      igt_output_name(outputs[i]),
 							      coexist_feature_str(j)) {
@@ -1118,7 +1142,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
@@ -1148,7 +1173,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
@@ -1174,7 +1200,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
@@ -1201,7 +1228,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
@@ -1228,7 +1256,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
@@ -1256,7 +1285,9 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s",
+							  get_psr_mode_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
@@ -1285,7 +1316,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
@@ -1312,7 +1344,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
@@ -1339,7 +1372,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
@@ -1367,7 +1401,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+							  get_psr_mode_for_output(&data, outputs[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
@@ -1400,7 +1435,8 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_for_output(&data, outputs[i]),
+							  kmstest_pipe_name(pipes[i]),
 						      igt_output_name(outputs[i]),
 						      coexist_feature_str(j)) {
 						data.pipe = pipes[i];
-- 
2.25.1

