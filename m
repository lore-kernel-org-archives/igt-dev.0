Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5102810FBEE
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 09:05:07 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
To: igt-dev <igt-dev@lists.freedesktop.org>
Date: Thu, 14 Apr 2022 14:35:54 +0530
Message-Id: <20220414090555.9344-2-ramalingam.c@intel.com>
In-Reply-To: <20220414090555.9344-1-ramalingam.c@intel.com>
References: <20220414090555.9344-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 1/2] tests/i915/gem_lmem_swapping: create
 batch buffer from obj pool
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Use the gem_create_from_pool() for creating the batch buffers.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_lmem_swapping.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 432607b06155..2f9f32685cd8 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -129,7 +129,7 @@ static void move_to_lmem(int i915,
 			 const intel_ctx_t *ctx,
 			 struct object *list,
 			 unsigned int num,
-			 uint32_t batch,
+			 unsigned int region,
 			 unsigned int engine,
 			 bool do_oom_test)
 {
@@ -140,7 +140,13 @@ static void move_to_lmem(int i915,
 		.flags = I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT | engine,
 		.rsvd1 = ctx->id,
 	};
-	unsigned int i, ret;
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	unsigned int i, ret, batch;
+	uint64_t size;
+
+	size = 4096;
+	batch = gem_create_from_pool(i915, &size, region);
+	gem_write(i915, batch, 0, &bbe, sizeof(bbe));
 
 	memset(obj, 0, sizeof(obj));
 
@@ -163,10 +169,10 @@ static void __do_evict(int i915,
 		       struct params *params,
 		       unsigned int seed)
 {
+	uint32_t region_id = INTEL_MEMORY_REGION_ID(region->memory_class,
+						    region->memory_instance);
 	const unsigned int max_swap_in = params->count / 100 + 1;
-	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct object *objects, *obj, *list;
-	uint32_t batch;
 	unsigned int engine = 0;
 	unsigned int i, l;
 	uint64_t size;
@@ -174,9 +180,6 @@ static void __do_evict(int i915,
 	unsigned int num;
 
 	size = 4096;
-	batch = create_bo(i915, &size, region, params->oom_test);
-
-	gem_write(i915, batch, 0, &bbe, sizeof(bbe));
 
 	objects = calloc(params->count, sizeof(*objects));
 	igt_assert(objects);
@@ -203,7 +206,7 @@ static void __do_evict(int i915,
 		}
 		obj->handle = create_bo(i915, &obj->size, region, params->oom_test);
 
-		move_to_lmem(i915, ctx, objects + i, 1, batch, engine,
+		move_to_lmem(i915, ctx, objects + i, 1, region_id, engine,
 			     params->oom_test);
 		if (params->flags & TEST_VERIFY)
 			init_object(i915, obj, rand(), params->flags);
@@ -228,7 +231,8 @@ static void __do_evict(int i915,
 			idx = (idx + 1) % params->count;
 		}
 
-		move_to_lmem(i915, ctx, list, num, batch, engine, params->oom_test);
+		move_to_lmem(i915, ctx, list, num, region_id, engine,
+			     params->oom_test);
 
 		if (params->flags & TEST_ENGINES)
 			engine = (engine + 1) % __num_engines__;
@@ -248,8 +252,6 @@ static void __do_evict(int i915,
 
 	free(list);
 	free(objects);
-
-	gem_close(i915, batch);
 }
 
 static void fill_params(int i915, struct params *params,
-- 
2.20.1
