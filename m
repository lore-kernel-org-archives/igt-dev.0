Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A72D2D0E0
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 12:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E75310E334;
	Tue, 13 Jan 2026 12:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5YNQnkk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52F610E334
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768305887; x=1799841887;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=K49Jpf/NjpvfbJtmNH9Vd6KjbXeJNrIhtHEzRe1OOIQ=;
 b=m5YNQnkkcdIAO7w7+JRFlXhxpzC6UgOsbJkkJoy1wkgunb9Yt1RFcs8P
 ueUmL+uJ6qqRSO0p+ahkEIVt3Gf0aQJnfGcsWuKSwRz5WNHvc58c2h5WY
 gZuNCn9boTCI4NU2oz/ohqRdPtdpf4P9QyenqpO6f2cfRMmZfhbO8Ktdf
 3HQRRkBv4iheFk5CgSeUeDy68+YJvIAbSgzpUR3s4D73jBHt0039PPPsR
 Aj/4Q5wIkcI7zjmejBs7uiTy0w8hcp2r2YZsp44HoxAk3UTzTpJ6Q1DWu
 IwgPcL9eMjT143CQmsQyz7iOuxmmh90Vp1XvOgbSDS1bRbxnR3NuHZF/6 w==;
X-CSE-ConnectionGUID: pXbyKTnjQyKmRYn0rgRsHA==
X-CSE-MsgGUID: hdp1FPlWSlCLNJ5fzi0leQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69497658"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69497658"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:04:47 -0800
X-CSE-ConnectionGUID: nKwbLMHySHahI/mFxGPVdw==
X-CSE-MsgGUID: ZzEGrt8cToejzsT4oT/qOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="209421903"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.124.220.52])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:04:46 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/8] tests/kms_plane_cursor: s/or/rect/
Date: Tue, 13 Jan 2026 14:04:32 +0200
Message-ID: <20260113120439.12577-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Rename data.or to data.rect. Coccinelle seems to think
'or' is some kind of reserved keyword and fails to parse
the code when it sees a variable with that name.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane_cursor.c | 48 ++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 8b172794bc88..fcb7cea06c9e 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -84,7 +84,7 @@ typedef struct data {
 	igt_fb_t cfb;
 	enum pipe pipe_id;
 	int drm_fd;
-	rect_t or;
+	rect_t rect;
 	uint64_t max_curw;
 	uint64_t max_curh;
 } data_t;
@@ -112,10 +112,10 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* Overlay rectangle for a rect in the center of the screen */
-	data->or.x = data->mode->hdisplay / 4;
-	data->or.y = data->mode->vdisplay / 4;
-	data->or.w = data->mode->hdisplay / 2;
-	data->or.h = data->mode->vdisplay / 2;
+	data->rect.x = data->mode->hdisplay / 4;
+	data->rect.y = data->mode->vdisplay / 4;
+	data->rect.w = data->mode->hdisplay / 2;
+	data->rect.h = data->mode->vdisplay / 2;
 }
 
 /* Common test cleanup. */
@@ -149,13 +149,13 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	igt_fb_t *cfb = &data->cfb;
 	int cw = cfb->width;
 	int ch = cfb->height;
-	const rect_t *or = &data->or;
+	const rect_t *rect = &data->rect;
 
 	cr = igt_get_cairo_ctx(ref_fb->fd, ref_fb);
 	igt_paint_color(cr, 0, 0, ref_fb->width, ref_fb->height, 1.0, 1.0, 1.0);
 
 	if (flags & TEST_OVERLAY)
-		igt_paint_color(cr, or->x, or->y, or->w, or->h, 0.5, 0.5, 0.5);
+		igt_paint_color(cr, rect->x, rect->y, rect->w, rect->h, 0.5, 0.5, 0.5);
 
 	igt_paint_color(cr, x, y, cw, ch, 1.0, 0.0, 1.0);
 	igt_put_cairo_ctx(cr);
@@ -173,12 +173,12 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 
 	if (flags & TEST_OVERLAY) {
 		igt_plane_set_fb(data->overlay, ofb);
-		igt_plane_set_position(data->overlay, or->x, or->y);
-		igt_plane_set_size(data->overlay, or->w, or->h);
-		igt_fb_set_size(ofb, data->overlay, or->w, or->h);
+		igt_plane_set_position(data->overlay, rect->x, rect->y);
+		igt_plane_set_size(data->overlay, rect->w, rect->h);
+		igt_fb_set_size(ofb, data->overlay, rect->w, rect->h);
 		igt_fb_set_position(ofb, data->overlay,
-				    (ofb->width - or->w) / 2,
-				    (ofb->height - or->h) / 2);
+				    (ofb->width - rect->w) / 2,
+				    (ofb->height - rect->h) / 2);
 	}
 
 	igt_plane_set_fb(data->cursor, cfb);
@@ -206,27 +206,27 @@ static void test_cursor_spots(data_t *data, int size, unsigned int flags)
 {
 	int sw = data->mode->hdisplay;
 	int sh = data->mode->vdisplay;
-	const rect_t *or = &data->or;
+	const rect_t *rect = &data->rect;
 	int i;
 	const pos_t pos[] = {
 		/* Test diagonally from top left to bottom right. */
 		{ -size / 3, -size / 3 },
 		{ 0, 0 },
-		{ or->x - size, or->y - size },
-		{ or->x - size / 3, or->y - size / 3 },
-		{ or->x, or->y },
-		{ or->x + size, or->y + size },
+		{ rect->x - size, rect->y - size },
+		{ rect->x - size / 3, rect->y - size / 3 },
+		{ rect->x, rect->y },
+		{ rect->x + size, rect->y + size },
 		{ sw / 2, sh / 2 },
-		{ or->x + or->w - size, or->y + or->h - size },
-		{ or->x + or->w - size / 3, or->y + or->h - size / 3 },
-		{ or->x + or->w + size, or->y + or->h + size },
+		{ rect->x + rect->w - size, rect->y + rect->h - size },
+		{ rect->x + rect->w - size / 3, rect->y + rect->h - size / 3 },
+		{ rect->x + rect->w + size, rect->y + rect->h + size },
 		{ sw - size, sh - size },
 		{ sw - size / 3, sh - size / 3 },
 		/* Test remaining corners. */
 		{ sw - size, 0 },
 		{ 0, sh - size },
-		{ or->x + or->w - size, or->y },
-		{ or->x, or->y + or->h - size }
+		{ rect->x + rect->w - size, rect->y },
+		{ rect->x, rect->y + rect->h - size }
 	};
 
 	for (i = 0; i < ARRAY_SIZE(pos); ++i) {
@@ -265,8 +265,8 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 			    DRM_FORMAT_MOD_LINEAR, 1.0, 1.0, 1.0, &data->pfb);
 
 	if (flags & TEST_OVERLAY) {
-		int width = (flags & TEST_VIEWPORT) ? data->or.w + pad : data->or.w;
-		int height = (flags & TEST_VIEWPORT) ? data->or.h + pad : data->or.h;
+		int width = (flags & TEST_VIEWPORT) ? data->rect.w + pad : data->rect.w;
+		int height = (flags & TEST_VIEWPORT) ? data->rect.h + pad : data->rect.h;
 
 		igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
 				    DRM_FORMAT_MOD_LINEAR, 0.5, 0.5, 0.5, &data->ofb);
-- 
2.51.2

