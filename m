Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D32C25B79
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 12:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE6210E213;
	Wed, 15 May 2024 12:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdYWFplA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F5310E213
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 12:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715775627; x=1747311627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=diMbeqlLu4ZGw6FuFsKZmNLXKoP094bJD0SqPtDAfKw=;
 b=mdYWFplAvXMI0Qe1onDzwVGFAOKeffJ7efwgsQbkiBBii5EIAvIdDEe7
 9FWooWMi8GZUeipbRiDc2wkvOotwtshV0M6iLoQ4I4u2hog7khgWsiKDP
 ckGs+Nn1t7d+im0HP2jN/QJcZEbjlu+dObpkfYYYwMtTkCzgCp2ifGg5A
 RlelJJ/AcpuEOM17L3EwXWsrITHBdTCG0Ke9uf7aoRBYw08gDopXL3+X9
 ZJQ4EpBa5cHxaaYWa0Lswj8tTgzWGY3tRG/5vg5vO953x2KG6gub9c0ge
 j8qisjw8Ewh9mAWcNxztoGBmBzG3iE6Rvc+HCUYLmbfYO1lqu2oAk+MGZ w==;
X-CSE-ConnectionGUID: DJhUsJu7Q5G+LBlQfulg5g==
X-CSE-MsgGUID: lhQzRPAsTr6j9uYIfRdfLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="12036173"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="12036173"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:26 -0700
X-CSE-ConnectionGUID: r0ukUyADSp2TpDbeFbx0bg==
X-CSE-MsgGUID: 8pvtgbVWTICA1zESPuvvLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="31039774"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:26 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v6 8/9] tests/xe_render_copy: Add subtest which
 exercises compression
Date: Wed, 15 May 2024 14:19:48 +0200
Message-Id: <20240515121949.245280-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
References: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
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

Add subtest which iterates over all supported tilings and does
render-copy to and from compressed surface.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/xe_render_copy.c | 91 ++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index a6096664c0..978441afaa 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -38,6 +38,10 @@
  *
  * SUBTEST: render-full
  * Description: Copy surface using 3d engine (1:1)
+ *
+ * SUBTEST: render-full-compressed
+ * Description: Copy surface using 3d engine (1:1) when intermediate surface
+ *              is compressed
  */
 #define WIDTH	256
 #define HEIGHT	256
