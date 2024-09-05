Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41B2CD5BC5
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 13:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854F310E8BD;
	Thu,  5 Sep 2024 13:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/mxYdAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA41910E8BD
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 13:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725543761; x=1757079761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MlUHeLuy6WJdDYOQSw8qc3/CyeV6X4hkAXE6XnXBXaw=;
 b=U/mxYdApE4FVKJxGuN2TwINprH1hc77axuhzHZ25CizMdObuAXXqYUch
 k9tZbUEtZXbZQG7NOh96l8UjezY5w5/1UbV6AQnr4LMeNLzF6qrao8zKB
 JgUepMQMndAxEI37e7FEqggP4GLMvsg5zCFeSKoUiTuSvL5xlApkqxECJ
 8tV/fZHWsJRn7H9Ca2qJOR2TSvX2l8Rn2R1tF8SOiTXsQpY73B7bqKFDe
 dhaN+vZEBMYk6kmf2F+ah47wQB4hlYVvzioCVOJ92L44Hj+PzJcnAo6Ki
 bPgMpGefpAbT8YozC2AK21vYco9K1ddqRlqr2j2y/DAfIgOdK7PqVvcSW Q==;
X-CSE-ConnectionGUID: FLvpPm3fQwyzH/wUw0mC8A==
X-CSE-MsgGUID: cnZoLvsqTEy5l5CjkPAD0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28148159"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="28148159"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 06:42:40 -0700
X-CSE-ConnectionGUID: Kx+wuQbBRRO2JHpNQp1TyA==
X-CSE-MsgGUID: mLIwg9DWQXi5FqSRR6XhKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="103080633"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 05 Sep 2024 06:42:38 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 1/2] tests/intel/kms_psr2_sf: Modify kms_psr2_sf test
Date: Thu,  5 Sep 2024 19:12:58 +0530
Message-Id: <20240905134259.1155164-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

