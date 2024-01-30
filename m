Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0878C46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 07:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5B6112C32;
	Tue, 30 Jan 2024 07:53:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6A4112E15
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 07:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706601215; x=1738137215;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GpFvppwMVpcPn9wsxCWQtpQRERjBb06zIkz2ML7L36g=;
 b=HnhgD3YynYy9pWTelbT+b9E2L+yQi4rjPRSiS1lRzVrs1oiJdP7Yp+LI
 o3e6y9R7/+NYlzOxm8UkIpa+Y/pPSpmVe8BLyxQKBmQyHzMGodbhp0yUF
 9yEpoKIIyygQs02ZVK6zfJtxcLUgzgO2/f8v+mloMILgWHkTuVNdzgVIu
 H2mjKG2PvFuqj6/ZjiJSWioO4o2NHa0Q+ovODzBPY5D/OnuUfi2wLSnVk
 CK+gLDQe680V8ns6kAHQhfX/4lrwGlkNK2OzNxCR4l+N24iUIfOX12f0Q
 4Lfwr/0hOJvSKQ2C1aK1RCNjDxjciej1mf4haT/StQJv1MzZLWbDit5ow A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2135241"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="2135241"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 23:53:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3586356"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 23:53:33 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t] lib/igt_draw: Fix the usage of FB width & height
Date: Tue, 30 Jan 2024 13:17:18 +0530
Message-ID: <20240130074718.584552-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Aliging to xe default alignment is causing the mismatch in derived
height from framebuffer size (height = size/ stride). Instead use
the original width & height from the created fb.

Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/608
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_draw.c                         | 14 +++++++++++---
 lib/igt_draw.h                         |  1 +
 tests/intel/kms_frontbuffer_tracking.c |  1 +
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 637b9ba76..a56337e49 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -75,6 +75,8 @@ struct buf_data {
 	uint32_t handle;
 	uint32_t size;
 	uint32_t stride;
+	int width;
+	int height;
 	int bpp;
 	uint8_t pat_index;
 };
@@ -648,8 +650,8 @@ static struct intel_buf *create_buf(int fd, struct buf_ops *bops,
 	uint64_t region = driver == INTEL_DRIVER_XE ? vram_if_possible(fd, 0) : -1;
 	uint64_t size = from->size;
 
-	width = from->stride / (from->bpp / 8);
-	height = from->size / from->stride;
+	width = from->width;
+	height = from->height;
 	if (driver == INTEL_DRIVER_XE)
 		size = ALIGN(size, xe_get_default_alignment(fd));
 
@@ -686,7 +688,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 	intel_bb_add_intel_buf(ibb, dst, true);
 
 	if (HAS_4TILE(intel_get_drm_devid(fd))) {
-		int buf_height = buf->size / buf->stride;
+		int buf_height = buf->height;
 
 		switch (buf->bpp) {
 		case 8:
@@ -834,6 +836,8 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
  * @buf_handle: the handle of the buffer where you're going to draw to
  * @buf_size: the size of the buffer
  * @buf_stride: the stride of the buffer
+ * @buf_width: the width of the buffer
+ * @buf_height: the height of the buffer
  * @tiling: the tiling of the buffer
  * @method: method you're going to use to write to the buffer
  * @rect_x: horizontal position on the buffer where your rectangle starts
@@ -848,6 +852,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
  */
 void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
 		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
+		   int buf_width, int buf_height,
 		   uint32_t tiling, enum igt_draw_method method,
 		   int rect_x, int rect_y, int rect_w, int rect_h,
 		   uint32_t color, int bpp)
@@ -862,6 +867,8 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
 		.handle = buf_handle,
 		.size = buf_size,
 		.stride = buf_stride,
+		.width = buf_width,
+		.height = buf_height,
 		.bpp = bpp,
 		.pat_index = intel_get_pat_idx_uc(fd),
 	};
@@ -925,6 +932,7 @@ void igt_draw_rect_fb(int fd, struct buf_ops *bops,
 		      int rect_w, int rect_h, uint32_t color)
 {
 	igt_draw_rect(fd, bops, ctx, fb->gem_handle, fb->size, fb->strides[0],
+		      fb->width, fb->height,
 		      igt_fb_mod_to_tiling(fb->modifier), method,
 		      rect_x, rect_y, rect_w, rect_h, color,
 		      igt_drm_format_to_bpp(fb->drm_format));
diff --git a/lib/igt_draw.h b/lib/igt_draw.h
index fe7531b79..1dec95e86 100644
--- a/lib/igt_draw.h
+++ b/lib/igt_draw.h
@@ -54,6 +54,7 @@ bool igt_draw_supports_method(int fd, enum igt_draw_method method);
 
 void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
 		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
+		   int buf_width, int buf_height,
 		   uint32_t tiling, enum igt_draw_method method,
 		   int rect_x, int rect_y, int rect_w, int rect_h,
 		   uint32_t color, int bpp);
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 2a2690d18..912cca3f8 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2242,6 +2242,7 @@ static void *busy_thread_func(void *data)
 	while (!busy_thread.stop)
 		igt_draw_rect(drm.fd, drm.bops, 0, busy_thread.handle,
 			      busy_thread.size, busy_thread.stride,
+			      busy_thread.width, busy_thread.height,
 			      busy_thread.tiling, IGT_DRAW_BLT, 0, 0,
 			      busy_thread.width, busy_thread.height,
 			      busy_thread.color, busy_thread.bpp);
-- 
2.43.0

