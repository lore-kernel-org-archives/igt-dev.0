Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14085D11183
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 13:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEF310E6DA;
	Thu, 27 Nov 2025 13:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBWHBp5I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797DB10E6DA
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764250417; x=1795786417;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rbjoW+4dxnULMXT4HSgFMfUnISwguPwMXVdw8s4Pg1o=;
 b=mBWHBp5IfZETXDQbN+RrcDl4zpPyv82hXuZhUnUcQB9yJc2mVnvMQopO
 UCb7Ky+yD579nPajHGoQBCOVNcsMcGE0r779lwtOq6o6tsqZyFSNuUffA
 96P/ohJEvOxzKyONUpNm/kYShR5k/PQFg+PK180h7e+ylHE9+qhz1m6kH
 /D10UnM4aHd8wfVbPA0HNTfa0cMjqK13qjrFAkvEVMTZUkcK/gVqvkDot
 WmxhbNWY3AuYUmzpGCEt1t8sV7axf+va7VLNzVxBix/XUDVHPOe3//74h
 QyuyMqovAD6dL0l0WwGqIzIzvRRKZILbl73gz3/18rchyzUapDZDOcsbd w==;
X-CSE-ConnectionGUID: GSzIXxtdR9aULjoesK1abg==
X-CSE-MsgGUID: 17Pcd/dcTIOvzfnfH02ODg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="88940867"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="88940867"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 05:33:37 -0800
X-CSE-ConnectionGUID: Nc47C6CHSy2HvAvw2656gQ==
X-CSE-MsgGUID: xYWsbr8ETbmuWSzksKGXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="216586817"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 27 Nov 2025 05:33:35 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	juha-pekka.heikkila@intel.com
Subject: [PATCH i-g-t] tests/kms_plane_cursor: Use two FBs for reference image
Date: Thu, 27 Nov 2025 18:46:45 +0530
Message-Id: <20251127131645.1378867-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Painting directly on the FB currently being scanned out ends up
modifying the frontbuffer. Since the FB isn’t marked dirty, those
updates never reach the actual buffer, leading to stale or incorrect
reference images during testing.

To avoid this, create two reference framebuffers and alternately flip
between them: one is displayed while the other is used for rendering
the reference image.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_plane_cursor.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 9fa36bfd4..fa78b58ff 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -78,6 +78,7 @@ typedef struct data {
 	igt_pipe_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
+	igt_fb_t ref_fb[2];
 	igt_fb_t pfb;
 	igt_fb_t ofb;
 	igt_fb_t cfb;
@@ -152,6 +153,7 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 {
 	igt_crc_t ref_crc, test_crc;
 	cairo_t *cr;
+	igt_fb_t *ref_fb;
 	igt_fb_t *pfb = &data->pfb;
 	igt_fb_t *ofb = &data->ofb;
 	igt_fb_t *cfb = &data->cfb;
@@ -159,8 +161,11 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	int ch = cfb->height;
 	const rect_t *or = &data->or;
 
-	cr = igt_get_cairo_ctx(pfb->fd, pfb);
-	igt_paint_color(cr, 0, 0, pfb->width, pfb->height, 1.0, 1.0, 1.0);
+	ref_fb = (data->primary->drm_plane->fb_id ==
+		  data->ref_fb[0].fb_id) ? &data->ref_fb[1] : &data->ref_fb[0];
+
+	cr = igt_get_cairo_ctx(pfb->fd, ref_fb);
+	igt_paint_color(cr, 0, 0, ref_fb->width, ref_fb->height, 1.0, 1.0, 1.0);
 
 	if (flags & TEST_OVERLAY)
 		igt_paint_color(cr, or->x, or->y, or->w, or->h, 0.5, 0.5, 0.5);
@@ -168,6 +173,9 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	igt_paint_color(cr, x, y, cw, ch, 1.0, 0.0, 1.0);
 	igt_put_cairo_ctx(cr);
 
+	igt_plane_set_fb(data->primary, ref_fb);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+
 	if (flags & TEST_OVERLAY)
 		igt_plane_set_fb(data->overlay, NULL);
 	igt_plane_set_fb(data->cursor, NULL);
@@ -249,6 +257,8 @@ static void test_cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->cfb);
 	igt_remove_fb(data->drm_fd, &data->ofb);
 	igt_remove_fb(data->drm_fd, &data->pfb);
+	igt_remove_fb(data->drm_fd, &data->ref_fb[0]);
+	igt_remove_fb(data->drm_fd, &data->ref_fb[1]);
 }
 
 static void test_cursor(data_t *data, int size, unsigned int flags)
@@ -263,6 +273,12 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 
 	test_cleanup(data);
 
+	igt_create_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888,
+		      DRM_FORMAT_MOD_LINEAR, &data->ref_fb[0]);
+
+	igt_create_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888,
+		      DRM_FORMAT_MOD_LINEAR, &data->ref_fb[1]);
+
 	igt_create_color_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1.0, 1.0, 1.0, &data->pfb);
 
-- 
2.25.1

