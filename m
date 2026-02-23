Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8EEEA4FCB
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769FE10E3F9;
	Mon, 23 Feb 2026 14:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cStoVNpu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03F110E3F0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771858650; x=1803394650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uE/OGefc33bFBBk4o2IkleJxkYIkIrmwWTbBW8YxFUg=;
 b=cStoVNpu1Ec7GQcgpmePvHyOgm5xILA+29i9s//TOpwK8iWRu3txtNWE
 46TVraffgRMXyy5jJ7eYdGWsXQ0UN+1DwwWq9bKmNPeZ4+RQN8R3cQpnT
 SFJzLjo0zc6Y0huzsAnovZXBLgZ6vDwlW7kScYp62uX6z8gm33H1oWAUX
 jKnTkJDgIkscnmA+8iRcsqj2OOSfvrHtOld30YqgdBOwse21CCEuGhqSA
 zSKU4J3P4g5kF5RRkUiILMfbLTnAO+P23e9JRhPN5MUwZy4kRN2DFk6sJ
 db/SH+fnE6eRtHb3M/aGj2Owp8iwF83TYJtP+7MND3uAhn42XcQBOWDV7 w==;
X-CSE-ConnectionGUID: tCCH9U7nSROT0F5SQd84pg==
X-CSE-MsgGUID: yI50Yp4OTtmMGj0urWfDUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84215234"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="84215234"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:57:29 -0800
X-CSE-ConnectionGUID: 5GfVfNbYQheXWh46JDnDDg==
X-CSE-MsgGUID: mK+xuyb6SrO8cewbKWYGLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="213518197"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2026 06:57:28 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	chaitanya.kumar.borah@intel.com
Subject: [PATCH i-g-t v3 4/4] tests/kms_color_pipeline: collect reference CRC
 once per pipe
Date: Mon, 23 Feb 2026 20:02:21 +0530
Message-Id: <20260223143221.807474-4-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260223143221.807474-1-chaitanya.kumar.borah@intel.com>
References: <20260223143221.807474-1-chaitanya.kumar.borah@intel.com>
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

The reference (software-equivalent) CRC is being recomputed
for every plane even though it is identical across planes for
a given test configuration. Refactor the test to collect the
reference CRC once per pipe and reuse it for all planes.

v3:
 - Rebase

v2:
 - Rebase
 - s/test_grab_crc/capture_ref_crc (Swati)
 - Use DRM_PLANE_TYPE_PRIMARY (Swati)
 - s/igt_skip_on/igt_assert/ (Swati)
 - Add a comment explaining why CRC capture on the
   primary plane is sufficient (Swati)
 - Wait for vblank before CRC collection (Swati)
 - s/reference_crc/ref_crc (Swati)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 66 +++++++++++++++++++++++++++++---------
 1 file changed, 50 insertions(+), 16 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 41808718f..3b4b85758 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -84,16 +84,58 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
 	return true;
 }
 
+static void
+capture_ref_crc(data_t *data, igt_output_t *output,
+		const color_t *fb_color, igt_crc_t *crc /* out */)
+{
+	struct igt_fb fb;
+	drmModeModeInfo *mode;
+	igt_plane_t *primary;
+	char *crc_str;
+	int ret;
+
+	/*
+	 * Since CRC is collected at Pipe level,
+	 * collecting crc for primary plane
+	 * is enough for reference.
+	 */
+	primary = igt_output_get_plane(output, DRM_PLANE_TYPE_PRIMARY);
+
+	mode = igt_output_get_mode(output);
+	igt_assert_fd(igt_create_fb(data->drm_fd,
+				    mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR,
+				    &fb));
+
+	paint_rectangles(data, mode, fb_color, &fb);
+	igt_plane_set_fb(primary, &fb);
+	ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
+	igt_assert(!ret);
+
+	igt_wait_for_vblank(primary->crtc);
+	igt_pipe_crc_collect_crc(data->pipe_crc, crc);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+
+	igt_remove_fb(data->drm_fd, &fb);
+
+	crc_str = igt_crc_to_string(crc);
+	igt_debug("CRC for reference fb: %s\n", crc_str);
+	free(crc_str);
+}
+
 static void _test_plane_colorops(data_t *data,
 				 igt_plane_t *plane,
 				 const color_t *fb_colors,
-				 const color_t *exp_colors,
+				 igt_crc_t *crc_ref,
 				 kms_colorop_t *colorops[])
 {
 	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode = data->mode;
 	igt_colorop_t *color_pipeline;
-	igt_crc_t crc_ref, crc_pipe;
+	igt_crc_t crc_pipe;
 	struct igt_fb fb;
 
 	color_pipeline = get_color_pipeline(display, plane, colorops);
@@ -106,18 +148,6 @@ static void _test_plane_colorops(data_t *data,
 				 DRM_FORMAT_XRGB8888,
 				 DRM_FORMAT_MOD_LINEAR,
 				 &fb));
-	igt_plane_set_fb(plane, &fb);
-
-	igt_display_commit_atomic(&data->display, 0, NULL);
-
-	/* Reference (software-equivalent) CRC */
-	set_color_pipeline_bypass(plane);
-	paint_rectangles(data, mode, exp_colors, &fb);
-
-	igt_plane_set_fb(plane, &fb);
-	igt_display_commit_atomic(&data->display, 0, NULL);
-	igt_wait_for_vblank(plane->crtc);
-	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
 
 	/* Hardware pipeline CRC */
 	set_color_pipeline(display, plane, colorops, color_pipeline);
@@ -135,7 +165,7 @@ static void _test_plane_colorops(data_t *data,
 	igt_wait_for_vblank(plane->crtc);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
 
-	igt_assert_crc_equal(&crc_ref, &crc_pipe);
+	igt_assert_crc_equal(crc_ref, &crc_pipe);
 
 	/* Cleanup per-test state */
 	set_color_pipeline_bypass(plane);
@@ -154,6 +184,9 @@ static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
 	int n_planes = crtc->n_planes;
 	igt_output_t *output = data->output;
 	igt_plane_t *plane;
+	igt_crc_t ref_crc;
+
+	capture_ref_crc(data, output, exp_colors, &ref_crc);
 
 	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
 		plane = igt_output_get_plane(output, plane_id);
@@ -162,7 +195,8 @@ static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
 			continue;
 
 		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
-			_test_plane_colorops(data, plane, fb_colors, exp_colors, colorops);
+			_test_plane_colorops(data, plane, fb_colors,
+					     &ref_crc, colorops);
 	}
 }
 
-- 
2.25.1

