Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  6 May 2020 15:22:18 +0100
Message-Id: <20200506142218.3098955-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200506142218.3098955-1-chris@chris-wilson.co.uk>
References: <20200506142218.3098955-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/gem_exec_fence: Exercise
 timeslicing on submit-fence
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

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_fence.c | 124 ++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 4b0d87e4d..a75188c9c 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -46,6 +46,15 @@ struct sync_merge_data {
 #define SYNC_IOC_MERGE _IOWR(SYNC_IOC_MAGIC, 3, struct sync_merge_data)
 #endif
 
+#define MI_SEMAPHORE_WAIT		(0x1c << 23)
+#define   MI_SEMAPHORE_POLL             (1 << 15)
+#define   MI_SEMAPHORE_SAD_GT_SDD       (0 << 12)
+#define   MI_SEMAPHORE_SAD_GTE_SDD      (1 << 12)
+#define   MI_SEMAPHORE_SAD_LT_SDD       (2 << 12)
+#define   MI_SEMAPHORE_SAD_LTE_SDD      (3 << 12)
+#define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
+#define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
+
 static void store(int fd, const struct intel_execution_engine2 *e,
 		  int fence, uint32_t target, unsigned offset_value)
 {
@@ -376,6 +385,109 @@ static void test_fence_await(int fd, const struct intel_execution_engine2 *e,
 	gem_close(fd, scratch);
 }
 
+static uint32_t timeslicing_batches(int i915, uint32_t *offset)
+{
+        uint32_t handle = gem_create(i915, 4096);
+        uint32_t cs[256];
+
+	*offset += 4000;
+	for (int pair = 0; pair <= 1; pair++) {
+		int x = 1;
+		int i = 0;
+
+		for (int step = 0; step < 8; step++) {
+			if (pair) {
+				cs[i++] =
+					MI_SEMAPHORE_WAIT |
+					MI_SEMAPHORE_POLL |
+					MI_SEMAPHORE_SAD_EQ_SDD |
+					(4 - 2);
+				cs[i++] = x++;
+				cs[i++] = *offset;
+				cs[i++] = 0;
+			}
+
+			cs[i++] = MI_STORE_DWORD_IMM;
+			cs[i++] = *offset;
+			cs[i++] = 0;
+			cs[i++] = x++;
+
+			if (!pair) {
+				cs[i++] =
+					MI_SEMAPHORE_WAIT |
+					MI_SEMAPHORE_POLL |
+					MI_SEMAPHORE_SAD_EQ_SDD |
+					(4 - 2);
+				cs[i++] = x++;
+				cs[i++] = *offset;
+				cs[i++] = 0;
+			}
+		}
+
+		cs[i++] = MI_BATCH_BUFFER_END;
+		igt_assert(i < ARRAY_SIZE(cs));
+		gem_write(i915, handle, pair * sizeof(cs), cs, sizeof(cs));
+	}
+
+	*offset = sizeof(cs);
+        return handle;
+}
+
+static void test_submit_fence(int i915, unsigned int engine)
+{
+	const struct intel_execution_engine2 *e;
+
+	/*
+	 * Create a pair of interlocking batches, that ping pong
+	 * between each other, and only advance one step at a time.
+	 * We require the kernel to preempt at each semaphore and
+	 * switch to the other batch in order to advance.
+	 */
+
+	__for_each_physical_engine(i915, e) {
+		unsigned int offset = 24 << 20;
+		struct drm_i915_gem_exec_object2 obj = {
+			.offset = offset,
+			.flags = EXEC_OBJECT_PINNED,
+		};
+		struct drm_i915_gem_execbuffer2 execbuf  = {
+			.buffers_ptr = to_user_pointer(&obj),
+			.buffer_count = 1,
+		};
+		uint32_t result;
+		int out;
+
+		obj.handle = timeslicing_batches(i915, &offset);
+
+		execbuf.flags = engine | I915_EXEC_FENCE_OUT;
+		execbuf.batch_start_offset = 0;
+		gem_execbuf_wr(i915, &execbuf);
+
+		execbuf.rsvd1 = gem_context_clone_with_engines(i915, 0);
+		execbuf.rsvd2 >>= 32;
+		execbuf.flags = e->flags;
+		execbuf.flags |= I915_EXEC_FENCE_SUBMIT | I915_EXEC_FENCE_OUT;
+		execbuf.batch_start_offset = offset;
+		gem_execbuf_wr(i915, &execbuf);
+		gem_context_destroy(i915, execbuf.rsvd1);
+
+		gem_sync(i915, obj.handle);
+
+		/* no hangs! */
+		out = execbuf.rsvd2;
+		igt_assert_eq(sync_fence_status(out), 1);
+		close(out);
+
+		out = execbuf.rsvd2 >> 32;
+		igt_assert_eq(sync_fence_status(out), 1);
+		close(out);
+
+		gem_read(i915, obj.handle, 4000, &result, sizeof(result));
+		igt_assert_eq(result, 16);
+		gem_close(i915, obj.handle);
+	}
+}
+
 static void resubmit(int fd, uint32_t handle,
 		     const struct intel_execution_engine2 *e, int count)
 {
@@ -1458,6 +1570,18 @@ igt_main
 				}
 			}
 
+			igt_subtest_with_dynamic("submit") {
+				igt_require(gem_scheduler_has_semaphores(i915));
+				igt_require(gem_scheduler_has_preemption(i915));
+				igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+
+				__for_each_physical_engine(i915, e) {
+
+					igt_dynamic_f("%s", e->name)
+						test_submit_fence(i915, e->flags);
+				}
+			}
+
 			igt_fixture {
 				igt_stop_hang_detector();
 			}
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
