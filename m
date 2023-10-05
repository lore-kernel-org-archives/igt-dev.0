Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C6F88CFA
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 19:32:14 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 18:57:31 +0000
Message-ID: <20231005185745.3056219-14-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
References: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 13/17] benchmarks/gem_wsim: group i915 fields
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Group i915 specific fields.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 100 ++++++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 48 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 5fdd28494..306125f27 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -174,11 +174,15 @@ struct w_step {
 	unsigned int request;
 	unsigned int preempt_us;
 
-	struct drm_i915_gem_execbuffer2 eb;
-	struct drm_i915_gem_exec_object2 *obj;
-	struct drm_i915_gem_relocation_entry reloc[3];
+	union {
+		struct {
+			struct drm_i915_gem_execbuffer2 eb;
+			struct drm_i915_gem_exec_object2 *obj;
+			struct drm_i915_gem_relocation_entry reloc[3];
+			uint32_t *bb_duration;
+		} i915;
+	};
 	uint32_t bb_handle;
-	uint32_t *bb_duration;
 };
 
 struct ctx {
@@ -247,7 +251,7 @@ static const char *ring_str_map[NUM_ENGINES] = {
 
 static void w_step_sync(struct w_step *w)
 {
-	gem_sync(fd, w->obj[0].handle);
+	gem_sync(fd, w->i915.obj[0].handle);
 }
 
 static int read_timestamp_frequency(int i915)
@@ -1372,9 +1376,9 @@ static unsigned int create_bb(struct w_step *w, int self)
 	/* Save delta for indirect read by COND_BBE */
 	*cs++ = MI_STORE_REGISTER_MEM_CMD | (1 + use_64b) | MI_CS_MMIO_DST;
 	*cs++ = CS_GPR(NOW_TS);
-	w->reloc[r].target_handle = self;
-	w->reloc[r].offset = offset_in_page(cs);
-	*cs++ = w->reloc[r].delta = 4000;
+	w->i915.reloc[r].target_handle = self;
+	w->i915.reloc[r].offset = offset_in_page(cs);
+	*cs++ = w->i915.reloc[r].delta = 4000;
 	*cs++ = 0;
 	r++;
 
@@ -1387,19 +1391,19 @@ static unsigned int create_bb(struct w_step *w, int self)
 
 	/* Break if delta [time elapsed] > target ns (target filled in later) */
 	*cs++ = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | (1 + use_64b);
-	w->bb_duration = cs;
+	w->i915.bb_duration = cs;
 	*cs++ = 0;
-	w->reloc[r].target_handle = self;
-	w->reloc[r].offset = offset_in_page(cs);
-	*cs++ = w->reloc[r].delta = 4000;
+	w->i915.reloc[r].target_handle = self;
+	w->i915.reloc[r].offset = offset_in_page(cs);
+	*cs++ = w->i915.reloc[r].delta = 4000;
 	*cs++ = 0;
 	r++;
 
 	/* Otherwise back to recalculating delta */
 	*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | use_64b;
-	w->reloc[r].target_handle = self;
-	w->reloc[r].offset = offset_in_page(cs);
-	*cs++ = w->reloc[r].delta = offset_in_page(jmp);
+	w->i915.reloc[r].target_handle = self;
+	w->i915.reloc[r].offset = offset_in_page(cs);
+	*cs++ = w->i915.reloc[r].delta = offset_in_page(jmp);
 	*cs++ = 0;
 	r++;
 
@@ -1444,16 +1448,16 @@ eb_update_flags(struct workload *wrk, struct w_step *w,
 	struct ctx *ctx = __get_ctx(wrk, w);
 
 	if (ctx->engine_map)
-		w->eb.flags = find_engine_in_map(ctx, engine);
+		w->i915.eb.flags = find_engine_in_map(ctx, engine);
 	else
-		eb_set_engine(&w->eb, engine);
+		eb_set_engine(&w->i915.eb, engine);
 
-	w->eb.flags |= I915_EXEC_HANDLE_LUT;
-	w->eb.flags |= I915_EXEC_NO_RELOC;
+	w->i915.eb.flags |= I915_EXEC_HANDLE_LUT;
+	w->i915.eb.flags |= I915_EXEC_NO_RELOC;
 
 	igt_assert(w->emit_fence <= 0);
 	if (w->emit_fence)
-		w->eb.flags |= I915_EXEC_FENCE_OUT;
+		w->i915.eb.flags |= I915_EXEC_FENCE_OUT;
 }
 
 static uint32_t
@@ -1475,11 +1479,11 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
 	unsigned int nr_obj = 2 + w->data_deps.nr;
 	unsigned int i;
 
-	w->obj = calloc(nr_obj, sizeof(*w->obj));
-	igt_assert(w->obj);
+	w->i915.obj = calloc(nr_obj, sizeof(*w->i915.obj));
+	igt_assert(w->i915.obj);
 
-	w->obj[j].handle = alloc_bo(fd, 4096);
-	w->obj[j].flags = EXEC_OBJECT_WRITE;
+	w->i915.obj[j].handle = alloc_bo(fd, 4096);
+	w->i915.obj[j].flags = EXEC_OBJECT_WRITE;
 	j++;
 	igt_assert(j < nr_obj);
 
@@ -1494,7 +1498,7 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
 			igt_assert(dep_idx >= 0 && dep_idx < w->idx);
 			igt_assert(wrk->steps[dep_idx].type == BATCH);
 
-			dep_handle = wrk->steps[dep_idx].obj[0].handle;
+			dep_handle = wrk->steps[dep_idx].i915.obj[0].handle;
 		} else {
 			struct working_set *set;
 
@@ -1510,28 +1514,28 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
 			dep_handle = set->handles[entry->target];
 		}
 
-		w->obj[j].flags = entry->write ? EXEC_OBJECT_WRITE : 0;
-		w->obj[j].handle = dep_handle;
+		w->i915.obj[j].flags = entry->write ? EXEC_OBJECT_WRITE : 0;
+		w->i915.obj[j].handle = dep_handle;
 		j++;
 		igt_assert(j < nr_obj);
 	}
 
