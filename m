Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB0B6E321
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 12:31:20 +0000 (UTC)
From: saigowth <sai.gowtham.ch@intel.com>
Date: Mon,  3 Feb 2020 18:01:03 +0530
Message-Id: <20200203123103.12397-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t]tests/i915/gem_exec_fence:Added
 __for_each_physical_engine to utilize all available engines.
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
To: sai.gowtham.ch@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Changes:-
1) Added __for_each_physical_engine .
2) moved subtests from static to dynamic

subtests that are modified:
1) basic-busy
2) basic-wait
3) basic-await
4) nb-await
5) keep-in-fence
6) parallel
7) busy-hang
8) wait-hang
9) await-hang
10) nb-await-hang
11) basic-busy-all
12) basic-wait-all
13) busy-hang-all
14) wait-hang-all

Cc: Dec Katarzyna <katarzyna.dec@intel.com>
Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
Signed-off-by: saigowth <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_exec_fence.c | 204 ++++++++++++++++++++++--------------
 1 file changed, 123 insertions(+), 81 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 6d369f58..36488ea7 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -46,7 +46,8 @@ struct sync_merge_data {
 #define SYNC_IOC_MERGE _IOWR(SYNC_IOC_MAGIC, 3, struct sync_merge_data)
 #endif
 
-static void store(int fd, unsigned ring, int fence, uint32_t target, unsigned offset_value)
+static void store(int fd, const struct intel_execution_engine2 *e,
+		  int fence, uint32_t target, unsigned offset_value)
 {
 	const int SCRATCH = 0;
 	const int BATCH = 1;
@@ -60,7 +61,7 @@ static void store(int fd, unsigned ring, int fence, uint32_t target, unsigned of
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
-	execbuf.flags = ring | I915_EXEC_FENCE_IN;
+	execbuf.flags = e->flags | I915_EXEC_FENCE_IN;
 	execbuf.rsvd2 = fence;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
@@ -108,7 +109,8 @@ static bool fence_busy(int fence)
 #define NONBLOCK 0x2
 #define WAIT 0x4
 
-static void test_fence_busy(int fd, unsigned ring, unsigned flags)
+static void test_fence_busy(int fd, const struct intel_execution_engine2 *e,
+			    unsigned flags)
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj;
@@ -119,14 +121,14 @@ static void test_fence_busy(int fd, unsigned ring, unsigned flags)
 	int fence, i, timeout;
 
 	if ((flags & HANG) == 0)
-		igt_require(gem_engine_has_mutable_submission(fd, ring));
+		igt_require(gem_class_has_mutable_submission(fd, e->class));
 
 	gem_quiescent_gpu(fd);
 
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
-	execbuf.flags = ring | I915_EXEC_FENCE_OUT;
+	execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, 4096);
@@ -205,6 +207,7 @@ static void test_fence_busy(int fd, unsigned ring, unsigned flags)
 
 static void test_fence_busy_all(int fd, unsigned flags)
 {
+	const struct intel_execution_engine2 *e;
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj;
 	struct drm_i915_gem_relocation_entry reloc;
@@ -260,14 +263,14 @@ static void test_fence_busy_all(int fd, unsigned flags)
 	i++;
 
 	all = -1;
-	for_each_engine(e, fd) {
+	__for_each_physical_engine(fd, e) {
 		int fence, new;
 
 		if ((flags & HANG) == 0 &&
-		    !gem_engine_has_mutable_submission(fd, eb_ring(e)))
+		    !gem_class_has_mutable_submission(fd, e->class))
 			continue;
 
-		execbuf.flags = eb_ring(e) | I915_EXEC_FENCE_OUT;
+		execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
 		execbuf.rsvd2 = -1;
 		gem_execbuf_wr(fd, &execbuf);
 		fence = execbuf.rsvd2 >> 32;
@@ -316,39 +319,41 @@ static void test_fence_busy_all(int fd, unsigned flags)
 	gem_quiescent_gpu(fd);
 }
 
-static void test_fence_await(int fd, unsigned ring, unsigned flags)
+static void test_fence_await(int fd, const struct intel_execution_engine2 *e,
+			     unsigned flags)
 {
+	const struct intel_execution_engine2 *e2;
 	uint32_t scratch = gem_create(fd, 4096);
 	igt_spin_t *spin;
 	uint32_t *out;
 	int i;
 
 	if ((flags & HANG) == 0)
-		igt_require(gem_engine_has_mutable_submission(fd, ring));
+		igt_require(gem_class_has_mutable_submission(fd, e->class));
 
-	igt_require(gem_can_store_dword(fd, 0));
+	igt_require(gem_class_can_store_dword(fd, 0));
 
 	out = gem_mmap__wc(fd, scratch, 0, 4096, PROT_WRITE);
 	gem_set_domain(fd, scratch,
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
 	spin = igt_spin_new(fd,
-			    .engine = ring,
+			    .engine = e->flags,
 			    .flags = (IGT_SPIN_FENCE_OUT |
 				      IGT_SPIN_NO_PREEMPTION |
 				      (flags & HANG ? IGT_SPIN_INVALID_CS : 0)));
 	igt_assert(spin->out_fence != -1);
 
 	i = 0;
-	for_each_physical_engine(e, fd) {
-		if (!gem_can_store_dword(fd, eb_ring(e)))
+	__for_each_physical_engine(fd, e2) {
+		if (!gem_class_can_store_dword(fd, e->class))
 			continue;
 
 		if (flags & NONBLOCK) {
-			store(fd, eb_ring(e), spin->out_fence, scratch, i);
+			store(fd, e2, spin->out_fence, scratch, i);
 		} else {
 			igt_fork(child, 1)
-				store(fd, eb_ring(e), spin->out_fence, scratch, i);
+				store(fd, e2, spin->out_fence, scratch, i);
 		}
 
 		i++;
@@ -376,13 +381,14 @@ static void test_fence_await(int fd, unsigned ring, unsigned flags)
 	gem_close(fd, scratch);
 }
 
-static void resubmit(int fd, uint32_t handle, unsigned int ring, int count)
+static void resubmit(int fd, uint32_t handle,
+		     const struct intel_execution_engine2 *e, int count)
 {
 	struct drm_i915_gem_exec_object2 obj = { .handle = handle };
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
-		.flags = ring,
+		.flags = e->flags,
 	};
 	while (count--)
 		gem_execbuf(fd, &execbuf);
@@ -404,8 +410,9 @@ static int __execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
 	return err;
 }
 
-static void test_parallel(int fd, unsigned int master)
+static void test_parallel(int fd, const struct intel_execution_engine2 *e)
 {
+	const struct intel_execution_engine2 *e2;
 	const int SCRATCH = 0;
 	const int BATCH = 1;
 	const int gen = intel_gen(intel_get_drm_devid(fd));
@@ -426,14 +433,14 @@ static void test_parallel(int fd, unsigned int master)
 	/* Fill the queue with many requests so that the next one has to
 	 * wait before it can be executed by the hardware.
 	 */
-	spin = igt_spin_new(fd, .engine = master, .dependency = plug);
-	resubmit(fd, spin->handle, master, 16);
+	spin = igt_spin_new(fd, .engine = e->flags, .dependency = plug);
+	resubmit(fd, spin->handle, e, 16);
 
 	/* Now queue the master request and its secondaries */
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
-	execbuf.flags = master | I915_EXEC_FENCE_OUT;
+	execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
 
@@ -502,11 +509,11 @@ static void test_parallel(int fd, unsigned int master)
 	obj[BATCH].relocation_count = 1;
 
 	/* Queue all secondaries */
-	for_each_physical_engine(e, fd) {
-		if (eb_ring(e) == master)
+	__for_each_physical_engine(fd, e2) {
+		if (e2->flags == e->flags)
 			continue;
 
-		execbuf.flags = eb_ring(e) | I915_EXEC_FENCE_SUBMIT;
+		execbuf.flags = e2->flags | I915_EXEC_FENCE_SUBMIT;
 		if (gen < 6)
 			execbuf.flags |= I915_EXEC_SECURE;
 
@@ -593,7 +600,7 @@ static inline uint32_t upper_32_bits(uint64_t x)
 	return x >> 32;
 }
 
-static void test_keep_in_fence(int fd, unsigned int engine, unsigned int flags)
+static void test_keep_in_fence(int fd, const struct intel_execution_engine2 *e)
 {
 	struct sigaction sa = { .sa_handler = alarm_handler };
 	struct drm_i915_gem_exec_object2 obj = {
@@ -602,14 +609,14 @@ static void test_keep_in_fence(int fd, unsigned int engine, unsigned int flags)
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
-		.flags = engine | I915_EXEC_FENCE_OUT,
+		.flags = e->flags | I915_EXEC_FENCE_OUT,
 	};
 	unsigned long count, last;
 	struct itimerval itv;
 	igt_spin_t *spin;
 	int fence;
 
-	spin = igt_spin_new(fd, .engine = engine);
+	spin = igt_spin_new(fd, .engine = e->flags);
 
 	gem_execbuf_wr(fd, &execbuf);
 	fence = upper_32_bits(execbuf.rsvd2);
@@ -1373,7 +1380,7 @@ static void test_syncobj_channel(int fd)
 
 igt_main
 {
-	const struct intel_execution_engine *e;
+	const struct intel_execution_engine2 *e;
 	int i915 = -1;
 
 	igt_fixture {
@@ -1412,69 +1419,105 @@ igt_main
 		}
 	}
 
-	for (e = intel_execution_engines; e->name; e++) {
-		igt_subtest_group {
+	igt_subtest_group {
+		__for_each_physical_engine(i915, e) {
 			igt_fixture {
-				igt_require(gem_has_ring(i915, eb_ring(e)));
-				igt_require(gem_can_store_dword(i915, eb_ring(e)));
+				igt_require(gem_class_can_store_dword(i915, e->class));
 			}
+		}
+		igt_subtest_group {
+			igt_fixture {
+				igt_fork_hang_detector(i915);
+		}
+			igt_subtest_with_dynamic("basic-busy") {
+				__for_each_physical_engine(i915, e) {
+				/* Requires master for STORE_DWORD on gen4/5 */
 
-			igt_subtest_group {
-				igt_fixture {
-					igt_fork_hang_detector(i915);
+					igt_dynamic_f("%s", e->name)
+						test_fence_busy(i915, e, 0);
 				}
-
-				igt_subtest_f("%sbusy-%s",
-						e->exec_id == 0 ? "basic-" : "",
-						e->name)
-					test_fence_busy(i915, eb_ring(e), 0);
-				igt_subtest_f("%swait-%s",
-						e->exec_id == 0 ? "basic-" : "",
-						e->name)
-					test_fence_busy(i915, eb_ring(e), WAIT);
-				igt_subtest_f("%sawait-%s",
-						e->exec_id == 0 ? "basic-" : "",
-						e->name)
-					test_fence_await(i915, eb_ring(e), 0);
-				igt_subtest_f("nb-await-%s", e->name)
-					test_fence_await(i915, eb_ring(e), NONBLOCK);
-
-				igt_subtest_f("keep-in-fence-%s", e->name)
-					test_keep_in_fence(i915, eb_ring(e), 0);
-
-				if (e->exec_id &&
-				    !(e->exec_id == I915_EXEC_BSD && !e->flags)) {
-					igt_subtest_f("parallel-%s", e->name) {
-						igt_require(has_submit_fence(i915));
-						igt_until_timeout(2)
-							test_parallel(i915, eb_ring(e));
-					}
+			}
+			igt_subtest_with_dynamic("basic-wait") {
+				__for_each_physical_engine(i915, e) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+					igt_dynamic_f("%s", e->name)
+						test_fence_busy(i915, e, WAIT);
 				}
-
-				igt_fixture {
-					igt_stop_hang_detector();
+			}
+			igt_subtest_with_dynamic("basic-await") {
+				__for_each_physical_engine(i915, e) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+					igt_dynamic_f("%s", e->name)
+						test_fence_await(i915, e, 0);
+				}
+			}
+			igt_subtest_with_dynamic("nb-await") {
+				__for_each_physical_engine(i915, e) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+					igt_dynamic_f("%s", e->name)
+						test_fence_await(i915,
+								 e, NONBLOCK);
+				}
+			}
+			igt_subtest_with_dynamic("keep-in-fence") {
+				__for_each_physical_engine(i915, e) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+					igt_dynamic_f("%s", e->name)
+						test_keep_in_fence(i915, e);
+				}
+			}
+			igt_subtest_with_dynamic("parallel") {
+				__for_each_physical_engine(i915, e) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+					igt_dynamic_f("%s", e->name)
+					igt_require(has_submit_fence(i915));
+					igt_until_timeout(2)
+						test_parallel(i915, e);
 				}
 			}
 
-			igt_subtest_group {
-				igt_hang_t hang;
+			igt_fixture {
+				igt_stop_hang_detector();
+			}
+		}
 
-				igt_fixture {
-					hang = igt_allow_hang(i915, 0, 0);
-				}
+		igt_subtest_group {
+			igt_hang_t hang;
 
-				igt_subtest_f("busy-hang-%s", e->name)
-					test_fence_busy(i915, eb_ring(e), HANG);
-				igt_subtest_f("wait-hang-%s", e->name)
-					test_fence_busy(i915, eb_ring(e), HANG | WAIT);
-				igt_subtest_f("await-hang-%s", e->name)
-					test_fence_await(i915, eb_ring(e), HANG);
-				igt_subtest_f("nb-await-hang-%s", e->name)
-					test_fence_await(i915, eb_ring(e), NONBLOCK | HANG);
-				igt_fixture {
-					igt_disallow_hang(i915, hang);
+			igt_fixture {
+				hang = igt_allow_hang(i915, 0, 0);
+			}
+			igt_subtest_with_dynamic("busy-hang") {
+				__for_each_physical_engine(i915, e) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+					igt_dynamic_f("%s", e->name)
+						test_fence_busy(i915, e, HANG);
+				}
+			}
+			igt_subtest_with_dynamic("wait-hang") {
+				__for_each_physical_engine(i915, e) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+					igt_dynamic_f("%s", e->name)
+						test_fence_busy(i915, e, HANG | WAIT);
+				}
+			}
+			igt_subtest_with_dynamic("await-hang") {
+				__for_each_physical_engine(i915, e) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+					igt_dynamic_f("%s", e->name)
+						test_fence_await(i915, e, HANG);
+				}
+			}
+			igt_subtest_with_dynamic("nb-await-hang") {
+				__for_each_physical_engine(i915, e) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+					igt_dynamic_f("%s", e->name)
+						test_fence_await(i915, e, NONBLOCK | HANG);
 				}
 			}
+			igt_fixture {
+				igt_disallow_hang(i915, hang);
+			}
 		}
 	}
 
@@ -1542,7 +1585,6 @@ igt_main
 			igt_stop_hang_detector();
 		}
 	}
-
 	igt_fixture {
 		close(i915);
 	}
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
