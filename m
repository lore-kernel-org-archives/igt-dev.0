Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8574C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 09:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881D110E066;
	Mon, 29 Jun 2026 09:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4Ecy9fv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9347E10E066
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782723806; x=1814259806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hB/lHYq3gzeDzBFobX9Qc1Ji1GNBTYC5XoX5fgQNxOA=;
 b=f4Ecy9fvXA3+3xE9JQd0YikL7bQGd2argVocIkRO+XTx60zQ5A9qqkzG
 8Nu9PiDBM0HYZ1DoXdgk9Lqw1TnyU1VKasTSyBTveYAp3GmIQQ4nHSj4K
 xBjbNNeqOLA2PCLXaulMJDg4BOzMguq773a1La9tFPJrTDRwOhn8DrlS9
 YWlWuU+7q5UQAI2VcpHES9+VKGs+IwJrQCc2y9gkMfY2QVwdqGOC7bZdZ
 ldFefoVRn1Z2LtEcXTuTtD7dEkfOE8Ridhldpf0n9ET4HBbn3mH8QX7S2
 bNDazjADoKP1TbJeMkSceyNHmuMLTOM1KiA1s3JIbrmjn5hCGxy+RlRT/ g==;
X-CSE-ConnectionGUID: jatLUSGqS1KyYcq5omBDwA==
X-CSE-MsgGUID: f5NdTpBaRYu2rTaLB4tvMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94793461"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94793461"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:03:26 -0700
X-CSE-ConnectionGUID: cV5Z3EgKR3+wlBpPDtLnBg==
X-CSE-MsgGUID: UzdQsPi5RYKCQMjMfciaBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="281988778"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:03:25 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 2/3] tests/kms_plane_multiple: Fix 2-display test for
 MST shared-link BW
Date: Mon, 29 Jun 2026 14:56:10 +0530
Message-ID: <20260629092611.298235-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629092611.298235-1-sowmiya.s@intel.com>
References: <20260629092611.298235-1-sowmiya.s@intel.com>
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

Perform joint CRC capture with BW-fitting
Ensure fitted modes are applied before reference capture
so driver-accepted BW-constrained commit matches the test.

v2: Update function name(Jani)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_plane_multiple.c | 85 +++++++++++++++++++++++++++++++-------
 1 file changed, 71 insertions(+), 14 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 0d338eeb5..0ebf9d391 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -473,6 +473,62 @@ static void test_fini_2_display(data_t *data)
 	igt_display_reset(&data->display);
 }
 
+/*
+ * get_reference_crc_2_display:
+ * Capture reference CRCs for both outputs in a single joint commit so that
+ * the kernel negotiates the same bpp/dithering settings as the actual test
+ * commit.  On shared-link configurations (e.g. two MST streams on one DP
+ * connection) the per-pipe bpp is reduced when both streams are active
+ * simultaneously (e.g. 24bpp -> 18bpp with dithering), which changes the
+ * scanout CRC.  Capturing refs one pipe at a time would use unconstrained
+ * bpp and produce a mismatching reference.
+ */
+static void get_reference_crc_2_display(data_t *data,
+					igt_output_t *output1, igt_output_t *output2,
+					color_t *color, uint64_t modifier)
+{
+	drmModeModeInfo *mode1, *mode2;
+	igt_plane_t *primary1, *primary2;
+	int ret;
+
+	/*
+	 * Display reset, CRTC assignment and igt_require_mst_link_bw() are done
+	 * by the caller before this function is invoked so the fitted modes
+	 * are already set on the outputs.
+	 */
+	mode1 = igt_output_get_mode(output1);
+	mode2 = igt_output_get_mode(output2);
+
+	primary1 = igt_output_get_plane_type(output1, DRM_PLANE_TYPE_PRIMARY);
+	primary2 = igt_output_get_plane_type(output2, DRM_PLANE_TYPE_PRIMARY);
+
+	data->plane1[primary1->index] = primary1;
+	data->plane2[primary2->index] = primary2;
+
+	igt_create_color_fb(data->drm_fd, mode1->hdisplay, mode1->vdisplay,
+			    DRM_FORMAT_XRGB8888, modifier,
+			    color->red, color->green, color->blue,
+			    &data->fb1[primary1->index]);
+	igt_create_color_fb(data->drm_fd, mode2->hdisplay, mode2->vdisplay,
+			    DRM_FORMAT_XRGB8888, modifier,
+			    color->red, color->green, color->blue,
+			    &data->fb2[primary2->index]);
+
+	igt_plane_set_fb(primary1, &data->fb1[primary1->index]);
+	igt_plane_set_fb(primary2, &data->fb2[primary2->index]);
+
+	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+	igt_skip_on(ret != 0);
+
+	igt_pipe_crc_collect_crc(data->pipe_crc1, &data->ref_crc1);
+	igt_pipe_crc_collect_crc(data->pipe_crc2, &data->ref_crc2);
+
+	igt_plane_set_fb(primary1, NULL);
+	igt_plane_set_fb(primary2, NULL);
+	igt_remove_fb(data->drm_fd, &data->fb1[primary1->index]);
+	igt_remove_fb(data->drm_fd, &data->fb2[primary2->index]);
+}
+
 static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 					  igt_crtc_t *crtc2,
 					  igt_output_t *output1, igt_output_t *output2,
@@ -486,23 +542,23 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 	if (!opt.all_planes)
 		n_planes = min(n_planes, DEFAULT_N_PLANES);
 
+	test_init_2_display(data, crtc1, crtc2, n_planes);
+
 	/*
-	 * Note: We could use the dynamic way of calculating the maximum planes here
-	 * like we've on single display subtest but this consumes a lot of extra time
-	 * with the number of dynamic subtests in this case. So keeping n_planes to the
-	 * default value. This might need to be tweaked if we see any bw related failures.
+	 * Reset the display, assign CRTCs and compute the fitted modes before
+	 * the reference CRC capture.  igt_require_mst_link_bw() selects modes that
+	 * satisfy shared-link bandwidth constraints (e.g. two MST streams on
+	 * one DP connection).  Doing this here means get_reference_crc_2_display()
+	 * needs no internal reset, so the chosen modes stay in place for the
+	 * entire test without having to be saved and re-applied afterwards.
 	 */
+	igt_display_reset(&data->display);
+	igt_output_set_crtc(output1, crtc1);
+	igt_output_set_crtc(output2, crtc2);
+	igt_require_mst_link_bw(&data->display);
 
-	test_init_2_display(data, crtc1,
-			    crtc2, n_planes);
-	get_reference_crc(data, output1,
-			  crtc1,
-			  data->pipe_crc1, &blue,
-			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data->ref_crc1);
-	get_reference_crc(data, output2,
-			  crtc2,
-			  data->pipe_crc2, &blue,
-			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data->ref_crc2);
+	get_reference_crc_2_display(data, output1, output2,
+				    &blue, DRM_FORMAT_MOD_LINEAR);
 
 	prepare_planes(data, crtc1, &blue,
 		       data->plane1,
@@ -512,6 +568,7 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 		       modifier, 2, output2, data->fb2);
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
 	igt_pipe_crc_start(data->pipe_crc1);
 	igt_pipe_crc_start(data->pipe_crc2);
 
-- 
2.51.0