In the current kms_psr2_sf tests, we identify PSR/PR/PR-SF at
dynamic subtest level.
This patch converts the test structure to execute on PSR/PR/PR-SF
at subtest level for easy identification of tests.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_psr2_sf.c | 809 +++++++++++++++++++-------------------
 1 file changed, 407 insertions(+), 402 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 03ff1cddb..3fd814281 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -44,11 +44,20 @@
 #include <string.h>
 
 /**
- * SUBTEST: %s-plane-move-continuous-%s
+ * SUBTEST: psr2-%s-plane-move-continuous-%s
  * Description: Test that selective fetch works on moving %arg[1] plane %arg[2]
  *              visible area (no update)
  *
- * SUBTEST: fbc-%s-plane-move-continuous-%s
+ * SUBTEST: pr-%s-plane-move-continuous-%s
+ * Description: Test that selective fetch works on moving %arg[1] plane %arg[2]
+ *              visible area (no update)
+ *
+ * SUBTEST: fbc-psr2-%s-plane-move-continuous-%s
+ * Description: Test that fbc with selective fetch works on moving %arg[1] plane %arg[2]
+ *              visible area (no update)
+ * Functionality: plane, psr2, selective_fetch, fbc
+ *
+ * SUBTEST: fbc-pr-%s-plane-move-continuous-%s
  * Description: Test that fbc with selective fetch works on moving %arg[1] plane %arg[2]
  *              visible area (no update)
  * Functionality: plane, psr2, selective_fetch, fbc
@@ -66,51 +75,98 @@
  */
 
 /**
- * SUBTEST: cursor-plane-update-sf
+ * SUBTEST: psr2-cursor-plane-update-sf
  * Description: Test that selective fetch works on cursor plane
  *
- * SUBTEST: fbc-cursor-plane-update-sf
+ * SUBTEST: pr-cursor-plane-update-sf
+ * Description: Test that selective fetch works on cursor plane
+ *
+ * SUBTEST: fbc-psr2-cursor-plane-update-sf
+ * Description: Test that fbc with selective fetch works on cursor plane
+ * Functionality: plane, psr2, selective_fetch, fbc
+ *
+ * SUBTEST: fbc-pr-cursor-plane-update-sf
  * Description: Test that fbc with selective fetch works on cursor plane
  * Functionality: plane, psr2, selective_fetch, fbc
  *
- * SUBTEST: overlay-plane-update-continuous-sf
+ * SUBTEST: psr2-overlay-plane-update-continuous-sf
  * Description: Test that selective fetch works on overlay plane
  *
- * SUBTEST: fbc-overlay-plane-update-sf-dmg-area
+ * SUBTEST: pr-overlay-plane-update-continuous-sf
+ * Description: Test that selective fetch works on overlay plane
+ *
+ * SUBTEST: fbc-psr2-overlay-plane-update-sf-dmg-area
+ * Description: Test that fbc with selective fetch works on overlay plane
+ * Functionality: plane, psr2, selective_fetch, fbc
+ *
+ * SUBTEST: fbc-pr-overlay-plane-update-sf-dmg-area
  * Description: Test that fbc with selective fetch works on overlay plane
  * Functionality: plane, psr2, selective_fetch, fbc
  *
- * SUBTEST: overlay-plane-update-sf-dmg-area
+ * SUBTEST: psr2-overlay-plane-update-sf-dmg-area
+ * Description: Test that selective fetch works on overlay plane
+ *
+ * SUBTEST: pr-overlay-plane-update-sf-dmg-area
  * Description: Test that selective fetch works on overlay plane
  *
- * SUBTEST: fbc-overlay-plane-update-continuous-sf
+ * SUBTEST: fbc-psr2-overlay-plane-update-continuous-sf
  * Description: Test that fbc with selective fetch works on overlay plane
  * Functionality: plane, psr2, selective_fetch, fbc
  *
- * SUBTEST: overlay-primary-update-sf-dmg-area
+ * SUBTEST: fbc-pr-overlay-plane-update-continuous-sf
+ * Description: Test that fbc with selective fetch works on overlay plane
+ * Functionality: plane, psr2, selective_fetch, fbc
+ *
+ * SUBTEST: psr2-overlay-primary-update-sf-dmg-area
+ * Description: Test that selective fetch works on primary plane with blended
+ *              overlay plane
+ *
+ * SUBTEST: pr-overlay-primary-update-sf-dmg-area
  * Description: Test that selective fetch works on primary plane with blended
  *              overlay plane
  *
- * SUBTEST: fbc-overlay-primary-update-sf-dmg-area
+ * SUBTEST: fbc-psr2-overlay-primary-update-sf-dmg-area
  * Description: Test that fbc with selective fetch works on primary plane with blended
  *              overlay plane
  * Functionality: plane, psr2, selective_fetch, fbc
  *
- * SUBTEST: plane-move-sf-dmg-area
+ * SUBTEST: fbc-pr-overlay-primary-update-sf-dmg-area
+ * Description: Test that fbc with selective fetch works on primary plane with blended
+ *              overlay plane
+ * Functionality: plane, psr2, selective_fetch, fbc
+ *
+ * SUBTEST: psr2-plane-move-sf-dmg-area
  * Description: Test that selective fetch works on moving overlay plane
  *
- * SUBTEST: fbc-plane-move-sf-dmg-area
+ * SUBTEST: pr-plane-move-sf-dmg-area
+ * Description: Test that selective fetch works on moving overlay plane
+ *
+ * SUBTEST: fbc-psr2-plane-move-sf-dmg-area
  * Description: Test that fbc with selective fetch works on moving overlay plane
  * Functionality: plane, psr2, selective_fetch, fbc
  *
- * SUBTEST: primary-plane-update-sf-dmg-area
+ * SUBTEST: fbc-pr-plane-move-sf-dmg-area
+ * Description: Test that fbc with selective fetch works on moving overlay plane
+ * Functionality: plane, psr2, selective_fetch, fbc
+ *
+ * SUBTEST: psr2-primary-plane-update-sf-dmg-area
+ * Description: Test that selective fetch works on primary plane
+ *
+ * SUBTEST: pr-primary-plane-update-sf-dmg-area
  * Description: Test that selective fetch works on primary plane
  *
- * SUBTEST: fbc-primary-plane-update-sf-dmg-area
+ * SUBTEST: fbc-psr2-primary-plane-update-sf-dmg-area
  * Description: Test that fbc with selective fetch works on primary plane
  * Functionality: plane, psr2, selective_fetch, fbc
  *
- * SUBTEST: primary-plane-update-sf-dmg-area-big-fb
+ * SUBTEST: fbc-pr-primary-plane-update-sf-dmg-area
+ * Description: Test that fbc with selective fetch works on primary plane
+ * Functionality: plane, psr2, selective_fetch, fbc
+ *
+ * SUBTEST: psr2-primary-plane-update-sf-dmg-area-big-fb
+ * Description: Test that selective fetch works on primary plane with big fb
+ *
+ * SUBTEST: pr-primary-plane-update-sf-dmg-area-big-fb
  * Description: Test that selective fetch works on primary plane with big fb
  */
 
