Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5C6606A6F2
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 19:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EGYbUdks
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4357112CD0;
	Fri, 20 Nov 2026 19:20:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F1C112CD0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 19:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795202338; x=1826738338;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PcPQ5g1qYEPYEMv1gE+a2lnDxMAqkEy9Eot/gWImEdA=;
 b=EGYbUdksN+AlRMWecA/bf38EXXQJXKyqH/y6r0Dko5LTkvTP06FRFced
 VpFJPthX4uHLSDLQd3O+G3ehlaMWUwMCuDfBq5gtDbxiKR48VopZ/8BDS
 071ZCF/xKRFCKu6bec/tJI/uxSw4ij8X7leLSheqHXYinNPhyX9JCvqTB
 FD5DEtRfk7IvSnyJuMP8urV4tqezFRov1T1pi5yxBSQMVC1eEzZuycWOa
 HqVokiQ1lQK4my4a9l9687c991Ym74ABeJLD8lsupElDx1i3K1fTYqKhV
 RTv8Xp3ztFA5lelWjS9p5oCz27cjFK0rGRC2PXt8I86HMJLm1gdE74Rwt g==;
X-CSE-ConnectionGUID: PJzBMa1RRimH8cIg0Hdhkg==
X-CSE-MsgGUID: Q7UsskenTAGFgFQfmSwgpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4097506"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4097506"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 11:18:57 -0800
X-CSE-ConnectionGUID: E1H1cqlmSm6NrTMRSGIJrA==
X-CSE-MsgGUID: OS7MHOe2RbqrFizwoQUn3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11113728"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 11:18:56 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_color_pipeline: Limit simulation to
 first/last planes
Date: Sat, 21 Nov 2026 00:58:18 +0530
Message-Id: <20261120192818.1894936-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The plane color pipeline subtests iterate over every eligible plane,
which can make simulation runs time out. Restrict simulation coverage
for both regular and fixed-matrix subtests to the first and last planes
supporting color pipelines, while retaining full coverage otherwise.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_color_pipeline.c | 75 +++++++++++++++-----------------
 1 file changed, 35 insertions(+), 40 deletions(-)

diff --git a/tests/intel/kms_color_pipeline.c b/tests/intel/kms_color_pipeline.c
index 69d5d8cf2..41a0e244a 100644
--- a/tests/intel/kms_color_pipeline.c
+++ b/tests/intel/kms_color_pipeline.c
@@ -197,17 +197,27 @@ static void _test_plane_colorops(data_t *data,
 		igt_assert_crc_equal(crc_ref, &crc_pipe);
 }
 
-static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
-				const color_t *fb_colors,
-				const color_t *exp_colors,
-				kms_colorop_t *colorops[])
+static void test_colorops_on_planes(data_t *data, igt_crtc_t *crtc,
+				    const color_t *fb_colors, igt_crc_t *ref_crc,
+				    kms_colorop_t *colorops[], uint32_t input_format)
 {
 	int n_planes = crtc->n_planes;
+	int first_plane = -1, last_plane = -1;
+	bool in_simulation = igt_run_in_simulation();
 	igt_output_t *output = data->output;
 	igt_plane_t *plane;
-	igt_crc_t ref_crc;
 
-	capture_ref_crc(data, output, exp_colors, &ref_crc);
+	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
+		plane = igt_output_get_plane(output, plane_id);
+
+		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
+		if (first_plane < 0)
+			first_plane = plane_id;
+
+		last_plane = plane_id;
+	}
 
 	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
 		plane = igt_output_get_plane(output, plane_id);
@@ -215,13 +225,28 @@ static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
 		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
 			continue;
 
+		if (in_simulation &&
+		    plane_id != first_plane && plane_id != last_plane)
+			continue;
+
 		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
 			_test_plane_colorops(data, plane, fb_colors,
-					     &ref_crc, colorops,
-					     DRM_FORMAT_XRGB8888);
+					     ref_crc, colorops, input_format);
 	}
 }
 
+static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
+				const color_t *fb_colors,
+				const color_t *exp_colors,
+				kms_colorop_t *colorops[])
+{
+	igt_crc_t ref_crc;
+
+	capture_ref_crc(data, data->output, exp_colors, &ref_crc);
+	test_colorops_on_planes(data, crtc, fb_colors, &ref_crc, colorops,
+				DRM_FORMAT_XRGB8888);
+}
+
 static void
 run_tests_for_plane(data_t *data)
 {
@@ -406,12 +431,8 @@ static void test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
 					     const color_t *fb_colors,
 					     kms_colorop_t *colorops[])
 {
-	int n_planes = crtc->n_planes;
-	int first_plane = -1, last_plane = -1;
-	bool in_simulation = igt_run_in_simulation();
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = data->mode;
-	igt_plane_t *plane;
 	igt_crc_t ref_crc;
 	struct igt_fb yuv_fb;
 	enum igt_color_encoding encoding;
@@ -435,34 +456,8 @@ static void test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
 	capture_sw_converted_ref_crc(data, output, &yuv_fb, &ref_crc);
 	igt_remove_fb(data->drm_fd, &yuv_fb);
 
-	/* Get first & last planes supporting color pipeline. */
-	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
-		plane = igt_output_get_plane(output, plane_id);
-
-		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
-			continue;
-
-		if (first_plane < 0)
-			first_plane = plane_id;
-
-		last_plane = plane_id;
-	}
-
-	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
-		plane = igt_output_get_plane(output, plane_id);
-
-		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
-			continue;
-
-		if (in_simulation &&
-		    plane_id != first_plane && plane_id != last_plane)
-			continue;
-
-		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
-			_test_plane_colorops(data, plane, fb_colors,
-					     &ref_crc, colorops,
-					     DRM_FORMAT_YUYV);
-	}
+	test_colorops_on_planes(data, crtc, fb_colors, &ref_crc, colorops,
+				DRM_FORMAT_YUYV);
 }
 
 /**
-- 
2.25.1

