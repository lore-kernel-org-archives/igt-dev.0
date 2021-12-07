Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0AB6EA95
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Dec 2021 13:10:18 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue,  7 Dec 2021 14:10:13 +0100
Message-Id: <20211207131013.27252-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/gem_exec_fence: Adopt to use no-reloc
 in three syncobj subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Three subtests:
- syncobj-timeline-chain-engines
- syncobj-stationary-timeline-chain-engines
- syncobj-backward-timeline-chain-engines
were not previously rewritten to use no-reloc.

Using allocator is not necessary in this case, we need to softpin
only counter object. Offsets for all batches are chosen by the
kernel as they location within gpu vm doesn't matter.

Some explanation is required regarding batchbuffer updates for each
iteration. Before introducing softpin all batchbuffers were touched by
the relocations what introduces stalls between them during execution.
These stalls could be removed as batchbuffers don't change their
contents for each iteration. But I decided to keep this behavior
intact for relocations changing it only for no-reloc mode. With
softpinning batchbuffer for each engine is written once (for first
iteration) so next execbuf reuses same batch. This removes stalls
on subsequent iterations as batchbuffer for each engine is ready
immediate after completion.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_fence.c | 47 ++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 9a6336ce9..b6f4f1615 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -2468,9 +2468,13 @@ static void test_syncobj_timeline_multiple_ext_nodes(int fd)
 #define RING_TIMESTAMP                  (0x358)
 #define MI_PREDICATE_RESULT_1           (0x41c)
 
