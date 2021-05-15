Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C086E463
 for <igt-dev@lists.freedesktop.org>; Sat, 15 May 2021 23:01:48 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Sat, 15 May 2021 16:01:34 -0700
Message-Id: <20210515230142.1816456-10-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
References: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 09/17] Add subtest to copy raw source to
 protected dest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add subtest to 3d-copy raw source buffer (with
known readible content) to a destination buffer
marked as protected with a protected session using
default session keys. The destination buffer is
verified to be different from the source (when
read via CPU) because its encrypted.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 55 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 339d4347..435e879b 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -404,7 +404,9 @@ static uint32_t alloc_and_fill_dest_buff(int i915, bool protected, uint32_t size
 #define TSTSURF_STRIDE      (TSTSURF_WIDTH*TSTSURF_BYTESPP)
 #define TSTSURF_SIZE        (TSTSURF_STRIDE*TSTSURF_HEIGHT)
 #define TSTSURF_FILLCOLOR1  0xfaceface
+#define TSTSURF_FILLCOLOR2  0xdeaddead
 #define TSTSURF_INITCOLOR1  0x12341234
+#define TSTSURF_INITCOLOR2  0x56785678
 
 static void test_render_baseline(int i915)
 {
@@ -450,6 +452,57 @@ static void test_render_baseline(int i915)
 	buf_ops_destroy(bops);
 }
 
+static void test_render_pxp_src_to_protdest(int i915)
+{
+	uint32_t ctx, srcbo, dstbo;
+	struct intel_buf *srcbuf, *dstbuf;
+	struct buf_ops *bops;
+	struct intel_bb *ibb;
+	uint32_t devid;
+	int ret;
+
+	devid = intel_get_drm_devid(i915);
+	igt_assert(devid);
+
+	bops = buf_ops_create(i915);
+	igt_assert(bops);
+
+	/*
+	 * Perform a protected render operation but only label
+	 * the dest as protected. After rendering, the content
+	 * should be encrypted
+	 */
+	ret = create_ctx_with_params(i915, true, true, true, false, &ctx);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
+	ibb = intel_bb_create_with_context(i915, ctx, 4096);
+	igt_assert(ibb);
+	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, I915_PROTECTED_CONTENT_DEFAULT_SESSION);
+
+	dstbo = alloc_and_fill_dest_buff(i915, true, TSTSURF_SIZE, TSTSURF_INITCOLOR2);
+	dstbuf = intel_buf_create_using_handle(bops, dstbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
+						TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+	intel_buf_set_pxp(dstbuf, true);
+
+	srcbo = alloc_and_fill_dest_buff(i915, false, TSTSURF_SIZE, TSTSURF_FILLCOLOR2);
+	srcbuf = intel_buf_create_using_handle(bops, srcbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
+						TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+
+	gen12_render_copyfunc(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
+	gem_sync(i915, dstbo);
+
+	assert_bo_content_check(i915, dstbo, COMPARE_COLOR_UNREADIBLE,
+				TSTSURF_SIZE, TSTSURF_FILLCOLOR2);
+
+	intel_bb_destroy(ibb);
+	intel_buf_destroy(srcbuf);
+	gem_close(i915, srcbo);
+	intel_buf_destroy(dstbuf);
+	gem_close(i915, dstbo);
+	gem_context_destroy(i915, ctx);
+	buf_ops_destroy(bops);
+}
+
 igt_main
 {
 	int i915 = -1;
@@ -521,6 +574,8 @@ igt_main
 		igt_describe("Verify protected render operations:");
 		igt_subtest("regular-baseline-src-copy-readible")
 			test_render_baseline(i915);
+		igt_subtest("protected-raw-src-copy-not-readible")
+			test_render_pxp_src_to_protdest(i915);
 	}
 
 	igt_fixture {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
