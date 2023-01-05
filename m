Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A042B10E7F5
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jan 2023 19:11:15 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Jan 2023 11:11:11 -0800
Message-Id: <20230105191111.1157494-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/i915/pxp: Always use igt helper
 to get the render function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In preparation for future HW and be consistent with other tests,
add a local helper code to use igt's helper to get the render
function ptr. While here, remove unncessary local variables.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 55 ++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 41043df9..8c141ddd 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -306,6 +306,11 @@ static void test_ctx_mod_protected_to_all_invalid(int i915)
 	gem_context_destroy(i915, ctx);
 }
 
+static igt_render_copyfunc_t get_copy_func(int i915)
+{
+	return igt_get_render_copyfunc(intel_get_drm_devid(i915));
+}
+
 static void fill_bo_content(int i915, uint32_t bo, uint32_t size, uint32_t initcolor)
 {
 	uint32_t *ptr, *ptrtmp;
@@ -441,15 +446,15 @@ static uint32_t alloc_and_fill_dest_buff(int i915, bool protected, uint32_t size
 
 static void test_render_baseline(int i915)
 {
+	igt_render_copyfunc_t render_copy;
 	uint32_t ctx, srcbo, dstbo;
 	struct intel_buf *srcbuf, *dstbuf;
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
-	uint32_t devid;
 	int ret;
 
-	devid = intel_get_drm_devid(i915);
-	igt_assert(devid);
+	render_copy = get_copy_func(i915);
+	igt_assert(render_copy);
 
 	bops = buf_ops_create(i915);
 	igt_assert(bops);
@@ -468,7 +473,7 @@ static void test_render_baseline(int i915)
 	srcbuf = intel_buf_create_using_handle(bops, srcbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
 					       TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
 
-	gen12_render_copyfunc(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
+	render_copy(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
 	gem_sync(i915, dstbo);
 
 	assert_bo_content_check(i915, dstbo, COMPARE_COLOR_READIBLE,
@@ -485,15 +490,15 @@ static void test_render_baseline(int i915)
 
 static void __test_render_pxp_src_to_protdest(int i915, uint32_t *outpixels, int outsize)
 {
+	igt_render_copyfunc_t render_copy;
 	uint32_t ctx, srcbo, dstbo;
 	struct intel_buf *srcbuf, *dstbuf;
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
-	uint32_t devid;
 	int ret;
 
-	devid = intel_get_drm_devid(i915);
-	igt_assert(devid);
+	render_copy = get_copy_func(i915);
+	igt_assert(render_copy);
 
 	bops = buf_ops_create(i915);
 	igt_assert(bops);
@@ -519,7 +524,7 @@ static void __test_render_pxp_src_to_protdest(int i915, uint32_t *outpixels, int
 	srcbuf = intel_buf_create_using_handle(bops, srcbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
 						TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
 
-	gen12_render_copyfunc(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
+	render_copy(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
 	gem_sync(i915, dstbo);
 
 	assert_bo_content_check(i915, dstbo, COMPARE_COLOR_UNREADIBLE,
@@ -545,16 +550,16 @@ static void test_render_pxp_src_to_protdest(int i915)
 
 static void test_render_pxp_protsrc_to_protdest(int i915)
 {
+	igt_render_copyfunc_t render_copy;
 	uint32_t ctx, srcbo, dstbo, dstbo2;
 	struct intel_buf *srcbuf, *dstbuf, *dstbuf2;
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
-	uint32_t devid;
 	int ret;
 	uint32_t encrypted[TSTSURF_SIZE/TSTSURF_BYTESPP];
 
-	devid = intel_get_drm_devid(i915);
-	igt_assert(devid);
+	render_copy = get_copy_func(i915);
+	igt_assert(render_copy);
 
 	bops = buf_ops_create(i915);
 	igt_assert(bops);
@@ -580,7 +585,7 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
 	srcbuf = intel_buf_create_using_handle(bops, srcbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
 						TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
 
-	gen12_render_copyfunc(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
+	render_copy(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
 	gem_sync(i915, dstbo);
 
 	assert_bo_content_check(i915, dstbo, COMPARE_COLOR_UNREADIBLE,
@@ -605,7 +610,7 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
 
 	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, I915_PROTECTED_CONTENT_DEFAULT_SESSION);
 
-	gen12_render_copyfunc(ibb, dstbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf2, 0, 0);
+	render_copy(ibb, dstbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf2, 0, 0);
 	gem_sync(i915, dstbo2);
 
 	assert_bo_content_check(i915, dstbo2, COMPARE_BUFFER_READIBLE,
@@ -622,8 +627,9 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
 	buf_ops_destroy(bops);
 }
 
-static void test_pxp_dmabuffshare_refcnt(void)
+static void test_pxp_dmabuffshare_refcnt(int i915)
 {
+	igt_render_copyfunc_t render_copy;
 	uint32_t ctx[2], sbo[2], dbo[2];
 	struct intel_buf *sbuf[2], *dbuf[2];
 	struct buf_ops *bops[2];
@@ -631,6 +637,9 @@ static void test_pxp_dmabuffshare_refcnt(void)
 	int fd[2], dmabuf_fd = 0, ret, n, num_matches = 0;
 	uint32_t encrypted[2][TSTSURF_SIZE/TSTSURF_BYTESPP];
 
+	render_copy = get_copy_func(i915);
+	igt_assert(render_copy);
+
 	/* First, create the client driver handles and
 	 * protected dest buffer (is exported via dma-buff
 	 * from first handle and imported to the second).
@@ -673,8 +682,8 @@ static void test_pxp_dmabuffshare_refcnt(void)
 							TSTSURF_HEIGHT, TSTSURF_BYTESPP*8, 0,
 							I915_TILING_NONE, 0);
 
-		gen12_render_copyfunc(ibb[n], sbuf[n], 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT,
-				      dbuf[n], 0, 0);
+		render_copy(ibb[n], sbuf[n], 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT,
+			    dbuf[n], 0, 0);
 		gem_sync(fd[n], dbo[n]);
 
 		assert_bo_content_check(fd[n], dbo[n], COMPARE_COLOR_UNREADIBLE, TSTSURF_SIZE,
@@ -1011,14 +1020,10 @@ static void setup_protected_fb(int i915, int width, int height, igt_fb_t *fb, ui
 	struct intel_buf *srcbuf, *dstbuf;
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
-	uint32_t devid;
-	igt_render_copyfunc_t rendercopy;
-
-	devid = intel_get_drm_devid(i915);
-	igt_assert(devid);
+	igt_render_copyfunc_t render_copy;
 
-	rendercopy = igt_get_render_copyfunc(devid);
-	igt_assert(rendercopy);
+	render_copy = get_copy_func(i915);
+	igt_assert(render_copy);
 
 	bops = buf_ops_create(i915);
 	igt_assert(bops);
@@ -1058,7 +1063,7 @@ static void setup_protected_fb(int i915, int width, int height, igt_fb_t *fb, ui
 	ibb->pxp.apptype = DISPLAY_APPTYPE;
 	ibb->pxp.appid = I915_PROTECTED_CONTENT_DEFAULT_SESSION;
 
-	gen12_render_copyfunc(ibb, srcbuf, 0, 0, fb->width, fb->height, dstbuf, 0, 0);
+	render_copy(ibb, srcbuf, 0, 0, fb->width, fb->height, dstbuf, 0, 0);
 
 	gem_sync(i915, fb->gem_handle);
 	assert_bo_content_check(i915, fb->gem_handle, COMPARE_COLOR_UNREADIBLE, fb->size,
@@ -1229,7 +1234,7 @@ igt_main
 		igt_subtest("protected-encrypted-src-copy-not-readible")
 			test_render_pxp_protsrc_to_protdest(i915);
 		igt_subtest("dmabuf-shared-protected-dst-is-context-refcounted")
-			test_pxp_dmabuffshare_refcnt();
+			test_pxp_dmabuffshare_refcnt(i915);
 	}
 	igt_subtest_group {
 		igt_fixture {

base-commit: db10a19b94d1d7ae5ba62eb48d52c47ccb27766f
-- 
2.39.0