@@ -216,23 +272,6 @@ static bool set_sel_fetch_mode_for_output(data_t *data)
 	return supported;
 }
 
-static const char *get_psr_mode_str_for_output(data_t *data)
-{
-	static const char *psr_mode;
-
-	switch (data->psr_mode) {
-	case PSR_MODE_2:
-		psr_mode = "psr2";
-		break;
-	case PR_MODE_SEL_FETCH:
-		psr_mode = "pr";
-		break;
-	default:
-		psr_mode = "";
-	}
-	return psr_mode;
-}
-
 static const char *op_str(enum operations op)
 {
 	static const char * const name[] = {
@@ -1045,13 +1084,95 @@ pipe_output_combo_valid(igt_display_t *display,
 	return ret;
 }
 
+static bool check_psr_mode_supported(data_t *data, int psr_stat)
+{
+	if (data->psr_mode == psr_stat)
+		return true;
+	else
+		return false;
+}
+
+static void run_dynamic_test_damage_areas(data_t data, int i, int coexist_features[])
+{
+	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+		if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			continue;
+		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
+			      igt_output_name(data.output), coexist_feature_str(j)) {
+			data.coexist_feature = j;
+			for (int k = 1; k <= MAX_DAMAGE_AREAS; k++) {
+				data.damage_area_count = k;
+				prepare(&data);
+				run(&data);
+				cleanup(&data);
+			}
+		}
+	}
+}
+
+static void run_dynamic_test(data_t data, int i, int coexist_features[])
+{
+	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+		if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			continue;
+		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
+			      igt_output_name(data.output), coexist_feature_str(j)) {
+			data.coexist_feature = j;
+			prepare(&data);
+			run(&data);
+			cleanup(&data);
+		}
+	}
+}
+
+static void run_plane_move(data_t data, int i, int coexist_features[])
+{
+	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+		if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			continue;
+		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
+			      igt_output_name(data.output), coexist_feature_str(j)) {
+			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+			data.coexist_feature = j;
+			for (int k = POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT; k++) {
+				data.pos = k;
+				prepare(&data);
+				run(&data);
+				cleanup(&data);
+			}
+		}
+	}
+}
+
+static void run_plane_update_continuous(data_t data, int i, int coexist_features[])
+{
+	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+		if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			continue;
+		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
+			      igt_output_name(data.output), coexist_feature_str(j)) {
+			data.damage_area_count = 1;
+			if (data.op_fbc_mode == FBC_ENABLED)
+				data.primary_format = DRM_FORMAT_XRGB8888;
+			else
+				data.primary_format = DRM_FORMAT_NV12;
+
+			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+			data.coexist_feature = j;
+			prepare(&data);
+			run(&data);
+			cleanup(&data);
+		}
+	}
+}
+
 igt_main
 {
 	bool output_supports_pr_psr2_sel_fetch = false;
 	bool pr_psr2_sel_fetch_supported = false;
 	data_t data = {};
 	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
-	int i, j, k, y;
+	int i, y, z;
 	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
 	int n_pipes = 0;
 	int coexist_features[IGT_MAX_PIPES * IGT_MAX_PIPES];
@@ -1061,6 +1182,12 @@ igt_main
 	};
 	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
 
+	const char *append_psr_subtest[2] = {
+		"psr2-",
+		"pr-"
+	};
+	int psr_status[] = {PSR_MODE_2, PR_MODE_SEL_FETCH};
+
 	igt_fixture {
 		drmModeResPtr res;
 
@@ -1103,430 +1230,308 @@ igt_main
 	}
 
 	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
