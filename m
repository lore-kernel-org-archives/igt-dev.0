Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F96FD116E2
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 14:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E31B10E76A;
	Thu, 27 Nov 2025 14:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esgvLZ2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B2C10E76A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764253492; x=1795789492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fj1iPfdETMybxNPrctxUQQivN/jMT4gtMnU8HyDU2y8=;
 b=esgvLZ2S2gfztfXusjr+xwhv+PZ0ybAEL8Q/fNZ7cP8NynQtkaGJV2//
 /drgtPp6kBwwrpp93mhiGSWEKpZUvOhuSekAqezYKi+jMSuCt7g2wsyXK
 hypwBi/1xT4exY5rT7m/ywruYuBbI0q0mCgofLFl/yBxB2oxMZOgTSRFT
 j8fbQX35gxise8nWfqs2sgcgdL1jL+znMu/aIAH+Vgbf8EJf8/uhm9nlK
 tKP2bRnrgxqEV92b0OUdz9GIB77RBxs13KarfcuzPZZL+osnYJnsU4PEz
 /vHr0hxBT11bzQf2UD/0SHniUUFzbau/PVB4hS0NFu5Fa2GZz7A04YhJs A==;
X-CSE-ConnectionGUID: Z8bog6CmTsOHB1QW18daXw==
X-CSE-MsgGUID: KL77HR4STgWQfAKj6IAIyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77662309"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="77662309"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 06:24:51 -0800
X-CSE-ConnectionGUID: eK4QMLM5T4GMRcbeu3ctqg==
X-CSE-MsgGUID: hy1WlZnZRH6MvP7MOzc9yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="198187555"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa004.fm.intel.com with ESMTP; 27 Nov 2025 06:24:50 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	juha-pekka.heikkila@intel.com
Subject: [PATCH i-g-t v2] tests/kms_plane_cursor: Use additional FB for
 reference image
Date: Thu, 27 Nov 2025 19:38:00 +0530
Message-Id: <20251127140800.1379905-1-chaitanya.kumar.borah@intel.com>
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

To avoid this, create a reference framebuffer in addition to the one
created for the primary plane and  alternately flip
between them while collecting crcs for the reference image and output
image respectively.

While at it, remove draw_color as it is no longer used.

v2:
 - Simplify implementation to use a single ref_fb instead of two
 - Remove draw_color()
 - Remove redundant commit

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_plane_cursor.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 9fa36bfd4..258b22b1a 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -78,6 +78,7 @@ typedef struct data {
 	igt_pipe_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
+	igt_fb_t ref_fb;
 	igt_fb_t pfb;
 	igt_fb_t ofb;
 	igt_fb_t cfb;
@@ -129,16 +130,6 @@ static void test_fini(data_t *data)
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
-/* Fills a FB with the solid color given. */
-static void draw_color(igt_fb_t *fb, double r, double g, double b)
-{
-	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
-
-	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
-	igt_paint_color(cr, 0, 0, fb->width, fb->height, r, g, b);
-	igt_put_cairo_ctx(cr);
-}
-
 /*
  * Draws white and gray (if overlay FB is given) on the primary FB.
  * Draws a magenta square where the cursor should be over top both planes.
@@ -152,6 +143,7 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 {
 	igt_crc_t ref_crc, test_crc;
 	cairo_t *cr;
+	igt_fb_t *ref_fb = &data->ref_fb;
 	igt_fb_t *pfb = &data->pfb;
 	igt_fb_t *ofb = &data->ofb;
 	igt_fb_t *cfb = &data->cfb;
@@ -159,8 +151,8 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	int ch = cfb->height;
 	const rect_t *or = &data->or;
 
-	cr = igt_get_cairo_ctx(pfb->fd, pfb);
-	igt_paint_color(cr, 0, 0, pfb->width, pfb->height, 1.0, 1.0, 1.0);
+	cr = igt_get_cairo_ctx(ref_fb->fd, ref_fb);
+	igt_paint_color(cr, 0, 0, ref_fb->width, ref_fb->height, 1.0, 1.0, 1.0);
 
 	if (flags & TEST_OVERLAY)
 		igt_paint_color(cr, or->x, or->y, or->w, or->h, 0.5, 0.5, 0.5);
@@ -168,6 +160,7 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	igt_paint_color(cr, x, y, cw, ch, 1.0, 0.0, 1.0);
 	igt_put_cairo_ctx(cr);
 
+	igt_plane_set_fb(data->primary, ref_fb);
 	if (flags & TEST_OVERLAY)
 		igt_plane_set_fb(data->overlay, NULL);
 	igt_plane_set_fb(data->cursor, NULL);
@@ -176,7 +169,7 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	igt_pipe_crc_start(data->pipe_crc);
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &ref_crc);
 
-	draw_color(pfb, 1.0, 1.0, 1.0);
+	igt_plane_set_fb(data->primary, pfb);
 
 	if (flags & TEST_OVERLAY) {
 		igt_plane_set_fb(data->overlay, ofb);
@@ -249,6 +242,7 @@ static void test_cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->cfb);
 	igt_remove_fb(data->drm_fd, &data->ofb);
 	igt_remove_fb(data->drm_fd, &data->pfb);
+	igt_remove_fb(data->drm_fd, &data->ref_fb);
 }
 
 static void test_cursor(data_t *data, int size, unsigned int flags)
@@ -263,6 +257,9 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 
 	test_cleanup(data);
 
+	igt_create_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888,
+		      DRM_FORMAT_MOD_LINEAR, &data->ref_fb);
+
 	igt_create_color_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1.0, 1.0, 1.0, &data->pfb);
 
-- 
2.25.1

