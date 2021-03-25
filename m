Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0406EB25
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 05:45:53 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Wed, 24 Mar 2021 22:45:48 -0700
Message-Id: <20210325054549.465386-15-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
References: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 14/15] Verify protected surfaces are dma
 buffer sharable
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

Verify we can export a protected surface from
protected context A into protected context B (with
different client driver handles) and protected
rendering is successful even after prior file
handle is closed (i.e. pxp specific refcounting
works).

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 119 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 05083ac9..583983f2 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -4,6 +4,7 @@
  */
 
 #include <sys/ioctl.h>
+#include <fcntl.h>
 
 #include "igt.h"
 #include "igt_device.h"
@@ -36,6 +37,9 @@ IGT_TEST_DESCRIPTION("Test PXP (Protected Xe Path), which is the component "
 #define COPY3D_PROTECTED_PROTSRC_TO_PROTDST 3
 #define COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED 4
 
+/* test-configs for protected rendering with dma-buffer sharing */
+#define BUFSHARED_PROTDST_DUAL_CTX_REFCOUNT 1
+
 /* test-configs for power-management triggered protected session teardown */
 #define SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE 1
 #define SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC 2
@@ -643,6 +647,118 @@ static void __test_render_protected_buffer(int i915, uint32_t test_cfg,
 	buf_ops_destroy(bops);
 }
 
+static int export_handle(int fd, uint32_t handle, int *outfd)
+{
+	struct drm_prime_handle args;
+	int ret;
+
+	args.handle = handle;
+	args.flags = DRM_CLOEXEC;
+	args.fd = -1;
+
+	ret = drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
+	if (ret)
+		ret = errno;
+	*outfd = args.fd;
+
+	return ret;
+}
+
+static void test_sharing_protected_asssets(uint32_t test_cfg)
+{
+	uint32_t ctx[2], sbo[2], dbo[2];
+	struct intel_buf *sbuf[2], *dbuf[2];
+	struct buf_ops *bops[2];
+	struct intel_bb *ibb[2];
+	int fd[2], dmabuf_fd = 0, ret, n, num_matches = 0;
+	uint32_t encrypted[2][TSTSURF_SIZE/TSTSURF_BYTESPP];
+
+	switch (test_cfg) {
+	case BUFSHARED_PROTDST_DUAL_CTX_REFCOUNT:
+		/* First, create the client driver handles and
+		 * protected dest buffer (is exported via dma-buff
+		 * from first handle and imported to the second).
+		 */
+		for (n = 0; n < 2; ++n) {
+			fd[n] = drm_open_driver(DRIVER_INTEL);
+			igt_require(fd[n]);
+			if (n == 0) {
+				dbo[0] = alloc_and_fill_dest_buff(fd[0], true,
+					TSTSURF_SIZE, TSTSURF_INITCOLOR1);
+			} else {
+				ret = export_handle(fd[0], dbo[0], &dmabuf_fd);
+				igt_assert(ret == 0);
+				dbo[1] = prime_fd_to_handle(fd[1], dmabuf_fd);
+				igt_assert(dbo[1]);
+			}
+		}
+		/* Repeat twice: Create a full set of assets to perform
+		 * a protected 3D session but using the same dest buffer
+		 * from above.
+		 */
+		for (n = 0; n < 2; ++n) {
+			ctx[n] = create_protected_ctx(fd[n],
+				true, true, true, false, 0);
+			assert_ctx_protected_param(fd[n],
+				ctx[n], true);
+			bops[n] = buf_ops_create(fd[n]);
+			if (n == 1)
+				fill_bo_content(fd[1], dbo[1],
+					TSTSURF_SIZE, TSTSURF_INITCOLOR2);
+			dbuf[n] = intel_buf_create_using_handle(bops[n],
+					dbo[n], TSTSURF_WIDTH, TSTSURF_HEIGHT,
+					TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+			intel_buf_set_pxp(dbuf[n], true);
+
+			sbo[n] = alloc_and_fill_dest_buff(fd[n], false,
+					TSTSURF_SIZE, TSTSURF_FILLCOLOR1);
+			sbuf[n] = intel_buf_create_using_handle(bops[n],
+					sbo[n], TSTSURF_WIDTH, TSTSURF_HEIGHT,
+					TSTSURF_BYTESPP*8, 0, I915_TILING_NONE, 0);
+
+			ibb[n] = intel_bb_create_with_context(fd[n], ctx[n], 4096);
+			intel_bb_set_pxp(ibb[n], true, DISPLAY_APPTYPE,
+				I915_PROTECTED_CONTENT_DEFAULT_SESSION);
+
+			gen12_render_copyfunc(ibb[n], sbuf[n], 0, 0,
+				TSTSURF_WIDTH, TSTSURF_HEIGHT, dbuf[n], 0, 0);
+			gem_sync(fd[n], dbo[n]);
+
+			assert_bo_content_check(fd[n], dbo[n],
+				COMPARE_COLOR_UNREADIBLE, TSTSURF_SIZE,
+				TSTSURF_FILLCOLOR1, NULL, 0);
+			assert_bo_content_check(fd[n], dbo[n], COPY_BUFFER,
+				TSTSURF_SIZE, 0, encrypted[n], TSTSURF_SIZE);
+
+			/* free up all assets except the dest buffer to
+			 * verify dma buff refcounting is performed on
+			 * the protected dest buffer on the 2nd loop with
+			 * successful reuse in another protected render.
+			 */
+			intel_bb_destroy(ibb[n]);
+			intel_buf_destroy(sbuf[n]);
+			intel_buf_destroy(dbuf[n]);
+			gem_close(fd[n], sbo[n]);
+			gem_close(fd[n], dbo[n]);
+			gem_context_destroy(fd[n], ctx[n]);
+			close(fd[n]);
+		}
+		/* Verify that encrypted output across loops were equal */
+		for (n = 0; n < (TSTSURF_SIZE/4); ++n)
+			if (encrypted[0][n] == encrypted[1][n])
+				++num_matches;
+		igt_assert(num_matches == (TSTSURF_SIZE/4));
+
+		break;
+
+	default:
+		igt_info("Skipping unknown asset test_cfg = %d\n",
+			test_cfg);
+		break;
+	}
+
+}
+
 static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 {
 	__test_render_protected_buffer(i915, test_cfg, NULL, 0);
@@ -981,6 +1097,9 @@ igt_main
 		igt_subtest("protected-encrypted-src-copy-not-readible")
 			test_render_protected_buffer(i915,
 				COPY3D_PROTECTED_PROTSRC_TO_PROTDST);
+		igt_subtest("dmabuf-shared-protected-dst-is-context-refcounted")
+			test_sharing_protected_asssets(
+				BUFSHARED_PROTDST_DUAL_CTX_REFCOUNT);
 	}
 	igt_subtest_group {
 		igt_fixture {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
