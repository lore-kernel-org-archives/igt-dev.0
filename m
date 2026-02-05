Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A67E91286
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 07:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED5F10E7D8;
	Thu,  5 Feb 2026 07:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqyaASpn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3C010E7D7
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 07:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770275089; x=1801811089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RVu9KXjoHpl66UKyzWTOjmIW5UpkffajwJluXDfL/Y4=;
 b=DqyaASpnrQS+S3XjkJz5mmkBALTHVsP5LW1SIfj1EvX6LAb1JCbosn5P
 G0YG7qegPGMYR6SnsPXVEW6JWogRWZ4GVJxp2k+/TolxlG/pLgRQRRoaV
 /60fZvhldv6pyHHhrPTtZ/zg5rynmGyWHz+jcAQ91RRQk1TY6irqz2rhH
 5pZvwXz42hBYsVF5ydiVM0SfERORKUEaA8C+GQrdGm7ovuUKR/sMDPqTI
 DFzH/v3sxgYdkQ5/WP25kQ6eEksVI9kRLTvqvq2YONVMOBbq3FjYF63LF
 XGe7d9hTu8n/18KA6VZl1ggDdoogt6ep2SYSMtkKoJorH8aHJtP/g/ZRv Q==;
X-CSE-ConnectionGUID: k7Tj9PzOTbGTezdBvK5p/g==
X-CSE-MsgGUID: idCHUNm/Q06bueF17FJf8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70486958"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70486958"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 23:04:49 -0800
X-CSE-ConnectionGUID: aRI0JbCQTmGP0Y5rI0kBTA==
X-CSE-MsgGUID: ObDfd2wGTyemzRTHFgzeew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210495586"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.51])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 23:04:48 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t v3 3/3] tests/kms_psr2_sf: Allow testing of both PSR2
 and Panel Replay if supported
Date: Thu,  5 Feb 2026 09:04:25 +0200
Message-ID: <20260205070425.300934-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205070425.300934-1-jouni.hogander@intel.com>
References: <20260205070425.300934-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently kms_psr2_sf is testing only Panel Replay even if PSR2 is
supported. Allow testing both PSR2 and Panel Replay when supported.

Also drop some complexity from fixture for detection of working
PSR. Earlier working PSR support was detected in fixture by enabling PSR
and then ensuring PSR entry happens. Now we are relying on
pipe_output_combo_valid. Earlier approach was problematic as PSR Might be
broken due to some earlier test which was run. This caused kms_psr2_sf to
not run any tests on that sink/pipe setup. Now these are supposed to be
visible as failing testcases.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_psr2_sf.c | 153 +++++---------------------------------
 1 file changed, 20 insertions(+), 133 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index e537af121..6aeda119b 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -252,36 +252,6 @@ static bool is_et_check_needed(data_t *data)
 	}
 }
 
