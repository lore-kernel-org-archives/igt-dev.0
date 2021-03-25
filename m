Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DE36EB26
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 05:45:53 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Wed, 24 Mar 2021 22:45:42 -0700
Message-Id: <20210325054549.465386-9-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
References: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 08/15] Add test where both src and dest
 are protected
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

When both the source and destination surfaces are
protected, the destination pixel result of the 3d
copy operation would be the same as the source. By
appending this test case to the end of the prior
test (raw-src to protected-dest) and reusing the
previous' test destination as the current source,
we can prove that new-source was decrypted properly
as we would see the difference in results: repeating
the same render operation but with a src buffer
that is protected in this case yields matching
(but still encrypted) output rendered pixels.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 117 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 104 insertions(+), 13 deletions(-)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 825edbf1..e5d8e1f7 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -358,29 +358,52 @@ static void fill_bo_content(int i915, uint32_t bo,
 
 #define COMPARE_COLOR_READIBLE     1
 #define COMPARE_COLOR_UNREADIBLE   2
+#define COMPARE_BUFFER_READIBLE    3
+#define COMPARE_BUFFER_UNREADIBLE  4
+#define COPY_BUFFER                5
+
 #define COMPARE_N_PIXELS_VERBOSELY 0
 static void assert_bo_content_check(int i915, uint32_t bo,
-	int compare_op, uint32_t size, uint32_t color)
+	int compare_op, uint32_t size, uint32_t color, uint32_t *auxptr, int auxsize)
 {
-	uint32_t *ptr, *ptrtmp;
+	uint32_t *ptr, *ptrtmp, *auxtmp;
 	int loop = 0, num_matches = 0;
 	uint32_t value;
-	bool op_readible = (compare_op == COMPARE_COLOR_READIBLE);
+	bool op_readible = ((compare_op == COMPARE_COLOR_READIBLE) ||
+		 (compare_op == COMPARE_BUFFER_READIBLE));
+	bool chk_buff = ((compare_op == COMPARE_BUFFER_READIBLE) ||
+		 (compare_op == COMPARE_BUFFER_UNREADIBLE));
+	bool copy_buff = (compare_op == COPY_BUFFER);
 
 	ptr = gem_mmap__device_coherent(i915, bo, 0, size, PROT_READ);
 	ptrtmp = ptr;
 
+	if (chk_buff || copy_buff) {
+		if (auxsize < size)
+			auxptr = NULL;
+		igt_assert(auxptr);
+		auxtmp = auxptr;
+	}
+
 	if (COMPARE_N_PIXELS_VERBOSELY) {
 		igt_info("--------->>>\n");
 		while (loop < COMPARE_N_PIXELS_VERBOSELY && loop < (size/4)) {
 			value = *ptrtmp;
-			igt_info("Color read = 0x%08x ", value);
-			igt_info("expected %c= 0x%08x)\n",
-				op_readible?'=':'!', color);
+			if (chk_buff)
+				color = *auxtmp;
+			if (copy_buff)
+				igt_info("Color copy = 0x%08x\n", value);
+			else {
+				igt_info("Color read = 0x%08x ", value);
+				igt_info("expected %c= 0x%08x)\n",
+					op_readible?'=':'!', color);
+			}
+			++auxtmp;
 			++ptrtmp;
 			++loop;
 		}
 		igt_info("<<<---------\n");
+		auxtmp = auxptr;
 		ptrtmp = ptr;
 		loop = 0;
 	}
@@ -388,8 +411,25 @@ static void assert_bo_content_check(int i915, uint32_t bo,
 	/*count all pixels for matches */
 	while (loop++ < (size/4)) {
 		value = *ptrtmp;
-		if (value == color)
-			++num_matches;
+		switch (compare_op) {
+		case COMPARE_COLOR_READIBLE:
+		case COMPARE_COLOR_UNREADIBLE:
+			if (value == color)
+				++num_matches;
+			break;
+		case COMPARE_BUFFER_READIBLE:
+		case COMPARE_BUFFER_UNREADIBLE:
+			if (value == (*auxtmp))
+				++num_matches;
+			++auxtmp;
+			break;
+		case COPY_BUFFER:
+			*auxtmp = value;
+			++auxtmp;
+			break;
+		default:
+			break;
+		}
 		++ptrtmp;
 	}
 
@@ -411,7 +451,7 @@ static uint32_t alloc_and_fill_dest_buff(int i915, bool protected,
 	igt_assert(bo);
 	fill_bo_content(i915, bo, size, init_color);
 	assert_bo_content_check(i915, bo, COMPARE_COLOR_READIBLE,
-		size, init_color);
+		size, init_color, NULL, 0);
 
 	return bo;
 }
@@ -428,14 +468,16 @@ static uint32_t alloc_and_fill_dest_buff(int i915, bool protected,
 #define TSTSURF_FILLCOLOR2  0xdeaddead
 #define TSTSURF_INITCOLOR1  0x12341234
 #define TSTSURF_INITCOLOR2  0x56785678
+#define TSTSURF_INITCOLOR3  0xabcdabcd
 
 static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 {
-	uint32_t ctx, srcbo, dstbo;
-	struct intel_buf *srcbuf, *dstbuf;
+	uint32_t ctx, srcbo, dstbo, dstbo2;
+	struct intel_buf *srcbuf, *dstbuf, *dstbuf2;
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
 	uint32_t devid;
+	uint32_t encrypted[TSTSURF_SIZE/TSTSURF_BYTESPP];
 
 	devid = intel_get_drm_devid(i915);
 	igt_assert(devid);
@@ -472,7 +514,7 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 		gem_sync(i915, dstbo);
 
 		assert_bo_content_check(i915, dstbo, COMPARE_COLOR_READIBLE,
-			TSTSURF_SIZE, TSTSURF_FILLCOLOR1);
+			TSTSURF_SIZE, TSTSURF_FILLCOLOR1, NULL, 0);
 
 		intel_bb_destroy(ibb);
 		intel_buf_destroy(srcbuf);
@@ -483,6 +525,7 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 		break;
 
 	case COPY3D_PROTECTED_SRC_TO_PROTDST:
+	case COPY3D_PROTECTED_PROTSRC_TO_PROTDST:
 		/* Perform a protected render operation but only label
 		 * the dest as protected. After rendering, the content
 		 * should be encrypted
@@ -515,15 +558,60 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 		gem_sync(i915, dstbo);
 
 		assert_bo_content_check(i915, dstbo, COMPARE_COLOR_UNREADIBLE,
-			TSTSURF_SIZE, TSTSURF_FILLCOLOR2);
+			TSTSURF_SIZE, TSTSURF_FILLCOLOR2, NULL, 0);
+
+		if (test_cfg == COPY3D_PROTECTED_SRC_TO_PROTDST) {
+			intel_bb_destroy(ibb);
+			intel_buf_destroy(srcbuf);
+			gem_close(i915, srcbo);
+			intel_buf_destroy(dstbuf);
+			gem_close(i915, dstbo);
+			gem_context_destroy(i915, ctx);
+			break;
+		}
+
+		/* For COPY3D_PROTECTED_PROTSRC_TO_PROTDST, reuse
+		 * prior dst as the new-src and create a new dst2 as
+		 * the new-dest. Take a copy of encrypted content
+		 * from new-src for comparison after render operation.
+		 * After the rendering, we should find no difference
+		 * in content since both new-src and new-dest are
+		 * labelled as encrypted. HW should read and decrypt
+		 * new-src, perform the render and re-encrypt when
+		 * going into new-dest
+		 */
+		assert_bo_content_check(i915, dstbo, COPY_BUFFER,
+			TSTSURF_SIZE, 0, encrypted, TSTSURF_SIZE);
+
+		dstbo2 = alloc_and_fill_dest_buff(i915, false,
+				TSTSURF_SIZE, TSTSURF_INITCOLOR3);
+		dstbuf2 = intel_buf_create_using_handle(bops, dstbo2,
+				TSTSURF_WIDTH, TSTSURF_HEIGHT,
+				TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+		intel_buf_set_pxp(dstbuf2, true);
+
+		intel_buf_set_pxp(dstbuf, true);/*this time, src is protected*/
+
+		intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE,
+			I915_PROTECTED_CONTENT_DEFAULT_SESSION);
+
+		gen12_render_copyfunc(ibb, dstbuf, 0, 0,
+			TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf2, 0, 0);
+
+		gem_sync(i915, dstbo2);
+		assert_bo_content_check(i915, dstbo2, COMPARE_BUFFER_READIBLE,
+			TSTSURF_SIZE, 0, encrypted, TSTSURF_SIZE);
 
 		intel_bb_destroy(ibb);
 		intel_buf_destroy(srcbuf);
 		gem_close(i915, srcbo);
 		intel_buf_destroy(dstbuf);
 		gem_close(i915, dstbo);
+		intel_buf_destroy(dstbuf2);
+		gem_close(i915, dstbo2);
 		gem_context_destroy(i915, ctx);
 		break;
+
 	default:
 		igt_info("Skipping unknown render test_cfg = %d\n",
 			test_cfg);
@@ -622,6 +710,9 @@ igt_main
 		igt_subtest("protected-raw-src-copy-not-readible")
 			test_render_protected_buffer(i915,
 				COPY3D_PROTECTED_SRC_TO_PROTDST);
+		igt_subtest("protected-encrypted-src-copy-not-readible")
+			test_render_protected_buffer(i915,
+				COPY3D_PROTECTED_PROTSRC_TO_PROTDST);
 	}
 
 	igt_fixture {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
