Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81496F3D8
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Sep 2021 04:54:11 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Fri, 17 Sep 2021 21:54:33 -0700
Message-Id: <20210918045436.34782-13-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210918045436.34782-1-alan.previn.teres.alexis@intel.com>
References: <20210918045436.34782-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v11 12/15] Verify execbuf ok with stale PXP
 buf in opt-out use
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

Add a check to verify that reusing a stale protected
buffer in a gem_execbuff call, but using a regular (not-
protected) context will succeed after a teardown event.
Trigger the teardown via the pxp invalidation debugfs
that simulates a HW teardown IRQ.

This ensures that user space applications that choose
not to opt-in for strict PXP teardown awareness (by
using a regular context) won't suffer gem_execbuff
failures if a protected buffer was among the assets
used in any of its rendering operations.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/i915/gem_pxp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 22a2e5a4..8e3bc3cf 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -829,6 +829,27 @@ static void test_pxp_stale_buf_execution(int i915)
 	free_exec_assets(i915, &data);
 }
 
+static void test_pxp_stale_buf_optout_execution(int i915)
+{
+	int ret;
+	struct simple_exec_assets data = {0};
+
+	/*
+	 * Use a normal context for testing opt-out behavior
+	 * when executing with a pxp buffer across a teardown event.
+	 */
+	prepare_exec_assets(i915, &data, false, true);
+	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
+	igt_assert(ret == 0);
+
+	trigger_pxp_debugfs_forced_teardown(i915);
+
+	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
+	igt_assert_f((ret == 0), "Opt-out-execution with stale pxp buffer didn't succeed\n");
+
+	free_exec_assets(i915, &data);
+}
+
 igt_main
 {
 	int i915 = -1;
@@ -922,6 +943,8 @@ igt_main
 			test_pxp_stale_ctx_execution(i915);
 		igt_subtest("verify-pxp-stale-buf-execution")
 			test_pxp_stale_buf_execution(i915);
+		igt_subtest("verify-pxp-stale-buf-optout-execution")
+			test_pxp_stale_buf_optout_execution(i915);
 	}
 
 	igt_fixture {
-- 
2.25.1
