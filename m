Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0D7E9A048
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 09:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CD210E687;
	Thu, 19 Feb 2026 09:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWqe/5wf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE0210E1FB
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771493455; x=1803029455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PN3w9bAqHVshR0Es+sh0QALCPQmPGl29AetM2GeNibU=;
 b=RWqe/5wfEhGYXolKGLtIEqhJP9fTF4K4/W/lQZ/2nE9ZUqKoE1yYytU1
 DQmoIvi5ObYd5+dU2N530rc1L6tGj4FW+4R8Kh0Zl3rFcs1XQ6dLmOdVD
 Q4zlCb3Rni2rB0B42yiPP7AAnvsacBhAj4ZEeFE5iQZKZE2HhRo0IuxGV
 4TnG9ES9/dPCxunOf6fmJs3xBcJC1xpIMSOPD3vctxWv3DODjlgDDNsTy
 ppDH8b/lSTUCk2TQuEynGjVaGWBKKauWq3yQ39SiSVUvIhGbgzsHOnFE5
 /vWpQJoQxSuREK62SxP/bnV2NubNGbRHxPkD9SCQQ1kYR5HuF8vYw+M8b w==;
X-CSE-ConnectionGUID: +wQbDDCNSdmN42bNTmkKDQ==
X-CSE-MsgGUID: wSjPOTUjSCunm8wCoRRJ9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="84025251"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="84025251"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:30:55 -0800
X-CSE-ConnectionGUID: wAhFZ4H0TUaduglqCKQZww==
X-CSE-MsgGUID: Pvv/HLseT5mt/i/K8L2CLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="218989887"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa005.fm.intel.com with ESMTP; 19 Feb 2026 01:30:54 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	chaitanya.kumar.borah@intel.com
Subject: [PATCH i-g-t v2 4/4] tests/kms_color_pipeline: collect reference CRC
 once per pipe
Date: Thu, 19 Feb 2026 14:35:45 +0530
Message-Id: <20260219090545.340383-4-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260219090545.340383-1-chaitanya.kumar.borah@intel.com>
References: <20260219090545.340383-1-chaitanya.kumar.borah@intel.com>
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
---
 tests/kms_color_pipeline.c | 66 +++++++++++++++++++++++++++++---------
 1 file changed, 50 insertions(+), 16 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 4ba4ea605..7da78b2a5 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -87,16 +87,58 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
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
@@ -109,18 +151,6 @@ static void _test_plane_colorops(data_t *data,
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
@@ -138,7 +168,7 @@ static void _test_plane_colorops(data_t *data,
 	igt_wait_for_vblank(plane->crtc);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
 
-	igt_assert_crc_equal(&crc_ref, &crc_pipe);
+	igt_assert_crc_equal(crc_ref, &crc_pipe);
 
 	/* Cleanup per-test state */
 	set_color_pipeline_bypass(plane);
@@ -157,6 +187,9 @@ static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
 	int n_planes = crtc->n_planes;
 	igt_output_t *output = data->output;
 	igt_plane_t *plane;
+	igt_crc_t ref_crc;
+
+	capture_ref_crc(data, output, exp_colors, &ref_crc);
 
 	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
 		plane = igt_output_get_plane(output, plane_id);
@@ -165,7 +198,8 @@ static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
 			continue;
 
 		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
-			_test_plane_colorops(data, plane, fb_colors, exp_colors, colorops);
+			_test_plane_colorops(data, plane, fb_colors,
+					     &ref_crc, colorops);
 	}
 }
 
-- 
2.25.1

