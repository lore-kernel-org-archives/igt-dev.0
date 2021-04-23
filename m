Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544F26EC73
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:49:39 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id u11so20130631pjr.0
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:49:39 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:47:47 -0500
Message-Id: <20210423214853.876911-24-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 23/89] tests/i915/gem_exec_reloc: Convert to
 intel_ctx_t
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
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_reloc.c | 102 ++++++++++++++++++++++--------------
 1 file changed, 62 insertions(+), 40 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 397c335e..920dc61e 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -266,7 +266,7 @@ static void check_bo(int fd, uint32_t handle)
 	munmap(map, 4096);
 }
 
-static void active(int fd, unsigned engine)
+static void active(int fd, const intel_ctx_t *ctx, unsigned engine)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_relocation_entry reloc;
@@ -280,7 +280,7 @@ static void active(int fd, unsigned engine)
 	if (engine == ALL_ENGINES) {
 		const struct intel_execution_engine2 *e;
 
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			if (gem_class_can_store_dword(fd, e->class))
 				engines[nengine++] = e->flags;
 		}
@@ -308,6 +308,7 @@ static void active(int fd, unsigned engine)
 	execbuf.buffer_count = 2;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	for (pass = 0; pass < 1024; pass++) {
 		uint32_t batch[16];
@@ -367,7 +368,8 @@ static uint64_t many_relocs(unsigned long count, unsigned long *out)
 	return to_user_pointer(reloc);
 }
 
-static void __many_active(int i915, unsigned engine, unsigned long count)
+static void __many_active(int i915, const intel_ctx_t *ctx, unsigned engine,
+			  unsigned long count)
 {
 	unsigned long reloc_sz;
 	struct drm_i915_gem_exec_object2 obj[2] = {{
@@ -379,10 +381,12 @@ static void __many_active(int i915, unsigned engine, unsigned long count)
 		.buffers_ptr = to_user_pointer(obj),
 		.buffer_count = ARRAY_SIZE(obj),
 		.flags = engine | I915_EXEC_HANDLE_LUT,
+		.rsvd1 = ctx->id,
 	};
 	igt_spin_t *spin;
 
 	spin = __igt_spin_new(i915,
+			      .ctx = ctx,
 			      .engine = engine,
 			      .dependency = obj[0].handle,
 			      .flags = (IGT_SPIN_FENCE_OUT |
@@ -405,7 +409,7 @@ static void __many_active(int i915, unsigned engine, unsigned long count)
 	gem_close(i915, obj[0].handle);
 }
 
-static void many_active(int i915, unsigned engine)
+static void many_active(int i915, const intel_ctx_t *ctx, unsigned engine)
 {
 	const uint64_t max = 2048;
 	unsigned long count = 256;
@@ -418,7 +422,7 @@ static void many_active(int i915, unsigned engine)
 			break;
 
 		igt_debug("Testing count:%lu\n", count);
-		__many_active(i915, engine, count);
+		__many_active(i915, ctx, engine, count);
 
 		count <<= 1;
 		if (count >= max)
@@ -426,7 +430,8 @@ static void many_active(int i915, unsigned engine)
 	}
 }
 
-static void __wide_active(int i915, unsigned engine, unsigned long count)
+static void __wide_active(int i915, const intel_ctx_t *ctx, unsigned engine,
+			  unsigned long count)
 {
 	struct drm_i915_gem_relocation_entry *reloc =
 		calloc(count, sizeof(*reloc));
@@ -436,6 +441,7 @@ static void __wide_active(int i915, unsigned engine, unsigned long count)
 		.buffers_ptr = to_user_pointer(obj),
 		.buffer_count = count + 1,
 		.flags = engine | I915_EXEC_HANDLE_LUT,
+		.rsvd1 = ctx->id,
 	};
 	igt_spin_t *spin;
 
@@ -446,6 +452,7 @@ static void __wide_active(int i915, unsigned engine, unsigned long count)
 	}
 
 	spin = __igt_spin_new(i915,
+			      .ctx = ctx,
 			      .engine = engine,
 			      .flags = (IGT_SPIN_FENCE_OUT |
 					IGT_SPIN_NO_PREEMPTION));
@@ -475,7 +482,7 @@ static void __wide_active(int i915, unsigned engine, unsigned long count)
 	free(reloc);
 }
 
-static void wide_active(int i915, unsigned engine)
+static void wide_active(int i915, const intel_ctx_t *ctx, unsigned engine)
 {
 	const uint64_t max = gem_aperture_size(i915) / 4096 / 2;
 	unsigned long count = 256;
@@ -488,7 +495,7 @@ static void wide_active(int i915, unsigned engine)
 			break;
 
 		igt_debug("Testing count:%lu\n", count);
-		__wide_active(i915, engine, count);
+		__wide_active(i915, ctx, engine, count);
 
 		count <<= 1;
 		if (count >= max)
@@ -501,7 +508,7 @@ static unsigned int offset_in_page(void *addr)
 	return (uintptr_t)addr & 4095;
 }
 
