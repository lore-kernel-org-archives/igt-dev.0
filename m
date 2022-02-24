Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CF110E159
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 22:02:40 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Feb 2022 14:02:29 -0800
Message-Id: <20220224220229.25548-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_dummyload: Drop ahnd from igt_spin_t
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jasmine.newsome@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In 4d9396e67930 we have started storing the opts with which the spin was
created as part of igt_spin_t. The ahnd stored as part of igt_spin_t is
therefore redundant. We can get ahnd from opts.ahnd.

Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Cc: Jasmine Newsome <jasmine.newsome@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_dummyload.c              | 9 ++++-----
 lib/igt_dummyload.h              | 1 -
 tests/i915/gem_ctx_persistence.c | 2 +-
 tests/i915/gem_ctx_shared.c      | 2 +-
 tests/i915/gem_exec_balancer.c   | 2 +-
 tests/i915/gem_exec_schedule.c   | 6 +++---
 tests/i915/gem_spin_batch.c      | 2 +-
 tests/i915/gem_watchdog.c        | 2 +-
 tests/i915/i915_hangman.c        | 2 +-
 9 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 0b2be154dd97..dc1bd51e0823 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -128,7 +128,6 @@ emit_recursive_batch(igt_spin_t *spin,
 		addr += random() % addr / 2;
 		addr &= -4096;
 	} else {
-		spin->ahnd = ahnd;
 		objflags |= EXEC_OBJECT_PINNED;
 	}
 
@@ -612,14 +611,14 @@ static void __igt_spin_free(int fd, igt_spin_t *spin)
 
 	if (spin->poll_handle) {
 		gem_close(fd, spin->poll_handle);
-		if (spin->ahnd)
-			intel_allocator_free(spin->ahnd, spin->poll_handle);
+		if (spin->opts.ahnd)
+			intel_allocator_free(spin->opts.ahnd, spin->poll_handle);
 	}
 
 	if (spin->handle) {
 		gem_close(fd, spin->handle);
-		if (spin->ahnd)
-			intel_allocator_free(spin->ahnd, spin->handle);
+		if (spin->opts.ahnd)
+			intel_allocator_free(spin->opts.ahnd, spin->handle);
 	}
 
 	if (spin->out_fence >= 0)
diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
index af9e6a435dc3..b33507971b65 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -81,7 +81,6 @@ typedef struct igt_spin {
 	unsigned int flags;
 #define SPIN_CLFLUSH (1 << 0)
 
-	uint64_t ahnd;
 	struct igt_spin_factory opts;
 } igt_spin_t;
 
diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 9312aec302a5..00dda3a8b52d 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -524,7 +524,7 @@ static void test_noheartbeat_many(int i915, int count, unsigned int flags)
 		}
 
 		for (int n = 0; n < ARRAY_SIZE(spin); n++) {
-			ahnd = spin[n]->ahnd;
+			ahnd = spin[n]->opts.ahnd;
 			igt_spin_free(i915, spin[n]);
 			put_ahnd(ahnd);
 		}
diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index 37444185649c..cc547b87b065 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -628,7 +628,7 @@ static void unplug_show_queue(int i915, struct igt_cork *c, uint64_t ahnd,
 	usleep(25000);
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
-		ahnd = spin[n]->ahnd;
+		ahnd = spin[n]->opts.ahnd;
 		igt_spin_free(i915, spin[n]);
 		if (!cfg->vm)
 			put_ahnd(ahnd);
diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 42fd0a5220bf..857d008563da 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -2387,7 +2387,7 @@ static void hangme(int i915)
 			igt_assert_eq(sync_fence_status(c->spin[1]->out_fence),
 				      -EIO);
 
-			ahnd = c->spin[0]->ahnd;
+			ahnd = c->spin[0]->opts.ahnd;
 			igt_spin_free(i915, c->spin[0]);
 			igt_spin_free(i915, c->spin[1]);
 			put_ahnd(ahnd);
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 119ec2d4369d..cf7e4d4eb3b6 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -252,7 +252,7 @@ static void unplug_show_queue(int fd, struct igt_cork *c,
 	usleep(25000);
 
 	for (int n = 0; n < max; n++) {
-		uint64_t ahnd = spin[n]->ahnd;
+		uint64_t ahnd = spin[n]->opts.ahnd;
 		igt_spin_free(fd, spin[n]);
 		put_ahnd(ahnd);
 	}
@@ -1042,7 +1042,7 @@ static void semaphore_codependency(int i915, const intel_ctx_t *ctx,
 	}
 
 	for (i = 0; i < ARRAY_SIZE(task); i++) {
-		ahnd = task[i].rcs->ahnd;
+		ahnd = task[i].rcs->opts.ahnd;
 		igt_spin_free(i915, task[i].xcs);
 		igt_spin_free(i915, task[i].rcs);
 		put_ahnd(ahnd);
@@ -1994,7 +1994,7 @@ static void preemptive_hang(int fd, const intel_ctx_cfg_t *cfg,
 		 * This is subject to change as the scheduler evolve. The test should
 		 * be updated to reflect such changes.
 		 */
-		ahnd_lo = spin[n]->ahnd;
+		ahnd_lo = spin[n]->opts.ahnd;
 		igt_assert(gem_bo_busy(fd, spin[n]->handle));
 		igt_spin_free(fd, spin[n]);
 		put_ahnd(ahnd_lo);
diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
index 707d69b6f497..9b39bfc78620 100644
--- a/tests/i915/gem_spin_batch.c
+++ b/tests/i915/gem_spin_batch.c
@@ -168,7 +168,7 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 
 	igt_list_for_each_entry_safe(spin, n, &list, link) {
 		igt_assert(gem_bo_busy(i915, spin->handle));
-		ahnd = spin->ahnd;
+		ahnd = spin->opts.ahnd;
 		igt_spin_end(spin);
 		if (flags & PARALLEL_SPIN_NEW_CTX)
 			intel_ctx_destroy(i915, spin->opts.ctx);
diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
index a9d7f9da7feb..fc1ba007128c 100644
--- a/tests/i915/gem_watchdog.c
+++ b/tests/i915/gem_watchdog.c
@@ -261,7 +261,7 @@ static void virtual(int i915, const intel_ctx_cfg_t *base_cfg)
 	count = wait_timeout(i915, spin, num_engines, wait_us, expect);
 
 	for (i = 0; i < num_engines && spin[i]; i++) {
-		ahnd = spin[i]->ahnd;
+		ahnd = spin[i]->opts.ahnd;
 		igt_spin_free(i915, spin[i]);
 		intel_ctx_destroy(i915, ctx[i]);
 		put_ahnd(ahnd);
diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 23055c2715f1..c7d69fdd69b8 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -346,7 +346,7 @@ test_engine_hang(const intel_ctx_t *ctx,
 
 	/* But no other engines/clients should be affected */
 	igt_list_for_each_entry_safe(spin, next, &list, link) {
-		ahndN = spin->ahnd;
+		ahndN = spin->opts.ahnd;
 		igt_assert(sync_fence_wait(spin->out_fence, 0) == -ETIME);
 		igt_spin_end(spin);
 
-- 
2.34.1
