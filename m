Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 30 Mar 2020 10:21:15 +0100
Message-Id: <20200330092117.810776-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200330092117.810776-1-chris@chris-wilson.co.uk>
References: <20200330092117.810776-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] i915/gem_exec_async: Dynamise
 per-engine tests
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

Convert the per-engine tests into a dynamic subtest.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_async.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
index 623493963..3187b4f63 100644
--- a/tests/i915/gem_exec_async.c
+++ b/tests/i915/gem_exec_async.c
@@ -80,9 +80,10 @@ static void store_dword(int fd, unsigned ring,
 	gem_close(fd, obj[1].handle);
 }
 
-static void one(int fd, unsigned ring, uint32_t flags)
+static void one(int fd, unsigned engine)
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
+	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_exec_object2 obj[2];
 #define SCRATCH 0
 #define BATCH 1
@@ -137,22 +138,20 @@ static void one(int fd, unsigned ring, uint32_t flags)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
-	execbuf.flags = ring | flags;
-
-	igt_require(gem_engine_has_mutable_submission(fd, ring));
+	execbuf.flags = engine;
 
 	igt_require(__gem_execbuf(fd, &execbuf) == 0);
 	gem_close(fd, obj[BATCH].handle);
 
 	i = 0;
-	for_each_physical_engine(e, fd) {
-		if (eb_ring(e) == ring)
+	__for_each_physical_engine(fd, e) {
+		if (e->flags == engine)
 			continue;
 
-		if (!gem_can_store_dword(fd, eb_ring(e)))
+		if (!gem_class_can_store_dword(fd, e->class))
 			continue;
 
-		store_dword(fd, eb_ring(e), obj[SCRATCH].handle, 4*i, i);
+		store_dword(fd, e->flags, obj[SCRATCH].handle, 4*i, i);
 		i++;
 	}
 
@@ -185,9 +184,15 @@ static bool has_async_execbuf(int fd)
 	return async > 0;
 }
 
+#define test_each_engine(T, i915, e) \
+	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+		for_each_if(gem_class_can_store_dword(i915, (e)->class) && \
+			    gem_class_has_mutable_submission(i915, (e)->class))\
+			igt_dynamic_f("%s", (e)->name)
+
 igt_main
 {
-	const struct intel_execution_engine *e;
+	const struct intel_execution_engine2 *e;
 	int fd = -1;
 
 	igt_fixture {
@@ -195,21 +200,11 @@ igt_main
 		igt_require_gem(fd);
 		gem_require_mmap_wc(fd);
 		igt_require(has_async_execbuf(fd));
-		igt_require(gem_can_store_dword(fd, 0));
 		igt_fork_hang_detector(fd);
 	}
 
-	for (e = intel_execution_engines; e->name; e++) {
-		/* default exec-id is purely symbolic */
-		if (e->exec_id == 0)
-			continue;
-
-		igt_subtest_f("concurrent-writes-%s", e->name) {
-			igt_require(gem_ring_has_physical_engine(fd, eb_ring(e)));
-			igt_require(gem_can_store_dword(fd, eb_ring(e)));
-			one(fd, e->exec_id, e->flags);
-		}
-	}
+	test_each_engine("concurrent-writes", fd, e)
+		one(fd, e->flags);
 
 	igt_fixture {
 		igt_stop_hang_detector();
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
