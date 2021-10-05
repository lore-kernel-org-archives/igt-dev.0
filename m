Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6956E2D7
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 05:16:41 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Tue,  5 Oct 2021 10:44:48 +0530
Message-Id: <20211005051448.10856-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_sync: Add support for local
 memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com, zbigniew.kempczynski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

Add support for local memory region (Device memory)

Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_sync.c | 198 +++++++++++++++++++++++++++++-------------
 1 file changed, 136 insertions(+), 62 deletions(-)

diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index 6cb00c40..f80b6310 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -143,9 +143,20 @@ static void xchg_engine(void *array, unsigned i, unsigned j)
 	igt_swap(E[i], E[j]);
 }
 
+static uint32_t batch_create(int fd, uint32_t batch_size, uint32_t region)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	uint32_t handle;
+
+	handle = gem_create_in_memory_regions(fd, 4096, region);
+	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
+
+	return handle;
+}
+
 static void
 sync_ring(int fd, const intel_ctx_t *ctx,
-	  unsigned ring, int num_children, int timeout)
+	  unsigned ring, int num_children, int timeout, uint32_t region)
 {
 	struct intel_engine_data ied;
 
@@ -155,15 +166,13 @@ sync_ring(int fd, const intel_ctx_t *ctx,
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_children) {
-		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 object;
 		struct drm_i915_gem_execbuffer2 execbuf;
 		double start, elapsed;
 		unsigned long cycles;
 
 		memset(&object, 0, sizeof(object));
-		object.handle = gem_create(fd, 4096);
-		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
+		object.handle = batch_create(fd, 4096, region);
 
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
@@ -193,9 +202,8 @@ sync_ring(int fd, const intel_ctx_t *ctx,
 
 static void
 idle_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
-	  int num_children, int timeout)
+	  int num_children, int timeout, uint32_t region)
 {
-	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 object;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	double start, elapsed;
@@ -204,8 +212,7 @@ idle_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
 	gem_require_ring(fd, ring);
 
 	memset(&object, 0, sizeof(object));
-	object.handle = gem_create(fd, 4096);
-	gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
+	object.handle = batch_create(fd, 4096, region);
 
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&object);
@@ -234,7 +241,7 @@ idle_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
 
 static void
 wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
-	    int timeout, int wlen)
+	    int timeout, int wlen, uint32_t region)
 {
 	struct intel_engine_data ied;
 
@@ -243,7 +250,6 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, ied.nengines) {
-		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 object;
 		struct drm_i915_gem_execbuffer2 execbuf;
 		double end, this, elapsed, now, baseline;
@@ -251,8 +257,7 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		igt_spin_t *spin;
 
 		memset(&object, 0, sizeof(object));
-		object.handle = gem_create(fd, 4096);
-		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
+		object.handle = batch_create(fd, 4096, region);
 
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
@@ -329,7 +334,7 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 }
 
 static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
