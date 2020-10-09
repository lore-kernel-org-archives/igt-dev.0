Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri,  9 Oct 2020 17:22:05 +0100
Message-Id: <20201009162206.1661402-2-chris@chris-wilson.co.uk>
In-Reply-To: <20201009162206.1661402-1-chris@chris-wilson.co.uk>
References: <20201009162206.1661402-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] i915/gem_exec_schedule: Include userptr
 scheduling tests
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

In practice, it turns out that compute likes to use userptr for
everything, and so in turn so must we.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_schedule.c | 41 +++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 488d93511..57c20560a 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -805,7 +805,7 @@ static uint32_t batch_create(int i915)
 	return __batch_create(i915, 0);
 }
 
-static void semaphore_userlock(int i915)
+static void semaphore_userlock(int i915, unsigned long flags)
 {
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_exec_object2 obj = {
@@ -828,7 +828,8 @@ static void semaphore_userlock(int i915)
 		if (!spin) {
 			spin = igt_spin_new(i915,
 					    .dependency = scratch,
-					    .engine = e->flags);
+					    .engine = e->flags,
+					    .flags = flags);
 		} else {
 			uint64_t saved = spin->execbuf.flags;
 
@@ -869,7 +870,7 @@ static void semaphore_userlock(int i915)
 	igt_spin_free(i915, spin);
 }
 
-static void semaphore_codependency(int i915)
+static void semaphore_codependency(int i915, unsigned long flags)
 {
 	const struct intel_execution_engine2 *e;
 	struct {
@@ -903,7 +904,7 @@ static void semaphore_codependency(int i915)
 			__igt_spin_new(i915,
 				       .ctx = ctx,
 				       .engine = e->flags,
-				       .flags = IGT_SPIN_POLL_RUN);
+				       .flags = IGT_SPIN_POLL_RUN | flags);
 		igt_spin_busywait_until_started(task[i].xcs);
 
 		/* Common rcs tasks will be queued in FIFO */
@@ -925,13 +926,18 @@ static void semaphore_codependency(int i915)
 	igt_spin_end(task[1].rcs);
 	gem_sync(i915, task[1].rcs->handle); /* to hang if task[0] hogs rcs */
 
+	for (i = 0; i < ARRAY_SIZE(task); i++) {
+		igt_spin_end(task[i].xcs);
+		igt_spin_end(task[i].rcs);
+	}
+
 	for (i = 0; i < ARRAY_SIZE(task); i++) {
 		igt_spin_free(i915, task[i].xcs);
 		igt_spin_free(i915, task[i].rcs);
 	}
 }
 
-static void semaphore_resolve(int i915)
+static void semaphore_resolve(int i915, unsigned long flags)
 {
 	const struct intel_execution_engine2 *e;
 	const uint32_t SEMAPHORE_ADDR = 64 << 10;
@@ -966,7 +972,7 @@ static void semaphore_resolve(int i915)
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
-		spin = __igt_spin_new(i915, .engine = e->flags);
+		spin = __igt_spin_new(i915, .engine = e->flags, .flags = flags);
 		igt_spin_end(spin); /* we just want its address for later */
 		gem_sync(i915, spin->handle);
 		igt_spin_reset(spin);
@@ -1060,7 +1066,7 @@ static void semaphore_resolve(int i915)
 	gem_context_destroy(i915, outer);
 }
 
-static void semaphore_noskip(int i915)
+static void semaphore_noskip(int i915, unsigned long flags)
 {
 	const int gen = intel_gen(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *outer, *inner;
@@ -1081,9 +1087,9 @@ static void semaphore_noskip(int i915)
 		    !gem_class_can_store_dword(i915, inner->class))
 			continue;
 
-		chain = __igt_spin_new(i915, .engine = outer->flags);
+		chain = __igt_spin_new(i915, .engine = outer->flags, .flags = flags);
 
-		spin = __igt_spin_new(i915, .engine = inner->flags);
+		spin = __igt_spin_new(i915, .engine = inner->flags, .flags = flags);
 		igt_spin_end(spin); /* we just want its address for later */
 		gem_sync(i915, spin->handle);
 		igt_spin_reset(spin);
@@ -2577,13 +2583,22 @@ igt_main
 			submit_slice(fd, e, LATE_SUBMIT);
 
 		igt_subtest("semaphore-user")
-			semaphore_userlock(fd);
+			semaphore_userlock(fd, 0);
 		igt_subtest("semaphore-codependency")
-			semaphore_codependency(fd);
+			semaphore_codependency(fd, 0);
 		igt_subtest("semaphore-resolve")
-			semaphore_resolve(fd);
+			semaphore_resolve(fd, 0);
 		igt_subtest("semaphore-noskip")
-			semaphore_noskip(fd);
+			semaphore_noskip(fd, 0);
+
+		igt_subtest("u-semaphore-user")
+			semaphore_userlock(fd, IGT_SPIN_USERPTR);
+		igt_subtest("u-semaphore-codependency")
+			semaphore_codependency(fd, IGT_SPIN_USERPTR);
+		igt_subtest("u-semaphore-resolve")
+			semaphore_resolve(fd, IGT_SPIN_USERPTR);
+		igt_subtest("u-semaphore-noskip")
+			semaphore_noskip(fd, IGT_SPIN_USERPTR);
 
 		igt_subtest("smoketest-all")
 			smoketest(fd, ALL_ENGINES, 30);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
