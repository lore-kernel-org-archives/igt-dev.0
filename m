Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE5E6EB23
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 05:45:53 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Wed, 24 Mar 2021 22:45:45 -0700
Message-Id: <20210325054549.465386-12-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
References: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 11/15] Verify execbuf fails with stale
 PXP buffer after teardown
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

Add a subtest to verify that reusing a stale protected buffer
in a gem_execbuff (with a protected context) after a teardown
(triggered by suspend-resume cycle) shall fail with -EIO error.

NOTE: The end-to-end architecture requirement includes that
any break in the links of the PXP sessions needs to trigger a
full teardown and the application needs to be made aware of that
allowing it to re-establish the end-to-end pipeline of buffers,
contexts and renders again if it chooses to. This stricter
behavior targets only contexts created with PXP enabled.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 47 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 0cb37177..bf6a8ef1 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -39,6 +39,7 @@ IGT_TEST_DESCRIPTION("Test PXP (Protected Xe Path), which is the component "
 /* test-configs for power-management triggered protected session teardown */
 #define SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE 1
 #define SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC 2
+#define SESSION_PMSUSPEND_STALEPROTBO_BAN_EXEC 3
 
 /* Struct and defintions for power management. */
 struct powermgt_data {
@@ -742,10 +743,10 @@ static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 	uint32_t encrypted_pixels_b4[TSTSURF_SIZE/TSTSURF_BYTESPP];
 	uint32_t encrypted_pixels_aft[TSTSURF_SIZE/TSTSURF_BYTESPP];
 	int matched_after_keychange = 0, loop = 0;
-	uint32_t ctx, fencebo;
+	uint32_t ctx, ctx2, fencebo;
 	struct intel_buf *fencebuf;
 	struct buf_ops *bops;
-	struct intel_bb *ibb;
+	struct intel_bb *ibb, *ibb2;
 
 	switch (test_cfg) {
 	case SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE:
@@ -769,16 +770,22 @@ static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 		break;
 
 	case SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC:
+	case SESSION_PMSUSPEND_STALEPROTBO_BAN_EXEC:
 		ctx = create_protected_ctx(i915, true, true,
 			true, false, 0);
 		assert_ctx_protected_param(i915, ctx, true);
 
-		/* use normal buffers for testing for invalidation
-		 * of protected contexts to ensure kernel is catching
-		 * the invalidated context (not buffer)
-		 */
-		fencebo = alloc_and_fill_dest_buff(i915, false,
-				4096, 0);
+		if (test_cfg == SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC) {
+			/* use normal buffers for testing for invalidation
+			 * of protected contexts to ensure kernel is catching
+			 * the invalidated context
+			 */
+			fencebo = alloc_and_fill_dest_buff(i915, false,
+					4096, 0);
+		} else {
+			fencebo = alloc_and_fill_dest_buff(i915, true,
+					4096, 0);
+		}
 
 		ibb = intel_bb_create_with_context(i915, ctx, 4096);
 		igt_assert(ibb);
@@ -793,12 +800,29 @@ static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 		gem_execbuf_flush_store_dw(i915, ibb, ctx, fencebuf, 0);
 		trigger_powermgt_suspend_cycle(i915, pm);
 
-		gem_execbuf_flush_store_dw(i915, ibb, ctx, fencebuf, -EIO);
+		if (test_cfg == SESSION_PMSUSPEND_STALEPROTBO_BAN_EXEC) {
+			/* after teardown, alloc new assets for everything
+			 * except the bo to ensure the kernel is catching
+			 * the invalidated bo
+			 */
+			ctx2 = create_protected_ctx(i915, true, true,
+				true, false, 0);
+			assert_ctx_protected_param(i915, ctx2, true);
+			ibb2 = intel_bb_create_with_context(i915, ctx2, 4096);
+			igt_assert(ibb2);
+			gem_execbuf_flush_store_dw(i915, ibb2, ctx2, fencebuf, -EIO);
+		} else {
+			gem_execbuf_flush_store_dw(i915, ibb, ctx, fencebuf, -EIO);
+		}
 
 		intel_bb_destroy(ibb);
 		intel_buf_destroy(fencebuf);
 		gem_close(i915, fencebo);
 		gem_context_destroy(i915, ctx);
+		if (test_cfg == SESSION_PMSUSPEND_STALEPROTBO_BAN_EXEC) {
+			intel_bb_destroy(ibb2);
+			gem_context_destroy(i915, ctx2);
+		}
 		buf_ops_destroy(bops);
 		break;
 
@@ -922,6 +946,11 @@ igt_main
 				SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC,
 				&pm);
 		}
+		igt_subtest("reject-old-prot-buffer-execution-after-suspend-resume") {
+			test_protected_session_teardown(i915,
+				SESSION_PMSUSPEND_STALEPROTBO_BAN_EXEC,
+				&pm);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
