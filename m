Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D006E422
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 18:33:21 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date: Wed, 29 Jan 2020 23:40:02 +0530
Message-Id: <20200129181002.9405-2-krishnaiah.bommu@intel.com>
In-Reply-To: <20200129181002.9405-1-krishnaiah.bommu@intel.com>
References: <20200129181002.9405-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 1/1] tests/i915/gem_ctx_persistence: Set
 context with supported engines
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Update the context with supported engines on the platform with set_property
I915_CONTEXT_PARAM_ENGINES to make sure the work load is submitted to
the available engines only.

v2: addressed the review comments.
v3: addressed v2 review comments.
V4: Re-introduced the gem_context_set_all_engines() API,test_process_mixed()
test creating new forked process, to set engine map to new forked process
I added gem_context_set_all_engines() API.
v5: addressed v4 review comments.
v6: addressed chris comments.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 59 +++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 13 deletions(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 43333aaf..de6f5925 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -156,7 +156,7 @@ static void test_persistence(int i915, unsigned int engine)
 	 * request is retired -- no early termination.
 	 */
 
-	ctx = gem_context_create(i915);
+	ctx = gem_context_clone_with_engines(i915, 0);
 	gem_context_set_persistence(i915, ctx, true);
 
 	spin = igt_spin_new(i915, ctx,
@@ -188,7 +188,7 @@ static void test_nonpersistent_cleanup(int i915, unsigned int engine)
 	 * any inflight request is cancelled.
 	 */
 
-	ctx = gem_context_create(i915);
+	ctx = gem_context_clone_with_engines(i915, 0);
 	gem_context_set_persistence(i915, ctx, false);
 
 	spin = igt_spin_new(i915, ctx,
@@ -217,7 +217,7 @@ static void test_nonpersistent_mixed(int i915, unsigned int engine)
 		igt_spin_t *spin;
 		uint32_t ctx;
 
-		ctx = gem_context_create(i915);
+		ctx = gem_context_clone_with_engines(i915, 0);
 		gem_context_set_persistence(i915, ctx, i & 1);
 
 		spin = igt_spin_new(i915, ctx,
@@ -253,7 +253,7 @@ static void test_nonpersistent_hostile(int i915, unsigned int engine)
 	 * the requests and cleanup the context.
 	 */
 
-	ctx = gem_context_create(i915);
+	ctx = gem_context_clone_with_engines(i915, 0);
 	gem_context_set_persistence(i915, ctx, false);
 
 	spin = igt_spin_new(i915, ctx,
@@ -284,7 +284,7 @@ static void test_nonpersistent_hostile_preempt(int i915, unsigned int engine)
 
 	igt_require(gem_scheduler_has_preemption(i915));
 
-	ctx = gem_context_create(i915);
+	ctx = gem_context_clone_with_engines(i915, 0);
 	gem_context_set_persistence(i915, ctx, true);
 	gem_context_set_priority(i915, ctx, 0);
 	spin[0] = igt_spin_new(i915, ctx,
@@ -295,7 +295,7 @@ static void test_nonpersistent_hostile_preempt(int i915, unsigned int engine)
 
 	igt_spin_busywait_until_started(spin[0]);
 
-	ctx = gem_context_create(i915);
+	ctx = gem_context_clone_with_engines(i915, 0);
 	gem_context_set_persistence(i915, ctx, false);
 	gem_context_set_priority(i915, ctx, 1); /* higher priority than 0 */
 	spin[1] = igt_spin_new(i915, ctx,
@@ -445,7 +445,7 @@ static void test_nonpersistent_queued(int i915, unsigned int engine)
 
 	gem_quiescent_gpu(i915);
 
-	ctx = gem_context_create(i915);
+	ctx = gem_context_clone_with_engines(i915, 0);
 	gem_context_set_persistence(i915, ctx, false);
 	spin = igt_spin_new(i915, ctx,
 			    .engine = engine,
@@ -552,7 +552,7 @@ static void test_process(int i915)
 	gem_quiescent_gpu(i915);
 }
 
-static void test_process_mixed(int i915, unsigned int engine)
+static void test_process_mixed(int pfd, unsigned int engine)
 {
 	int fence[2], sv[2];
 
@@ -565,7 +565,8 @@ static void test_process_mixed(int i915, unsigned int engine)
 	igt_require(socketpair(AF_UNIX, SOCK_DGRAM, 0, sv) == 0);
 
 	igt_fork(child, 1) {
-		i915 = gem_reopen_driver(i915);
+		int i915;
+		i915 = gem_reopen_driver(pfd);
 		gem_quiescent_gpu(i915);
 
 		for (int persists = 0; persists <= 1; persists++) {
@@ -573,6 +574,7 @@ static void test_process_mixed(int i915, unsigned int engine)
 			uint32_t ctx;
 
 			ctx = gem_context_create(i915);
+			gem_context_copy_engines(pfd, 0, i915, ctx);
 			gem_context_set_persistence(i915, ctx, persists);
 
 			spin = igt_spin_new(i915, ctx,
@@ -586,7 +588,7 @@ static void test_process_mixed(int i915, unsigned int engine)
 	}
 	close(sv[0]);
 	igt_waitchildren();
-	flush_delayed_fput(i915);
+	flush_delayed_fput(pfd);
 
 	fence[0] = recvfd(sv[1]);
 	fence[1] = recvfd(sv[1]);
@@ -602,9 +604,9 @@ static void test_process_mixed(int i915, unsigned int engine)
 	close(fence[1]);
 
 	/* We have to manually clean up the orphaned spinner */
-	igt_drop_caches_set(i915, DROP_RESET_ACTIVE);
+	igt_drop_caches_set(pfd, DROP_RESET_ACTIVE);
 
-	gem_quiescent_gpu(i915);
+	gem_quiescent_gpu(pfd);
 }
 
 static void test_processes(int i915)
@@ -789,13 +791,44 @@ igt_main
 	igt_subtest("hang")
 		test_nohangcheck_hang(i915);
 
-	__for_each_static_engine(e) {
+	for_each_engine(e, i915) {
 		igt_subtest_group {
 			igt_fixture {
 				gem_require_ring(i915, e->flags);
 				gem_require_contexts(i915);
 			}
 
+			igt_subtest_f("legacy-%s-persistence", e->name)
+				test_persistence(i915, e->flags);
+
+			igt_subtest_f("legacy-%s-cleanup", e->name)
+				test_nonpersistent_cleanup(i915, e->flags);
+
+			igt_subtest_f("legacy-%s-queued", e->name)
+				test_nonpersistent_queued(i915, e->flags);
+
+			igt_subtest_f("legacy-%s-mixed", e->name)
+				test_nonpersistent_mixed(i915, e->flags);
+
+			igt_subtest_f("legacy-%s-mixed-process", e->name)
+				test_process_mixed(i915, e->flags);
+
+			igt_subtest_f("legacy-%s-hostile", e->name)
+				test_nonpersistent_hostile(i915, e->flags);
+
+			igt_subtest_f("legacy-%s-hostile-preempt", e->name)
+				test_nonpersistent_hostile_preempt(i915,
+								   e->flags);
+		}
+	}
+
+        __for_each_physical_engine(i915, e) {
+                igt_subtest_group {
+                        igt_fixture {
+                                gem_require_ring(i915, e->flags);
+                                gem_require_contexts(i915);
+                        }
+
 			igt_subtest_f("%s-persistence", e->name)
 				test_persistence(i915, e->flags);
 
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
