Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F26EA4FCE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7220710E3D5;
	Mon, 23 Feb 2026 14:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0tXNAS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E1710E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771858646; x=1803394646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8xOXz01Ydjtb+xOrkJKIth/HEPGjpwYN684WhUl3as0=;
 b=h0tXNAS+MITV1PGSwAnGHbJ62++4AB4LNIpA7dxMw7qaTTOmNUFAgJHJ
 AHGF1CLu4BagQJ8cIpIFvOvid1UM1aU0v6/b4qDUn+/KX4+3AxjK18t8l
 0a3M6fvqDu4HKiIFbRdUeBVWdAUwFQ7cAa0a43Fv51IDdEs7CZrhkZRTq
 KbPPeJpboDmx7SepKkFpCnwVyjaN8p5DAOYruie/aJj9ps4L8lBDYGLyw
 qYVszGATVsXF4K6Ni+itmdpkXJqOZaLjEm5yvslgya8PmBT56NDcyef1i
 8GcsfEHbm4mBzh4SAVl28MW1Vlv/+nMmpccqrpLRkMayvF6VO933nC0D6 A==;
X-CSE-ConnectionGUID: p50YhtNRT86/ekMY4Hzd4w==
X-CSE-MsgGUID: YkjPcQ7YSFilYY5kkNC2ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84215208"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="84215208"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:57:25 -0800
X-CSE-ConnectionGUID: m7IPKjdUS42P2gjcra0YQA==
X-CSE-MsgGUID: PbgdWnmxRfmbH/vR0akVLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="213518172"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2026 06:57:24 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	chaitanya.kumar.borah@intel.com
Subject: [PATCH i-g-t v3 1/4] tests/kms_color_pipeline: use atomic commit
 helper consistently
Date: Mon, 23 Feb 2026 20:02:18 +0530
Message-Id: <20260223143221.807474-1-chaitanya.kumar.borah@intel.com>
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
should not rely on the legacy-compatible commit path.

Replace igt_display_commit2(COMMIT_ATOMIC) with
igt_display_commit_atomic() throughout the test to make the atomic
requirement explicit and avoid any ambiguity around commit paths.

No functional change intended.

v2:
 - Rebase

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 7445b1456..3b270e86e 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -43,7 +43,7 @@ static void test_cleanup(data_t *data)
 	}
 
 	igt_output_set_crtc(data->output, NULL);
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
 static void test_setup(data_t *data, igt_crtc_t *crtc)
@@ -61,7 +61,7 @@ static void test_setup(data_t *data, igt_crtc_t *crtc)
 	data->pipe_crc = igt_crtc_crc_new(data->primary->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
 static bool ctm_colorop_only(kms_colorop_t *colorops[])
@@ -108,14 +108,14 @@ static bool test_plane_colorops(data_t *data,
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
 
@@ -131,7 +131,7 @@ static bool test_plane_colorops(data_t *data,
 		paint_gradient_rectangles(data, mode, fb_colors, &fb);
 
 	igt_plane_set_fb(plane, &fb);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, 0, NULL);
 	igt_wait_for_vblank(plane->crtc);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
 
@@ -141,7 +141,7 @@ static bool test_plane_colorops(data_t *data,
 	set_color_pipeline_bypass(plane);
 	reset_colorops(colorops);
 	igt_plane_set_fb(plane, NULL);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, 0, NULL);
 
 	igt_remove_fb(data->drm_fd, &fb);
 
-- 
2.25.1

