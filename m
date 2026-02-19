Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83118E9A03B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 09:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBFE10E1D5;
	Thu, 19 Feb 2026 09:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRrp6oG0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC77B10E1D5
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 09:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771493452; x=1803029452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GfNtmvJF+fR6Y3T31gejgm+pqSVqQExmoxPTH/BX2vc=;
 b=mRrp6oG0o77nTBTzwRBPMy11qgo56dDh7UrfM484GjRUqImptJHf6kXB
 HteE78u4OLbmIP4KhgbdbDv5DoLI/ICNZ4pEpFk/va/Sugbav5RSyWrlR
 5PZm7KgR5eAVv+sRQlzlDb65C1he27Bl2u8u7lIfdgSSDSKC7zX2wLhzA
 hgHSdwP1p4JZJ6MMjxjWecWxbfH7OdxmksA+BEnrCPhY8W5LjJKswackb
 KP7McxxTG7idkIXrya3M3NYo0V2vt7yJjISeZuG5YRyo+l5M6xa+xL+b6
 Wjpe8/vBB9oNRGpUeRNFDJlcOsVWagwVce/iCprb04kGnn4HpyCs4KIHn w==;
X-CSE-ConnectionGUID: oWfp3+wcSWOndFmBnmRoyA==
X-CSE-MsgGUID: SEHLQMezTu62JR1FnxoTFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="84025248"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="84025248"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:30:51 -0800
X-CSE-ConnectionGUID: dC2Y2ky9RyiV4KMNUOY9Lg==
X-CSE-MsgGUID: 3sVc6F7rTAKdI+Y2yk1fCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="218989878"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa005.fm.intel.com with ESMTP; 19 Feb 2026 01:30:50 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	chaitanya.kumar.borah@intel.com
Subject: [PATCH i-g-t v2 1/4] tests/kms_color_pipeline: use atomic commit
 helper consistently
Date: Thu, 19 Feb 2026 14:35:42 +0530
Message-Id: <20260219090545.340383-1-chaitanya.kumar.borah@intel.com>
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

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 733ead1cd..e7f168b10 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -43,7 +43,7 @@ static void test_cleanup(data_t *data)
 	}
 
 	igt_output_set_crtc(data->output, NULL);
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
 static void test_setup(data_t *data, enum pipe p)
@@ -64,7 +64,7 @@ static void test_setup(data_t *data, enum pipe p)
 	data->pipe_crc = igt_crtc_crc_new(data->primary->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
 static bool ctm_colorop_only(kms_colorop_t *colorops[])
@@ -111,14 +111,14 @@ static bool test_plane_colorops(data_t *data,
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
 
@@ -134,7 +134,7 @@ static bool test_plane_colorops(data_t *data,
 		paint_gradient_rectangles(data, mode, fb_colors, &fb);
 
 	igt_plane_set_fb(plane, &fb);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, 0, NULL);
 	igt_wait_for_vblank(plane->crtc);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
 
@@ -144,7 +144,7 @@ static bool test_plane_colorops(data_t *data,
 	set_color_pipeline_bypass(plane);
 	reset_colorops(colorops);
 	igt_plane_set_fb(plane, NULL);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_display_commit_atomic(&data->display, 0, NULL);
 
 	igt_remove_fb(data->drm_fd, &fb);
 
-- 
2.25.1