@@ -57,9 +61,13 @@ static void scratch_buf_init(struct buf_ops *bops,
 {
 	int fd = buf_ops_get_fd(bops);
 	int bpp = 32;
+	uint64_t region = system_memory(fd);
+
+	if (compression && xe_has_vram(fd))
+		region = vram_memory(fd, 0);
 
 	intel_buf_init_in_region(bops, buf, width, height, bpp, 0,
-				 req_tiling, compression, system_memory(fd));
+				 req_tiling, compression, region);
 
 	igt_assert(intel_buf_width(buf) == width);
 	igt_assert(intel_buf_height(buf) == height);
@@ -121,6 +129,67 @@ static int compare_bufs(struct intel_buf *buf1, struct intel_buf *buf2,
 	return ret;
 }
 
+static bool buf_is_aux_compressed(struct buf_ops *bops, struct intel_buf *buf)
+{
+	int xe = buf_ops_get_fd(bops);
+	unsigned int gen = intel_gen(buf_ops_get_devid(bops));
+	uint32_t ccs_size;
+	uint8_t *ptr;
+	bool is_compressed = false;
+
+	igt_assert_neq(buf->ccs[0].offset, 0);
+
+	ccs_size = intel_buf_ccs_width(gen, buf) * intel_buf_ccs_height(gen, buf);
+	ptr = xe_bo_map(xe, buf->handle, buf->size);
+	for (int i = 0; i < ccs_size; i++)
+		if (ptr[buf->ccs[0].offset + i] != 0) {
+			is_compressed = true;
+			break;
+		}
+	munmap(ptr, buf->size);
+
+	return is_compressed;
+}
+
+static bool buf_is_compressed(struct buf_ops *bops, struct intel_buf *buf)
+{
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+	int xe = buf_ops_get_fd(bops);
+	struct blt_copy_object obj;
+	uint64_t ahnd;
+	uint32_t vm, exec_queue;
+	uint32_t tiling = i915_tile_to_blt_tile(buf->tiling);
+	uint32_t devid = buf_ops_get_devid(bops);
+	intel_ctx_t *ctx;
+	bool is_compressed;
+
+	if (!HAS_FLATCCS(devid))
+		return buf_is_aux_compressed(bops, buf);
+
+	vm = xe_vm_create(xe, 0, 0);
+	exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
+	ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
+	ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
+
+	blt_set_object(&obj, buf->handle,
+		       buf->size, buf->region, buf->mocs_index,
+		       buf->pat_index, tiling,
+		       buf->compression ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
+		       COMPRESSION_TYPE_3D);
+	blt_set_geom(&obj, buf->surface[0].stride, 0, 0, buf->width, buf->height, 0, 0);
+
+	is_compressed = blt_surface_is_compressed(xe, ctx, NULL, ahnd, &obj);
+
+	xe_exec_queue_destroy(xe, exec_queue);
+	xe_vm_destroy(xe, vm);
+	put_ahnd(ahnd);
+	free(ctx);
+
+	return is_compressed;
+}
+
 /*
  *
  * Scenarios implemented are presented below. We copy from linear to and forth
@@ -177,6 +246,7 @@ enum render_copy_testtype {
 	COPY_HSTRIPES,
 	COPY_RANDOM,
 	COPY_FULL,
+	COPY_FULL_COMPRESSED,
 };
 
 static const char * const testname[] = {
@@ -185,6 +255,7 @@ static const char * const testname[] = {
 	[COPY_HSTRIPES]	= "hstripes",
 	[COPY_RANDOM]	= "random",
 	[COPY_FULL]	= "full",
+	[COPY_FULL_COMPRESSED] = "full-compressed",
 };
 
 static int render(struct buf_ops *bops, uint32_t tiling,
@@ -197,6 +268,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	uint32_t fails = 0;
 	uint32_t devid = intel_get_drm_devid(xe);
 	igt_render_copyfunc_t render_copy = NULL;
+	int compression = testtype == COPY_FULL_COMPRESSED ? I915_COMPRESSION_RENDER :
+							     I915_COMPRESSION_NONE;
+	bool is_compressed;
 	struct posrc {
 		uint32_t x0, y0;
 		uint32_t x1, y1;
@@ -242,7 +316,7 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	scratch_buf_init(bops, &src, width, height, I915_TILING_NONE,
 			 I915_COMPRESSION_NONE);
 	scratch_buf_init(bops, &dst, width, height, tiling,
-			 I915_COMPRESSION_NONE);
+			 compression);
 	scratch_buf_init(bops, &final, width, height, I915_TILING_NONE,
 			 I915_COMPRESSION_NONE);
 	scratch_buf_init(bops, &grfs, 64, height * 4, I915_TILING_NONE,
@@ -318,6 +392,7 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 
 
 	case COPY_FULL:
+	case COPY_FULL_COMPRESSED:
 		render_copy(ibb,
 			    &src, 0, 0, width, height,
 			    &dst, 0, 0);
@@ -340,7 +415,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 					   tiling, width, height);
 	}
 
-	fails = compare_bufs(&src, &final, true);
+	fails = compare_bufs(&src, &final, false);
+	if (compression == I915_COMPRESSION_RENDER)
+		is_compressed = buf_is_compressed(bops, &dst);
 
 	intel_buf_close(bops, &src);
 	intel_buf_close(bops, &dst);
@@ -348,6 +425,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 
 	igt_assert_f(fails == 0, "%s: (tiling: %d) fails: %d\n",
 		     __func__, tiling, fails);
+	if (compression == I915_COMPRESSION_RENDER && blt_platform_has_flat_ccs_enabled(xe))
+		igt_assert_f(is_compressed, "%s: (tiling: %d) buffer is not compressed\n",
+			     __func__, tiling);
 
 	return fails;
 }
@@ -399,12 +479,13 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 		srand(time(NULL));
 	}
 
-	for (int id = 0; id <= COPY_FULL; id++) {
+	for (int id = 0; id <= COPY_FULL_COMPRESSED; id++) {
 		igt_subtest_with_dynamic_f("render-%s", testname[id]) {
 			igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
 
 			for_each_tiling(tiling) {
-				if (!blt_block_copy_supports_tiling(xe, tiling))
+				if (!render_supports_tiling(xe, tiling,
+							    id == COPY_FULL_COMPRESSED))
 					continue;
 
 				tiling_name = blt_tiling_name(tiling);
-- 
2.34.1

