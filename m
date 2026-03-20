Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBCD108B8F7
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 11:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1F010EADD;
	Fri, 20 Mar 2026 11:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTzz8f2r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11C010EAD1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 11:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774005966; x=1805541966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kWetcebuU4XtnvFwvwXEzSxy4bQOMJhEd2GoVsDafGM=;
 b=YTzz8f2rb40l210cEGJqA1N8F2WX46I+DAUKaL313A+8i5GKxGFlrLGV
 NfrEvTIORh8jMf8VqNfXE7bwdxpXePBpiNqlvEeOrMa1h9RdyCKMBG/8B
 UiY+AoGvJEPd3SSw9yigswd8+AhRZPZ+c6ztL692UHlkLgipfHstIo+QW
 4S2baL/fSynHP5EuQf9D46JyTKL7RKoqHTMyi006DUzYIibPHYP4K9cFL
 QXs243ca2Eq40tdnKIW3LS9GTmDMjnlAZ+BXZxVpOWwNlRfLvTc083bFq
 XAR93VzGHLgVVNJcAthRoLpNeW37v5CiEgmHmZPdCGFeaNnHb88WOjIE8 Q==;
X-CSE-ConnectionGUID: NeCAPkI7Sa+4EQlyAoD/pQ==
X-CSE-MsgGUID: DjJu0MEVQgm4J4BghH9iwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="97706043"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="97706043"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:18 -0700
X-CSE-ConnectionGUID: h7jEr1+tSbyuOW7tGmhjqQ==
X-CSE-MsgGUID: qtFkpPCOSpy/d44OlN/c6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="253759122"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t 2/7] tests/amdgpu/amd_dp_dsc:
 s/crtc->pipe/crtc->crtc_index/
Date: Fri, 20 Mar 2026 13:24:52 +0200
Message-ID: <ebef7d318c01bdd2b2857df7f7a4efbed2158e17.1774005763.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774005763.git.jani.nikula@intel.com>
References: <cover.1774005763.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

For amdpgu, crtc->crtc_index == crtc->pipe always. Use the generic and
GPU agnostic crtc->crtc_index instead of the vendor specific crtc->pipe.

This allows us to better highlight the places where crtc->pipe is
actually needed and valid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Hung <alex.hung@amd.com>

Review tip: apply and use this to ignore the whitespace changes:

git show --color-words --word-diff-regex="\w+"
---
 tests/amdgpu/amd_dp_dsc.c | 142 ++++++++++++++++++++------------------
 1 file changed, 73 insertions(+), 69 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 3874e4a88ca9..c04f4d003267 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -49,7 +49,7 @@ static void test_fini(data_t *data)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		igt_pipe_crc_free(data->pipe_crc[crtc->pipe]);
+		igt_pipe_crc_free(data->pipe_crc[crtc->crtc_index]);
 	}
 
 	igt_display_reset(display);
@@ -64,12 +64,11 @@ static void test_init(data_t *data)
 	int i, n;
 
 	for_each_crtc(display, crtc) {
-		data->crtc[crtc->pipe] = crtc;
-		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
-								    DRM_PLANE_TYPE_PRIMARY);
-		data->pipe_crc[crtc->pipe] =
-				igt_crtc_crc_new(crtc,
-						 IGT_PIPE_CRC_SOURCE_AUTO);
+		data->crtc[crtc->crtc_index] = crtc;
+		data->primary[crtc->crtc_index] =
+			igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+		data->pipe_crc[crtc->crtc_index] =
+			igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
 	for (i = 0,
@@ -122,19 +121,20 @@ static void test_dsc_enable(data_t *data)
 
 	for_each_crtc(&data->display, crtc) {
 		/* Setup the output */
-		output = data->output[crtc->pipe];
-		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[crtc->pipe]))
+		output = data->output[crtc->crtc_index];
+		if (!output || !igt_output_is_connected(output) ||
+		    !is_dsc_capable(&data->mode[crtc->crtc_index]))
 			continue;
 
 		igt_create_pattern_fb(data->fd,
-				      data->mode[crtc->pipe].hdisplay,
-				      data->mode[crtc->pipe].vdisplay,
+				      data->mode[crtc->crtc_index].hdisplay,
+				      data->mode[crtc->crtc_index].vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      0,
 				      &ref_fb);
 		igt_output_set_crtc(output,
 				    crtc);
