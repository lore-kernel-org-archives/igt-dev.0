Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304AC6EE12
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 06:50:10 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Thu, 13 May 2021 23:49:50 -0700
Message-Id: <20210514064953.1644250-14-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
References: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 13/16] Verify execbuf ok with stale
 prot-buff and regular context
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

Add a subtest to verify that reusing a stale protected
buffer in a gem_execbuff call, but using a regular (not-
protcted) context will succeed despite after a teardown
(triggered by suspend-resume cycle).

This ensures that user space applications that choose
not to opt-in for strict PXP teardown awareness (by
using a regular context) wont suffer gem_execbuff
failures if a protected buffer was among the assets
used in any of its rendering operations.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 605b6524..ef93c4fe 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -39,6 +39,7 @@ IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated
 #define SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE 1
 #define SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC 2
 #define SESSION_PMSUSPEND_STALEPROTBO_BAN_EXEC 3
+#define SESSION_PMSUSPEND_STALECTX_STALEPROTBO_EXEC_OK 4
 
 /* Struct and defintions for power management. */
 struct powermgt_data {
@@ -714,8 +715,15 @@ static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 
 	case SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC:
 	case SESSION_PMSUSPEND_STALEPROTBO_BAN_EXEC:
-		ctx = create_protected_ctx(i915, true, true, true, false, 0);
-		assert_ctx_protected_param(i915, ctx, true);
+	case SESSION_PMSUSPEND_STALECTX_STALEPROTBO_EXEC_OK:
+		if (test_cfg == SESSION_PMSUSPEND_STALECTX_STALEPROTBO_EXEC_OK) {
+			ctx = create_protected_ctx(i915, false, false, false, false, 0);
+			assert_ctx_protected_param(i915, ctx, false);
+
+		} else {
+			ctx = create_protected_ctx(i915, true, true, true, false, 0);
+			assert_ctx_protected_param(i915, ctx, true);
+		}
 
 		if (test_cfg == SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC) {
 			/* use normal buffers for testing for invalidation
@@ -754,7 +762,10 @@ static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 			intel_bb_add_intel_buf(ibb2, fencebuf, true);
 			gem_execbuf_flush_store_dw(i915, ibb2, ctx2, fencebuf, -ENOEXEC);
 		} else {
-			gem_execbuf_flush_store_dw(i915, ibb, ctx, fencebuf, -EACCES);
+			if (test_cfg == SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC)
+				gem_execbuf_flush_store_dw(i915, ibb, ctx, fencebuf, -EACCES);
+			else if (test_cfg == SESSION_PMSUSPEND_STALECTX_STALEPROTBO_EXEC_OK)
+				gem_execbuf_flush_store_dw(i915, ibb, ctx, fencebuf, 0);
 		}
 
 		intel_bb_destroy(ibb);
@@ -870,6 +881,9 @@ igt_main
 		igt_subtest("reject-old-prot-buffer-execution-after-suspend-resume") {
 			test_protected_session_teardown(i915, SESSION_PMSUSPEND_STALEPROTBO_BAN_EXEC, &pm);
 		}
+		igt_subtest("allow-regular-ctx-old-prot-buff-execution-after-suspend-resume") {
+			test_protected_session_teardown(i915, SESSION_PMSUSPEND_STALECTX_STALEPROTBO_EXEC_OK, &pm);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
