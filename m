Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7F5C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 09:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB3C10E269;
	Mon, 24 Mar 2025 09:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1NYehYu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F16C10E269
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 09:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742809320; x=1774345320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3jlU796HoKxq1D3c3kvcZIkX9hlHhfGYbJDnpKwtw34=;
 b=D1NYehYuYswfHmt0X3z0EXhI+p4vFRmB5q+GJiBdlhP/gZGbf3M8UufU
 GZ9vM5F+cOKa71HbjTGIslKqiNMwy+K8Hc6XZgvuiFGiRk0A24QFIB0HX
 uBz8RkZfNtUDur6kL9tMj1VSRZPonCpnz8h5LKsNnBfxqGi5I5SeUvGoG
 LA8QkxihQfpLRgUhyue5Gbzw8tYgWI2Dqu71MIWpOczkX7Kruep5Mi8lq
 9tr7xusrprnrLyppAIuyaBsS18RCeUc1ZZZfdqqiTJahl/aY7aVw0LAYG
 ENWCAfwTktcADZQwu4kEboqMHMgpeL0sKt2bs62QtsMJGziI/7qcyvQsm g==;
X-CSE-ConnectionGUID: x7k0AGP0SX63xv4aWaMbAg==
X-CSE-MsgGUID: sidFd0EQQpStRNnn0XXfhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="54639923"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="54639923"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:42:00 -0700
X-CSE-ConnectionGUID: k02PN+zIQYmjYJ38moyiWQ==
X-CSE-MsgGUID: pwBBc6vrSO2YzpyVq+/I9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="128161656"
Received: from ba_tws-123.gar.corp.intel.com (HELO
 spottumu-desk.iind.intel.com) ([10.190.216.156])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:41:57 -0700
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.teja.pottumuttu@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com, matthew.d.roper@intel.com,
 zbigniew.kempczynski@intel.com
Subject: [PATCH i-g-t] lib/intel_batchbuffer: Refactor igt_get_render_copyfunc
Date: Mon, 24 Mar 2025 15:06:27 +0530
Message-Id: <20250324093627.3711195-1-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
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

The render copy wouldn't be supported if at all the render
engine is absent. Refactor igt_get_render_copyfunc on these lines to
return NULL if render engine is absent.