-static void active_spin(int fd, unsigned engine)
+static void active_spin(int fd, const intel_ctx_t *ctx, unsigned engine)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_relocation_entry reloc;
@@ -510,6 +517,7 @@ static void active_spin(int fd, unsigned engine)
 	igt_spin_t *spin;
 
 	spin = igt_spin_new(fd,
+			    .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_NO_PREEMPTION);
 
@@ -529,6 +537,7 @@ static void active_spin(int fd, unsigned engine)
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
 	execbuf.flags = engine;
+	execbuf.rsvd1 = ctx->id;
 
 	gem_execbuf(fd, &execbuf);
 	gem_close(fd, obj[1].handle);
@@ -541,7 +550,7 @@ static void active_spin(int fd, unsigned engine)
 	igt_spin_free(fd, spin);
 }
 
-static void others_spin(int i915, unsigned engine)
+static void others_spin(int i915, const intel_ctx_t *ctx, unsigned engine)
 {
 	struct drm_i915_gem_relocation_entry reloc = {};
 	struct drm_i915_gem_exec_object2 obj = {
@@ -552,18 +561,20 @@ static void others_spin(int i915, unsigned engine)
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 		.flags = engine,
+		.rsvd1 = ctx->id,
 	};
 	const struct intel_execution_engine2 *e;
 	igt_spin_t *spin = NULL;
 	uint64_t addr;
 	int fence;
 
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		if (e->flags == engine)
 			continue;
 
 		if (!spin) {
 			spin = igt_spin_new(i915,
+					    .ctx = ctx,
 					    .engine = e->flags,
 					    .flags = IGT_SPIN_FENCE_OUT);
 			fence = dup(spin->out_fence);
@@ -985,12 +996,13 @@ static void sighandler(int sig)
 	stop = 1;
 }
 
-static void parallel_child(int i915,
+static void parallel_child(int i915, const intel_ctx_t *ctx,
 			   const struct intel_execution_engine2 *engine,
 			   struct drm_i915_gem_relocation_entry *reloc,
 			   uint32_t common)
 {
-	igt_spin_t *spin = __igt_spin_new(i915, .engine = engine->flags);
+	igt_spin_t *spin = __igt_spin_new(i915, .ctx = ctx,
+					  .engine = engine->flags);
 	struct drm_i915_gem_exec_object2 reloc_target = {
 		.handle = gem_create(i915, 32 * 1024 * 8),
 		.relocation_count = 32 * 1024,
@@ -1005,6 +1017,7 @@ static void parallel_child(int i915,
 		.buffers_ptr = to_user_pointer(obj),
 		.buffer_count = ARRAY_SIZE(obj),
 		.flags = engine->flags | I915_EXEC_HANDLE_LUT,
+		.rsvd1 = ctx->id,
 	};
 	struct sigaction act = {
 		.sa_handler = sighandler,
@@ -1032,7 +1045,7 @@ static void kill_children(int sig)
 	signal(sig, SIG_DFL);
 }
 
-static void parallel(int i915)
+static void parallel(int i915, const intel_ctx_t *ctx)
 {
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_relocation_entry *reloc;
@@ -1043,16 +1056,16 @@ static void parallel(int i915)
 	reloc = parallel_relocs(32 * 1024, &reloc_sz);
 
 	stop = 0;
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		igt_fork(child, 1)
-			parallel_child(i915, e, reloc, common);
+			parallel_child(i915, ctx, e, reloc, common);
 	}
 	sleep(2);
 
 	if (gem_scheduler_has_preemption(i915)) {
-		uint32_t ctx = gem_context_clone_with_engines(i915, 0);
+		const intel_ctx_t *tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
 
-		__for_each_physical_engine(i915, e) {
+		for_each_ctx_engine(i915, ctx, e) {
 			struct drm_i915_gem_exec_object2 obj[2] = {
 				{ .handle = common },
 				{ .handle = batch },
@@ -1061,12 +1074,12 @@ static void parallel(int i915)
 				.buffers_ptr = to_user_pointer(obj),
 				.buffer_count = ARRAY_SIZE(obj),
 				.flags = e->flags,
-				.rsvd1 = ctx,
+				.rsvd1 = tmp_ctx->id,
 			};
 			gem_execbuf(i915, &execbuf);
 		}
 
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, tmp_ctx);
 	}
 	gem_sync(i915, batch);
 	gem_close(i915, batch);
@@ -1120,7 +1133,7 @@ static void xchg_u32(void *array, unsigned i, unsigned j)
 	u32[j] = tmp;
 }
 
-static void concurrent_child(int i915,
+static void concurrent_child(int i915, const intel_ctx_t *ctx,
 			     const struct intel_execution_engine2 *e,
 			     uint32_t *common, int num_common,
 			     int in, int out)
@@ -1133,6 +1146,7 @@ static void concurrent_child(int i915,
 		.buffers_ptr = to_user_pointer(obj),
 		.buffer_count = ARRAY_SIZE(obj),
 		.flags = e->flags | I915_EXEC_HANDLE_LUT | (gen < 6 ? I915_EXEC_SECURE : 0),
+		.rsvd1 = ctx->id,
 	};
 	uint32_t *batch = &obj[num_common + 1].handle;
 	unsigned long count = 0;
@@ -1213,7 +1227,7 @@ static uint32_t create_concurrent_batch(int i915, unsigned int count)
 	return handle;
 }
 
-static void concurrent(int i915, int num_common)
+static void concurrent(int i915, const intel_ctx_t *ctx, int num_common)
 {
 	const struct intel_execution_engine2 *e;
 	int in[2], out[2];
@@ -1239,12 +1253,12 @@ static void concurrent(int i915, int num_common)
 		common[n] = gem_create(i915, 4 * 4 * CONCURRENT);
 
 	nchild = 0;
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
 		igt_fork(child, 1)
-			concurrent_child(i915, e,
+			concurrent_child(i915, ctx, e,
 					 common, num_common,
 					 in[0], out[1]);
 
@@ -1308,6 +1322,7 @@ pin_scanout(igt_display_t *dpy, igt_output_t *output, struct igt_fb *fb)
 
 static void scanout(int i915,
 		    igt_display_t *dpy,
+		    const intel_ctx_t *ctx,
 		    const struct intel_execution_engine2 *e)
 {
 	struct drm_i915_gem_relocation_entry reloc = {};
@@ -1318,6 +1333,7 @@ static void scanout(int i915,
 		.buffers_ptr = to_user_pointer(obj),
 		.buffer_count = 2,
 		.flags = e->flags,
+		.rsvd1 = ctx->id,
 	};
 	igt_output_t *output;
 	struct igt_fb fb;
@@ -1437,6 +1453,7 @@ static void invalid_domains(int fd)
 
 igt_main
 {
+	const intel_ctx_t *ctx = 0;
 	const struct intel_execution_engine2 *e;
 	const struct mode {
 		const char *name;
@@ -1480,6 +1497,11 @@ igt_main
 		igt_require_gem(fd);
 		/* Check if relocations supported by platform */
 		igt_require(gem_has_relocations(fd));
+
+		if (gem_has_contexts(fd))
+			ctx = intel_ctx_create_all_physical(fd);
+		else
+			ctx = intel_ctx_0(fd);
 	}
 
 	for (f = flags; f->name; f++) {
@@ -1541,52 +1563,52 @@ igt_main
 
 	igt_subtest_with_dynamic("basic-active") {
 		igt_dynamic("all")
-			active(fd, ALL_ENGINES);
+			active(fd, ctx, ALL_ENGINES);
 
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			if (!gem_class_can_store_dword(fd, e->class))
 				continue;
 
 			igt_dynamic_f("%s", e->name)
-				active(fd, e->flags);
+				active(fd, ctx, e->flags);
 		}
 	}
 
 	igt_subtest_with_dynamic("basic-spin") {
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				active_spin(fd, e->flags);
+				active_spin(fd, ctx, e->flags);
 		}
 	}
 
 	igt_subtest_with_dynamic("basic-spin-others") {
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				others_spin(fd, e->flags);
+				others_spin(fd, ctx, e->flags);
 		}
 	}
 
 	igt_subtest_with_dynamic("basic-many-active") {
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				many_active(fd, e->flags);
+				many_active(fd, ctx, e->flags);
 		}
 	}
 
 	igt_subtest_with_dynamic("basic-wide-active") {
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				wide_active(fd, e->flags);
+				wide_active(fd, ctx, e->flags);
 		}
 	}
 
 	igt_subtest("basic-parallel")
-		parallel(fd);
+		parallel(fd, ctx);
 
 	igt_subtest("basic-concurrent0")
-		concurrent(fd, 0);
+		concurrent(fd, ctx, 0);
 	igt_subtest("basic-concurrent16")
-		concurrent(fd, 16);
+		concurrent(fd, ctx, 16);
 
 	igt_subtest("invalid-domains")
 		invalid_domains(fd);
@@ -1604,9 +1626,9 @@ igt_main
 		}
 
 		igt_subtest_with_dynamic("basic-scanout") {
-			__for_each_physical_engine(fd, e) {
+			for_each_ctx_engine(fd, ctx, e) {
 				igt_dynamic_f("%s", e->name)
-					scanout(fd, &display, e);
+					scanout(fd, &display, ctx, e);
 			}
 		}
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
