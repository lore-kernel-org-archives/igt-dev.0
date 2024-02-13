Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEEFC4829F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 10:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3ABE10E31A;
	Tue, 13 Feb 2024 10:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2R2/kV6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5588C10E2E4
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Feb 2024 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707818500; x=1739354500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nsfvlEZbDlm4pzsGZGGeF6drmTTW6+VKOUCiLsJ7Zz4=;
 b=f2R2/kV6FQdFIUq6p6JXDGNBuZO4bgxL+7YVzpDWRO7uQInwt+NUz/Dm
 nMpwd84PUQO5H6kNuPXp5yo55iqgnid2Teps3RkoSgQgTZYwDWLsZhL2p
 Xmb5eF0SVqLQblnvCEl1q+vwIEKHyOFZz6ERMDTsXZF/Ctdy7fiR8GVts
 4VS7lWn7xj5Fd2oLb5LWG0dG1p/7YR8B3C/n07t90Toirs2bbYFRXR7De
 3FJaOOeU2Hia9rSh71OxA9LtajcEbef85IytOosk5TDMsRmjIsoNFT4Uj
 lJTz0aeJ8O0Kddkr2t+bF/xG8wQ68pDi22wECReBUa2eBh1le5MkGHR5F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19232359"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="19232359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2815510"
Received: from gfmckenx-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.21.42])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:38 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 4/8] tests/intel: replace
 intel_buf_create_using_handle()
Date: Tue, 13 Feb 2024 10:01:21 +0000
Message-ID: <20240213100125.90085-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213100125.90085-1-matthew.auld@intel.com>
References: <20240213100125.90085-1-matthew.auld@intel.com>
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

Require the original object size, if the caller created the object and
convert all existing users over.

v2:(Zbigniew)
  - Fix doc for function name and also assert size.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_bufops.c               |  24 +------
 tests/intel/gem_concurrent_all.c |  31 ++++++----
 tests/intel/gem_pxp.c            | 103 ++++++++++++++++++++++---------
 tests/intel/kms_fence_pin_leak.c |   5 +-
 4 files changed, 99 insertions(+), 64 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index a299cdba7..fa7dc4de6 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1111,7 +1111,7 @@ struct intel_buf *intel_buf_create(struct buf_ops *bops,
 }
 
 /**
- * intel_buf_create_using_handle
+ * intel_buf_create_using_handle_and_size
  * @bops: pointer to buf_ops
  * @handle: BO handle created by the caller
  * @width: surface width
@@ -1126,26 +1126,6 @@ struct intel_buf *intel_buf_create(struct buf_ops *bops,
  * take ownership of the buffer. close()/destroy() paths doesn't close
  * passed handle unless buffer will take ownership using set_ownership().
  */
-struct intel_buf *intel_buf_create_using_handle(struct buf_ops *bops,
-						uint32_t handle,
-						int width, int height,
-						int bpp, int alignment,
-						uint32_t req_tiling,
-						uint32_t compression)
-{
-	struct intel_buf *buf;
-
-	igt_assert(bops);
-
-	buf = calloc(1, sizeof(*buf));
-	igt_assert(buf);
-
-	intel_buf_init_using_handle(bops, handle, buf, width, height, bpp,
-				    alignment, req_tiling, compression);
-
-	return buf;
-}
-
 struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
 							 uint32_t handle,
 							 int width, int height,