-			int num_children, int timeout)
+			int num_children, int timeout, uint32_t region)
 {
 	struct intel_engine_data ied;
 
@@ -381,7 +386,7 @@ static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
 
 static void
 active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
-		   int timeout, int wlen)
+		   int timeout, int wlen, uint32_t region)
 {
 	struct intel_engine_data ied;
 
@@ -390,7 +395,6 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, ied.nengines) {
-		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 object;
 		struct drm_i915_gem_execbuffer2 execbuf;
 		double end, this, elapsed, now, baseline;
@@ -398,8 +402,7 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		igt_spin_t *spin[2];
 
 		memset(&object, 0, sizeof(object));
-		object.handle = gem_create(fd, 4096);
-		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
+		object.handle = batch_create(fd, 4096, region);
 
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
@@ -497,7 +500,7 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 
 static void
 store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
-	   int num_children, int timeout)
+	   int num_children, int timeout, uint32_t region)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct intel_engine_data ied;
@@ -508,7 +511,6 @@ store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_children) {
-		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 object[2];
 		struct drm_i915_gem_relocation_entry reloc[1024];
 		struct drm_i915_gem_execbuffer2 execbuf;
@@ -526,8 +528,7 @@ store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		execbuf.rsvd1 = ctx->id;
 
 		memset(object, 0, sizeof(object));
-		object[0].handle = gem_create(fd, 4096);
-		gem_write(fd, object[0].handle, 0, &bbe, sizeof(bbe));
+		object[0].handle = batch_create(fd, 4096, region);
 		execbuf.buffer_count = 1;
 		gem_execbuf(fd, &execbuf);
 
@@ -595,7 +596,7 @@ store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 
 static void
 switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
-	    int num_children, int timeout)
+	    int num_children, int timeout, uint32_t region)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct intel_engine_data ied;
@@ -618,7 +619,6 @@ switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		unsigned long cycles;
 
 		for (int i = 0; i < ARRAY_SIZE(contexts); i++) {
-			const uint32_t bbe = MI_BATCH_BUFFER_END;
 			const uint32_t sz = 32 << 10;
 			struct context *c = &contexts[i];
 			uint32_t *batch, *b;
@@ -635,8 +635,7 @@ switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 			c->execbuf.rsvd1 = c->ctx->id;
 
 			memset(c->object, 0, sizeof(c->object));
-			c->object[0].handle = gem_create(fd, 4096);
-			gem_write(fd, c->object[0].handle, 0, &bbe, sizeof(bbe));
+			c->object[0].handle = batch_create(fd, 4096, region);
 			c->execbuf.buffer_count = 1;
 			gem_execbuf(fd, &c->execbuf);
 
@@ -778,10 +777,9 @@ static void *waiter(void *arg)
 
 static void
 __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
-	     int timeout, unsigned long *cycles)
+	     int timeout, unsigned long *cycles, uint32_t region)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
-	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 object[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_relocation_entry reloc[1024];
@@ -800,8 +798,7 @@ __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
 	execbuf.rsvd1 = ctx->id;
 
 	memset(object, 0, sizeof(object));
-	object[0].handle = gem_create(fd, 4096);
-	gem_write(fd, object[0].handle, 0, &bbe, sizeof(bbe));
+	object[0].handle = batch_create(fd, 4096, region);
 	execbuf.buffer_count = 1;
 	gem_execbuf(fd, &execbuf);
 	object[0].flags |= EXEC_OBJECT_WRITE;
@@ -908,7 +905,7 @@ __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
 
 static void
 store_many(int fd, const intel_ctx_t *ctx, unsigned int ring,
-	   int num_children, int timeout)
+	   int num_children, int timeout, uint32_t region)
 {
 	struct intel_engine_data ied;
 	unsigned long *shared;
@@ -926,7 +923,8 @@ store_many(int fd, const intel_ctx_t *ctx, unsigned int ring,
 			__store_many(fd, ctx,
 				     ied_flags(&ied, n),
 				     timeout,
-				     &shared[n]);
+				     &shared[n],
+				     region);
 	}
 	igt_waitchildren();
 
@@ -939,7 +937,7 @@ store_many(int fd, const intel_ctx_t *ctx, unsigned int ring,
 }
 
 static void
-sync_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
+sync_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout, uint32_t region)
 {
 	struct intel_engine_data ied;
 
@@ -948,15 +946,13 @@ sync_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_children) {
-		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 object;
 		struct drm_i915_gem_execbuffer2 execbuf;
 		double start, elapsed;
 		unsigned long cycles;
 
 		memset(&object, 0, sizeof(object));
-		object.handle = gem_create(fd, 4096);
-		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
+		object.handle = batch_create(fd, 4096, region);
 
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
@@ -986,7 +982,7 @@ sync_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
 }
 
 static void
