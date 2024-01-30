Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D68C47DDF
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 11:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0491124BE;
	Tue, 30 Jan 2024 11:43:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC601124BE
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706615031; x=1738151031;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fMvoi8tpvzDq1QxYCmb0vKImFa020uNkXGzi1peaAhs=;
 b=Bc26XLd+rr0ffK5ZUaILoAe1m13l4PfmzWuRFgxY1yvKn8Y/3j3lFn8P
 Sgye+3WMcqk7LV1CY/eRnS+nWxP8DNPtbIL3pPCiwV+LYhpSS32udpSyy
 lKR32kUH0TJoLaSwOuU/qVl/pSASujEFOtxtwNVm9mqMOwizC/v6+JVui
 iTyU79xbXotfTkDux+ygEhcC9f3rPXl5ZOL/lhZrjG3WOZF8MXG5x49It
 5wTUcie0GJXJIYHONb3J+gGhRLZCxQrnivwvww6GkgfyYy2OhRjo5aR96
 TGu3kGrCPXvwxgoQjedyP68H43g91BCKHDjWu+DM/qkQmZNPc/XGnLxhh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16783759"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="16783759"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 03:43:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="911419535"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="911419535"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 03:43:47 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t V2] lib/igt_draw: Fix the usage of FB width & height
Date: Tue, 30 Jan 2024 17:07:27 +0530
Message-ID: <20240130113727.721365-1-bhanuprakash.modem@intel.com>
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

V2: - Fix issues in CI

Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/608
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_draw.c                         | 16 +++++++++++++---
 lib/igt_draw.h                         |  1 +
 tests/intel/kms_big_fb.c               |  7 +++----
 tests/intel/kms_frontbuffer_tracking.c |  1 +
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 637b9ba76..0757e9801 100644
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
@@ -807,6 +809,8 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 
 	tmp.stride = rect->w * pixel_size;
 	tmp.bpp = buf->bpp;
+	tmp.width = rect->w;
+	tmp.height = rect->h;
 	if (is_i915_device(fd))
 		draw_rect_mmap_cpu(fd, &tmp, &(struct rect){0, 0, rect->w, rect->h},
 				   I915_TILING_NONE, I915_BIT_6_SWIZZLE_NONE, color);
@@ -834,6 +838,8 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
  * @buf_handle: the handle of the buffer where you're going to draw to
  * @buf_size: the size of the buffer
  * @buf_stride: the stride of the buffer
+ * @buf_width: the width of the buffer
+ * @buf_height: the height of the buffer
  * @tiling: the tiling of the buffer
  * @method: method you're going to use to write to the buffer
  * @rect_x: horizontal position on the buffer where your rectangle starts
@@ -848,6 +854,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
  */
 void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
 		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
+		   int buf_width, int buf_height,
 		   uint32_t tiling, enum igt_draw_method method,
 		   int rect_x, int rect_y, int rect_w, int rect_h,
 		   uint32_t color, int bpp)
@@ -862,6 +869,8 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
 		.handle = buf_handle,
 		.size = buf_size,
 		.stride = buf_stride,
+		.width = buf_width,
+		.height = buf_height,
 		.bpp = bpp,
 		.pat_index = intel_get_pat_idx_uc(fd),
 	};
@@ -925,6 +934,7 @@ void igt_draw_rect_fb(int fd, struct buf_ops *bops,
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
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 3eb43515a..0bd79394b 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -189,18 +189,17 @@ static struct intel_buf *init_buf(data_t *data,
 {
 	struct intel_buf *buf;
 	enum intel_driver driver = buf_ops_get_driver(data->bops);
-	uint32_t name, handle, tiling, stride, width, height, bpp, size;
+	uint32_t name, handle, tiling, width, height, bpp, size;
 	uint64_t region = driver == INTEL_DRIVER_XE ?
 				vram_if_possible(data->drm_fd, 0) : -1;
 
 	igt_assert_eq(fb->offsets[0], 0);
 
 	tiling = igt_fb_mod_to_tiling(fb->modifier);
-	stride = fb->strides[0];
 	bpp = fb->plane_bpp[0];
 	size = fb->size;
-	width = stride / (bpp / 8);
-	height = size / stride;
+	width = fb->width;
+	height = fb->height;
 
 	name = gem_flink(data->drm_fd, fb->gem_handle);
 	handle = gem_open(data->drm_fd, name);
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