@@ -1154,6 +1134,8 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
 							 uint32_t compression,
 							 uint64_t size)
 {
+	igt_assert(handle);
+	igt_assert(size);
 	return intel_buf_create_full(bops, handle, width, height, bpp, alignment,
 				     req_tiling, compression, size, 0, -1,
 				     DEFAULT_PAT_INDEX);
diff --git a/tests/intel/gem_concurrent_all.c b/tests/intel/gem_concurrent_all.c
index 0bf46c0a2..dbb7622d3 100644
--- a/tests/intel/gem_concurrent_all.c
+++ b/tests/intel/gem_concurrent_all.c
@@ -172,8 +172,9 @@ create_private_bo(struct buf_ops *bops, uint32_t width, uint32_t height,
 	name = gem_flink(fd, handle);
 	buf_handle = gem_open(fd, name);
 
-	buf = intel_buf_create_using_handle(bops, buf_handle,
-					    width, height, bpp, 0, tiling, 0);
+	buf = intel_buf_create_using_handle_and_size(bops, buf_handle, width,
+						     height, bpp, 0, tiling, 0,
+						     size);
 	intel_buf_set_ownership(buf, true);
 
 	gem_close(fd, handle);
@@ -202,8 +203,9 @@ create_stolen_bo(struct buf_ops *bops, uint32_t width, uint32_t height,
 	name = gem_flink(fd, handle);
 	buf_handle = gem_open(fd, name);
 
-	buf = intel_buf_create_using_handle(bops, buf_handle,
-					    width, height, bpp, 0, tiling, 0);
+	buf = intel_buf_create_using_handle_and_size(bops, buf_handle, width,
+						     height, bpp, 0, tiling, 0,
+						     size);
 	intel_buf_set_ownership(buf, true);
 
 	gem_close(fd, handle);
@@ -305,9 +307,10 @@ userptr_create_bo(const struct buffers *b)
 	userptr.user_ptr = to_user_pointer(ptr);
 
 	do_or_die(drmIoctl(fd, DRM_IOCTL_I915_GEM_USERPTR, &userptr));
-	buf = intel_buf_create_using_handle(b->bops, userptr.handle,
-					    b->width, b->height, 32, 0,
-					    I915_TILING_NONE, 0);
+	buf = intel_buf_create_using_handle_and_size(b->bops, userptr.handle,
+						     b->width, b->height, 32, 0,
+						     I915_TILING_NONE, 0,
+						     userptr.user_size);
 	intel_buf_set_ownership(buf, true);
 
 	buf->ptr = (void *) from_user_pointer(userptr.user_ptr);
@@ -404,9 +407,9 @@ dmabuf_create_bo(const struct buffers *b)
 	igt_assert(args.fd != -1);
 
 	handle = prime_fd_to_handle(buf_ops_get_fd(b->bops), args.fd);
-	buf = intel_buf_create_using_handle(b->bops, handle,
-					    b->width, b->height, 32, 0,
-					    I915_TILING_NONE, 0);
+	buf = intel_buf_create_using_handle_and_size(b->bops, handle, b->width,
+						     b->height, 32, 0,
+						     I915_TILING_NONE, 0, size);
 	intel_buf_set_ownership(buf, true);
 
 	dmabuf = malloc(sizeof(*dmabuf));
@@ -511,9 +514,11 @@ vgem_create_bo(const struct buffers *b)
 	igt_assert(args.fd != -1);
 
 	handle = prime_fd_to_handle(buf_ops_get_fd(b->bops), args.fd);
-	buf = intel_buf_create_using_handle(b->bops, handle,
-					    vgem.width, vgem.height, vgem.bpp,
-					    0, I915_TILING_NONE, 0);
+	buf = intel_buf_create_using_handle_and_size(b->bops, handle,
+						     vgem.width, vgem.height,
+						     vgem.bpp, 0,
+						     I915_TILING_NONE, 0,
+						     vgem.size);
 	intel_buf_set_ownership(buf, true);
 
 	dmabuf = malloc(sizeof(*dmabuf));
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index dff4a5d25..9cc6b9c2f 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -545,12 +545,20 @@ static void test_render_baseline(int i915)
 	igt_assert(ibb);
 
 	dstbo = alloc_and_fill_dest_buff(i915, false, TSTSURF_SIZE, TSTSURF_INITCOLOR1);
-	dstbuf = intel_buf_create_using_handle(bops, dstbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
-					       TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+	dstbuf = intel_buf_create_using_handle_and_size(bops, dstbo,
+							TSTSURF_WIDTH,
+							TSTSURF_HEIGHT,
+							TSTSURF_BYTESPP*8, 0,
+							I915_TILING_NONE, 0,
+							TSTSURF_SIZE);
 
 	srcbo = alloc_and_fill_dest_buff(i915, false, TSTSURF_SIZE, TSTSURF_FILLCOLOR1);
-	srcbuf = intel_buf_create_using_handle(bops, srcbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
-					       TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+	srcbuf = intel_buf_create_using_handle_and_size(bops, srcbo,
+							TSTSURF_WIDTH,
+							TSTSURF_HEIGHT,
+							TSTSURF_BYTESPP*8, 0,
+							I915_TILING_NONE, 0,
+							TSTSURF_SIZE);
 
 	render_copy(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
 	gem_sync(i915, dstbo);
@@ -595,13 +603,21 @@ static void __test_render_pxp_src_to_protdest(int i915, uint32_t *outpixels, int
 	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, I915_PROTECTED_CONTENT_DEFAULT_SESSION);
 
 	dstbo = alloc_and_fill_dest_buff(i915, true, TSTSURF_SIZE, TSTSURF_INITCOLOR2);
-	dstbuf = intel_buf_create_using_handle(bops, dstbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
-						TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+	dstbuf = intel_buf_create_using_handle_and_size(bops, dstbo,
+							TSTSURF_WIDTH,
+							TSTSURF_HEIGHT,
+							TSTSURF_BYTESPP*8, 0,
+							I915_TILING_NONE, 0,
+							TSTSURF_SIZE);
 	intel_buf_set_pxp(dstbuf, true);
 
 	srcbo = alloc_and_fill_dest_buff(i915, false, TSTSURF_SIZE, TSTSURF_FILLCOLOR2);
-	srcbuf = intel_buf_create_using_handle(bops, srcbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
-						TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+	srcbuf = intel_buf_create_using_handle_and_size(bops, srcbo,
+							TSTSURF_WIDTH,
+							TSTSURF_HEIGHT,
+							TSTSURF_BYTESPP*8, 0,
+							I915_TILING_NONE, 0,
+							TSTSURF_SIZE);
 
 	render_copy(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
 	gem_sync(i915, dstbo);
@@ -656,13 +672,21 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
 	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, I915_PROTECTED_CONTENT_DEFAULT_SESSION);
 
 	dstbo = alloc_and_fill_dest_buff(i915, true, TSTSURF_SIZE, TSTSURF_INITCOLOR2);
-	dstbuf = intel_buf_create_using_handle(bops, dstbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
-						TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+	dstbuf = intel_buf_create_using_handle_and_size(bops, dstbo,
+							TSTSURF_WIDTH,
+							TSTSURF_HEIGHT,
+							TSTSURF_BYTESPP*8, 0,
+							I915_TILING_NONE, 0,
+							TSTSURF_SIZE);
 	intel_buf_set_pxp(dstbuf, true);
 
 	srcbo = alloc_and_fill_dest_buff(i915, false, TSTSURF_SIZE, TSTSURF_FILLCOLOR2);
-	srcbuf = intel_buf_create_using_handle(bops, srcbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
-						TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+	srcbuf = intel_buf_create_using_handle_and_size(bops, srcbo,
+							TSTSURF_WIDTH,
+							TSTSURF_HEIGHT,
+							TSTSURF_BYTESPP*8, 0,
+							I915_TILING_NONE, 0,
+							TSTSURF_SIZE);
 
 	render_copy(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
 	gem_sync(i915, dstbo);
@@ -682,8 +706,12 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
 				TSTSURF_SIZE, 0, encrypted, TSTSURF_SIZE);
 
 	dstbo2 = alloc_and_fill_dest_buff(i915, true, TSTSURF_SIZE, TSTSURF_INITCOLOR3);
-	dstbuf2 = intel_buf_create_using_handle(bops, dstbo2, TSTSURF_WIDTH, TSTSURF_HEIGHT,
-						TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+	dstbuf2 = intel_buf_create_using_handle_and_size(bops, dstbo2,
+							 TSTSURF_WIDTH,
+							 TSTSURF_HEIGHT,
+							 TSTSURF_BYTESPP*8, 0,
+							 I915_TILING_NONE, 0,
+							 TSTSURF_SIZE);
 	intel_buf_set_pxp(dstbuf2, true);
 	intel_buf_set_pxp(dstbuf, true);/*this time, src is protected*/
 
@@ -751,15 +779,27 @@ static void test_pxp_dmabuffshare_refcnt(int i915)
 		if (n == 1)
 			fill_bo_content(fd[1], dbo[1], TSTSURF_SIZE, TSTSURF_INITCOLOR2);
 
-		dbuf[n] = intel_buf_create_using_handle(bops[n], dbo[n], TSTSURF_WIDTH,
-							TSTSURF_HEIGHT,	TSTSURF_BYTESPP*8, 0,
-							I915_TILING_NONE, 0);
+		dbuf[n] = intel_buf_create_using_handle_and_size(bops[n],
+								 dbo[n],
+								 TSTSURF_WIDTH,
+								 TSTSURF_HEIGHT,
+								 TSTSURF_BYTESPP*8,
+								 0,
+								 I915_TILING_NONE,
+								 0,
+								 TSTSURF_SIZE);
 		intel_buf_set_pxp(dbuf[n], true);
 
 		sbo[n] = alloc_and_fill_dest_buff(fd[n], false, TSTSURF_SIZE, TSTSURF_FILLCOLOR1);
-		sbuf[n] = intel_buf_create_using_handle(bops[n], sbo[n], TSTSURF_WIDTH,
-							TSTSURF_HEIGHT, TSTSURF_BYTESPP*8, 0,
-							I915_TILING_NONE, 0);
+		sbuf[n] = intel_buf_create_using_handle_and_size(bops[n],
+								 sbo[n],
+								 TSTSURF_WIDTH,
+								 TSTSURF_HEIGHT,
+								 TSTSURF_BYTESPP*8,
+								 0,
+								 I915_TILING_NONE,
+								 0,
+								 TSTSURF_SIZE);
 
 		render_copy(ibb[n], sbuf[n], 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT,
 			    dbuf[n], 0, 0);
@@ -913,8 +953,11 @@ static void prepare_exec_assets(int i915, struct simple_exec_assets *data, bool
 	data->bops = buf_ops_create(i915);
 	igt_assert(data->bops);
 
-	data->fencebuf = intel_buf_create_using_handle(data->bops, data->fencebo, 256, 4,
-						       32, 0, I915_TILING_NONE, 0);
+	data->fencebuf = intel_buf_create_using_handle_and_size(data->bops,
+								data->fencebo,
+								256, 4, 32, 0,
+								I915_TILING_NONE,
+								0, 4096);
 	intel_bb_add_intel_buf(data->ibb, data->fencebuf, true);
 }
 
@@ -1144,15 +1187,19 @@ static void setup_protected_fb(int i915, int width, int height, igt_fb_t *fb, ui
 			      fb->modifier, fb->strides, fb->offsets, fb->num_planes,
 			      DRM_MODE_FB_MODIFIERS, &fb->fb_id));
 
-	dstbuf = intel_buf_create_using_handle(bops, fb->gem_handle, fb->width, fb->height,
-					       fb->plane_bpp[0], 0,
-					       igt_fb_mod_to_tiling(fb->modifier), 0);
+	dstbuf = intel_buf_create_using_handle_and_size(bops, fb->gem_handle,
+							fb->width, fb->height,
+							fb->plane_bpp[0], 0,
+							igt_fb_mod_to_tiling(fb->modifier),
+							0, fb->size);
 	dstbuf->is_protected = true;
 
 	srcbo = alloc_and_fill_dest_buff(i915, false, fb->size, TSTSURF_GREENCOLOR);
-	srcbuf = intel_buf_create_using_handle(bops, srcbo, fb->width, fb->height,
-					       fb->plane_bpp[0], 0,
-					       igt_fb_mod_to_tiling(fb->modifier), 0);
+	srcbuf = intel_buf_create_using_handle_and_size(bops, srcbo, fb->width,
+							fb->height,
+							fb->plane_bpp[0], 0,
+							igt_fb_mod_to_tiling(fb->modifier),
+							0, fb->size);
 
 	ibb = intel_bb_create_with_context(i915, ctx, 0, NULL, 4096);
 	igt_assert(ibb);
diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
index 24e7b011c..0771799ba 100644
--- a/tests/intel/kms_fence_pin_leak.c
+++ b/tests/intel/kms_fence_pin_leak.c
@@ -72,8 +72,9 @@ static void exec_nop(data_t *data, struct igt_fb *fb, uint32_t ctx)
 
 	name = gem_flink(data->drm_fd, fb->gem_handle);
 	handle = gem_open(data->drm_fd, name);
-	dst = intel_buf_create_using_handle(data->bops, handle,
-					    width, height, bpp, 0, tiling, 0);
+	dst = intel_buf_create_using_handle_and_size(data->bops, handle, width,
+						     height, bpp, 0, tiling, 0,
+						     size);
 	intel_buf_set_ownership(dst, true);
 
 	ibb = intel_bb_create_with_context(buf_ops_get_fd(data->bops),
-- 
2.43.0

