Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EC6C021AA
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 09:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE21A10E23B;
	Fri, 21 Feb 2025 09:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSj+MAjd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A5210E22C
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740129906; x=1771665906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nPYCqSkPuRBkd8aFi9TyeliI+WINkeFYvKkM8OjmM0g=;
 b=jSj+MAjduCYooqkGCfsMm1dS5ejIpMdF0gYZq4YoXRii9jov3TOfYaVV
 1TVL8eYC7fN9c/s+vjAK+Xkh4Ny1dr6nSx6BeNtxIgG1PUGEaPLA8+nj1
 pba+wI2kZY/5lupDaIW22x1YdIOabFm2RpqMylauMmVkupwTwe9X4pBaz
 KblpZ6l5/GLRxpgKAfSVsfiKIyTALJlPxU0p6slLTIqc1Akcmrr2KQ/6u
 Or3bk+L33dbqAyGybW2z+JgLrCwyw5uv+wG1MaxMXgINwZzK3mVijHJgA
 +SZY+j80TB9bkVjK4OGsSC9z9jQP4fae0w4EICzQN8wYgtv6X3JqL2Y+j w==;
X-CSE-ConnectionGUID: TWOC12zoRyqB+rA/KaQNVQ==
X-CSE-MsgGUID: yfjW4gcvTEmE0hylpPFnZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44857909"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="44857909"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 01:25:05 -0800
X-CSE-ConnectionGUID: 3B8bnad8Rl+YVbJHMz+gpg==
X-CSE-MsgGUID: ECzAHBO8QsWUniN80T7YTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="146188419"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by orviesa002.jf.intel.com with ESMTP; 21 Feb 2025 01:25:02 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_display_modes: Remove negative test for
 extended display
Date: Fri, 21 Feb 2025 14:55:00 +0530
Message-ID: <20250221092500.15215-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220103640.44879-1-mohammed.thasleem@intel.com>
References: <20250220103640.44879-1-mohammed.thasleem@intel.com>
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

This negative test was crated to validate ENOSPC when two 2k-4k or 4k-4k
monitors connected through MST to cover bandwidth issue in MST config.

But it will not helpfult to handle current bandwidth which are
DisplayPort (DP) 1.4 supports a total bandwidth of 4 × 8.1 Gbps.

However, with DP 2.1, the bandwidth allocation strategy has
significantly changed to 4 × 20 Gbps of available bandwidth.
This provides significantly greater display capabilities
w.r.t bandwidth.

v2: Fix compilation issue.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_display_modes.c | 109 +-------------------------------------
 1 file changed, 1 insertion(+), 108 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 117f82325..e12d08f8d 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -40,64 +40,17 @@
  * Description: Test for validating display extended mode with a pair of connected
  *              displays
  * Functionality: kms_core
- *
- * SUBTEST: mst-extended-mode-negative
- * Description: Negative test for validating display extended mode with a pair
- *		of connected 2k-4k or 4k-4k displays.
- * Functionality: kms_core, mst
  */
 
-#define HDISPLAY_4K	3840
-#define VDISPLAY_4K	2160
-
 IGT_TEST_DESCRIPTION("Test Display Modes");
 
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
-	drmModeModeInfo mode_mst[2];
 	igt_output_t *mst_output[2];
 	int n_pipes;
 } data_t;
 
