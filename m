Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A7BD172CE
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 06:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD6810E267;
	Mon,  2 Feb 2026 06:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2lnJPhT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B15410E267
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 06:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770013770; x=1801549770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gsnVv+k0IIf35ZE32cpUL5gmkwK8d4nNPQoOv7CL2hU=;
 b=G2lnJPhTx+DASsMR2YfDq6BSzk0lS/giSMJjXLde36FK9tpy978ri9zO
 k8hSnFPQS8p8N8Isw/PjXGKD7UFQP6pjQLxUSfLHtRtpaqJIXEYSGLj4x
 +xIdfjQGpfcc/UKzJ+BtH2OMt3UskGYktEMo71F9y3U6JWwLf5Tw/bpUm
 Dfsgcz73bzd4cmUDFgMrEAZmxBvYRDGef9A6Y7K9Cx6uXYm9YXrzYLDyI
 OR0CClyBFRc9o+NEHGU8Wlh64SkxX7bn5vSEssHuKmJXTd3f2OeCyJlmB
 FT03mHdlWk2babvheygG9VDHu94Rtgkaf5xZL9/vX8bZt3rlIXNJCFoEc A==;
X-CSE-ConnectionGUID: rlg5x6cqSYybtfRyzaMFQw==
X-CSE-MsgGUID: PAZ8nIUTSRCJb7098/FFsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="82276736"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="82276736"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:29:30 -0800
X-CSE-ConnectionGUID: Xqr99ZU0RayhF0U5Gx01mA==
X-CSE-MsgGUID: kgVUtbMETu+SYd3+sssL3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213966514"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa004.jf.intel.com with ESMTP; 01 Feb 2026 22:29:28 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, pranay.samala@intel.com,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH i-g-t 1/4] tests/kms_color_pipeline: use atomic commit helper
 consistently
Date: Mon,  2 Feb 2026 11:34:12 +0530
Message-Id: <20260202060415.2680288-1-chaitanya.kumar.borah@intel.com>
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

The color pipeline is an atomic-only feature, so kms_color_pipeline
should not rely on the legacy-compat commit path.

Replace igt_display_commit2(COMMIT_ATOMIC) with
igt_display_commit_atomic() throughout the test to make the atomic
requirement explicit and avoid any ambiguity around commit paths.

No functional change intended.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color_pipeline.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index bf8c4734b..7c4b89139 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -43,7 +43,7 @@ static void test_cleanup(data_t *data)
 	}
 
 	igt_output_set_crtc(data->output, NULL);
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
 static void test_setup(data_t *data, enum pipe p)
@@ -65,7 +65,7 @@ static void test_setup(data_t *data, enum pipe p)
 	data->pipe_crc = igt_crtc_crc_new(data->primary->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
 static bool ctm_colorop_only(kms_colorop_t *colorops[])
@@ -112,14 +112,14 @@ static bool test_plane_colorops(data_t *data,
 	disable_ctm(plane->crtc);
 	disable_degamma(plane->crtc);
 	disable_gamma(plane->crtc);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, 0, NULL);
 
 	/* Reference (software-equivalent) CRC */
 	set_color_pipeline_bypass(plane);
 	paint_rectangles(data, mode, exp_colors, &fb);
 
 	igt_plane_set_fb(plane, &fb);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, 0, NULL);
 	igt_wait_for_vblank(plane->crtc);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
 
@@ -135,7 +135,7 @@ static bool test_plane_colorops(data_t *data,
 		paint_gradient_rectangles(data, mode, fb_colors, &fb);
 
 	igt_plane_set_fb(plane, &fb);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, 0, NULL);
 	igt_wait_for_vblank(plane->crtc);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
 
@@ -145,7 +145,7 @@ static bool test_plane_colorops(data_t *data,
 	set_color_pipeline_bypass(plane);
 	reset_colorops(colorops);
 	igt_plane_set_fb(plane, NULL);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, 0, NULL);
 
 	igt_remove_fb(data->drm_fd, &fb);
 
-- 
2.25.1