-		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 		test_conn_cnt++;
@@ -145,7 +145,7 @@ static void test_dsc_enable(data_t *data)
 		/* Force enable DSC */
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_ON);
 
-		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 		/* Check if DSC is enabled */
@@ -154,13 +154,13 @@ static void test_dsc_enable(data_t *data)
 		/* Revert DSC to automatic state */
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
 
-		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 		dsc_after = igt_amd_read_dsc_clock_status(data->fd, output->name);
 
 		/* Revert DSC back to automatic mechanism by disabling state overwrites */
-		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
 
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
 
@@ -270,19 +270,20 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 
 	for_each_crtc(&data->display, crtc) {
 		/* Setup the output */
-		output = data->output[crtc->pipe];
-		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[crtc->pipe]))
+		output = data->output[crtc->crtc_index];
+		if (!output || !igt_output_is_connected(output) ||
+		    !is_dsc_capable(&data->mode[crtc->crtc_index]))
 			continue;
 
 		igt_create_pattern_fb(data->fd,
-				      data->mode[crtc->pipe].hdisplay,
-				      data->mode[crtc->pipe].vdisplay,
+				      data->mode[crtc->crtc_index].hdisplay,
+				      data->mode[crtc->crtc_index].vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      0,
 				      &ref_fb);
 		igt_output_set_crtc(output,
 				    crtc);
-		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 		test_conn_cnt++;
@@ -298,7 +299,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 		/* Force enable DSC */
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_ON);
 
-		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 		/* Check if DSC is enabled */
@@ -306,23 +307,23 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 
 		if (dsc_on) {
 			ret_slice_height = update_slice_height(data, v_addressable, num_slices, output,
-							       crtc->pipe,
+							       crtc->crtc_index,
 							       ref_fb);
 			ret_slice_width = update_slice_width(data, h_addressable, num_slices, output,
-							     crtc->pipe,
+							     crtc->crtc_index,
 							     ref_fb);
 		}
 
 		/* Force disable DSC */
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
 
-		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 		dsc_after = igt_amd_read_dsc_clock_status(data->fd, output->name);
 
 		/* Revert DSC back to automatic mechanism by disabling state overwrites */
-		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
 
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
 
@@ -366,40 +367,42 @@ static void test_dsc_link_settings(data_t *data)
 
 	/* Setup all outputs */
 	for_each_crtc(&data->display, crtc) {
-		output = data->output[crtc->pipe];
-		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[crtc->pipe]))
+		output = data->output[crtc->crtc_index];
+		if (!output || !igt_output_is_connected(output) ||
+		    !is_dsc_capable(&data->mode[crtc->crtc_index]))
 			continue;
 
 		igt_create_pattern_fb(data->fd,
-				      data->mode[crtc->pipe].hdisplay,
-				      data->mode[crtc->pipe].vdisplay,
+				      data->mode[crtc->crtc_index].hdisplay,
+				      data->mode[crtc->crtc_index].vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      0,
-				      &ref_fb[crtc->pipe]);
+				      &ref_fb[crtc->crtc_index]);
 		igt_output_set_crtc(output,
 				    crtc);
-		igt_plane_set_fb(data->primary[crtc->pipe],
-				 &ref_fb[crtc->pipe]);
+		igt_plane_set_fb(data->primary[crtc->crtc_index],
+				 &ref_fb[crtc->crtc_index]);
 	}
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	/* Collect reference CRCs */
 	for_each_crtc(&data->display, crtc) {
-		output = data->output[crtc->pipe];
-		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[crtc->pipe]))
+		output = data->output[crtc->crtc_index];
+		if (!output || !igt_output_is_connected(output) ||
+		    !is_dsc_capable(&data->mode[crtc->crtc_index]))
 			continue;
 
