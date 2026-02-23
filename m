Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A94EA4FCB
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C3F10E2F2;
	Mon, 23 Feb 2026 14:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLqwMtVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816D610E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771858647; x=1803394647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ngo74rSJETRjEIagbE9Mb7qHuuNYXoPHYVO00cEsHTo=;
 b=FLqwMtVaNI5cf9oLqaHSYD9F4lwxFNWNltiUl4Zk447DLjOR/IIj+aEl
 dtNJj0MY/rF0ziVdnYRD8Qn8R4xcbRpuUBOpdGERNZoTtNxg2+IIe/ie6
 YX47Xr2qmdazgVENVkPa7UtLbhZaKJnP7uM17a5wYC9/Sc/L/EqzeNIQX
 LYqPz7dZSNuk7QZkz1Cxey/gyx/+p4Qv221ZFeaIBsx8Fsy1Wp9E4Leyq
 ahzV56zzF7sqNqXbgtQO4Yo7jjRWRAaeXgoXBeMaf4rY6rCDhc9+LmjCr
 etdKtdV9sM28kFPJHOfPyaVCOxYjavxP1gtpaV1oojwZdD3FcSDU3HTMK g==;
X-CSE-ConnectionGUID: JyMr2MK7Tn60Y2JIinj4bg==
X-CSE-MsgGUID: ifobnqqkReS//3rJM1oDiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84215224"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="84215224"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:57:27 -0800
X-CSE-ConnectionGUID: ofl08At4SKeRBCxkOX2E+A==
X-CSE-MsgGUID: fBRnBpOcTuO+uVVTsF10SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="213518180"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2026 06:57:25 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	chaitanya.kumar.borah@intel.com
Subject: [PATCH i-g-t v3 2/4] tests/kms_color_pipeline: Run tests on all
 supported planes
Date: Mon, 23 Feb 2026 20:02:19 +0530
Message-Id: <20260223143221.807474-2-chaitanya.kumar.borah@intel.com>
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

Extend the color pipeline tests to run on all planes of a pipe that
exposes COLOR_PIPELINE property instead of only the primary plane.

v3:
 - Rebase

v2:
 - Rebase
 - Remove unused variable (Swati)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 57 +++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 3b270e86e..e5914e2cc 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -58,7 +58,7 @@ static void test_setup(data_t *data, igt_crtc_t *crtc)
 	data->mode = igt_output_get_mode(data->output);
 	igt_require(data->mode);
 
-	data->pipe_crc = igt_crtc_crc_new(data->primary->crtc,
+	data->pipe_crc = igt_crtc_crc_new(crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
@@ -79,18 +79,17 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
 	return true;
 }
 
-static bool test_plane_colorops(data_t *data,
-				const color_t *fb_colors,
-				const color_t *exp_colors,
-				kms_colorop_t *colorops[])
+static void _test_plane_colorops(data_t *data,
+				 igt_plane_t *plane,
+				 const color_t *fb_colors,
+				 const color_t *exp_colors,
+				 kms_colorop_t *colorops[])
 {
-	igt_plane_t *plane = data->primary;
 	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode = data->mode;
 	igt_colorop_t *color_pipeline;
 	igt_crc_t crc_ref, crc_pipe;
 	struct igt_fb fb;
-	bool ret;
 
 	color_pipeline = get_color_pipeline(display, plane, colorops);
 	igt_skip_on(!color_pipeline);
@@ -135,7 +134,7 @@ static bool test_plane_colorops(data_t *data,
 	igt_wait_for_vblank(plane->crtc);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
 
-	ret = igt_check_crc_equal(&crc_ref, &crc_pipe);
+	igt_assert_crc_equal(&crc_ref, &crc_pipe);
 
 	/* Cleanup per-test state */
 	set_color_pipeline_bypass(plane);
@@ -144,8 +143,26 @@ static bool test_plane_colorops(data_t *data,
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
 	igt_remove_fb(data->drm_fd, &fb);
+}
 
-	return ret;
+static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
+				const color_t *fb_colors,
+				const color_t *exp_colors,
+				kms_colorop_t *colorops[])
+{
+	int n_planes = crtc->n_planes;
+	igt_output_t *output = data->output;
+	igt_plane_t *plane;
+
+	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
+		plane = igt_output_get_plane(output, plane_id);
+
+		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
+		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
+			_test_plane_colorops(data, plane, fb_colors, exp_colors, colorops);
+	}
 }
 
 static void
@@ -282,23 +299,13 @@ run_tests_for_plane(data_t *data)
 				test_setup(data,
 					   crtc);
 
-				if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE)) {
-					test_cleanup(data);
-					continue;
-				}
-
-				igt_dynamic_f("pipe-%s-%s",
-					       igt_crtc_name(crtc),
-					       igt_output_name(data->output)) {
-					data->color_depth = 8;
-					data->drm_format = DRM_FORMAT_XRGB8888;
-
-					igt_assert(test_plane_colorops(data,
-								       plane_colorops_tests[i].fb_colors,
-								       plane_colorops_tests[i].exp_colors,
-								       plane_colorops_tests[i].colorops));
-				}
+				data->color_depth = 8;
+				data->drm_format = DRM_FORMAT_XRGB8888;
 
+				test_plane_colorops(data, crtc,
+						    plane_colorops_tests[i].fb_colors,
+						    plane_colorops_tests[i].exp_colors,
+						    plane_colorops_tests[i].colorops);
 				test_cleanup(data);
 			}
 		}
-- 
2.25.1

