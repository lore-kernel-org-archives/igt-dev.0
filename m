Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27DACD11DD
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 14:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9812F10EAAD;
	Tue, 26 Mar 2024 14:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wh/grsaS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610DF10E5F7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711462439; x=1742998439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zh0VPvZL3VsJC9Mgi0BsumsiqFPo2qkKNd9utigiQAI=;
 b=Wh/grsaSrxx2YmNx3/7lFhKAWbq8JwyyqwpB19VfknpdmShJQVdenphF
 v2k6zefgQwnJn7WuTEA8l/QQs1ezvJmMD/RhrQ3I5AgxFcu+h9i/hVwD+
 Dr4D2VicMBbgimn0LTylcUIzQL5wIBApX4vPMhKcxHIsyICqw10Fx/tvi
 fqr+r6R4I8LCA9i9t+S3/3jbJEy/4crGpPJAwf5smL4mW4tRtJdaWRWdz
 BJ3GKoEfYCVwwjX/AsEx5zpWZ9rl4VjH33P7SX1hA1Ngrg1hCzVUj2wa1
 hEqg+tuNgxVgqOSfGTcm6qhHZ2E6PXaqM25h5EK795WlcmeygFyLSjMOS w==;
X-CSE-ConnectionGUID: NynyLGubTjGwvTwuttpKvQ==
X-CSE-MsgGUID: QkKqSaUzRSeqfTntH0u6JQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17147226"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17147226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 07:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="53437635"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 07:13:58 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [v4 1/3] lib/igt_draw: Dont mmap, if the buffer is already mmapped
Date: Tue, 26 Mar 2024 19:44:20 +0530
Message-ID: <20240326141422.13993-2-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240326141422.13993-1-vandita.kulkarni@intel.com>
References: <20240326141422.13993-1-vandita.kulkarni@intel.com>
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

This will help add support to tests which would reuse the
same fbs and would not want to mmap again and would just
want to update the fbs.

v2: Handle non null buf ptr cases in non WC mmap cases.
    Squash changes in kms_frontbuffer_tracking which is using
    this function. (Zbigniew)

v3: Fix the buf ptr handling in non WC mmap cases (Zbigniew)

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 lib/igt_draw.c                         | 61 ++++++++++++++++----------
 lib/igt_draw.h                         |  2 +-
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 3 files changed, 39 insertions(+), 26 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 2c01d7b02..a4d5f2f0e 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -75,6 +75,7 @@ struct buf_data {
 	uint32_t handle;
 	uint32_t size;
 	uint32_t stride;
+	void *buf_ptr;
 	int width;
 	int height;
 	int bpp;
@@ -448,6 +449,8 @@ static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
 {
 	uint32_t *ptr;
 
+	igt_assert(buf->buf_ptr == NULL);
+
 	gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_CPU,
 		       I915_GEM_DOMAIN_CPU);
 
@@ -483,6 +486,8 @@ static void draw_rect_mmap_gtt(int fd, struct buf_data *buf, struct rect *rect,
 {
 	uint32_t *ptr;
 
+	igt_assert(buf->buf_ptr == NULL);
+
 	gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
 		       I915_GEM_DOMAIN_GTT);
 
@@ -499,28 +504,32 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
 {
 	uint32_t *ptr;
 
-	if (is_i915_device(fd)) {
-		gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
-			       I915_GEM_DOMAIN_GTT);
-
-		/* We didn't implement suport for the older tiling methods yet. */
-		if (tiling != I915_TILING_NONE)
-			igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
-
-		if (gem_has_lmem(fd))
-			ptr = gem_mmap_offset__fixed(fd, buf->handle, 0,
-						     PAGE_ALIGN(buf->size),
-						     PROT_READ | PROT_WRITE);
-		else if (gem_has_legacy_mmap(fd))
-			ptr = gem_mmap__wc(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
-					   PROT_READ | PROT_WRITE);
-		else
-			ptr = gem_mmap_offset__wc(fd, buf->handle, 0,
-						  PAGE_ALIGN(buf->size),
-						  PROT_READ | PROT_WRITE);
+	if (!buf->buf_ptr) {
+		if (is_i915_device(fd)) {
+			gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
+				       I915_GEM_DOMAIN_GTT);
+
+			/* We didn't implement suport for the older tiling methods yet. */
+			if (tiling != I915_TILING_NONE)
+				igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
+
+			if (gem_has_lmem(fd))
+				ptr = gem_mmap_offset__fixed(fd, buf->handle, 0,
+							     PAGE_ALIGN(buf->size),
+							     PROT_READ | PROT_WRITE);
+			else if (gem_has_legacy_mmap(fd))
+				ptr = gem_mmap__wc(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
+						   PROT_READ | PROT_WRITE);
+			else
+				ptr = gem_mmap_offset__wc(fd, buf->handle, 0,
+							  PAGE_ALIGN(buf->size),
+							  PROT_READ | PROT_WRITE);
+		} else {
+			ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size,
+					     PROT_READ | PROT_WRITE);
+		}
 	} else {
-		ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size,
-				     PROT_READ | PROT_WRITE);
+		ptr = buf->buf_ptr;
 	}
 
 	switch (tiling) {
@@ -538,7 +547,8 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
 		break;
 	}
 
