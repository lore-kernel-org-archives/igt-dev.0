Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA07B10E48D
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 09:43:07 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 13 Sep 2023 11:42:52 +0200
Message-ID: <20230913094252.6246-4-nirmoy.das@intel.com>
In-Reply-To: <20230913094252.6246-1-nirmoy.das@intel.com>
References: <20230913094252.6246-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/intel/gem_ctx_schedule: Skip some
 test on MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: andi.shyti@intel.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We do GGTT update on MTL using bcs engine, blocking that would
will fail the test so skip such subtests on bcs engine for MTL.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/gem_exec_schedule.c | 39 ++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index c94988d36..288503c70 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -3503,21 +3503,27 @@ igt_main
 		const struct intel_execution_engine2 *e;
 
 		test_each_engine_store("fifo", fd, ctx, e)
-			fifo(fd, ctx, e->flags);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				fifo(fd, ctx, e->flags);
 
 		test_each_engine_store("implicit-read-write", fd, ctx, e)
-			implicit_rw(fd, ctx, e->flags, READ_WRITE);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				implicit_rw(fd, ctx, e->flags, READ_WRITE);
 
 		test_each_engine_store("implicit-write-read", fd, ctx, e)
-			implicit_rw(fd, ctx, e->flags, WRITE_READ);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				implicit_rw(fd, ctx, e->flags, WRITE_READ);
 
 		test_each_engine_store("implicit-boths", fd, ctx, e)
-			implicit_rw(fd, ctx, e->flags, READ_WRITE | WRITE_READ);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				implicit_rw(fd, ctx, e->flags, READ_WRITE | WRITE_READ);
 
 		test_each_engine_store("independent", fd, ctx, e)
-			independent(fd, ctx, e->flags, 0);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				independent(fd, ctx, e->flags, 0);
 		test_each_engine_store("u-independent", fd, ctx, e)
-			independent(fd, ctx, e->flags, IGT_SPIN_USERPTR);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				independent(fd, ctx, e->flags, IGT_SPIN_USERPTR);
 	}
 
 	igt_subtest_group {
@@ -3613,13 +3619,16 @@ igt_main
 			smoketest(fd, &ctx->cfg, ALL_ENGINES, 30);
 
 		test_each_engine_store("in-order", fd, ctx, e)
-			reorder(fd, &ctx->cfg, e->flags, EQUAL);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				reorder(fd, &ctx->cfg, e->flags, EQUAL);
 
 		test_each_engine_store("out-order", fd, ctx, e)
-			reorder(fd, &ctx->cfg, e->flags, 0);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				reorder(fd, &ctx->cfg, e->flags, 0);
 
 		test_each_engine_store("promotion", fd, ctx, e)
-			promotion(fd, &ctx->cfg, e->flags);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				promotion(fd, &ctx->cfg, e->flags);
 
 		igt_subtest_group {
 			igt_fixture {
@@ -3686,7 +3695,8 @@ igt_main
 		}
 
 		test_each_engine_store("noreorder", fd, ctx, e)
-			noreorder(fd, &ctx->cfg, e->flags, 0, 0);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				noreorder(fd, &ctx->cfg, e->flags, 0, 0);
 
 		test_each_engine_store("noreorder-priority", fd, ctx, e) {
 			igt_require(gem_scheduler_enabled(fd));
@@ -3695,7 +3705,8 @@ igt_main
 
 		test_each_engine_store("noreorder-corked", fd, ctx, e) {
 			igt_require(gem_scheduler_enabled(fd));
-			noreorder(fd, &ctx->cfg, e->flags, MAX_PRIO, CORKED);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				noreorder(fd, &ctx->cfg, e->flags, MAX_PRIO, CORKED);
 		}
 
 		test_each_engine_store("deep", fd, ctx, e)
@@ -3736,10 +3747,12 @@ igt_main
 			test_pi_userfault(fd, &ctx->cfg, e->flags);
 
 		test_each_engine("pi-distinct-iova", fd, ctx, e)
-			test_pi_iova(fd, &ctx->cfg, e->flags, 0);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				test_pi_iova(fd, &ctx->cfg, e->flags, 0);
 
 		test_each_engine("pi-shared-iova", fd, ctx, e)
-			test_pi_iova(fd, &ctx->cfg, e->flags, SHARED);
+			if (!(gem_has_ggtt_bind(fd) && e->class == I915_ENGINE_CLASS_COPY))
+				test_pi_iova(fd, &ctx->cfg, e->flags, SHARED);
 	}
 
 	igt_subtest_group {
-- 
2.41.0
