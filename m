Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD4E6E45D
 for <igt-dev@lists.freedesktop.org>; Sat, 15 May 2021 23:01:49 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Sat, 15 May 2021 16:01:38 -0700
Message-Id: <20210515230142.1816456-14-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
References: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 13/17] Verify execbuf fails with stale PXP
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

Add a check to verify that reusing a stale protected buffer
in a gem_execbuff (with a protected context) after a teardown
(triggered by suspend-resume cycle) shall fail with -ENOEXEC error.
Reuse the existing subtest function to with separate assets
to minimize the number of suspend-resume cycles we take.

NOTE: The end-to-end architecture requirement includes that
any break in the links of the PXP sessions needs to trigger a
full teardown and the application needs to be made aware of that
allowing it to re-establish the end-to-end pipeline of buffers,
contexts and renders again if it chooses to. This stricter
behavior targets only contexts created with PXP enabled.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 13f19772..a7d9f02b 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -786,23 +786,45 @@ static void free_exec_assets(int i915, struct simple_exec_assets *data)
 static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_data *pm)
 {
 	int ret;
-	struct simple_exec_assets data = {0};
+	struct simple_exec_assets data[2] = {{0}, {0}};
+	uint32_t ctx2;
+	struct intel_bb *ibb2;
 
 	/*
-	 * Use normal buffers for testing for invalidation
+	 * For data[0]: Use normal buffers for testing for invalidation
 	 * of protected contexts to ensure kernel is catching
 	 * the invalidated context (not buffer)
 	 */
-	prepare_exec_assets(i915, &data, true, false);
-	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
+	prepare_exec_assets(i915, &data[0], true, false);
+	ret = gem_execbuf_flush_store_dw(i915, data[0].ibb, data[0].ctx, data[0].fencebuf);
+	igt_assert(ret == 0);
+
+	prepare_exec_assets(i915, &data[1], true, true);
+	ret = gem_execbuf_flush_store_dw(i915, data[1].ibb, data[1].ctx, data[1].fencebuf);
 	igt_assert(ret == 0);
 
 	trigger_powermgt_suspend_cycle(i915, pm);
 
-	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
+	ret = gem_execbuf_flush_store_dw(i915, data[0].ibb, data[0].ctx, data[0].fencebuf);
 	igt_assert_f((ret == -EACCES), "Execution with stale pxp context didnt fail with -EACCES\n");
 
-	free_exec_assets(i915, &data);
+	/*
+	 * For data[1]: after teardown, alloc new assets for context but
+	 * reuse the bo to ensure the kernel is catching the
+	 * invalidated bo (not context)
+	 */
+	ret = create_ctx_with_params(i915, true, true, true, false, &ctx2);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx2), 1);
+	ibb2 = intel_bb_create_with_context(i915, ctx2, 4096);
+	igt_assert(ibb2);
+	intel_bb_detach_intel_buf(data[1].ibb, data[1].fencebuf);
+	intel_bb_add_intel_buf(ibb2, data[1].fencebuf, true);
+	ret = gem_execbuf_flush_store_dw(i915, ibb2, ctx2, data[1].fencebuf);
+	igt_assert_f((ret == -ENOEXEC), "Execution with stale pxp buffer didnt fail with -ENOEXEC\n");
+
+	free_exec_assets(i915, &data[0]);
+	free_exec_assets(i915, &data[1]);
 }
 
 igt_main
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
