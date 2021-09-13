Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730656E213
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Sep 2021 17:28:29 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Mon, 13 Sep 2021 10:26:56 -0700
Message-Id: <20210913172658.1573994-14-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210913172658.1573994-1-alan.previn.teres.alexis@intel.com>
References: <20210913172658.1573994-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 13/15] Verify execution behavior with
 stale PXP assets through suspend-resume
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

Add a subtest to repeat the same previous three scenarios when attempting
to execute work with either stale PXP contexts or buffers but this time
trigger the teardown event via an S3 suspend-resume power state cycle.

NOTE: The end-to-end architecture requirement includes that
any break in the links of the PXP sessions needs to trigger a
full teardown and the application needs to be made aware of that
allowing it to re-establish the end-to-end pipeline of buffers,
contexts and renders again if it chooses to. This stricter
behavior targets only contexts created with PXP enabled.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/i915/gem_pxp.c | 65 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 92b2ea87..9b01cfc7 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -844,6 +844,69 @@ static void test_pxp_stale_buf_optout_execution(int i915)
 	free_exec_assets(i915, &data);
 }
 
+static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_data *pm)
+{
+	int ret;
+	struct simple_exec_assets data[3] = {{0}, {0}, {0}};
+	uint32_t ctx2;
+	struct intel_bb *ibb2;
+
+	/*
+	 * For asset data[0]: Use normal buffers for testing for invalidation
+	 * of protected contexts to ensure kernel is catching
+	 * the invalidated context (not buffer)
+	 */
+	prepare_exec_assets(i915, &data[0], true, false);
+	ret = gem_execbuf_flush_store_dw(i915, data[0].ibb, data[0].ctx, data[0].fencebuf);
+	igt_assert(ret == 0);
+
+	/*
+	 * For asset data[1]: Use pxp buffers with pxp context for testing for invalidation
+	 * of protected buffers.
+	 */
+	prepare_exec_assets(i915, &data[1], true, true);
+	ret = gem_execbuf_flush_store_dw(i915, data[1].ibb, data[1].ctx, data[1].fencebuf);
+	igt_assert(ret == 0);
+
+	/*
+	 * For asset data[2]: Use a normal context for testing opt-out behavior
+	 * when executing with a pxp buffer across a teardown event.
+	 */
+	prepare_exec_assets(i915, &data[2], false, true);
+	ret = gem_execbuf_flush_store_dw(i915, data[2].ibb, data[2].ctx, data[2].fencebuf);
+	igt_assert(ret == 0);
+
+	/* Do an S3 suspend resume cycle which also causes the pxp teardown event */
+	trigger_powermgt_suspend_cycle(i915, pm);
+
+	ret = gem_execbuf_flush_store_dw(i915, data[0].ibb, data[0].ctx, data[0].fencebuf);
+	igt_assert_f((ret == -EIO), "Executing stale pxp context didn't fail with -EIO\n");
+
+	/*
+	 * For asset data[1]: after teardown, alloc new assets for context but
+	 * reuse the bo to ensure the kernel is catching the
+	 * invalidated bo (not context)
+	 */
+	ret = create_ctx_with_params(i915, true, true, true, false, &ctx2);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx2), 1);
+	ibb2 = intel_bb_create_with_context(i915, ctx2, 4096);
+	igt_assert(ibb2);
+	intel_bb_remove_intel_buf(data[1].ibb, data[1].fencebuf);
+	intel_bb_add_intel_buf(ibb2, data[1].fencebuf, true);
+	ret = gem_execbuf_flush_store_dw(i915, ibb2, ctx2, data[1].fencebuf);
+	igt_assert_f((ret == -ENOEXEC), "Executing stale pxp buffer didn't fail with -ENOEXEC\n");
+
+	ret = gem_execbuf_flush_store_dw(i915, data[2].ibb, data[2].ctx, data[2].fencebuf);
+	igt_assert_f((ret == 0), "Opt-out-execution with stale pxp buffer didn't succeed\n");
+
+	free_exec_assets(i915, &data[0]);
+	intel_bb_destroy(ibb2);
+	gem_context_destroy(i915, ctx2);
+	free_exec_assets(i915, &data[1]);
+	free_exec_assets(i915, &data[2]);
+}
+
 igt_main
 {
 	int i915 = -1;
@@ -939,6 +1002,8 @@ igt_main
 			test_pxp_stale_buf_execution(i915);
 		igt_subtest("verify-pxp-stale-buf-optout-execution")
 			test_pxp_stale_buf_optout_execution(i915);
+		igt_subtest("verify-pxp-execution-after-suspend-resume")
+			test_pxp_pwrcycle_staleasset_execution(i915, &pm);
 	}
 
 	igt_fixture {
-- 
2.25.1