-		data.op = PLANE_UPDATE;
-		data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-		data.primary_format = DRM_FORMAT_XRGB8888;
-		data.big_fb_test = 0;
-
-		data.op_fbc_mode = fbc_status[y];
-		/* Verify primary plane selective fetch */
-		igt_describe("Test that selective fetch works on primary plane");
-		igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-area", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							 "Selective fetch is not supported\n");
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+		for (z = 0; z < ARRAY_SIZE(psr_status); z++) {
+			data.op = PLANE_UPDATE;
+			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+			data.primary_format = DRM_FORMAT_XRGB8888;
+			data.big_fb_test = 0;
+
+			data.op_fbc_mode = fbc_status[y];
+			data.psr_mode = psr_status[z];
+
+			/* Verify primary plane selective fetch */
+			igt_describe("Test that selective fetch works on primary plane");
+			igt_subtest_with_dynamic_f("%s%sprimary-%s-sf-dmg-area",
+						   append_fbc_subtest[y],
+						   append_psr_subtest[z],
+						   op_str(data.op)) {
+				for (i = 0; i < n_pipes; i++) {
+					if (!pipe_output_combo_valid(&data.display,
+								     pipes[i], outputs[i]))
+						continue;
+					data.pipe = pipes[i];
+					data.output = outputs[i];
+					igt_assert_f(set_sel_fetch_mode_for_output(&data),
+						     "Selective fetch is not supported\n");
+
+					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
-					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
-							  kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+
+					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+					run_dynamic_test_damage_areas(data, i, coexist_features);
+				}
+			}
+
+			/* Verify primary plane selective fetch with big fb */
+			if (data.op_fbc_mode == FBC_DISABLED) {
+				data.big_fb_test = 1;
+				igt_describe("Test that selective fetch works on primary plane "
+					     "with big fb");
+				igt_subtest_with_dynamic_f("%s%sprimary-%s-sf-dmg-area-big-fb",
+							   append_fbc_subtest[y],
+							   append_psr_subtest[z],
+							   op_str(data.op)) {
+					for (i = 0; i < n_pipes; i++) {
+						if (!pipe_output_combo_valid(&data.display,
+									     pipes[i], outputs[i]))
+							continue;
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						igt_assert_f(set_sel_fetch_mode_for_output(&data),
+							     "Selective fetch is not supported\n");
+						if (!check_psr_mode_supported(&data, psr_status[z]))
+							continue;
+
 						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-						data.coexist_feature = j;
-						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
-							data.damage_area_count = k;
-							prepare(&data);
-							run(&data);
-							cleanup(&data);
-						}
+						run_dynamic_test_damage_areas(data, i,
+									      coexist_features);
 					}
 				}
 			}
-		}
 
-		/* Verify primary plane selective fetch with big fb */
-		if (data.op_fbc_mode == FBC_DISABLED) {
-			data.big_fb_test = 1;
-			igt_describe("Test that selective fetch works on primary plane with "
-				     "big fb");
-			igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-area-big-fb",
-						   append_fbc_subtest[y], op_str(data.op)) {
+			data.big_fb_test = 0;
+			/* Verify overlay plane selective fetch */
+			igt_describe("Test that selective fetch works on overlay plane");
+			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf-dmg-area",
+						   append_fbc_subtest[y],
+						   append_psr_subtest[z],
+						   op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display, pipes[i],
+					if (!pipe_output_combo_valid(&data.display,
+								     pipes[i],
 								     outputs[i]))
 						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-								 "Selective fetch is not supported\n");
+						     "Selective fetch is not supported\n");
+					if (!check_psr_mode_supported(&data, psr_status[z]))
+						continue;
 
-					for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-						if (j != FEATURE_NONE && !(coexist_features[i] & j))
-							continue;
-						igt_dynamic_f("%s-pipe-%s-%s%s",
-								  get_psr_mode_str_for_output(&data),
-							      kmstest_pipe_name(pipes[i]),
-							      igt_output_name(outputs[i]),
-							      coexist_feature_str(j)) {
-							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-							data.coexist_feature = j;
-
-							for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
-								data.damage_area_count = k;
-								prepare(&data);
-								run(&data);
-								cleanup(&data);
-							}
-						}
-					}
+					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+					run_dynamic_test_damage_areas(data, i, coexist_features);
 				}
 			}
-		}
 
