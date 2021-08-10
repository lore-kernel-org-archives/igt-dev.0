Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2972C89E05
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:28:23 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:26:58 +0200
Message-Id: <20210810052711.7866-53-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 52/65] tests/sysfs_heartbeat_interval:
 Adopt to use allocator
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
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/sysfs_heartbeat_interval.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
index b70b653b1..bc8d1b3c0 100644
--- a/tests/i915/sysfs_heartbeat_interval.c
+++ b/tests/i915/sysfs_heartbeat_interval.c
@@ -36,6 +36,7 @@
 #include "i915/gem.h"
 #include "i915/gem_context.h"
 #include "i915/gem_engine_topology.h"
+#include "intel_allocator.h"
 #include "igt_debugfs.h"
 #include "igt_dummyload.h"
 #include "igt_sysfs.h"
@@ -149,6 +150,7 @@ static uint64_t __test_timeout(int i915, int engine, unsigned int timeout)
 	igt_spin_t *spin[2];
 	uint64_t elapsed;
 	const intel_ctx_t *ctx[2];
+	uint64_t ahnd[2];
 
 	igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
 	igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
@@ -156,15 +158,18 @@ static uint64_t __test_timeout(int i915, int engine, unsigned int timeout)
 	set_heartbeat(engine, timeout);
 
 	ctx[0] = create_ctx(i915, class, inst, 1023);
-	spin[0] = igt_spin_new(i915, .ctx = ctx[0],
+	ahnd[0] = get_reloc_ahnd(i915, ctx[0]->id);
+	spin[0] = igt_spin_new(i915, .ahnd = ahnd[0], .ctx = ctx[0],
 			       .flags = (IGT_SPIN_NO_PREEMPTION |
 					 IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_OUT));
 	igt_spin_busywait_until_started(spin[0]);
 
 	ctx[1] = create_ctx(i915, class, inst, -1023);
+	ahnd[1] = get_reloc_ahnd(i915, ctx[1]->id);
 	igt_nsec_elapsed(&ts);
-	spin[1] = igt_spin_new(i915, .ctx = ctx[1], .flags = IGT_SPIN_POLL_RUN);
+	spin[1] = igt_spin_new(i915, .ahnd = ahnd[1], .ctx = ctx[1],
+				.flags = IGT_SPIN_POLL_RUN);
 	igt_spin_busywait_until_started(spin[1]);
 	elapsed = igt_nsec_elapsed(&ts);
 
@@ -177,6 +182,8 @@ static uint64_t __test_timeout(int i915, int engine, unsigned int timeout)
 
 	intel_ctx_destroy(i915, ctx[1]);
 	intel_ctx_destroy(i915, ctx[0]);
+	put_ahnd(ahnd[1]);
+	put_ahnd(ahnd[0]);
 	gem_quiescent_gpu(i915);
 
 	return elapsed;
@@ -292,17 +299,19 @@ static void client(int i915, int engine, int *ctl, int duration, int expect)
 	unsigned int class, inst;
 	unsigned long count = 0;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
 	igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
 
 	ctx = create_ctx(i915, class, inst, 0);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	while (!READ_ONCE(*ctl)) {
 		unsigned int elapsed;
 		igt_spin_t *spin;
 
-		spin = igt_spin_new(i915, .ctx = ctx,
+		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 				    .flags = (IGT_SPIN_NO_PREEMPTION |
 					      IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_FENCE_OUT));
@@ -331,6 +340,7 @@ static void client(int i915, int engine, int *ctl, int duration, int expect)
 	}
 
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 	igt_info("%s client completed %lu spins\n",
 		 expect < 0 ? "Bad" : "Good", count);
 }
@@ -354,6 +364,8 @@ static void __test_mixed(int i915, int engine,
 	 * terminate the hog leaving the good client to run.
 	 */
 
+	intel_allocator_multiprocess_start();
+
 	igt_assert(igt_sysfs_scanf(engine, ATTR, "%u", &saved) == 1);
 	igt_debug("Initial %s:%u\n", ATTR, saved);
 	gem_quiescent_gpu(i915);
@@ -378,6 +390,7 @@ static void __test_mixed(int i915, int engine,
 
 	gem_quiescent_gpu(i915);
 	set_heartbeat(engine, saved);
+	intel_allocator_multiprocess_stop();
 }
 
 static void test_mixed(int i915, int engine)
@@ -414,6 +427,7 @@ static void test_off(int i915, int engine)
 	unsigned int saved;
 	igt_spin_t *spin;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	/*
 	 * Some other clients request that there is never any interruption
@@ -433,8 +447,9 @@ static void test_off(int i915, int engine)
 	set_heartbeat(engine, 0);
 
 	ctx = create_ctx(i915, class, inst, 0);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
-	spin = igt_spin_new(i915, .ctx = ctx,
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 			    .flags = (IGT_SPIN_POLL_RUN |
 				      IGT_SPIN_NO_PREEMPTION |
 				      IGT_SPIN_FENCE_OUT));
@@ -455,6 +470,7 @@ static void test_off(int i915, int engine)
 	gem_quiescent_gpu(i915);
 	set_heartbeat(engine, saved);
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 }
 
 igt_main
-- 
2.26.0