-static bool set_sel_fetch_mode_for_output(data_t *data)
-{
-	bool supported = false;
-
-	if (psr_sink_support(data->drm_fd, data->debugfs_fd,
-						 PR_MODE_SEL_FETCH_ET, data->output)) {
-		supported = true;
-		data->psr_mode = PR_MODE_SEL_FETCH;
-	} else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
-							PR_MODE_SEL_FETCH, data->output)) {
-		supported = true;
-		data->psr_mode = PR_MODE_SEL_FETCH;
-	} else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
-							PSR_MODE_2_ET, data->output)) {
-		supported = true;
-		data->psr_mode = PSR_MODE_2;
-	} else	if (psr_sink_support(data->drm_fd, data->debugfs_fd,
-							  PSR_MODE_2, data->output)) {
-		supported = true;
-		data->psr_mode = PSR_MODE_2;
-	} else
-		igt_info("selective fetch not supported on output %s\n", data->output->name);
-
-	if (supported)
-		supported = psr_enable(data->drm_fd, data->debugfs_fd, data->psr_mode,
-				       data->output);
-
-	return supported;
-}
-
 static const char *op_str(enum operations op)
 {
 	static const char * const name[] = {
@@ -430,6 +400,9 @@ static void prepare(data_t *data)
 	igt_plane_t *primary, *sprite = NULL, *cursor = NULL;
 	int fb_w, fb_h, x, y, view_w, view_h;
 
+	psr_enable(data->drm_fd, data->debugfs_fd, data->psr_mode,
+		   data->output);
+
 	data->mode = igt_output_get_mode(output);
 
 	if (data->coexist_feature & FEATURE_DSC) {
@@ -1065,25 +1038,6 @@ static void cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb_test);
 }
 
-static bool check_pr_psr2_sel_fetch_support(data_t *data)
-{
-	bool status = false;
-
-	/* Check sink supports PR/PSR2 selective fetch */
-	if (!set_sel_fetch_mode_for_output(data))
-		return false;
-
-	/* Check if selective fetch can be enabled */
-	if (!selective_fetch_check(data->debugfs_fd, data->output))
-		igt_assert("Selective fetch is not enabled even though panel should support it\n");
-
-	prepare(data);
-	/* We enter into DEEP_SLEEP for both PSR2 and PR sel fetch */
-	status = psr_wait_entry(data->debugfs_fd, data->psr_mode, data->output);
-	cleanup(data);
-	return status;
-}
-
 static bool sel_fetch_pipe_combo_valid(data_t *data)
 {
 	if (data->devid < 14 && !IS_ALDERLAKE_P(data->devid) && data->pipe != PIPE_A)
@@ -1118,14 +1072,6 @@ pipe_output_combo_valid(data_t *data)
 	return ret;
 }
 
-static bool check_psr_mode_supported(data_t *data, int psr_stat)
-{
-	if (data->psr_mode == psr_stat)
-		return true;
-	else
-		return false;
-}
-
 static void run_dynamic_test_damage_areas(data_t data, int i, int coexist_features[])
 {
 	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
@@ -1250,18 +1196,25 @@ int igt_main()
 		for_each_crtc_with_valid_output(&data.display, crtc,
 						data.output) {
 			data.pipe = crtc->pipe;
-			coexist_features[n_pipes] = 0;
-			output_supports_pr_psr2_sel_fetch = check_pr_psr2_sel_fetch_support(&data);
-			if (output_supports_pr_psr2_sel_fetch) {
-				pipes[n_pipes] = crtc->pipe;
-				outputs[n_pipes] = data.output;
+			for (i = 0; i < ARRAY_SIZE(psr_status); i++) {
+				data.psr_mode = psr_status[i];
+				output_supports_pr_psr2_sel_fetch = pipe_output_combo_valid(&data);
+				if (output_supports_pr_psr2_sel_fetch)
+					break;
+			}
 
-				if (is_dsc_supported_by_sink(data.drm_fd, data.output))
-					coexist_features[n_pipes] |= FEATURE_DSC;
+			if (!output_supports_pr_psr2_sel_fetch)
+				continue;
 
-				n_pipes++;
-			}
-			pr_psr2_sel_fetch_supported |= output_supports_pr_psr2_sel_fetch;
+			pipes[n_pipes] = data.pipe;
+			outputs[n_pipes] = data.output;
+
+			coexist_features[n_pipes] = 0;
+			if (is_dsc_supported_by_sink(data.drm_fd, data.output))
+				coexist_features[n_pipes] |= FEATURE_DSC;
+
+			n_pipes++;
+			pr_psr2_sel_fetch_supported = true;
 		}
 		igt_require_f(pr_psr2_sel_fetch_supported,
 					  "No output supports selective fetch\n");
@@ -1292,12 +1245,6 @@ int igt_main()
 					if (!pipe_output_combo_valid(&data))
 						continue;
 
-					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-						     "Selective fetch is not supported\n");
-
-					if (!check_psr_mode_supported(&data, psr_status[z]))
-						continue;
-
 					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 					run_dynamic_test_damage_areas(data, i, coexist_features);
 				}
