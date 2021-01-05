Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  5 Jan 2021 22:16:48 +0000
Message-Id: <20210105221648.3456839-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210105220941.3456706-1-chris@chris-wilson.co.uk>
References: <20210105220941.3456706-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_engine: Prerun the spinner to
 bind offsets before use
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

Set the spinner and target execbuf up before we start the test; this not
only saves time in recreating the spinner on each loop, but it ensures
that we don't antagonise ourselves by fighting over GTT offsets.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
---
 tests/i915/gem_ctx_engines.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index eab0cc40a..4ce4fdf3e 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -333,31 +333,37 @@ static void execute_one(int i915)
 	};
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	const struct intel_execution_engine2 *e;
+	igt_spin_t *spin;
+
+	/* Prewarm the spinner */
+	spin = igt_spin_new(i915, .ctx = param.ctx_id,
+			    .flags = (IGT_SPIN_NO_PREEMPTION |
+				      IGT_SPIN_POLL_RUN));
 
 	gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
 
 	/* Unadulterated I915_EXEC_DEFAULT should work */
 	execbuf.flags = 0;
 	gem_execbuf(i915, &execbuf);
+	obj.flags |= EXEC_OBJECT_PINNED;
+
+	igt_spin_end(spin);
 	gem_sync(i915, obj.handle);
 
 	__for_each_physical_engine(i915, e) {
 		struct drm_i915_gem_busy busy = { .handle = obj.handle };
 
-		for (int i = -1; i <= I915_EXEC_RING_MASK; i++) {
-			igt_spin_t *spin;
+		igt_debug("Testing [%s...]\n", e->name);
 
+		for (int i = -1; i <= I915_EXEC_RING_MASK; i++) {
 			memset(&engines, 0, sizeof(engines));
 			engine_class(&engines, 0) = e->class;
 			engine_instance(&engines, 0) = e->instance;
 			param.size = offsetof(typeof(engines), engines[1]);
 			gem_context_set_param(i915, &param);
 
-			spin = igt_spin_new(i915,
-					    .ctx = param.ctx_id,
-					    .engine = 0,
-					    .flags = (IGT_SPIN_NO_PREEMPTION |
-						      IGT_SPIN_POLL_RUN));
+			igt_spin_reset(spin);
+			gem_execbuf(i915, &spin->execbuf);
 
 			igt_debug("Testing with map of %d engines\n", i + 1);
 			memset(&engines.engines, -1, sizeof(engines.engines));
@@ -382,7 +388,7 @@ static void execute_one(int i915)
 			igt_assert_eq(batch_busy(busy.busy),
 				      i != -1 ? 1 << e->class : 0);
 
-			igt_spin_free(i915, spin);
+			igt_spin_end(spin);
 
 			gem_sync(i915, obj.handle);
 			do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
@@ -396,6 +402,8 @@ static void execute_one(int i915)
 	execbuf.flags = 0;
 	gem_execbuf(i915, &execbuf);
 
+	igt_spin_free(i915, spin);
+
 	gem_close(i915, obj.handle);
 	gem_context_destroy(i915, param.ctx_id);
 }
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