-/* Get higher mode supported by panel. */
-static drmModeModeInfo *get_highres_mode(igt_output_t *output)
-{
-	drmModeConnector *connector = output->config.connector;
-	drmModeModeInfo *highest_mode = NULL;
-
-	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
-	highest_mode = &connector->modes[0];
-
-	return highest_mode;
-}
-
-/* Get the 4k or less then 4k mode of connected panel. */
-static drmModeModeInfo *get_mode(igt_output_t *output)
-{
-	int j;
-	drmModeModeInfo *required_mode = NULL;
-	drmModeConnector *connector = output->config.connector;
-
-	required_mode = igt_output_get_mode(output);
-	if (required_mode->vdisplay <= VDISPLAY_4K &&
-	    required_mode->hdisplay <= HDISPLAY_4K) {
-		return required_mode;
-	}
-
-	/* If default mode not 4k or less than 4k mode, then sort modes and check for it. */
-	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
-	for (j = 0; j < connector->count_modes; j++) {
-		if (connector->modes[j].vdisplay <= VDISPLAY_4K &&
-		    connector->modes[j].hdisplay <= HDISPLAY_4K) {
-			required_mode = &connector->modes[j];
-			break;
-		}
-	}
-
-	return required_mode;
-}
-
 static bool output_is_dp_mst(data_t *data, igt_output_t *output, int i)
 {
 	int connector_id;
@@ -110,7 +63,7 @@ static bool output_is_dp_mst(data_t *data, igt_output_t *output, int i)
 	/*
 	 * Discarding outputs of other DP MST topology.
 	 * Testing only on outputs on the topology we got previously
-	 */
+	*/
 	if (i == 0) {
 		prev_connector_id = connector_id;
 	} else {
@@ -274,46 +227,9 @@ static void run_extendedmode_test(data_t *data) {
 	}
 }
 
-static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
-{
-	struct igt_fb fbs[2];
-	igt_display_t *display = &data->display;
-	igt_plane_t *plane[2];
-	int ret;
-
-	igt_display_reset(display);
-
-	igt_output_set_pipe(data->mst_output[0], pipe1);
-	igt_output_set_pipe(data->mst_output[1], pipe2);
-
-	igt_create_color_fb(data->drm_fd, data->mode_mst[0].hdisplay, data->mode_mst[0].vdisplay,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1, 0, 0, &fbs[0]);
-	igt_create_color_fb(data->drm_fd, data->mode_mst[1].hdisplay, data->mode_mst[1].vdisplay,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, 0, 1, &fbs[1]);
-
-	plane[0] = igt_pipe_get_plane_type(&display->pipes[pipe1], DRM_PLANE_TYPE_PRIMARY);
-	plane[1] = igt_pipe_get_plane_type(&display->pipes[pipe2], DRM_PLANE_TYPE_PRIMARY);
-
-	igt_plane_set_fb(plane[0], &fbs[0]);
-	igt_fb_set_size(&fbs[0], plane[0], data->mode_mst[0].hdisplay, data->mode_mst[0].vdisplay);
-	igt_plane_set_size(plane[0], data->mode_mst[0].hdisplay, data->mode_mst[0].vdisplay);
-
-	igt_plane_set_fb(plane[1], &fbs[1]);
-	igt_fb_set_size(&fbs[1], plane[1], data->mode_mst[1].hdisplay, data->mode_mst[1].vdisplay);
-	igt_plane_set_size(plane[1], data->mode_mst[1].hdisplay, data->mode_mst[1].vdisplay);
-
-	igt_output_override_mode(data->mst_output[0], &data->mode_mst[0]);
-	igt_output_override_mode(data->mst_output[1], &data->mode_mst[1]);
-
-	igt_require(intel_pipe_output_combo_valid(display));
-	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
-	igt_assert(ret != 0 && errno == ENOSPC);
-}
-
 igt_main
 {
 	int dp_mst_outputs = 0, count = 0;
-	enum pipe pipe1, pipe2;
 	igt_output_t *output;
 	data_t data;
 
@@ -340,29 +256,6 @@ igt_main
 		run_extendedmode_test(&data);
 	}
 
-	igt_describe("Negative test for validating display extended mode with a pair of connected "
-		     "2k-4k or 4k-4k displays");
-	igt_subtest_with_dynamic("mst-extended-mode-negative") {
-		igt_require_f(dp_mst_outputs > 1, "MST not found more then one\n");
-
-		memcpy(&data.mode_mst[0], get_mode(data.mst_output[0]), sizeof(drmModeModeInfo));
-		memcpy(&data.mode_mst[1], get_highres_mode(data.mst_output[1]),
-				sizeof(drmModeModeInfo));
-		igt_require_f((data.mode_mst[1].hdisplay >= HDISPLAY_4K &&
-			       data.mode_mst[1].vdisplay >= VDISPLAY_4K), "4k panel not found\n");
-
-		for_each_pipe(&data.display, pipe1) {
-			for_each_pipe(&data.display, pipe2) {
-				if (pipe1 == pipe2)
-					continue;
-
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe1),
-					      kmstest_pipe_name(pipe2))
-					run_extendedmode_negative(&data, pipe1, pipe2);
-			}
-		}
-	}
-
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.43.0

