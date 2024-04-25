Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEED9C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 10:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B08E10E2A5;
	Thu, 25 Apr 2024 10:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lu21oiBi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314D010E2A5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 10:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714042076; x=1745578076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JEeXkjUPAhkKUUdz9tysx6XvMA9q5qPaLDsbyLe6YMA=;
 b=Lu21oiBip589evmDom6rJc3vvZ70hcRSh5DZ+7DFSVfPCq9khIShJAb6
 nwVilJKSbZ043E1lfTJc0EmxV0L9jmY3GCEihdVWreU8GxA90zUlcZHnT
 vBSYi0fJkgv18ivWeHoKgHcLV5bIFL/83rmJZi0iHoOMM63rNmyAbC2LI
 cMVG4IYamjGZ5rPSWMhkXZeyT8Yz2+1iwWz3izjxdmTfvDaQ1nf1UnBDl
 5YF6tS0GFMD1undHi1lTIZwsvbp2OcCyP3LbCbpYS/zOf3+7ea794E5jK
 mv/aj2cjlNyLmE8xLYZVstUC0aNGNshO/hsGjrg0SubhhFr70rJVIKSML Q==;
X-CSE-ConnectionGUID: 1EV13WXjSbKqK0pRruRmMQ==
X-CSE-MsgGUID: Tt5QeH83QxuktQ/vaio4OQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="32209712"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="32209712"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:56 -0700
X-CSE-ConnectionGUID: loD4lAGIT22EDDsTY4pdlA==
X-CSE-MsgGUID: 4MtaHgJ+S+KtiJi+VxHUcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25018145"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:55 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 7/7] tests/xe_render_copy: Add subtest which exercises
 compression
Date: Thu, 25 Apr 2024 12:47:21 +0200
Message-Id: <20240425104721.52376-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
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
render-copy to and from compressed surface. DG2 doesn't support
linear and x so bypass those tilings.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_render_copy.c | 69 +++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index ef75c4ce6d..19f7f7ee60 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -37,6 +37,10 @@
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
@@ -56,9 +60,13 @@ static void scratch_buf_init(struct buf_ops *bops,
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
@@ -120,6 +128,41 @@ static int compare_bufs(struct intel_buf *buf1, struct intel_buf *buf2,
 	return ret;
 }
 
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
+	intel_ctx_t *ctx;
+	bool is_compressed;
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
@@ -176,6 +219,7 @@ enum render_copy_testtype {
 	COPY_HSTRIPES,
 	COPY_RANDOM,
 	COPY_FULL,
+	COPY_FULL_COMPRESSED,
 };
 
 static const char * const testname[] = {
@@ -184,6 +228,7 @@ static const char * const testname[] = {
 	[COPY_HSTRIPES]	= "hstripes",
 	[COPY_RANDOM]	= "random",
 	[COPY_FULL]	= "full",
+	[COPY_FULL_COMPRESSED] = "full-compressed",
 };
 
 static int render(struct buf_ops *bops, uint32_t tiling,
@@ -196,6 +241,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	uint32_t fails = 0;
 	uint32_t devid = intel_get_drm_devid(xe);
 	igt_render_copyfunc_t render_copy = NULL;
+	int compression = testtype == COPY_FULL_COMPRESSED ? I915_COMPRESSION_RENDER :
+							     I915_COMPRESSION_NONE;
+	bool is_compressed;
 	struct posrc {
 		uint32_t x0, y0;
 		uint32_t x1, y1;
@@ -241,7 +289,7 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	scratch_buf_init(bops, &src, width, height, I915_TILING_NONE,
 			 I915_COMPRESSION_NONE);
 	scratch_buf_init(bops, &dst, width, height, tiling,
-			 I915_COMPRESSION_NONE);
+			 compression);
 	scratch_buf_init(bops, &final, width, height, I915_TILING_NONE,
 			 I915_COMPRESSION_NONE);
 	scratch_buf_init(bops, &grfs, 64, height * 4, I915_TILING_NONE,
@@ -317,6 +365,7 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 
 
 	case COPY_FULL:
+	case COPY_FULL_COMPRESSED:
 		render_copy(ibb,
 			    &src, 0, 0, width, height,
 			    &dst, 0, 0);
@@ -339,7 +388,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 					   tiling, width, height);
 	}
 
-	fails = compare_bufs(&src, &final, true);
+	fails = compare_bufs(&src, &final, false);
+	if (compression == I915_COMPRESSION_RENDER)
+		is_compressed = buf_is_compressed(bops, &dst);
 
 	intel_buf_close(bops, &src);
 	intel_buf_close(bops, &dst);
@@ -347,6 +398,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 
 	igt_assert_f(fails == 0, "%s: (tiling: %d) fails: %d\n",
 		     __func__, tiling, fails);
+	if (compression == I915_COMPRESSION_RENDER && blt_platform_has_flat_ccs_enabled(xe))
+		igt_assert_f(is_compressed, "%s: (tiling: %d) buffer is not compressed\n",
+			     __func__, tiling);
 
 	return fails;
 }
@@ -390,15 +444,17 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 	int xe;
 	struct buf_ops *bops;
 	const char *tiling_name;
+	uint32_t devid;
 	int tiling;
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
 		bops = buf_ops_create(xe);
 		srand(time(NULL));
+		devid = intel_get_drm_devid(xe);
 	}
 
-	for (int id = 0; id <= COPY_FULL; id++) {
+	for (int id = 0; id <= COPY_FULL_COMPRESSED; id++) {
 		igt_subtest_with_dynamic_f("render-%s", testname[id]) {
 			igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
 
@@ -406,6 +462,11 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 				if (!blt_block_copy_supports_tiling(xe, tiling))
 					continue;
 
+				/* On DG2 compression works only with TILE4 and TILE64 */
+				if (id == COPY_FULL_COMPRESSED && IS_DG2(devid) &&
+					(tiling != T_TILE4 && tiling != T_TILE64))
+					continue;
+
 				tiling_name = blt_tiling_name(tiling);
 				tiling = blt_tile_to_i915_tile(tiling);
 				igt_dynamic_f("render-%s-%ux%u", tiling_name, surfwidth, surfheight)
-- 
2.34.1

