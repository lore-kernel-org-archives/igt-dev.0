Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78414C47422
	for <igt-dev@archiver.kernel.org>; Sun, 21 Jan 2024 12:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDF810E235;
	Sun, 21 Jan 2024 12:48:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C7F10E010
 for <igt-dev@lists.freedesktop.org>; Sun, 21 Jan 2024 12:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705841306; x=1737377306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a34/7DqQ+a2fY0oX/jo3QfwAkfFvX1H4pqpjzrP6FlM=;
 b=I4ITdZ9FLB/D9afCf+dKMIsn7oeSpzfmunDCNcLD20PeYdxxfn2Rp2ID
 QSD1MGZTG2KRnq1D1gIPSr1s3aO0/crGxhiMjz8hz5M2qpd8SG7fytT4n
 90V6T+7amzcAzFa3TXYvTgW02LcweAU5mw8fqXiQHHRzpJEp3q2D6oWS5
 cg4LPOEp0qvp1ksvE2rNp0aUITzmZrhBL46iYe85tf8DpRLGNNTL5baJj
 JIkWaJPfVUgPjQGvL0x8fHNUKyrDZ1/e/5PBPpxwDQBfxQpnHLeV4Nxly
 HK1IvYf5oNHyn9xfTy4XC94t9O0mnQ4s8o6JrA639zZXT86ZaZzqFEfEs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="487167505"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; d="scan'208";a="487167505"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 04:48:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="953620"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 04:48:24 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: extend tests for panel
 replay sf
Date: Sun, 21 Jan 2024 18:27:44 +0530
Message-Id: <20240121125744.1129837-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240121125744.1129837-1-kunal1.joshi@intel.com>
References: <20240121125744.1129837-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_psr2_sf.c | 119 ++++++++++++++++++++++----------------
 1 file changed, 69 insertions(+), 50 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index c826cd7c3..8f34f46b9 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -979,6 +979,21 @@ pipe_output_combo_valid(igt_display_t *display,
 	return ret;
 }
 
+static const char *get_psr_mode_for_output(data_t *data, igt_output_t *output)
+{
+	const char *psr_mode = NULL;
+
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE_SEL_FETCH,
+			     output))
+		psr_mode = "pr-";
+	else if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2,
+				  output))
+		psr_mode = "psr2-";
+	else
+		igt_assert_f(false, "PR/PSR2 selective fetch not supported\n");
+	return psr_mode;
+}
+
 igt_main
 {
 	data_t data = {};
@@ -1001,11 +1016,6 @@ igt_main
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 
-		igt_require_f(psr_sink_support(data.drm_fd,
-					       data.debugfs_fd, PSR_MODE_2,
-					       NULL),
-			      "Sink does not support PSR2\n");
-
 		display_init(&data);
 
 		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20) &&
@@ -1013,10 +1023,6 @@ igt_main
 			data.fbc_flag = true;
 		}
 
-		/* Test if PSR2 can be enabled */
-		igt_require_f(psr_enable(data.drm_fd,
-					 data.debugfs_fd, PSR_MODE_2_SEL_FETCH),
-			      "Error enabling PSR2\n");
 
 		data.damage_area_count = MAX_DAMAGE_AREAS;
 		data.primary_format = DRM_FORMAT_XRGB8888;
@@ -1055,7 +1061,7 @@ igt_main
 		/* Verify primary plane selective fetch */
 		igt_describe("Test that selective fetch works on primary plane");
 		igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-area", append_fbc_subtest[y],
-					   op_str(data.op)) {
+								   op_str(data.op)) {
 			for (i = 0; i < n_pipes; i++) {
 				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
@@ -1063,9 +1069,10 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					igt_dynamic_f("%spipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+								  get_psr_mode_for_output(&data, outputs[i]),
+								  igt_output_name(outputs[i]),
+								  coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
@@ -1096,10 +1103,11 @@ igt_main
 					for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 						if (j != FEATURE_NONE && !(coexist_features[i] & j))
 							continue;
-						igt_dynamic_f("pipe-%s-%s%s",
-							      kmstest_pipe_name(pipes[i]),
-							      igt_output_name(outputs[i]),
-							      coexist_feature_str(j)) {
+						igt_dynamic_f("%spipe-%s-%s%s",
+									  get_psr_mode_for_output(&data, outputs[i]),
+									  kmstest_pipe_name(pipes[i]),
+									  igt_output_name(outputs[i]),
+									  coexist_feature_str(j)) {
 							data.pipe = pipes[i];
 							data.output = outputs[i];
 							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
@@ -1128,9 +1136,10 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					igt_dynamic_f("%spipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+								  get_psr_mode_for_output(&data, outputs[i]),
+								  igt_output_name(outputs[i]),
+								  coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
@@ -1158,9 +1167,10 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					igt_dynamic_f("%spipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+								  get_psr_mode_for_output(&data, outputs[i]),
+								  igt_output_name(outputs[i]),
+								  coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
@@ -1184,9 +1194,10 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					igt_dynamic_f("%spipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+								  get_psr_mode_for_output(&data, outputs[i]),
+								  igt_output_name(outputs[i]),
+								  coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
@@ -1211,9 +1222,10 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					igt_dynamic_f("%spipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+								  get_psr_mode_for_output(&data, outputs[i]),
+								  igt_output_name(outputs[i]),
+								  coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
@@ -1238,9 +1250,10 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					igt_dynamic_f("%spipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+								  get_psr_mode_for_output(&data, outputs[i]),
+								  igt_output_name(outputs[i]),
+								  coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
@@ -1266,9 +1279,10 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					igt_dynamic_f("%spipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+								  get_psr_mode_for_output(&data, outputs[i]),
+								  igt_output_name(outputs[i]),
+								  coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
@@ -1295,9 +1309,10 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					igt_dynamic_f("%spipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+								  get_psr_mode_for_output(&data, outputs[i]),
+								  igt_output_name(outputs[i]),
+								  coexist_feature_str(j)) {
 					data.pipe = pipes[i];
 					data.output = outputs[i];
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
@@ -1322,9 +1337,10 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					igt_dynamic_f("%spipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+								  get_psr_mode_for_output(&data, outputs[i]),
+								  igt_output_name(outputs[i]),
+								  coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
@@ -1349,9 +1365,10 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					igt_dynamic_f("%spipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+								  get_psr_mode_for_output(&data, outputs[i]),
+								  igt_output_name(outputs[i]),
+								  coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
@@ -1377,9 +1394,10 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					igt_dynamic_f("%spipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+								  get_psr_mode_for_output(&data, outputs[i]),
+								  igt_output_name(outputs[i]),
+								  coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
@@ -1410,9 +1428,10 @@ igt_main
 				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 					if (j != FEATURE_NONE && !(coexist_features[i] & j))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					igt_dynamic_f("%spipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+								  get_psr_mode_for_output(&data, outputs[i]),
+								  igt_output_name(outputs[i]),
+								  coexist_feature_str(j)) {
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.damage_area_count = 1;
-- 
2.25.1

