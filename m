Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B73E6E463
 for <igt-dev@lists.freedesktop.org>; Sat, 15 May 2021 23:01:49 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Sat, 15 May 2021 16:01:39 -0700
Message-Id: <20210515230142.1816456-15-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
References: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 14/17] Verify execbuf ok with stale
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

Add a check to verify that reusing a stale protected
buffer in a gem_execbuff call, but using a regular (not-
protcted) context will succeed despite after a teardown
(triggered by suspend-resume cycle).

This ensures that user space applications that choose
not to opt-in for strict PXP teardown awareness (by
using a regular context) wont suffer gem_execbuff
failures if a protected buffer was among the assets
used in any of its rendering operations.

Reuse the existing subtest to minimize the number
of suspend resume cycles we take.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index a7d9f02b..e5f3f2f0 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -786,7 +786,7 @@ static void free_exec_assets(int i915, struct simple_exec_assets *data)
 static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_data *pm)
 {
 	int ret;
-	struct simple_exec_assets data[2] = {{0}, {0}};
+	struct simple_exec_assets data[3] = {{0}, {0}, {0}};
 	uint32_t ctx2;
 	struct intel_bb *ibb2;
 
@@ -803,6 +803,15 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
 	ret = gem_execbuf_flush_store_dw(i915, data[1].ibb, data[1].ctx, data[1].fencebuf);
 	igt_assert(ret == 0);
 
+	/*
+	 * For data[2]: Use non-pxp contexts but with protected buffers
+	 * to verify the "pxp-execution-opt-in" expectation where
+	 * execution will run without error (not buffer)
+	 */
+	prepare_exec_assets(i915, &data[2], false, true);
+	ret = gem_execbuf_flush_store_dw(i915, data[2].ibb, data[2].ctx, data[2].fencebuf);
+	igt_assert(ret == 0);
+
 	trigger_powermgt_suspend_cycle(i915, pm);
 
 	ret = gem_execbuf_flush_store_dw(i915, data[0].ibb, data[0].ctx, data[0].fencebuf);
@@ -823,8 +832,12 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
 	ret = gem_execbuf_flush_store_dw(i915, ibb2, ctx2, data[1].fencebuf);
 	igt_assert_f((ret == -ENOEXEC), "Execution with stale pxp buffer didnt fail with -ENOEXEC\n");
 
+	ret = gem_execbuf_flush_store_dw(i915, data[2].ibb, data[2].ctx, data[2].fencebuf);
+	igt_assert_f((ret == 0), "Opt-out-execution with stale pxp buffer didnt succeed\n");
+
 	free_exec_assets(i915, &data[0]);
 	free_exec_assets(i915, &data[1]);
+	free_exec_assets(i915, &data[2]);
 }
 
 igt_main
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