@@ -1319,11 +1266,6 @@ int igt_main()
 						if (!pipe_output_combo_valid(&data))
 							continue;
 
-						igt_assert_f(set_sel_fetch_mode_for_output(&data),
-							     "Selective fetch is not supported\n");
-						if (!check_psr_mode_supported(&data, psr_status[z]))
-							continue;
-
 						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 						run_dynamic_test_damage_areas(data, i,
 									      coexist_features);
@@ -1345,11 +1287,6 @@ int igt_main()
 					if (!pipe_output_combo_valid(&data))
 						continue;
 
-					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-						     "Selective fetch is not supported\n");
-					if (!check_psr_mode_supported(&data, psr_status[z]))
-						continue;
-
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 					run_dynamic_test_damage_areas(data, i, coexist_features);
 				}
@@ -1367,11 +1304,6 @@ int igt_main()
 					if (!pipe_output_combo_valid(&data))
 						continue;
 
-					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-						     "Selective fetch is not supported\n");
-					if (!check_psr_mode_supported(&data, psr_status[z]))
-						continue;
-
 					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1389,11 +1321,6 @@ int igt_main()
 					if (!pipe_output_combo_valid(&data))
 						continue;
 
-					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-						     "Selective fetch is not supported\n");
-					if (!check_psr_mode_supported(&data, psr_status[z]))
-						continue;
-
 					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1411,11 +1338,6 @@ int igt_main()
 					if (!pipe_output_combo_valid(&data))
 						continue;
 
-					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-						     "Selective fetch is not supported\n");
-					if (!check_psr_mode_supported(&data, psr_status[z]))
-						continue;
-
 					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1433,11 +1355,6 @@ int igt_main()
 					if (!pipe_output_combo_valid(&data))
 						continue;
 
-					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-						     "Selective fetch is not supported\n");
-					if (!check_psr_mode_supported(&data, psr_status[z]))
-						continue;
-
 					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1456,11 +1373,6 @@ int igt_main()
 					if (!pipe_output_combo_valid(&data))
 						continue;
 
-					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-						     "Selective fetch is not supported\n");
-					if (!check_psr_mode_supported(&data, psr_status[z]))
-						continue;
-
 					run_plane_move(data, i, coexist_features);
 				}
 			}
@@ -1477,11 +1389,6 @@ int igt_main()
 					if (!pipe_output_combo_valid(&data))
 						continue;
 
-					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-						     "Selective fetch is not supported\n");
-					if (!check_psr_mode_supported(&data, psr_status[z]))
-						continue;
-
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1499,11 +1406,6 @@ int igt_main()
 					if (!pipe_output_combo_valid(&data))
 						continue;
 
-					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-						     "Selective fetch is not supported\n");
-					if (!check_psr_mode_supported(&data, psr_status[z]))
-						continue;
-
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1521,11 +1423,6 @@ int igt_main()
 					if (!pipe_output_combo_valid(&data))
 						continue;
 
-					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-						     "Selective fetch is not supported\n");
-					if (!check_psr_mode_supported(&data, psr_status[z]))
-						continue;
-
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1544,11 +1441,6 @@ int igt_main()
 					if (!pipe_output_combo_valid(&data))
 						continue;
 
-					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-						     "Selective fetch is not supported\n");
-					if (!check_psr_mode_supported(&data, psr_status[z]))
-						continue;
-
 					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 					run_dynamic_test_damage_areas(data, i, coexist_features);
 				}
@@ -1569,11 +1461,6 @@ int igt_main()
 					if (!pipe_output_combo_valid(&data))
 						continue;
 
-					igt_assert_f(set_sel_fetch_mode_for_output(&data),
-						     "Selective fetch is not supported\n");
-					if (!check_psr_mode_supported(&data, psr_status[z]))
-						continue;
-
 					run_plane_update_continuous(data, i, coexist_features);
 				}
 			}
-- 
2.43.0

