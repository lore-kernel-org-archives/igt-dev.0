Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015186EE13
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 06:50:09 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Thu, 13 May 2021 23:49:41 -0700
Message-Id: <20210514064953.1644250-5-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
References: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 04/16] Perform a regular 3d copy as a
 control checkpoint
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

As a control checkpoint, allocate buffers to be used
as texture and render target in the 3d engine for a
regular src to dest copy blit and verify buffer pixels.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 162 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 6340daae..94655c27 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -27,6 +27,11 @@ IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated
 #define CTX_MODIFY_PROTECTED_BOTHPARAMS_TO_INVALID 8
 #define CTX_MODIFY_UNPROTECTED_BOTHPARAMS_TO_VALID 9
 
+/* test-configs for protected rendering operations */
+#define COPY3D_BASELINE_SRC_TO_DST 1
+#define COPY3D_PROTECTED_SRC_TO_PROTDST 2
+#define COPY3D_PROTECTED_PROTSRC_TO_PROTDST 3
+
 static bool is_pxp_hw_supported(int i915)
 {
 	uint32_t devid = intel_get_drm_devid(i915);
@@ -165,6 +170,7 @@ static uint32_t create_protected_ctx(int i915, bool with_protected_param, bool p
 
 #define CHANGE_PARAM_PROTECTED 0x0001
 #define CHANGE_PARAM_RECOVERY 0x0002
+
 static void modify_ctx_protected_param(int i915, uint32_t ctx_id, uint32_t change_param_mask,
 				       bool param_value, int expected_return)
 {
@@ -302,10 +308,153 @@ static void test_create_protected_context(int i915, uint32_t test_cfg)
 	}
 }
 
+static void fill_bo_content(int i915, uint32_t bo, uint32_t size, uint32_t initcolor)
+{
+	uint32_t *ptr, *ptrtmp;
+	int loop = 0;
+
+	ptr = gem_mmap__device_coherent(i915, bo, 0, size, PROT_WRITE);
+	ptrtmp = ptr;
+
+	/* read and count all dword matches till size */
+	while (loop++ < (size/4)) {
+		*ptrtmp = initcolor;
+		++ptrtmp;
+	}
+
+	igt_assert(gem_munmap(ptr, size) == 0);
+}
+
+#define COMPARE_COLOR_READIBLE     1
+#define COMPARE_COLOR_UNREADIBLE   2
+#define COMPARE_N_PIXELS_VERBOSELY 0
+
+static void assert_bo_content_check(int i915, uint32_t bo, int compare_op,
+				    uint32_t size, uint32_t color)
+{
+	uint32_t *ptr, *ptrtmp;
+	int loop = 0, num_matches = 0;
+	uint32_t value;
+	bool op_readible = (compare_op == COMPARE_COLOR_READIBLE);
+
+	ptr = gem_mmap__device_coherent(i915, bo, 0, size, PROT_READ);
+	ptrtmp = ptr;
+
+	if (COMPARE_N_PIXELS_VERBOSELY) {
+		igt_info("--------->>>\n");
+		while (loop < COMPARE_N_PIXELS_VERBOSELY && loop < (size/4)) {
+			value = *ptrtmp;
+			igt_info("Color read = 0x%08x ", value);
+			igt_info("expected %c= 0x%08x)\n", op_readible?'=':'!', color);
+			++ptrtmp;
+			++loop;
+		}
+		igt_info("<<<---------\n");
+		ptrtmp = ptr;
+		loop = 0;
+	}
+
+	/* count all pixels for matches */
+	while (loop++ < (size/4)) {
+		value = *ptrtmp;
+		if (value == color)
+			++num_matches;
+		++ptrtmp;
+	}
+
+	if (op_readible)
+		igt_assert_eq(num_matches, (size/4));
+	else
+		igt_assert_eq(num_matches, 0);
+
+	igt_assert(gem_munmap(ptr, size) == 0);
+}
+
+static uint32_t alloc_and_fill_dest_buff(int i915, bool protected, uint32_t size,
+					 uint32_t init_color)
+{
+	uint32_t bo;
+
+	bo = create_protected_bo(i915, size, protected, 0);
+	igt_assert(bo);
+	fill_bo_content(i915, bo, size, init_color);
+	assert_bo_content_check(i915, bo, COMPARE_COLOR_READIBLE, size, init_color);
+
+	return bo;
+}
+
+/*
+ * Rendering tests surface attributes, keep it simple:
+ * page aligned width==stride, thus, and size
+ */
+#define TSTSURF_WIDTH       1024
+#define TSTSURF_HEIGHT      128
+#define TSTSURF_BYTESPP     4
+#define TSTSURF_STRIDE      (TSTSURF_WIDTH*TSTSURF_BYTESPP)
+#define TSTSURF_SIZE        (TSTSURF_STRIDE*TSTSURF_HEIGHT)
+#define TSTSURF_FILLCOLOR1  0xfaceface
+#define TSTSURF_INITCOLOR1  0x12341234
+
+static void test_render_protected_buffer(int i915, uint32_t test_cfg)
+{
+	uint32_t ctx, srcbo, dstbo;
+	struct intel_buf *srcbuf, *dstbuf;
+	struct buf_ops *bops;
+	struct intel_bb *ibb;
+	uint32_t devid;
+
+	devid = intel_get_drm_devid(i915);
+	igt_assert(devid);
+
+	bops = buf_ops_create(i915);
+	igt_assert(bops);
+
+	switch (test_cfg) {
+	case COPY3D_BASELINE_SRC_TO_DST:
+		/* Perform a regular 3d copy as a control checkpoint */
+		ctx = create_protected_ctx(i915, false, false, false, false, 0);
+		assert_ctx_protected_param(i915, ctx, false);
+
+		dstbo = alloc_and_fill_dest_buff(i915, false, TSTSURF_SIZE, TSTSURF_INITCOLOR1);
+		dstbuf = intel_buf_create_using_handle(bops, dstbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
+						       TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+
+		srcbo = alloc_and_fill_dest_buff(i915, false, TSTSURF_SIZE, TSTSURF_FILLCOLOR1);
+		srcbuf = intel_buf_create_using_handle(bops, srcbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
+						       TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+
+		ibb = intel_bb_create_with_context(i915, ctx, 4096);
+		igt_assert(ibb);
+
+		gen12_render_copyfunc(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
+		gem_sync(i915, dstbo);
+
+		assert_bo_content_check(i915, dstbo, COMPARE_COLOR_READIBLE,
+					TSTSURF_SIZE, TSTSURF_FILLCOLOR1);
+
+		intel_bb_destroy(ibb);
+		intel_buf_destroy(srcbuf);
+		gem_close(i915, srcbo);
+		intel_buf_destroy(dstbuf);
+		gem_close(i915, dstbo);
+		gem_context_destroy(i915, ctx);
+		break;
+
+	default:
+		igt_info("Skipping unknown render test_cfg = %d\n", test_cfg);
+		break;
+	}
+
+	buf_ops_destroy(bops);
+}
+
+
 igt_main
 {
 	int i915 = -1;
 	bool pxp_supported = false;
+	igt_render_copyfunc_t rendercopy = NULL;
+	uint32_t devid = 0;
 
 	igt_fixture
 	{
@@ -359,6 +508,19 @@ igt_main
 		igt_subtest("reject-modify-context-protection-off-3")
 			test_create_protected_context(i915, CTX_MODIFY_PROTECTED_BOTHPARAMS_TO_INVALID);
 	}
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(pxp_supported);
+			devid = intel_get_drm_devid(i915);
+			igt_assert(devid);
+			rendercopy = igt_get_render_copyfunc(devid);
+			igt_require(rendercopy);
+		}
+
+		igt_describe("Verify protected render operations:");
+		igt_subtest("regular-baseline-src-copy-readible")
+			test_render_protected_buffer(i915, COPY3D_BASELINE_SRC_TO_DST);
+	}
 
 	igt_fixture {
 		close(i915);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