-		data.big_fb_test = 0;
-		/* Verify overlay plane selective fetch */
-		igt_describe("Test that selective fetch works on overlay plane");
-		igt_subtest_with_dynamic_f("%soverlay-%s-sf-dmg-area", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							 "Selective fetch is not supported\n");
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			data.damage_area_count = 1;
+			/* Verify cursor plane selective fetch */
+			igt_describe("Test that selective fetch works on cursor plane");
+			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
+						   append_psr_subtest[z], op_str(data.op)) {
+				for (i = 0; i < n_pipes; i++) {
+					if (!pipe_output_combo_valid(&data.display,
+								     pipes[i],
+								     outputs[i]))
 						continue;
-					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
-							  kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
-						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-						data.coexist_feature = j;
-
-						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
-							data.damage_area_count = k;
-							prepare(&data);
-							run(&data);
-							cleanup(&data);
-						}
-					}
-				}
-			}
-		}
-
-		data.damage_area_count = 1;
-		/* Verify cursor plane selective fetch */
-		igt_describe("Test that selective fetch works on cursor plane");
-		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							 "Selective fetch is not supported\n");
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+					data.pipe = pipes[i];
+					data.output = outputs[i];
+					igt_assert_f(set_sel_fetch_mode_for_output(&data),
+						     "Selective fetch is not supported\n");
+					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
-					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
-							  kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
-						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-						data.coexist_feature = j;
-						prepare(&data);
-						run(&data);
-						cleanup(&data);
-					}
+
+					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+					run_dynamic_test(data, i, coexist_features);
 				}
 			}
-		}
 
-		data.op = PLANE_MOVE_CONTINUOUS;
-		igt_describe("Test that selective fetch works on moving cursor plane (no update)");
-		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							 "Selective fetch is not supported\n");
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			data.op = PLANE_MOVE_CONTINUOUS;
+			igt_describe("Test that selective fetch works on "
+				     "moving cursor plane (no update)");
+			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
+						   append_psr_subtest[z], op_str(data.op)) {
+				for (i = 0; i < n_pipes; i++) {
+					if (!pipe_output_combo_valid(&data.display,
+								     pipes[i],
+								     outputs[i]))
 						continue;
-					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
-							  kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
-						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-						data.coexist_feature = j;
-
-						prepare(&data);
-						run(&data);
-						cleanup(&data);
-					}
+					data.pipe = pipes[i];
+					data.output = outputs[i];
+					igt_assert_f(set_sel_fetch_mode_for_output(&data),
+						     "Selective fetch is not supported\n");
+					if (!check_psr_mode_supported(&data, psr_status[z]))
+						continue;
+
+					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+					run_dynamic_test(data, i, coexist_features);
 				}
 			}
-		}
 
-		data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
-		igt_describe("Test that selective fetch works on moving cursor plane exceeding "
-			     "partially visible area (no update)");
-		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							 "Selective fetch is not supported\n");
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
+			igt_describe("Test that selective fetch works on moving cursor "
+				     "plane exceeding partially visible area (no update)");
+			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
+						   append_psr_subtest[z], op_str(data.op)) {
+				for (i = 0; i < n_pipes; i++) {
+					if (!pipe_output_combo_valid(&data.display,
+								     pipes[i],
+								     outputs[i]))
 						continue;
-					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
-							  kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
-						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-						data.coexist_feature = j;
-						prepare(&data);
-						run(&data);
-						cleanup(&data);
-					}
+					data.pipe = pipes[i];
+					data.output = outputs[i];
+					igt_assert_f(set_sel_fetch_mode_for_output(&data),
+						     "Selective fetch is not supported\n");
+					if (!check_psr_mode_supported(&data, psr_status[z]))
+						continue;
+
+					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+					run_dynamic_test(data, i, coexist_features);
 				}
 			}
-		}
 