+#define WAIT_BB_OFFSET			(64 << 20)
+#define COUNTER_OFFSET			(65 << 20)
+
 struct inter_engine_context {
 	int fd;
 	const intel_ctx_cfg_t *cfg;
+	bool use_relocs;
 
 	struct {
 		const intel_ctx_t *ctx;
@@ -2565,6 +2569,7 @@ static struct drm_i915_gem_exec_object2
 build_wait_bb(int i915,
 	      const struct intel_execution_engine2 *engine,
 	      uint64_t delay,
+	      bool use_relocs,
 	      struct drm_i915_gem_relocation_entry *relocs)
 {
 	const uint64_t timestamp_frequency = get_cs_timestamp_frequency(i915);
@@ -2579,8 +2584,8 @@ build_wait_bb(int i915,
 
 	obj.handle = gem_create(i915, 4096);
 	obj.relocs_ptr = to_user_pointer(memset(relocs, 0, sizeof(*relocs)));
-	obj.relocation_count = 1;
-	obj.offset = 64 << 20;
+	obj.relocation_count = use_relocs ? 1 : 0;
+	obj.offset = WAIT_BB_OFFSET;
 
 	relocs->target_handle = obj.handle;
 	relocs->presumed_offset = obj.offset;
@@ -2649,6 +2654,7 @@ static void wait_engine(int i915,
 		build_wait_bb(i915,
 			      &context->engines.engines[run_engine_idx],
 			      20 * 1000 * 1000ull /* 20ms */,
+			      context->use_relocs,
 			      &reloc),
 	};
 	struct drm_i915_gem_execbuffer2 execbuf = {
@@ -2717,6 +2723,7 @@ static void build_increment_engine_bb(struct inter_engine_batches *batch,
 
 static void increment_engine(struct inter_engine_context *context,
 			     const intel_ctx_t *ctx,
+			     int iteration,
 			     uint32_t read0_engine_idx,
 			     uint32_t read1_engine_idx,
 			     uint32_t write_engine_idx,
@@ -2732,7 +2739,8 @@ static void increment_engine(struct inter_engine_context *context,
 		{
 			.handle = batch->increment_bb_handle,
 			.relocs_ptr = to_user_pointer(relocs),
-			.relocation_count = ARRAY_SIZE(relocs),
+			.relocation_count = context->use_relocs ?
+						ARRAY_SIZE(relocs) : 0,
 		},
 	};
 	struct drm_i915_gem_execbuffer2 execbuf = {
@@ -2775,6 +2783,29 @@ static void increment_engine(struct inter_engine_context *context,
 	relocs[5].offset = batch->write_ptrs[1] - batch->increment_bb;
 	relocs[5].presumed_offset = -1;
 
+	/*
+	 * For no-relocs prepare batch for dedicated write engine once
+	 * as iteration doesn't matter for it. So we got full pipelining
+	 * starting from the second iteration. For relocs we keep its previous
+	 * behavior where kernel has to change offsets within bb for each round.
+	 */
+	if (!iteration && !context->use_relocs) {
+		uint64_t counter_offset;
+		uint32_t *bb;
+
+		counter_offset = context->engine_counter_object.offset;
+		bb = (uint32_t *) batch->increment_bb;
+
+		for (int i = 0; i < ARRAY_SIZE(relocs); i++) {
+			bb[relocs[i].offset / sizeof(uint32_t)] =
+					counter_offset + relocs[i].delta;
+			bb[relocs[i].offset / sizeof(uint32_t) + 1] =
+					(counter_offset + relocs[i].delta) >> 32;
+		}
+		gem_write(context->fd, batch->increment_bb_handle, 0,
+			  batch->increment_bb, batch->increment_bb_len);
+	}
+
 	submit_timeline_execbuf(context, &execbuf, write_engine_idx,
 				wait_syncobj, wait_value,
 				signal_syncobj, signal_value);
@@ -2808,11 +2839,15 @@ static void setup_timeline_chain_engines(struct inter_engine_context *context, i
 	context->cfg = cfg;
 	context->engines = intel_engine_list_for_ctx_cfg(fd, cfg);
 	igt_require(context->engines.nengines > 1);
+	context->use_relocs = gem_has_relocations(fd);
 
 	context->wait_ctx = intel_ctx_create(fd, cfg);
 	context->wait_timeline = syncobj_create(fd, 0);
 
 	context->engine_counter_object.handle = gem_create(fd, 4096);
+	context->engine_counter_object.offset = COUNTER_OFFSET;
+	if (context->use_relocs)
+		context->engine_counter_object.flags |= EXEC_OBJECT_PINNED;
 
 	for (uint32_t i = 0; i < ARRAY_SIZE(context->iterations); i++) {
 		context->iterations[i].ctx = intel_ctx_create(fd, context->cfg);
@@ -2901,7 +2936,7 @@ static void test_syncobj_timeline_chain_engines(int fd, const intel_ctx_cfg_t *c
 				iter == 0 && engine == 0 ?
 				1 : (engine == 0 ? iter : (iter + 1));
 
-			increment_engine(&ctx, ctx.iterations[iter].ctx,
+			increment_engine(&ctx, ctx.iterations[iter].ctx, iter,
 					 prev_prev_engine /* read0 engine */,
 					 prev_engine /* read1 engine */,
 					 engine /* write engine */,
@@ -2967,7 +3002,7 @@ static void test_syncobj_stationary_timeline_chain_engines(int fd, const intel_c
 				iter == 0 && engine == 0 ?
 				1 : 10;
 
-			increment_engine(&ctx, ctx.iterations[iter].ctx,
+			increment_engine(&ctx, ctx.iterations[iter].ctx, iter,
 					 prev_prev_engine /* read0 engine */,
 					 prev_engine /* read1 engine */,
 					 engine /* write engine */,
@@ -3028,7 +3063,7 @@ static void test_syncobj_backward_timeline_chain_engines(int fd, const intel_ctx
 				iter == 0 && engine == 0 ?
 				1 : 1;
 
-			increment_engine(&ctx, ctx.iterations[iter].ctx,
+			increment_engine(&ctx, ctx.iterations[iter].ctx, iter,
 					 prev_prev_engine /* read0 engine */,
 					 prev_engine /* read1 engine */,
 					 engine /* write engine */,
-- 
2.26.0