-		igt_pipe_crc_collect_crc(data->pipe_crc[crtc->pipe],
-					 &ref_crc[crtc->pipe]);
+		igt_pipe_crc_collect_crc(data->pipe_crc[crtc->crtc_index],
+					 &ref_crc[crtc->crtc_index]);
 	}
 
 	for (lc = 0; lc < ARRAY_SIZE(lane_count_vals); lc++) {
 		for (lr = 0; lr < ARRAY_SIZE(link_rate_vals); lr++) {
 			/* Write new link_settings */
 			for_each_crtc(&data->display, crtc) {
-				output = data->output[crtc->pipe];
+				output = data->output[crtc->crtc_index];
 				if (!output || !igt_output_is_connected(output) ||
-				    !is_dsc_capable(&data->mode[crtc->pipe]))
+				    !is_dsc_capable(&data->mode[crtc->crtc_index]))
 					continue;
 
 				/* Write lower link settings */
@@ -416,9 +419,9 @@ static void test_dsc_link_settings(data_t *data)
 			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 			for_each_crtc(&data->display, crtc) {
-				output = data->output[crtc->pipe];
+				output = data->output[crtc->crtc_index];
 				if (!output || !igt_output_is_connected(output) ||
-				    !is_dsc_capable(&data->mode[crtc->pipe]))
+				    !is_dsc_capable(&data->mode[crtc->crtc_index]))
 					continue;
 
 				/* Verify lower link settings */
@@ -434,26 +437,27 @@ static void test_dsc_link_settings(data_t *data)
 				/* Log current mode and DSC status */
 				dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
 				igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
-					 data->mode[crtc->pipe].hdisplay,
-					 data->mode[crtc->pipe].vdisplay,
-					 data->mode[crtc->pipe].vrefresh,
+					 data->mode[crtc->crtc_index].hdisplay,
+					 data->mode[crtc->crtc_index].vdisplay,
+					 data->mode[crtc->crtc_index].vrefresh,
 					 dsc_on ? "ON" : "OFF");
 
-				igt_pipe_crc_collect_crc(data->pipe_crc[crtc->pipe],
-							 &new_crc[crtc->pipe]);
-				igt_assert_crc_equal(&ref_crc[crtc->pipe],
-						     &new_crc[crtc->pipe]);
+				igt_pipe_crc_collect_crc(data->pipe_crc[crtc->crtc_index],
+							 &new_crc[crtc->crtc_index]);
+				igt_assert_crc_equal(&ref_crc[crtc->crtc_index],
+						     &new_crc[crtc->crtc_index]);
 			}
 		}
 	}
 
 	/* Cleanup all fbs */
 	for_each_crtc(&data->display, crtc) {
-		output = data->output[crtc->pipe];
-		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[crtc->pipe]))
+		output = data->output[crtc->crtc_index];
+		if (!output || !igt_output_is_connected(output) ||
+		    !is_dsc_capable(&data->mode[crtc->crtc_index]))
 			continue;
 
-		igt_remove_fb(data->fd, &ref_fb[crtc->pipe]);
+		igt_remove_fb(data->fd, &ref_fb[crtc->crtc_index]);
 	}
 
 	test_fini(data);
@@ -474,11 +478,11 @@ static void test_dsc_bpc(data_t *data)
 
 	/* Find max supported bpc */
 	for_each_crtc(&data->display, crtc) {
-		output = data->output[crtc->pipe];
+		output = data->output[crtc->crtc_index];
 		if (!output || !igt_output_is_connected(output))
 			continue;
 		igt_info("Checking bpc support of conn %s\n", output->name);
-		max_supported_bpc[crtc->pipe] = igt_get_output_max_bpc(output);
+		max_supported_bpc[crtc->crtc_index] = igt_get_output_max_bpc(output);
 	}
 
 	/* Setup all outputs */
