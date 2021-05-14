Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951B46EE11
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 06:50:10 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Thu, 13 May 2021 23:49:45 -0700
Message-Id: <20210514064953.1644250-9-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
References: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 08/16] Add subtest to copy raw source to
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
 tests/i915/gem_pxp.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 94655c27..cd839527 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -393,7 +393,9 @@ static uint32_t alloc_and_fill_dest_buff(int i915, bool protected, uint32_t size
 #define TSTSURF_STRIDE      (TSTSURF_WIDTH*TSTSURF_BYTESPP)
 #define TSTSURF_SIZE        (TSTSURF_STRIDE*TSTSURF_HEIGHT)
 #define TSTSURF_FILLCOLOR1  0xfaceface
+#define TSTSURF_FILLCOLOR2  0xdeaddead
 #define TSTSURF_INITCOLOR1  0x12341234
+#define TSTSURF_INITCOLOR2  0x56785678
 
 static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 {
@@ -440,6 +442,42 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 		gem_context_destroy(i915, ctx);
 		break;
 
+	case COPY3D_PROTECTED_SRC_TO_PROTDST:
+		/* Perform a protected render operation but only label
+		 * the dest as protected. After rendering, the content
+		 * should be encrypted
+		 */
+		ctx = create_protected_ctx(i915, true, true, true, false, 0);
+		assert_ctx_protected_param(i915, ctx, true);
+
+		dstbo = alloc_and_fill_dest_buff(i915, true, TSTSURF_SIZE, TSTSURF_INITCOLOR2);
+		dstbuf = intel_buf_create_using_handle(bops, dstbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
+							TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+		intel_buf_set_pxp(dstbuf, true);
+
+		srcbo = alloc_and_fill_dest_buff(i915, false, TSTSURF_SIZE, TSTSURF_FILLCOLOR2);
+		srcbuf = intel_buf_create_using_handle(bops, srcbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
+							TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+
+		ibb = intel_bb_create_with_context(i915, ctx, 4096);
+		igt_assert(ibb);
+
+		intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, I915_PROTECTED_CONTENT_DEFAULT_SESSION);
+
+		gen12_render_copyfunc(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
+		gem_sync(i915, dstbo);
+
+		assert_bo_content_check(i915, dstbo, COMPARE_COLOR_UNREADIBLE,
+					TSTSURF_SIZE, TSTSURF_FILLCOLOR2);
+
+		intel_bb_destroy(ibb);
+		intel_buf_destroy(srcbuf);
+		gem_close(i915, srcbo);
+		intel_buf_destroy(dstbuf);
+		gem_close(i915, dstbo);
+		gem_context_destroy(i915, ctx);
+		break;
+
 	default:
 		igt_info("Skipping unknown render test_cfg = %d\n", test_cfg);
 		break;
@@ -520,6 +558,8 @@ igt_main
 		igt_describe("Verify protected render operations:");
 		igt_subtest("regular-baseline-src-copy-readible")
 			test_render_protected_buffer(i915, COPY3D_BASELINE_SRC_TO_DST);
+		igt_subtest("protected-raw-src-copy-not-readible")
+			test_render_protected_buffer(i915, COPY3D_PROTECTED_SRC_TO_PROTDST);
 	}
 
 	igt_fixture {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
