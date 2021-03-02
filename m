Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04DE89FAC
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 22:59:09 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Tue,  2 Mar 2021 14:53:34 -0800
Message-Id: <20210302225334.361966-12-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 11/11] Verify gem_execbuf fails with stale PXP
 buffer after teardown
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
with a fresh protected context, in a gem_execbuff after a
teardown (triggered by suspend-resume cycle) shall fail
with -EIO error.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/i915_pxp.c | 44 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/tests/i915/i915_pxp.c b/tests/i915/i915_pxp.c
index b8c82ea9..4d639c0f 100644
--- a/tests/i915/i915_pxp.c
+++ b/tests/i915/i915_pxp.c
@@ -776,10 +776,10 @@ static void test_protected_session_teardown(int i915, uint32_t test_cfg,
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
@@ -803,6 +803,7 @@ static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 		break;
 
 	case SESSION_PMSUSPEND_TEARDOWN_PROTCTX_BAN_EXEC:
+	case SESSION_PMSUSPEND_TEARDOWN_PROTBO_BAN_EXEC:
 		ctx = create_protected_ctx(i915, true, true,
 			true, false, 0);
 		assert_ctx_protected_param(i915, ctx, true);
@@ -813,10 +814,16 @@ static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 		bops = buf_ops_create(i915);
 		igt_assert(bops);
 
-		fencebo = create_protected_bo(i915, 4096,
-				false, false, 0);
-		igt_assert(fencebo);
-		fill_bo_content(i915, fencebo, 1024, 0x0);
+		if (test_cfg == SESSION_PMSUSPEND_TEARDOWN_PROTCTX_BAN_EXEC) {
+			/* use normal buffers for testing for invalidation
+			 * of protected contexts to ensure kernel is catching
+			 * the invalidated context*/
+			fencebo = alloc_and_fill_dest_buff(i915, false,
+					4096, 0);
+		} else {
+			fencebo = alloc_and_fill_dest_buff(i915, true,
+					4096, 0);
+		}
 
 		fencebuf = intel_buf_create_using_handle(bops, fencebo,
 				256, 4,	32, 0, I915_TILING_NONE, 0);
@@ -824,12 +831,30 @@ static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 
 		gem_execbuf_flush_store_dw(i915, ibb, ctx, fencebuf, 0);
 		trigger_powermgt_suspend_cycle(i915, pm);
-		gem_execbuf_flush_store_dw(i915, ibb, ctx, fencebuf, -EIO);
+
+		if (test_cfg == SESSION_PMSUSPEND_TEARDOWN_PROTBO_BAN_EXEC) {
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
+		if (test_cfg == SESSION_PMSUSPEND_TEARDOWN_PROTBO_BAN_EXEC) {
+			intel_bb_destroy(ibb2);
+			gem_context_destroy(i915, ctx2);
+		}
 		buf_ops_destroy(bops);
 		break;
 
@@ -953,6 +978,11 @@ igt_main
 				SESSION_PMSUSPEND_TEARDOWN_PROTCTX_BAN_EXEC,
 				&pm);
 		}
+		igt_subtest("reject-old-buffer-execution-after-suspend-resume") {
+			test_protected_session_teardown(i915,
+				SESSION_PMSUSPEND_TEARDOWN_PROTBO_BAN_EXEC,
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
