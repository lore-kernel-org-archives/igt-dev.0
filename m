Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF8E6EC41
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 19:41:02 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Tue,  5 Oct 2021 12:41:29 -0700
Message-Id: <20211005194133.13508-12-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20211005194133.13508-1-alan.previn.teres.alexis@intel.com>
References: <20211005194133.13508-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v15 11/15] Verify execbuf fails with stale
 PXP buffer after teardown
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add a check to verify that reusing a stale protected buffer
in a gem_execbuff (with a protected context) after a teardown
event fails with -ENOEXEC error. Trigger the teardown via the
pxp invalidation debugfs that simulates a HW teardown IRQ.

NOTE: The end-to-end architecture requirement includes that
any break in the links of the PXP sessions needs to trigger a
full teardown and the application needs to be made aware of that
allowing it to re-establish the end-to-end pipeline of buffers,
contexts and renders again if it chooses to. This stricter
behavior targets only contexts created with PXP enabled.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/i915/gem_pxp.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 7d508674..22a2e5a4 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -796,6 +796,39 @@ static void test_pxp_stale_ctx_execution(int i915)
 	free_exec_assets(i915, &data);
 }
 
+static void test_pxp_stale_buf_execution(int i915)
+{
+	int ret;
+	struct simple_exec_assets data = {0};
+	uint32_t ctx2;
+	struct intel_bb *ibb2;
+
+	/* Use pxp buffers with pxp context for testing for invalidation of protected buffers. */
+	prepare_exec_assets(i915, &data, true, true);
+	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
+	igt_assert(ret == 0);
+
+	trigger_pxp_debugfs_forced_teardown(i915);
+
+	/*
+	 * After teardown, use a new pxp context but reuse the stale bo to ensure
+	 * the kernel is catching the invalidated bo (not context)
+	 */
+	ret = create_ctx_with_params(i915, true, true, true, false, &ctx2);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx2), 1);
+	ibb2 = intel_bb_create_with_context(i915, ctx2, 4096);
+	igt_assert(ibb2);
+	intel_bb_remove_intel_buf(data.ibb, data.fencebuf);
+	intel_bb_add_intel_buf(ibb2, data.fencebuf, true);
+	ret = gem_execbuf_flush_store_dw(i915, ibb2, ctx2, data.fencebuf);
+	igt_assert_f((ret == -ENOEXEC), "Executing stale pxp buffer didn't fail with -ENOEXEC\n");
+
+	intel_bb_destroy(ibb2);
+	gem_context_destroy(i915, ctx2);
+	free_exec_assets(i915, &data);
+}
+
 igt_main
 {
 	int i915 = -1;
@@ -887,6 +920,8 @@ igt_main
 			test_pxp_pwrcycle_teardown_keychange(i915, &pm);
 		igt_subtest("verify-pxp-stale-ctx-execution")
 			test_pxp_stale_ctx_execution(i915);
+		igt_subtest("verify-pxp-stale-buf-execution")
+			test_pxp_stale_buf_execution(i915);
 	}
 
 	igt_fixture {
-- 
2.25.1
