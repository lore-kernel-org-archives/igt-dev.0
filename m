Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C7E89AB6
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 22:57:18 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Tue,  2 Mar 2021 14:53:30 -0800
Message-Id: <20210302225334.361966-8-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 07/11] Add subtest to copy raw source to
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
 tests/i915/i915_pxp.c | 48 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/i915/i915_pxp.c b/tests/i915/i915_pxp.c
index f12ca3d5..e36da7ec 100644
--- a/tests/i915/i915_pxp.c
+++ b/tests/i915/i915_pxp.c
@@ -429,7 +429,9 @@ static uint32_t alloc_and_fill_dest_buff(int i915, bool protected,
 #define TSTSURF_STRIDE      (TSTSURF_WIDTH*TSTSURF_BYTESPP)
 #define TSTSURF_SIZE        (TSTSURF_STRIDE*TSTSURF_HEIGHT)
 #define TSTSURF_FILLCOLOR1  0xfaceface
+#define TSTSURF_FILLCOLOR2  0xdeaddead
 #define TSTSURF_INITCOLOR1  0x12341234
+#define TSTSURF_INITCOLOR2  0x56785678
 
 static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 {
@@ -488,6 +490,49 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 		gem_context_destroy(i915, ctx);
 		break;
 
+	case COPY3D_PROTECTED_SRC_TO_PROTDST:
+		/* Perform a protected render operation but only label
+		 * the dest as protected. After rendering, the content
+		 * should be encrypted
+		 */
+		ctx = create_protected_ctx(i915, true, true,
+			true, false, 0);
+		assert_ctx_protected_param(i915, ctx, true);
+
+		dstbo = alloc_and_fill_dest_buff(i915, true,
+				TSTSURF_SIZE, TSTSURF_INITCOLOR2);
+		dstbuf = intel_buf_create_using_handle(bops, dstbo,
+				TSTSURF_WIDTH, TSTSURF_HEIGHT,
+				TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+		dstbuf->is_protected = true;
+
+		srcbo = alloc_and_fill_dest_buff(i915, false,
+				TSTSURF_SIZE, TSTSURF_FILLCOLOR2);
+		srcbuf = intel_buf_create_using_handle(bops, srcbo,
+				TSTSURF_WIDTH, TSTSURF_HEIGHT,
+				TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+
+		ibb = intel_bb_create_with_context(i915, ctx, 4096);
+		igt_assert(ibb);
+
+		ibb->pxp.enabled = true;
+		ibb->pxp.apptype = DISPLAY_APPTYPE;
+		ibb->pxp.appid = I915_PROTECTED_CONTENT_DEFAULT_SESSION;
+
+		gen12_render_copyfunc(ibb, srcbuf, 0, 0,
+			TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
+		gem_sync(i915, dstbo);
+
+		assert_bo_content_check(i915, dstbo, COMPARE_COLOR_UNREADIBLE,
+			TSTSURF_SIZE, TSTSURF_FILLCOLOR2);
+
+		intel_bb_destroy(ibb);
+		intel_buf_destroy(srcbuf);
+		gem_close(i915, srcbo);
+		intel_buf_destroy(dstbuf);
+		gem_close(i915, dstbo);
+		gem_context_destroy(i915, ctx);
+		break;
 	default:
 		igt_info("Skipping unknown render test_cfg = %d\n",
 			test_cfg);
@@ -583,6 +628,9 @@ igt_main
 		igt_subtest("regular-baseline-src-copy-readible")
 			test_render_protected_buffer(i915,
 				COPY3D_BASELINE_SRC_TO_DST);
+		igt_subtest("protected-raw-src-copy-not-readible")
+			test_render_protected_buffer(i915,
+				COPY3D_PROTECTED_SRC_TO_PROTDST);
 	}
 
 	igt_fixture {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
