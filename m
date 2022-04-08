Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4795310E40C
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Apr 2022 16:56:48 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
To: arjun.melkaveri@intel.com, ashutosh.dixit@intel.com,
 igt-dev@lists.freedesktop.org
Date: Fri,  8 Apr 2022 22:26:43 +0530
Message-Id: <20220408165643.10211-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_persistence: Fixed
 assert issue seen for heartbeat-* tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

heartbeat-* tests were failing with assert mentioned below.
Issue got fixed by moving for_each_physical_ring to
for_each_ctx_cfg_engine, and creating right ctx .

Issue :-
Stack trace:
  #0 ../lib/igt_core.c:1756 __igt_fail_assert()
  #1 ../tests/i915/gem_ctx_persistence.c:589 test_noheartbeat_close()
  #2 [<unknown>+0x0]

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 49 +++++++++++++++++---------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 00dda3a8..08cd2a89 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -476,8 +476,10 @@ static bool set_preempt_timeout(int i915, const char *name, unsigned int value)
 	return true;
 }
 
-static void test_noheartbeat_many(int i915, int count, unsigned int flags)
+static void test_noheartbeat_many(int i915, const intel_ctx_cfg_t *cfg,
+				  int count, unsigned int flags)
 {
+	const struct intel_execution_engine2 *e;
 	unsigned long checked = 0;
 
 	cleanup(i915);
@@ -489,25 +491,25 @@ static void test_noheartbeat_many(int i915, int count, unsigned int flags)
 	 * cleaned up.
 	 */
 
-	for_each_physical_ring(e, i915) {
+	for_each_ctx_cfg_engine(i915, cfg, e) {
 		igt_spin_t *spin[count];
 		uint64_t ahnd;
 
-		if (!set_preempt_timeout(i915, e->full_name, 250))
+		if (!set_preempt_timeout(i915, e->name, 250))
 			continue;
 
-		if (!set_heartbeat(i915, e->full_name, 0))
+		if (!set_heartbeat(i915, e->name, 0))
 			continue;
 
-		igt_assert(set_heartbeat(i915, e->full_name, 500));
+		igt_assert(set_heartbeat(i915, e->name, 500));
 
 		for (int n = 0; n < ARRAY_SIZE(spin); n++) {
 			const intel_ctx_t *ctx;
 
-			ctx = intel_ctx_create(i915, NULL);
+			ctx = ctx_create_persistence(i915, cfg, false);
 			ahnd = get_reloc_ahnd(i915, ctx->id);
 			spin[n] = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
-					       .engine = eb_ring(e),
+					       .engine = e->flags,
 					       .flags = (IGT_SPIN_FENCE_OUT |
 							 IGT_SPIN_POLL_RUN |
 							 flags));
@@ -515,8 +517,8 @@ static void test_noheartbeat_many(int i915, int count, unsigned int flags)
 		}
 		igt_spin_busywait_until_started(spin[0]);
 
-		igt_debug("Testing %s\n", e->full_name);
-		igt_assert(set_heartbeat(i915, e->full_name, 0));
+		igt_debug("Testing %s\n", e->name);
+		igt_assert(set_heartbeat(i915, e->name, 0));
 
 		for (int n = 0; n < ARRAY_SIZE(spin); n++) {
 			igt_assert_eq(wait_for_status(spin[n]->out_fence, reset_timeout_ms),
@@ -529,15 +531,16 @@ static void test_noheartbeat_many(int i915, int count, unsigned int flags)
 			put_ahnd(ahnd);
 		}
 
-		set_heartbeat(i915, e->full_name, 2500);
+		set_heartbeat(i915, e->name, 2500);
 		cleanup(i915);
 		checked++;
 	}
 	igt_require(checked);
 }
 
-static void test_noheartbeat_close(int i915, unsigned int flags)
+static void test_noheartbeat_close(int i915, const intel_ctx_cfg_t *cfg, unsigned int flags)
 {
+	const struct intel_execution_engine2 *e;
 	unsigned long checked = 0;
 
 	cleanup(i915);
@@ -549,32 +552,32 @@ static void test_noheartbeat_close(int i915, unsigned int flags)
 	 * heartbeat has already been disabled.
 	 */
 
-	for_each_physical_ring(e, i915) {
+	for_each_ctx_cfg_engine(i915, cfg, e) {
 		igt_spin_t *spin;
 		const intel_ctx_t *ctx;
 		uint64_t ahnd;
 		int err;
 
-		if (!set_preempt_timeout(i915, e->full_name, 250))
+		if (!set_preempt_timeout(i915, e->name, 250))
 			continue;
 
-		if (!set_heartbeat(i915, e->full_name, 0))
+		if (!set_heartbeat(i915, e->name, 0))
 			continue;
 
-		ctx = intel_ctx_create(i915, NULL);
+		ctx = ctx_create_persistence(i915, cfg, false);
 		ahnd = get_reloc_ahnd(i915, ctx->id);
 		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
-				    .engine = eb_ring(e),
+				    .engine = e->flags,
 				    .flags = (IGT_SPIN_FENCE_OUT |
 					      IGT_SPIN_POLL_RUN |
 					      flags));
 		igt_spin_busywait_until_started(spin);
 
-		igt_debug("Testing %s\n", e->full_name);
+		igt_debug("Testing %s\n", e->name);
 		intel_ctx_destroy(i915, ctx);
 		err = wait_for_status(spin->out_fence, reset_timeout_ms);
 
-		set_heartbeat(i915, e->full_name, 2500);
+		set_heartbeat(i915, e->name, 2500);
 		igt_spin_free(i915, spin);
 		put_ahnd(ahnd);
 
@@ -1293,15 +1296,15 @@ igt_main
 		test_nohangcheck_hang(i915, &empty_cfg);
 
 	igt_subtest("heartbeat-stop")
-		test_noheartbeat_many(i915, 1, 0);
+		test_noheartbeat_many(i915, &empty_cfg, 1, 0);
 	igt_subtest("heartbeat-hang")
-		test_noheartbeat_many(i915, 1, IGT_SPIN_NO_PREEMPTION);
+		test_noheartbeat_many(i915, &empty_cfg, 1, IGT_SPIN_NO_PREEMPTION);
 	igt_subtest("heartbeat-many")
-		test_noheartbeat_many(i915, 16, 0);
+		test_noheartbeat_many(i915, &empty_cfg, 16, 0);
 	igt_subtest("heartbeat-close")
-		test_noheartbeat_close(i915, 0);
+		test_noheartbeat_close(i915, &empty_cfg, 0);
 	igt_subtest("heartbeat-hostile")
-		test_noheartbeat_close(i915, IGT_SPIN_NO_PREEMPTION);
+		test_noheartbeat_close(i915, &empty_cfg, IGT_SPIN_NO_PREEMPTION);
 
 	igt_subtest_group {
 		igt_fixture
-- 
2.25.1
