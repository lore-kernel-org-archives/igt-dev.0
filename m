Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE64510E0E4
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 16:48:23 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 18:47:46 +0200
Message-ID: <20230918164747.30171-4-nirmoy.das@intel.com>
In-Reply-To: <20230918164747.30171-1-nirmoy.das@intel.com>
References: <20230918164747.30171-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/intel/gem_ctx_schedule: Skip some
 test on MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: andi.shyti@intel.com, oak.zeng@intel.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We do GGTT update on MTL using bcs engine, blocking that would
fail the test so skip such subtests on bcs engine for MTL.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_exec_schedule.c | 39 +++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index c94988d36..183ee1a21 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -3479,6 +3479,12 @@ static void fairslice(int i915, const intel_ctx_cfg_t *cfg,
 		for_each_if(gem_class_can_store_dword(fd, e->class)) \
 		igt_dynamic_f("%s", e->name)
 
+#define test_each_ggtt_binder_nonblocking_engine(T, i915, ctx, e) \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
+		for_each_if(gem_class_can_store_dword(fd, e->class) && \
+			    !gem_engine_can_block_ggtt_binder(i915, e)) \
+		igt_dynamic_f("%s", e->name)
+
 igt_main
 {
 	int fd = -1;
@@ -3502,21 +3508,22 @@ igt_main
 	igt_subtest_group {
 		const struct intel_execution_engine2 *e;
 
-		test_each_engine_store("fifo", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("fifo", fd, ctx, e)
 			fifo(fd, ctx, e->flags);
 
-		test_each_engine_store("implicit-read-write", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("implicit-read-write", fd, ctx, e)
 			implicit_rw(fd, ctx, e->flags, READ_WRITE);
 
-		test_each_engine_store("implicit-write-read", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("implicit-write-read", fd, ctx, e)
 			implicit_rw(fd, ctx, e->flags, WRITE_READ);
 
-		test_each_engine_store("implicit-boths", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("implicit-boths", fd, ctx, e)
 			implicit_rw(fd, ctx, e->flags, READ_WRITE | WRITE_READ);
 
-		test_each_engine_store("independent", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("independent", fd, ctx, e)
 			independent(fd, ctx, e->flags, 0);
-		test_each_engine_store("u-independent", fd, ctx, e)
+
+		test_each_ggtt_binder_nonblocking_engine("u-independent", fd, ctx, e)
 			independent(fd, ctx, e->flags, IGT_SPIN_USERPTR);
 	}
 
@@ -3612,13 +3619,13 @@ igt_main
 		igt_subtest("smoketest-all")
 			smoketest(fd, &ctx->cfg, ALL_ENGINES, 30);
 
-		test_each_engine_store("in-order", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("in-order", fd, ctx, e)
 			reorder(fd, &ctx->cfg, e->flags, EQUAL);
 
-		test_each_engine_store("out-order", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("out-order", fd, ctx, e)
 			reorder(fd, &ctx->cfg, e->flags, 0);
 
-		test_each_engine_store("promotion", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("promotion", fd, ctx, e)
 			promotion(fd, &ctx->cfg, e->flags);
 
 		igt_subtest_group {
@@ -3685,23 +3692,23 @@ igt_main
 			}
 		}
 
-		test_each_engine_store("noreorder", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("noreorder", fd, ctx, e)
 			noreorder(fd, &ctx->cfg, e->flags, 0, 0);
 
-		test_each_engine_store("noreorder-priority", fd, ctx, e) {
+		test_each_ggtt_binder_nonblocking_engine("noreorder-priority", fd, ctx, e) {
 			igt_require(gem_scheduler_enabled(fd));
 			noreorder(fd, &ctx->cfg, e->flags, MAX_PRIO, 0);
 		}
 
-		test_each_engine_store("noreorder-corked", fd, ctx, e) {
+		test_each_ggtt_binder_nonblocking_engine("noreorder-corked", fd, ctx, e) {
 			igt_require(gem_scheduler_enabled(fd));
 			noreorder(fd, &ctx->cfg, e->flags, MAX_PRIO, CORKED);
 		}
 
-		test_each_engine_store("deep", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("deep", fd, ctx, e)
 			deep(fd, &ctx->cfg, e->flags);
 
-		test_each_engine_store("wide", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("wide", fd, ctx, e)
 			wide(fd, &ctx->cfg, e->flags);
 
 		test_each_engine_store("smoketest", fd, ctx, e)
@@ -3735,10 +3742,10 @@ igt_main
 		test_each_engine("pi-userfault", fd, ctx, e)
 			test_pi_userfault(fd, &ctx->cfg, e->flags);
 
-		test_each_engine("pi-distinct-iova", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("pi-distinct-iova", fd, ctx, e)
 			test_pi_iova(fd, &ctx->cfg, e->flags, 0);
 
-		test_each_engine("pi-shared-iova", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("pi-shared-iova", fd, ctx, e)
 			test_pi_iova(fd, &ctx->cfg, e->flags, SHARED);
 	}
 
-- 
2.41.0