The patch also corrects the function usage across IGT as per the
refactor and does the required cleanup.

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 lib/igt_draw.c                        |  5 ++---
 lib/igt_fb.c                          |  2 +-
 lib/intel_batchbuffer.c               |  8 +++++++-
 lib/intel_batchbuffer.h               |  2 +-
 tests/intel/api_intel_bb.c            |  4 ++--
 tests/intel/gem_concurrent_all.c      |  2 +-
 tests/intel/gem_ppgtt.c               |  5 +----
 tests/intel/gem_pxp.c                 | 17 ++++++-----------
 tests/intel/gem_read_read_speed.c     |  2 +-
 tests/intel/gem_render_copy.c         |  2 +-
 tests/intel/gem_render_copy_redux.c   |  2 +-
 tests/intel/gem_render_linear_blits.c |  2 +-
 tests/intel/gem_render_tiled_blits.c  |  2 +-
 tests/intel/gem_stress.c              |  2 +-
 tests/intel/kms_big_fb.c              |  2 +-
 tests/intel/kms_dirtyfb.c             |  2 +-
 tests/intel/kms_fbc_dirty_rect.c      |  2 +-
 tests/intel/kms_psr.c                 |  4 ++--
 tests/intel/perf.c                    |  2 +-
 tests/intel/xe_intel_bb.c             |  2 +-
 tests/intel/xe_oa.c                   |  2 +-
 tests/intel/xe_pat.c                  |  5 ++---
 tests/intel/xe_render_copy.c          |  3 +--
 tools/intel_tiling_detect.c           |  2 +-
 24 files changed, 39 insertions(+), 44 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 81da01a6c..e447ca44b 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -900,8 +900,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 			     uint32_t tiling, uint64_t color)
 {
 	struct intel_buf *src, *dst;
-	uint32_t devid = intel_get_drm_devid(fd);
-	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(devid);
+	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(fd);
 	struct intel_bb *ibb;
 	struct buf_data tmp;
 	int pixel_size = buf->bpp / 8;
@@ -1081,7 +1080,7 @@ bool igt_draw_supports_method(int fd, enum igt_draw_method method)
 		return is_i915_device(fd);
 
 	if (method == IGT_DRAW_RENDER)
-		return !!igt_get_render_copyfunc(intel_get_drm_devid(fd));
+		return !!igt_get_render_copyfunc(fd);
 
 	return true;
 }
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0d024dcad..d62a94e51 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2831,7 +2831,7 @@ static void copy_with_engine(struct fb_blit_upload *blit,
 	if (use_vebox_copy(src_fb, dst_fb))
 		vebox_copy = igt_get_vebox_copyfunc(intel_get_drm_devid(blit->fd));
 	else
-		render_copy = igt_get_render_copyfunc(intel_get_drm_devid(blit->fd));
+		render_copy = igt_get_render_copyfunc(blit->fd);
 
 	igt_require(vebox_copy || render_copy);
 
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 72bbbf8c6..99e7ade05 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -652,9 +652,15 @@ void igt_blitter_fast_copy__raw(int fd,
  * specified with @devid. Will return NULL when no render copy function is
  * implemented.
  */
-igt_render_copyfunc_t igt_get_render_copyfunc(int devid)
+igt_render_copyfunc_t igt_get_render_copyfunc(int fd)
 {
 	igt_render_copyfunc_t copy = NULL;
+	int devid;
+
+	if(is_xe_device(fd) && !xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER))
+		return copy;
+
+	devid = intel_get_drm_devid(fd);
 
 	if (IS_METEORLAKE(devid))
 		copy = mtl_render_copyfunc;
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 178aaa9d8..2b53058ff 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -143,7 +143,7 @@ typedef void (*igt_render_copyfunc_t)(struct intel_bb *ibb,
 				      struct intel_buf *dst,
 				      uint32_t dst_x, uint32_t dst_y);
 
-igt_render_copyfunc_t igt_get_render_copyfunc(int devid);
+igt_render_copyfunc_t igt_get_render_copyfunc(int fd);
 
 
 /**
diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index db039dc3b..4a1c9be91 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -1339,7 +1339,7 @@ static int render(struct buf_ops *bops, uint32_t tiling, bool do_reloc,
 			       0, 0, width, height,
 			       0, 0, width, height, 0);
 
-	render_copy = igt_get_render_copyfunc(devid);
+	render_copy = igt_get_render_copyfunc(i915);
 	igt_assert(render_copy);
 
 	render_copy(ibb,
@@ -1439,7 +1439,7 @@ static void render_ccs(struct buf_ops *bops)
 	scratch_buf_init(bops, &final, width, height, I915_TILING_NONE,
 			 I915_COMPRESSION_NONE);
 
-	render_copy = igt_get_render_copyfunc(devid);
+	render_copy = igt_get_render_copyfunc(i915);
 	igt_assert(render_copy);
 
 	intel_buf_draw_pattern(bops, &src,
diff --git a/tests/intel/gem_concurrent_all.c b/tests/intel/gem_concurrent_all.c
index acc6a230d..69ae7db1b 100644
--- a/tests/intel/gem_concurrent_all.c
+++ b/tests/intel/gem_concurrent_all.c
@@ -1905,7 +1905,7 @@ igt_main
 		intel_detect_and_clear_missed_interrupts(fd);
 		devid = intel_get_drm_devid(fd);
 		gen = intel_gen(devid);
-		rendercopy = igt_get_render_copyfunc(devid);
+		rendercopy = igt_get_render_copyfunc(fd);
 
 		vgem_drv = __drm_open_driver(DRIVER_VGEM);
 
diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
index 309f240cc..4ae9a5b73 100644
--- a/tests/intel/gem_ppgtt.c
+++ b/tests/intel/gem_ppgtt.c
@@ -103,19 +103,16 @@ static void fork_rcs_copy(int timeout, uint32_t final,
 #define CREATE_CONTEXT 0x1
 {
 	igt_render_copyfunc_t render_copy;
-	int devid;
 
 	for (int child = 0; child < count; child++) {
 		int fd = drm_open_driver(DRIVER_INTEL);
 		struct buf_ops *bops;
 
-		devid = intel_get_drm_devid(fd);
-
 		bops = buf_ops_create(fd);
 
 		dst[child] = create_bo(bops, ~0);
 
-		render_copy = igt_get_render_copyfunc(devid);
+		render_copy = igt_get_render_copyfunc(fd);
 		igt_require_f(render_copy,
 			      "no render-copy function\n");
 	}
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index 03c8bab89..c8d378875 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -368,11 +368,6 @@ static void test_ctx_mod_protected_to_all_invalid(int i915)
 	gem_context_destroy(i915, ctx);
 }
 
-static igt_render_copyfunc_t get_copy_func(int i915)
-{
-	return igt_get_render_copyfunc(intel_get_drm_devid(i915));
-}
-
 static void fill_bo_content(int i915, uint32_t bo, uint32_t size, uint32_t initcolor)
 {
 	uint32_t *ptr, *ptrtmp;
@@ -515,7 +510,7 @@ static void test_render_baseline(int i915)
 	struct intel_bb *ibb;
 	int ret;
 
-	render_copy = get_copy_func(i915);
+	render_copy = igt_get_render_copyfunc(i915);
 	igt_assert(render_copy);
 
 	bops = buf_ops_create(i915);
@@ -567,7 +562,7 @@ static void __test_render_pxp_src_to_protdest(int i915, uint32_t *outpixels, int
 	struct intel_bb *ibb;
 	int ret;
 
-	render_copy = get_copy_func(i915);
+	render_copy = igt_get_render_copyfunc(i915);
 	igt_assert(render_copy);
 
 	bops = buf_ops_create(i915);
@@ -636,7 +631,7 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
 	int ret;
 	uint32_t encrypted[TSTSURF_SIZE/TSTSURF_BYTESPP];
 
-	render_copy = get_copy_func(i915);
+	render_copy = igt_get_render_copyfunc(i915);
 	igt_assert(render_copy);
 
 	bops = buf_ops_create(i915);
@@ -727,7 +722,7 @@ static void test_pxp_dmabuffshare_refcnt(int i915)
 	int fd[2], dmabuf_fd = 0, ret, n, num_matches = 0;
 	uint32_t encrypted[2][TSTSURF_SIZE/TSTSURF_BYTESPP];
 
-	render_copy = get_copy_func(i915);
+	render_copy = igt_get_render_copyfunc(i915);
 	igt_assert(render_copy);
 
 	/* First, create the client driver handles and
@@ -1146,7 +1141,7 @@ static void setup_protected_fb(int i915, int width, int height, igt_fb_t *fb, ui
 	struct intel_bb *ibb;
 	igt_render_copyfunc_t render_copy;
 
-	render_copy = get_copy_func(i915);
+	render_copy = igt_get_render_copyfunc(i915);
 	igt_assert(render_copy);
 
 	bops = buf_ops_create(i915);
@@ -1321,7 +1316,7 @@ igt_main
 		devid = intel_get_drm_devid(i915);
 		igt_assert(devid);
 		pxp_supported = is_pxp_hw_supported(i915);
-		rendercopy = igt_get_render_copyfunc(devid);
+		rendercopy = igt_get_render_copyfunc(i915);
 	}
 
 	igt_subtest_group {
diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/gem_read_read_speed.c
index 5cf80fee6..c6095f19e 100644
--- a/tests/intel/gem_read_read_speed.c
+++ b/tests/intel/gem_read_read_speed.c
@@ -257,7 +257,7 @@ igt_main
 		devid = intel_get_drm_devid(fd);
 		igt_require(intel_gen(devid) >= 6);
 
-		rendercopy = igt_get_render_copyfunc(devid);
+		rendercopy = igt_get_render_copyfunc(fd);
 		igt_require(rendercopy);
 
 		bops = buf_ops_create(fd);
diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
index 3a46859bc..9df2ce117 100644
--- a/tests/intel/gem_render_copy.c
+++ b/tests/intel/gem_render_copy.c
@@ -862,7 +862,7 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		igt_require_gem(data.drm_fd);
 
-		data.render_copy = igt_get_render_copyfunc(data.devid);
+		data.render_copy = igt_get_render_copyfunc(data.drm_fd);
 		igt_require_f(data.render_copy,
 			      "no render-copy function\n");
 
diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
index 1971bfebd..b9961fe64 100644
--- a/tests/intel/gem_render_copy_redux.c
+++ b/tests/intel/gem_render_copy_redux.c
@@ -93,7 +93,7 @@ static void data_init(data_t *data)
 	data->devid = intel_get_drm_devid(data->fd);
 
 	data->bops = buf_ops_create(data->fd);
-	data->render_copy = igt_get_render_copyfunc(data->devid);
+	data->render_copy = igt_get_render_copyfunc(data->fd);
 	igt_require_f(data->render_copy,
 		      "no render-copy function\n");
 }
diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/gem_render_linear_blits.c
index 6a5e51c2a..5de090d1a 100644
--- a/tests/intel/gem_render_linear_blits.c
+++ b/tests/intel/gem_render_linear_blits.c
@@ -97,7 +97,7 @@ static void run_test (int fd, int count)
 	struct intel_buf *bufs;
 	int i, j;
 
-	render_copy = igt_get_render_copyfunc(intel_get_drm_devid(fd));
+	render_copy = igt_get_render_copyfunc(fd);
 	igt_require(render_copy);
 
 	bops = buf_ops_create(fd);
diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
index 892c9c42a..e33bd6890 100644
--- a/tests/intel/gem_render_tiled_blits.c
+++ b/tests/intel/gem_render_tiled_blits.c
@@ -130,7 +130,7 @@ static void run_test (int fd, int count)
 
 	devid = intel_get_drm_devid(fd);
 
-	render_copy = igt_get_render_copyfunc(devid);
+	render_copy = igt_get_render_copyfunc(fd);
 	igt_require(render_copy);
 
 	snoop = 1;
diff --git a/tests/intel/gem_stress.c b/tests/intel/gem_stress.c
index 19a33b7e7..dfdea74ce 100644
--- a/tests/intel/gem_stress.c
+++ b/tests/intel/gem_stress.c
@@ -374,7 +374,7 @@ static void render_copyfunc(struct intel_buf *src, unsigned src_x, unsigned src_
 			    unsigned logical_tile_no)
 {
 	static unsigned keep_gpu_busy_counter = 0;
-	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(devid);
+	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(drm_fd);
 
 	/* check both edges of the fence usage */
 	if (keep_gpu_busy_counter & 1)
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index d600c63a1..41fdcacab 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -1015,7 +1015,7 @@ igt_main
 		 * blitter there as well.
 		 */
 		if (intel_display_ver(data.devid) >= 4)
-			data.render_copy = igt_get_render_copyfunc(data.devid);
+			data.render_copy = igt_get_render_copyfunc(data.drm_fd);
 
 		data.bops = buf_ops_create(data.drm_fd);
 
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index ac251926b..8efa14447 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -365,7 +365,7 @@ igt_main
 		data.devid = intel_get_drm_devid(data.drm_fd);
 
 		data.bops = buf_ops_create(data.drm_fd);
-		data.rendercopy = igt_get_render_copyfunc(intel_get_drm_devid(data.drm_fd));
+		data.rendercopy = igt_get_render_copyfunc(data.drm_fd);
 	}
 
 	for (data.feature = FEATURE_DEFAULT; data.feature > 0;
diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index 5a4adfd14..07d616d90 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -138,7 +138,7 @@ update_rect_with_dirtyfb(data_t *data, struct igt_fb *fb1, struct igt_fb *fb2,
 	igt_render_copyfunc_t rendercopy;
 
 	bops = buf_ops_create(data->drm_fd);
-	rendercopy = igt_get_render_copyfunc(intel_get_drm_devid(data->drm_fd));
+	rendercopy = igt_get_render_copyfunc(data->drm_fd);
 
 	src = intel_buf_create_full(bops, fb1->gem_handle, fb1->width,
 				    fb1->height,
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index a83d90194..7fd87417c 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -427,7 +427,7 @@ static void fill_render(data_t *data, const struct igt_fb *fb,
 	struct intel_buf *src, *dst;
 	struct intel_bb *ibb;
 	const uint8_t buf[4] = { color, color, color, color };
-	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(data->devid);
+	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(data->drm_fd);
 	int height, width, tiling;
 
 	igt_skip_on(!rendercopy);
@@ -917,7 +917,7 @@ igt_main
 					igt_display_reset(&data.display);
 					data.output = output;
 					igt_dynamic_f("%s", data.output->name) {
-						data.op = igt_get_render_copyfunc(data.devid) ?
+						data.op = igt_get_render_copyfunc(data.drm_fd) ?
 										  RENDER : BLT;
 						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 						test_setup(&data);
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index a6e6e970d..1f106bed8 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -5909,7 +5909,7 @@ igt_main
 		igt_assert(perf_oa_groups && num_perf_oa_groups);
 
 		if (has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0))
-			render_copy = igt_get_render_copyfunc(devid);
+			render_copy = igt_get_render_copyfunc(drm_fd);
 	}
 
 	igt_subtest("non-system-wide-paranoid")
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 845052bf2..d8bd7b519 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -897,7 +897,7 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 			       0, 0, width, height,
 			       0, 0, width, height, 0);
 
-	render_copy = igt_get_render_copyfunc(devid);
+	render_copy = igt_get_render_copyfunc(xe);
 	igt_assert(render_copy);
 
 	render_copy(ibb,
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index b355ba58e..caf713c2a 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4712,7 +4712,7 @@ igt_main
 
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
 
-		render_copy = igt_get_render_copyfunc(devid);
+		render_copy = igt_get_render_copyfunc(drm_fd);
 	}
 
 	igt_subtest("non-system-wide-paranoid")
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 1322df349..88d8de9dd 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -363,7 +363,6 @@ static void pat_index_blt(struct xe_pat_param *p)
 static void pat_index_render(struct xe_pat_param *p)
 {
 	int fd = p->fd;
-	uint32_t devid = intel_get_drm_devid(fd);
 	igt_render_copyfunc_t render_copy = NULL;
 	int size, stride, width = p->size->width, height = p->size->height;
 	struct intel_buf src, dst;
@@ -372,7 +371,7 @@ static void pat_index_render(struct xe_pat_param *p)
 	int bpp = 32;
 	int i;
 
-	render_copy = igt_get_render_copyfunc(devid);
+	render_copy = igt_get_render_copyfunc(fd);
 	igt_require(render_copy);
 	igt_require(xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER));
 
@@ -754,7 +753,7 @@ static void display_vs_wb_transient(int fd)
 
 	igt_require(intel_get_device_info(devid)->graphics_ver >= 20);
 
-	render_copy = igt_get_render_copyfunc(devid);
+	render_copy = igt_get_render_copyfunc(fd);
 	igt_require(render_copy);
 	igt_require(xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER));
 
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index ffe5f7ef1..a9a3821ab 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -266,7 +266,6 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	struct intel_buf src, dst, final, grfs;
 	int xe = buf_ops_get_fd(bops);
 	uint32_t fails = 0;
-	uint32_t devid = intel_get_drm_devid(xe);
 	igt_render_copyfunc_t render_copy = NULL;
 	int compression = testtype == COPY_FULL_COMPRESSED ? I915_COMPRESSION_RENDER :
 							     I915_COMPRESSION_NONE;
@@ -326,7 +325,7 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 			       0, 0, width, height,
 			       0, 0, width, height, 0);
 
-	render_copy = igt_get_render_copyfunc(devid);
+	render_copy = igt_get_render_copyfunc(xe);
 	igt_assert(render_copy);
 
 	switch (testtype) {
diff --git a/tools/intel_tiling_detect.c b/tools/intel_tiling_detect.c
index 63dc9d3c0..951e2eecd 100644
--- a/tools/intel_tiling_detect.c
+++ b/tools/intel_tiling_detect.c
@@ -236,7 +236,7 @@ static void render(int fd, uint32_t width, uint32_t height, uint32_t tiling)
 	memcpy(src.ptr, refs[0].ptr, src.bo_size);
 	intel_buf_unmap(&src);
 
-	render_copy = igt_get_render_copyfunc(devid);
+	render_copy = igt_get_render_copyfunc(fd);
 	igt_assert(render_copy);
 
 	render_copy(ibb,
-- 
2.34.1

