Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEED3CCA464
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 07:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8024A10E1C7;
	Fri, 16 Oct 2026 07:56:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BF110E209
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 07:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792137348; x=1823673348;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8D9gNpjveNKO0Ax/lTV+vhpQjqgs3Q4anqjVt9v9RFQ=;
 b=SlhRXLkGHxxy/c+SJXw+1VegQkjIfmrUoJMspeEBSiqdkMbe5uIc0pIJ
 pgddPEY96RJjHUqnenMKxTpC8a9MKKXIB2OoKu+GtWOKD6omQ8WNSlxvz
 RQJCp3T1jPluwEPl1VvR+Z/5QsZ1FapDncW47aERTJz1cXBqAWykT+dCp
 8RpbAgcqCbn5isDJajpQqtz/BEqWRU3WGOgDCMgdkeIi2ni50+JEA7jD5
 Eh7MAsqKX4h9MZqS2f7GlbCS4iuojhbjmCOs7ii3sEnjcgcFeTIHrYOBz
 NVlKT+MVtgAant/96FRobua19L8MGcM25hPymD1h3Kuq09apMDLJNRiin g==;
X-CSE-ConnectionGUID: FPxLljSySrKUY5pfnB2ryA==
X-CSE-MsgGUID: XjvhVH1BQIisdPXc245gZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="929200"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="929200"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:55:48 -0700
X-CSE-ConnectionGUID: y57TBKMSTn6LVvBlHVKuyQ==
X-CSE-MsgGUID: 5Efw+z2yTqOHBpeHXu14Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2266336"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:55:46 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_color_pipeline: Test only first/last plane in
 simulation
Date: Fri, 16 Oct 2026 13:35:00 +0530
Message-Id: <20261016080500.1378982-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

The plane-fixed-matrix-* subtests run a dynamic subtest for every plane
that supports a color pipeline, on every pipe. On simulation this takes
long enough that the subtests time out.

When running in simulation, test only the first and last planes that
support a color pipeline, as other tests (e.g. kms_plane_alpha_blend)
already do. Non-simulation runs still cover all planes.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index bf4781796..9a5c44e41 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -407,6 +407,8 @@ static void test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
 					     kms_colorop_t *colorops[])
 {
 	int n_planes = crtc->n_planes;
+	int first_plane = -1, last_plane = -1;
+	bool in_simulation = igt_run_in_simulation();
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = data->mode;
 	igt_plane_t *plane;
@@ -433,12 +435,29 @@ static void test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
 	capture_sw_converted_ref_crc(data, output, &yuv_fb, &ref_crc);
 	igt_remove_fb(data->drm_fd, &yuv_fb);
 
+	/* Get first & last planes supporting color pipeline. */
 	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
 		plane = igt_output_get_plane(output, plane_id);
 
 		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
 			continue;
 
+		if (first_plane < 0)
+			first_plane = plane_id;
+
+		last_plane = plane_id;
+	}
+
+	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
+		plane = igt_output_get_plane(output, plane_id);
+
+		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
+		if (in_simulation &&
+		    plane_id != first_plane && plane_id != last_plane)
+			continue;
+
 		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
 			_test_plane_colorops(data, plane, fb_colors,
 					     &ref_crc, colorops,
-- 
2.25.1