-		data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
-		igt_describe("Test that selective fetch works on moving cursor plane exceeding "
-			     "fully visible area (no update)");
-		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							 "Selective fetch is not supported\n");
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
+			igt_describe("Test that selective fetch works on moving cursor plane "
+				     "exceeding fully visible area (no update)");
+			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
+						   append_psr_subtest[z], op_str(data.op)) {
+				for (i = 0; i < n_pipes; i++) {
+					if (!pipe_output_combo_valid(&data.display,
+								     pipes[i],
+								     outputs[i]))
 						continue;
-					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
-							  kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
-						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-						data.coexist_feature = j;
-						prepare(&data);
-						run(&data);
-						cleanup(&data);
-					}
+					data.pipe = pipes[i];
+					data.output = outputs[i];
+					igt_assert_f(set_sel_fetch_mode_for_output(&data),
+						     "Selective fetch is not supported\n");
+					if (!check_psr_mode_supported(&data, psr_status[z]))
+						continue;
+
+					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+					run_dynamic_test(data, i, coexist_features);
 				}
 			}
-		}
 
-		/* Only for overlay plane */
-		data.op = PLANE_MOVE;
-		/* Verify overlay plane move selective fetch */
-		igt_describe("Test that selective fetch works on moving overlay plane");
-		igt_subtest_with_dynamic_f("%s%s-sf-dmg-area", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							 "Selective fetch is not supported\n");
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			/* Only for overlay plane */
+			data.op = PLANE_MOVE;
+			/* Verify overlay plane move selective fetch */
+			igt_describe("Test that selective fetch works on moving overlay plane");
+			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
+						   append_psr_subtest[z], op_str(data.op)) {
+				for (i = 0; i < n_pipes; i++) {
+					if (!pipe_output_combo_valid(&data.display,
+								     pipes[i],
+								     outputs[i]))
 						continue;
-					igt_dynamic_f("%s-pipe-%s-%s%s",
-							  get_psr_mode_str_for_output(&data),
-							  kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
-						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-						data.coexist_feature = j;
-						for (k = POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT ; k++) {
-							data.pos = k;
-							prepare(&data);
-							run(&data);
-							cleanup(&data);
-						}
-					}
+					data.pipe = pipes[i];
+					data.output = outputs[i];
+					igt_assert_f(set_sel_fetch_mode_for_output(&data),
+						     "Selective fetch is not supported\n");
+					if (!check_psr_mode_supported(&data, psr_status[z]))
+						continue;
+
+					run_plane_move(data, i, coexist_features);
 				}
 			}
-		}
 
-		data.op = PLANE_MOVE_CONTINUOUS;
-		igt_describe("Test that selective fetch works on moving overlay plane (no update)");
-		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							 "Selective fetch is not supported\n");
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			data.op = PLANE_MOVE_CONTINUOUS;
+			igt_describe("Test that selective fetch works on moving overlay "
+				     "plane (no update)");
+			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
+						   append_psr_subtest[z], op_str(data.op)) {
+				for (i = 0; i < n_pipes; i++) {
+					if (!pipe_output_combo_valid(&data.display,
+								     pipes[i],
+								     outputs[i]))
 						continue;
-					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
-							  kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
+					data.pipe = pipes[i];
+					data.output = outputs[i];
+					igt_assert_f(set_sel_fetch_mode_for_output(&data),
+						     "Selective fetch is not supported\n");
+					if (!check_psr_mode_supported(&data, psr_status[z]))
+						continue;
+
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-					data.coexist_feature = j;
-					prepare(&data);
-					run(&data);
-					cleanup(&data);
-					}
+					run_dynamic_test(data, i, coexist_features);
 				}
 			}
-		}
 
-		data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
-		igt_describe("Test that selective fetch works on moving overlay plane partially "
-			     "exceeding visible area (no update)");
-		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							 "Selective fetch is not supported\n");
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
+			igt_describe("Test that selective fetch works on moving overlay "
+				     "plane partially exceeding visible area (no update)");
+			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
+						   append_psr_subtest[z], op_str(data.op)) {
+				for (i = 0; i < n_pipes; i++) {
+					if (!pipe_output_combo_valid(&data.display,
+								     pipes[i],
+								     outputs[i]))
 						continue;
-					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
-							  kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
-						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-						data.coexist_feature = j;
-						prepare(&data);
-						run(&data);
-						cleanup(&data);
-					}
+					data.pipe = pipes[i];
+					data.output = outputs[i];
+					igt_assert_f(set_sel_fetch_mode_for_output(&data),
+						     "Selective fetch is not supported\n");
+					if (!check_psr_mode_supported(&data, psr_status[z]))
+						continue;
+
+					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+					run_dynamic_test(data, i, coexist_features);
 				}
 			}