@@ -486,41 +490,41 @@ static void test_dsc_bpc(data_t *data)
 		igt_info("Testing bpc = %d\n", bpc_vals[bpc]);
 
 		for_each_crtc(&data->display, crtc) {
-			output = data->output[crtc->pipe];
+			output = data->output[crtc->crtc_index];
 			if (!output || !igt_output_is_connected(output))
 				continue;
 
-			if (max_supported_bpc[crtc->pipe] < bpc_vals[bpc]) {
+			if (max_supported_bpc[crtc->crtc_index] < bpc_vals[bpc]) {
 				igt_info("Display doesn't support bpc of %d, max is %d. Skipping to next bpc value.\n", bpc_vals[bpc],
-					 max_supported_bpc[crtc->pipe]);
+					 max_supported_bpc[crtc->crtc_index]);
 				continue;
 			}
 			igt_info("Setting bpc = %d\n", bpc_vals[bpc]);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, bpc_vals[bpc]);
 			igt_create_pattern_fb(data->fd,
-					      data->mode[crtc->pipe].hdisplay,
-					      data->mode[crtc->pipe].vdisplay,
+					      data->mode[crtc->crtc_index].hdisplay,
+					      data->mode[crtc->crtc_index].vdisplay,
 					      DRM_FORMAT_XRGB8888,
 					      0,
-					      &ref_fb[crtc->pipe]);
+					      &ref_fb[crtc->crtc_index]);
 			igt_output_set_crtc(output,
 					    crtc);
-			igt_plane_set_fb(data->primary[crtc->pipe],
-					 &ref_fb[crtc->pipe]);
+			igt_plane_set_fb(data->primary[crtc->crtc_index],
+					 &ref_fb[crtc->crtc_index]);
 		}
 
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 		for_each_crtc(&data->display, crtc) {
-			output = data->output[crtc->pipe];
+			output = data->output[crtc->crtc_index];
 			if (!output || !igt_output_is_connected(output))
 				continue;
 
-			if (max_supported_bpc[crtc->pipe] < bpc_vals[bpc])
+			if (max_supported_bpc[crtc->crtc_index] < bpc_vals[bpc])
 				continue;
 
 			/* Check that crc is non-zero */
-			igt_pipe_crc_collect_crc(data->pipe_crc[crtc->pipe],
+			igt_pipe_crc_collect_crc(data->pipe_crc[crtc->crtc_index],
 						 &test_crc);
 			igt_assert(test_crc.crc[0] && test_crc.crc[1] && test_crc.crc[2]);
 
@@ -533,22 +537,22 @@ static void test_dsc_bpc(data_t *data)
 			/* Log current mode and DSC status */
 			dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
 			igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
-				 data->mode[crtc->pipe].hdisplay,
-				 data->mode[crtc->pipe].vdisplay,
-				 data->mode[crtc->pipe].vrefresh,
+				 data->mode[crtc->crtc_index].hdisplay,
+				 data->mode[crtc->crtc_index].vdisplay,
+				 data->mode[crtc->crtc_index].vrefresh,
 				 dsc_on ? "ON" : "OFF");
 		}
 
 		/* Cleanup all fbs */
 		for_each_crtc(&data->display, crtc) {
-			output = data->output[crtc->pipe];
+			output = data->output[crtc->crtc_index];
 			if (!output || !igt_output_is_connected(output))
 				continue;
 
-			if (max_supported_bpc[crtc->pipe] < bpc_vals[bpc])
+			if (max_supported_bpc[crtc->crtc_index] < bpc_vals[bpc])
 				continue;
 
-			igt_remove_fb(data->fd, &ref_fb[crtc->pipe]);
+			igt_remove_fb(data->fd, &ref_fb[crtc->crtc_index]);
 		}
 	}
 
-- 
2.47.3