-	igt_assert(gem_munmap(ptr, buf->size) == 0);
+	if (ptr != buf->buf_ptr)
+		igt_assert(gem_munmap(ptr, buf->size) == 0);
 }
 
 static void draw_rect_pwrite_untiled(int fd, struct buf_data *buf,
@@ -839,6 +849,8 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
  * @buf_handle: the handle of the buffer where you're going to draw to
  * @buf_size: the size of the buffer
  * @buf_stride: the stride of the buffer
+ * @buf_ptr: if required can be used to pass already mmapped buffer ptr
+ *           only in case of wc mmap, can be NULL in any other case.
  * @buf_width: the width of the buffer
  * @buf_height: the height of the buffer
  * @tiling: the tiling of the buffer
@@ -855,7 +867,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
  */
 void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
 		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
-		   int buf_width, int buf_height,
+		   void *buf_ptr, int buf_width, int buf_height,
 		   uint32_t tiling, enum igt_draw_method method,
 		   int rect_x, int rect_y, int rect_w, int rect_h,
 		   uint32_t color, int bpp)
@@ -870,6 +882,7 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
 		.handle = buf_handle,
 		.size = buf_size,
 		.stride = buf_stride,
+		.buf_ptr = buf_ptr,
 		.width = buf_width,
 		.height = buf_height,
 		.bpp = bpp,
@@ -935,7 +948,7 @@ void igt_draw_rect_fb(int fd, struct buf_ops *bops,
 		      int rect_w, int rect_h, uint32_t color)
 {
 	igt_draw_rect(fd, bops, ctx, fb->gem_handle, fb->size, fb->strides[0],
-		      fb->width, fb->height,
+		      fb->driver_priv, fb->width, fb->height,
 		      igt_fb_mod_to_tiling(fb->modifier), method,
 		      rect_x, rect_y, rect_w, rect_h, color,
 		      igt_drm_format_to_bpp(fb->drm_format));
diff --git a/lib/igt_draw.h b/lib/igt_draw.h
index 1dec95e86..865641ef6 100644
--- a/lib/igt_draw.h
+++ b/lib/igt_draw.h
@@ -54,7 +54,7 @@ bool igt_draw_supports_method(int fd, enum igt_draw_method method);
 
 void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
 		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
-		   int buf_width, int buf_height,
+		   void *buf_ptr, int buf_width, int buf_height,
 		   uint32_t tiling, enum igt_draw_method method,
 		   int rect_x, int rect_y, int rect_w, int rect_h,
 		   uint32_t color, int bpp);
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index db2db0ff1..392539408 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2254,7 +2254,7 @@ static void *busy_thread_func(void *data)
 {
 	while (!busy_thread.stop)
 		igt_draw_rect(drm.fd, drm.bops, 0, busy_thread.handle,
-			      busy_thread.size, busy_thread.stride,
+			      busy_thread.size, busy_thread.stride, NULL,
 			      busy_thread.width, busy_thread.height,
 			      busy_thread.tiling, IGT_DRAW_BLT, 0, 0,
 			      busy_thread.width, busy_thread.height,
-- 
2.43.2