-		}
 
-		data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
-		igt_describe("Test that selective fetch works on moving overlay plane fully "
-			     "exceeding visible area (no update)");
-		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							 "Selective fetch is not supported\n");
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
+			igt_describe("Test that selective fetch works on moving overlay plane "
+				     "fully exceeding visible area (no update)");
+			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
+						   append_psr_subtest[z], op_str(data.op)) {
+				for (i = 0; i < n_pipes; i++) {
+					if (!pipe_output_combo_valid(&data.display, pipes[i],
+								     outputs[i]))
 						continue;
-					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
-							  kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
-						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-						data.coexist_feature = j;
-						prepare(&data);
-						run(&data);
-						cleanup(&data);
-					}
+					data.pipe = pipes[i];
+					data.output = outputs[i];
+					igt_assert_f(set_sel_fetch_mode_for_output(&data),
+						     "Selective fetch is not supported\n");
+					if (!check_psr_mode_supported(&data, psr_status[z]))
+						continue;
+
+					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+					run_dynamic_test(data, i, coexist_features);
 				}
 			}
-		}
 
-		/* Verify primary plane selective fetch with overplay plane blended */
-		data.op = OVERLAY_PRIM_UPDATE;
-		igt_describe("Test that selective fetch works on primary plane "
-			     "with blended overlay plane");
-		igt_subtest_with_dynamic_f("%s%s-sf-dmg-area", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							 "Selective fetch is not supported\n");
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			/* Verify primary plane selective fetch with overplay plane blended */
+			data.op = OVERLAY_PRIM_UPDATE;
+			igt_describe("Test that selective fetch works on primary plane "
+				     "with blended overlay plane");
+			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
+						   append_psr_subtest[z], op_str(data.op)) {
+				for (i = 0; i < n_pipes; i++) {
+					if (!pipe_output_combo_valid(&data.display,
+								     pipes[i],
+								     outputs[i]))
 						continue;
-					igt_dynamic_f("%s-pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-							  get_psr_mode_str_for_output(&data),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
-						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
-							data.damage_area_count = k;
-							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-							data.coexist_feature = j;
-
-							prepare(&data);
-							run(&data);
-							cleanup(&data);
-						}
-					}
+					data.pipe = pipes[i];
+					data.output = outputs[i];
+					igt_assert_f(set_sel_fetch_mode_for_output(&data),
+						     "Selective fetch is not supported\n");
+					if (!check_psr_mode_supported(&data, psr_status[z]))
+						continue;
+
+					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+					run_dynamic_test_damage_areas(data, i, coexist_features);
 				}
 			}
-		}
 
-		/*
-		 * Verify overlay plane selective fetch using NV12 primary
-		 * plane and continuous updates.
-		 */
-		data.op = PLANE_UPDATE_CONTINUOUS;
-		igt_describe("Test that selective fetch works on overlay plane");
-		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							 "Selective fetch is not supported\n");
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+			/*
+			 * Verify overlay plane selective fetch using NV12 primary
+			 * plane and continuous updates.
+			 */
+			data.op = PLANE_UPDATE_CONTINUOUS;
+			igt_describe("Test that selective fetch works on overlay plane");
+			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
+						   append_psr_subtest[z], op_str(data.op)) {
+				for (i = 0; i < n_pipes; i++) {
+					if (!pipe_output_combo_valid(&data.display,
+								     pipes[i],
+								     outputs[i]))
 						continue;
-					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
-							  kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
-						data.damage_area_count = 1;
-						if (data.op_fbc_mode == FBC_ENABLED)
-							data.primary_format = DRM_FORMAT_XRGB8888;
-						else
-							data.primary_format = DRM_FORMAT_NV12;
-						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-						data.coexist_feature = j;
-						prepare(&data);
-						run(&data);
-						cleanup(&data);
-					}
+					data.pipe = pipes[i];
+					data.output = outputs[i];
+					igt_assert_f(set_sel_fetch_mode_for_output(&data),
+						     "Selective fetch is not supported\n");
+					if (!check_psr_mode_supported(&data, psr_status[z]))
+						continue;
+
+					run_plane_update_continuous(data, i, coexist_features);
 				}
 			}
 		}
-- 
2.34.1

