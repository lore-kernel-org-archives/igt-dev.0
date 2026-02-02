Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418D3D172CC
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 06:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66B710E285;
	Mon,  2 Feb 2026 06:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwPLGNAe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5220810E285
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 06:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770013775; x=1801549775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LRRDcsLuTTehKZiYJ8MDXRdjBz5EF5opg5pVy4+F08M=;
 b=MwPLGNAecmXvUhozw+MBZU6qLHzXm7ASK39a0itE4upKZRGv1wKA8KZs
 lXWja2myJVALRgqto/g/yDR9zh7yGrm7kGceqbZRs3WuadhbhVTNNR+kQ
 6JdODd2Yp4xI6biAFF3mvykH85ArWBOuFc4Lcw2+YubDZO9lDm8IPwiLA
 ksjTjJIeDRebbv++KBRfImqY+TBUYgMOIriu9vNgO1yCEYUjno4cxa+V8
 VxJrKhzLwfpHx3lvRmNyzXijNqH8MijWVEFvY2ahj/chjefr4oquxXR2V
 TlhlroPjF1H7dC8MlEt2sZRl043MLYDzg1uiiB37STZ1RGvZTYt9/CsB4 g==;
X-CSE-ConnectionGUID: 2tAO/FazT8SBclgUBjMqIg==
X-CSE-MsgGUID: lSmNq1/RTNO2CBdWhRqaUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="82276744"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="82276744"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:29:35 -0800
X-CSE-ConnectionGUID: QzsXsOHzSJyW4u+9I3YhRQ==
X-CSE-MsgGUID: p7nU5xYRTSCcyGousO0jyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213966527"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa004.jf.intel.com with ESMTP; 01 Feb 2026 22:29:33 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, pranay.samala@intel.com,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH i-g-t 4/4] tests/kms_color_pipeline: collect reference CRC
 once per pipe
Date: Mon,  2 Feb 2026 11:34:15 +0530
Message-Id: <20260202060415.2680288-4-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202060415.2680288-1-chaitanya.kumar.borah@intel.com>
References: <20260202060415.2680288-1-chaitanya.kumar.borah@intel.com>
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

The reference (software-equivalent) CRC was being recomputed
for every plane even though it is identical across planes for
a given test configuration. Refactor the test to collect the
reference CRC once per pipe and reuse it for all planes.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color_pipeline.c | 60 ++++++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index e15f4d79a..8cc055591 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -88,16 +88,52 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
 	return true;
 }
 
+static void
+test_grab_crc(data_t *data, igt_output_t *output,
+	      const color_t *fb_color, igt_crc_t *crc /* out */)
+{
+	struct igt_fb fb;
+	drmModeModeInfo *mode;
+	igt_plane_t *primary;
+	char *crc_str;
+	int ret;
+
+	primary = igt_output_get_plane(output, 0);
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
+	igt_skip_on(ret != 0);
+
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
 static void _test_plane_colorops(data_t *data, enum pipe pipe,
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
@@ -110,18 +146,6 @@ static void _test_plane_colorops(data_t *data, enum pipe pipe,
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
@@ -139,7 +163,7 @@ static void _test_plane_colorops(data_t *data, enum pipe pipe,
 	igt_wait_for_vblank(plane->crtc);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
 
-	igt_assert_crc_equal(&crc_ref, &crc_pipe);
+	igt_assert_crc_equal(crc_ref, &crc_pipe);
 
 	/* Cleanup per-test state */
 	set_color_pipeline_bypass(plane);
@@ -158,6 +182,9 @@ static void test_plane_colorops(data_t *data, enum pipe pipe,
 	int n_planes = igt_crtc_for_pipe(&data->display, pipe)->n_planes;
 	igt_output_t *output = data->output;
 	igt_plane_t *plane;
+	igt_crc_t reference_crc;
+
+	test_grab_crc(data, output, exp_colors, &reference_crc);
 
 	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
 		plane = igt_output_get_plane(output, plane_id);
@@ -166,7 +193,8 @@ static void test_plane_colorops(data_t *data, enum pipe pipe,
 			continue;
 
 		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane_id)
-			_test_plane_colorops(data, pipe, plane, fb_colors, exp_colors, colorops);
+			_test_plane_colorops(data, pipe, plane, fb_colors,
+					     &reference_crc, colorops);
 	}
 }
 
-- 
2.25.1