-store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
+store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout, uint32_t region)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct intel_engine_data ied;
@@ -996,7 +992,6 @@ store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_children) {
-		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 object[2];
 		struct drm_i915_gem_relocation_entry reloc[1024];
 		struct drm_i915_gem_execbuffer2 execbuf;
@@ -1013,8 +1008,7 @@ store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
 		execbuf.rsvd1 = ctx->id;
 
 		memset(object, 0, sizeof(object));
-		object[0].handle = gem_create(fd, 4096);
-		gem_write(fd, object[0].handle, 0, &bbe, sizeof(bbe));
+		object[0].handle = batch_create(fd, 4096, region);
 		execbuf.buffer_count = 1;
 		gem_execbuf(fd, &execbuf);
 
@@ -1156,7 +1150,7 @@ igt_main
 	const struct {
 		const char *name;
 		void (*func)(int fd, const intel_ctx_t *ctx, unsigned int engine,
-			     int num_children, int timeout);
+			     int num_children, int timeout, uint32_t memregion);
 		int num_children;
 		int timeout;
 	} all[] = {
@@ -1192,6 +1186,10 @@ igt_main
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
 	int fd = -1;
+	struct drm_i915_query_memory_regions *query_info;
+	struct igt_collection *regions, *set;
+	char *sub_name;
+	uint32_t region;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
@@ -1201,47 +1199,121 @@ igt_main
 		ctx = intel_ctx_create_all_physical(fd);
 
 		igt_fork_hang_detector(fd);
+		query_info = gem_get_query_memory_regions(fd);
+		igt_assert(query_info);
+		set = get_memory_region_set(query_info,
+					I915_SYSTEM_MEMORY,
+					I915_DEVICE_MEMORY);
+
 	}
 
 	/* Legacy for selecting rings. */
 	for_each_test(t, individual) {
 		igt_subtest_with_dynamic_f("%s", t->name) {
 			for (const struct intel_execution_ring *l = intel_execution_rings; l->name; l++) {
-				igt_dynamic_f("%s", l->name) {
-					t->func(fd, intel_ctx_0(fd), eb_ring(l),
-						t->num_children, t->timeout);
+				for_each_combination(regions, 1, set) {
+					sub_name = memregion_dynamic_subtest_name(regions);
+					region = igt_collection_get_value(regions, 0);
+					igt_dynamic_f("%s", l->name) {
+						t->func(fd, intel_ctx_0(fd), eb_ring(l),
+								t->num_children, 
+								t->timeout,
+								region);
+					}
+					free(sub_name);
 				}
 			}
 		}
 	}
 
-	igt_subtest("basic-all")
-		sync_all(fd, ctx, 1, 2);
-	igt_subtest("basic-store-all")
-		store_all(fd, ctx, 1, 2);
+	igt_subtest_with_dynamic("basic-all") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("basic-all-%s", sub_name)
+				sync_all(fd, ctx, 1, 2, region);
+			free(sub_name);
+		}
+	}
+
+	igt_subtest_with_dynamic("basic-store-all") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("basic-store-all-%s", sub_name)
+				store_all(fd, ctx, 1, 2, region);
+			free(sub_name);
+		}
+	}
+
+	igt_subtest_with_dynamic("all") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("all-%s", sub_name)
+				sync_all(fd, ctx, 1, 20, region);
+			free(sub_name);
+		}
+	}
+
+	igt_subtest_with_dynamic("store-all") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("store-all-%s", sub_name)
+				store_all(fd, ctx, 1, 20, region);
+			free(sub_name);
+		}
+	}
 
-	igt_subtest("all")
-		sync_all(fd, ctx, 1, 20);
-	igt_subtest("store-all")
-		store_all(fd, ctx, 1, 20);
-	igt_subtest("forked-all")
-		sync_all(fd, ctx, ncpus, 20);
-	igt_subtest("forked-store-all")
-		store_all(fd, ctx, ncpus, 20);
+	igt_subtest_with_dynamic("forked-all") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("forked-all-%s", sub_name)
+				sync_all(fd, ctx, ncpus, 20, region);
+			free(sub_name);
+		}
+	}
+
+	igt_subtest_with_dynamic("forked-store-all") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("forked-store-all-%s", sub_name)
+				store_all(fd, ctx, ncpus, 20, region);
+			free(sub_name);
+		}
+	}
 
 	for_each_test(t, all) {
-		igt_subtest_f("%s", t->name)
-			t->func(fd, ctx, ALL_ENGINES, t->num_children, t->timeout);
+		igt_subtest_with_dynamic_f("%s", t->name) {
+			for_each_combination(regions, 1, set) {
+				sub_name = memregion_dynamic_subtest_name(regions);
+				region = igt_collection_get_value(regions, 0);
+				igt_dynamic_f("%s", sub_name)
+					t->func(fd, ctx, ALL_ENGINES, t->num_children,
+							t->timeout,
+							region);
+				free(sub_name);
+			}
+		}
 	}
 
 	/* New way of selecting engines. */
 	for_each_test(t, individual) {
 		igt_subtest_with_dynamic_f("%s", t->name) {
-			for_each_ctx_engine(fd, ctx, e) {
-				igt_dynamic_f("%s", e->name) {
-					t->func(fd, ctx, e->flags,
-						t->num_children, t->timeout);
-				}
+			for_each_combination(regions, 1, set) {
+				sub_name = memregion_dynamic_subtest_name(regions);
+				region = igt_collection_get_value(regions, 0);
+				for_each_ctx_engine(fd, ctx, e)
+					igt_dynamic_f("%s-%s", e->name, sub_name)
+						t->func(fd, ctx, e->flags,
+								t->num_children,
+								t->timeout,
+								region);
+				free(sub_name);
+
 			}
 		}
 	}
@@ -1264,6 +1336,8 @@ igt_main
 	}
 
 	igt_fixture {
+		free(query_info);
+		igt_collection_destroy(set);
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
 		close(fd);
-- 
2.32.0