-	w->bb_handle = w->obj[j].handle = gem_create(fd, 4096);
-	w->obj[j].relocation_count = create_bb(w, j);
-	igt_assert(w->obj[j].relocation_count <= ARRAY_SIZE(w->reloc));
-	w->obj[j].relocs_ptr = to_user_pointer(&w->reloc);
+	w->bb_handle = w->i915.obj[j].handle = gem_create(fd, 4096);
+	w->i915.obj[j].relocation_count = create_bb(w, j);
+	igt_assert(w->i915.obj[j].relocation_count <= ARRAY_SIZE(w->i915.reloc));
+	w->i915.obj[j].relocs_ptr = to_user_pointer(&w->i915.reloc);
 
-	w->eb.buffers_ptr = to_user_pointer(w->obj);
-	w->eb.buffer_count = j + 1;
-	w->eb.rsvd1 = get_ctxid(wrk, w);
+	w->i915.eb.buffers_ptr = to_user_pointer(w->i915.obj);
+	w->i915.eb.buffer_count = j + 1;
+	w->i915.eb.rsvd1 = get_ctxid(wrk, w);
 
 	eb_update_flags(wrk, w, engine);
 #ifdef DEBUG
-	printf("%u: %u:|", w->idx, w->eb.buffer_count);
+	printf("%u: %u:|", w->idx, w->i915.eb.buffer_count);
 	for (i = 0; i <= j; i++)
-		printf("%x|", w->obj[i].handle);
+		printf("%x|", w->i915.obj[i].handle);
 	printf(" flags=%llx bb=%x[%u] ctx[%u]=%u\n",
-		w->eb.flags, w->bb_handle, j, w->context,
+		w->i915.eb.flags, w->bb_handle, j, w->context,
 		get_ctxid(wrk, w));
 #endif
 }
@@ -1728,7 +1732,7 @@ static void measure_active_set(struct workload *wrk)
 				igt_assert(idx >= 0 && idx < w->idx);
 				igt_assert(wrk->steps[idx].type == BATCH);
 
-				_dep.target = wrk->steps[idx].obj[0].handle;
+				_dep.target = wrk->steps[idx].i915.obj[0].handle;
 			}
 
 			if (!find_dep(deps, nr, _dep)) {
@@ -2118,7 +2122,7 @@ update_bb_start(struct workload *wrk, struct w_step *w)
 	if (!w->duration.unbound)
 		ticks = ~ns_to_ctx_ticks(1000LL * get_duration(wrk, w));
 
-	*w->bb_duration = ticks;
+	*w->i915.bb_duration = ticks;
 }
 
 static void w_sync_to(struct workload *wrk, struct w_step *w, int target)
@@ -2156,20 +2160,20 @@ do_eb(struct workload *wrk, struct w_step *w, enum intel_engine_id engine)
 		igt_assert(wrk->steps[tgt].emit_fence > 0);
 
 		if (w->fence_deps.submit_fence)
-			w->eb.flags |= I915_EXEC_FENCE_SUBMIT;
+			w->i915.eb.flags |= I915_EXEC_FENCE_SUBMIT;
 		else
-			w->eb.flags |= I915_EXEC_FENCE_IN;
+			w->i915.eb.flags |= I915_EXEC_FENCE_IN;
 
-		w->eb.rsvd2 = wrk->steps[tgt].emit_fence;
+		w->i915.eb.rsvd2 = wrk->steps[tgt].emit_fence;
 	}
 
-	if (w->eb.flags & I915_EXEC_FENCE_OUT)
-		gem_execbuf_wr(fd, &w->eb);
+	if (w->i915.eb.flags & I915_EXEC_FENCE_OUT)
+		gem_execbuf_wr(fd, &w->i915.eb);
 	else
-		gem_execbuf(fd, &w->eb);
+		gem_execbuf(fd, &w->i915.eb);
 
-	if (w->eb.flags & I915_EXEC_FENCE_OUT) {
-		w->emit_fence = w->eb.rsvd2 >> 32;
+	if (w->i915.eb.flags & I915_EXEC_FENCE_OUT) {
+		w->emit_fence = w->i915.eb.rsvd2 >> 32;
 		igt_assert(w->emit_fence > 0);
 	}
 }
@@ -2294,7 +2298,7 @@ static void *run_workload(void *data)
 				igt_assert(wrk->steps[t_idx].type == BATCH);
 				igt_assert(wrk->steps[t_idx].duration.unbound);
 
-				*wrk->steps[t_idx].bb_duration = 0xffffffff;
+				*wrk->steps[t_idx].i915.bb_duration = 0xffffffff;
 				__sync_synchronize();
 				continue;
 			} else if (w->type == SSEU) {
-- 
2.42.0
