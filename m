Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC01410E980
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 17:47:28 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Nov 2023 17:46:52 +0000
Message-ID: <20231102174700.298135-8-matthew.auld@intel.com>
In-Reply-To: <20231102174700.298135-1-matthew.auld@intel.com>
References: <20231102174700.298135-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 07/15] lib/allocator: add
 get_offset_pat_index() helper
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

For some cases we are going to need to pass the pat_index for the
vm_bind op. Add a helper for this, such that we can allocate an address
and give the mapping some pat_index.

v2 (Zbigniew)
  - Plumb pat_index down into intel_allocator_record and protect against
    potential changes.
  - Add pat_index to bind_debug().
v3 (Zbigniew)
   - A few more improvements

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_allocator.c             | 58 ++++++++++++++++++++++---------
 lib/intel_allocator.h             |  7 ++--
 lib/intel_allocator_msgchannel.h  |  1 +
 lib/intel_allocator_reloc.c       |  5 ++-
 lib/intel_allocator_simple.c      |  5 ++-
 lib/xe/xe_util.c                  |  1 +
 lib/xe/xe_util.h                  |  1 +
 tests/intel/api_intel_allocator.c |  4 ++-
 8 files changed, 61 insertions(+), 21 deletions(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index f0a9b7fb5..e5b9457b8 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -16,6 +16,7 @@
 #include "igt_map.h"
 #include "intel_allocator.h"
 #include "intel_allocator_msgchannel.h"
+#include "intel_pat.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
 
@@ -92,6 +93,7 @@ struct allocator_object {
 	uint32_t handle;
 	uint64_t offset;
 	uint64_t size;
+	uint8_t pat_index;
 
 	enum allocator_bind_op bind_op;
 };
@@ -590,16 +592,17 @@ static int handle_request(struct alloc_req *req, struct alloc_resp *resp)
 							req->alloc.handle,
 							req->alloc.size,
 							req->alloc.alignment,
+							req->alloc.pat_index,
 							req->alloc.strategy);
 			alloc_info("<alloc> [tid: %ld] ahnd: %" PRIx64
 				   ", ctx: %u, vm: %u, handle: %u"
 				   ", size: 0x%" PRIx64 ", offset: 0x%" PRIx64
-				   ", alignment: 0x%" PRIx64 ", strategy: %u\n",
+				   ", alignment: 0x%" PRIx64 ", pat_index: %u, strategy: %u\n",
 				   (long) req->tid, req->allocator_handle,
 				   al->ctx, al->vm,
 				   req->alloc.handle, req->alloc.size,
 				   resp->alloc.offset, req->alloc.alignment,
-				   req->alloc.strategy);
+				   req->alloc.pat_index, req->alloc.strategy);
 			break;
 
 		case REQ_FREE:
@@ -1122,24 +1125,24 @@ void intel_allocator_get_address_range(uint64_t allocator_handle,
 
 static bool is_same(struct allocator_object *obj,
 		    uint32_t handle, uint64_t offset, uint64_t size,
-		    enum allocator_bind_op bind_op)
+		    uint8_t pat_index, enum allocator_bind_op bind_op)
 {
 	return obj->handle == handle &&	obj->offset == offset && obj->size == size &&
-	       (obj->bind_op == bind_op || obj->bind_op == BOUND);
+	       obj->pat_index == pat_index && (obj->bind_op == bind_op || obj->bind_op == BOUND);
 }
 
 static void track_object(uint64_t allocator_handle, uint32_t handle,
-			 uint64_t offset, uint64_t size,
+			 uint64_t offset, uint64_t size, uint8_t pat_index,
 			 enum allocator_bind_op bind_op)
 {
 	struct ahnd_info *ainfo;
 	struct allocator_object *obj;
 
-	bind_debug("[TRACK OBJECT]: [%s] pid: %d, tid: %d, ahnd: %llx, handle: %u, offset: %llx, size: %llx\n",
+	bind_debug("[TRACK OBJECT]: [%s] pid: %d, tid: %d, ahnd: %llx, handle: %u, offset: %llx, size: %llx, pat_index: %u\n",
 		   bind_op == TO_BIND ? "BIND" : "UNBIND",
 		   getpid(), gettid(),
 		   (long long)allocator_handle,
-		   handle, (long long)offset, (long long)size);
+		   handle, (long long)offset, (long long)size, pat_index);
 
 	if (offset == ALLOC_INVALID_ADDRESS) {
 		bind_debug("[TRACK OBJECT] => invalid address %llx, skipping tracking\n",
@@ -1156,6 +1159,9 @@ static void track_object(uint64_t allocator_handle, uint32_t handle,
 	if (ainfo->driver == INTEL_DRIVER_I915)
 		return; /* no-op for i915, at least for now */
 
+	if (pat_index == DEFAULT_PAT_INDEX)
+		pat_index = intel_get_pat_idx_wb(ainfo->fd);
+
 	pthread_mutex_lock(&ainfo->bind_map_mutex);
 	obj = igt_map_search(ainfo->bind_map, &handle);
 	if (obj) {
@@ -1165,7 +1171,7 @@ static void track_object(uint64_t allocator_handle, uint32_t handle,
 		 * bind_map.
 		 */
 		if (bind_op == TO_BIND) {
-			igt_assert_eq(is_same(obj, handle, offset, size, bind_op), true);
+			igt_assert_eq(is_same(obj, handle, offset, size, pat_index, bind_op), true);
 		} else if (bind_op == TO_UNBIND) {
 			if (obj->bind_op == TO_BIND)
 				igt_map_remove(ainfo->bind_map, &obj->handle, map_entry_free_func);
@@ -1181,6 +1187,7 @@ static void track_object(uint64_t allocator_handle, uint32_t handle,
 		obj->handle = handle;
 		obj->offset = offset;
 		obj->size = size;
+		obj->pat_index = pat_index;
 		obj->bind_op = bind_op;
 		igt_map_insert(ainfo->bind_map, &obj->handle, obj);
 	}
@@ -1194,6 +1201,8 @@ out:
  * @handle: handle to an object
  * @size: size of an object
  * @alignment: determines object alignment
+ * @pat_index: chosen pat_index for the binding
+ * @strategy: chosen allocator strategy
  *
  * Function finds and returns the most suitable offset with given @alignment
  * for an object with @size identified by the @handle.
@@ -1204,14 +1213,16 @@ out:
  */
 uint64_t __intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
 				 uint64_t size, uint64_t alignment,
-				 enum allocator_strategy strategy)
+				 uint8_t pat_index, enum allocator_strategy strategy)
 {
 	struct alloc_req req = { .request_type = REQ_ALLOC,
 				 .allocator_handle = allocator_handle,
 				 .alloc.handle = handle,
 				 .alloc.size = size,
 				 .alloc.strategy = strategy,
-				 .alloc.alignment = alignment };
+				 .alloc.alignment = alignment,
+				 .alloc.pat_index = pat_index,
+	};
 	struct alloc_resp resp;
 
 	igt_assert((alignment & (alignment-1)) == 0);
@@ -1219,7 +1230,8 @@ uint64_t __intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
 	igt_assert(handle_request(&req, &resp) == 0);
 	igt_assert(resp.response_type == RESP_ALLOC);
 
-	track_object(allocator_handle, handle, resp.alloc.offset, size, TO_BIND);
+	track_object(allocator_handle, handle, resp.alloc.offset, size, pat_index,
+		     TO_BIND);
 
 	return resp.alloc.offset;
 }
@@ -1241,7 +1253,7 @@ uint64_t intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
 	uint64_t offset;
 
 	offset = __intel_allocator_alloc(allocator_handle, handle,
-					 size, alignment,
+					 size, alignment, DEFAULT_PAT_INDEX,
 					 ALLOC_STRATEGY_NONE);
 	igt_assert(offset != ALLOC_INVALID_ADDRESS);
 
@@ -1268,7 +1280,8 @@ uint64_t intel_allocator_alloc_with_strategy(uint64_t allocator_handle,
 	uint64_t offset;
 
 	offset = __intel_allocator_alloc(allocator_handle, handle,
-					 size, alignment, strategy);
+					 size, alignment, DEFAULT_PAT_INDEX,
+					 strategy);
 	igt_assert(offset != ALLOC_INVALID_ADDRESS);
 
 	return offset;
@@ -1298,7 +1311,7 @@ bool intel_allocator_free(uint64_t allocator_handle, uint32_t handle)
 	igt_assert(handle_request(&req, &resp) == 0);
 	igt_assert(resp.response_type == RESP_FREE);
 
-	track_object(allocator_handle, handle, 0, 0, TO_UNBIND);
+	track_object(allocator_handle, handle, 0, 0, 0, TO_UNBIND);
 
 	return resp.free.freed;
 }
@@ -1500,16 +1513,17 @@ static void __xe_op_bind(struct ahnd_info *ainfo, uint32_t sync_in, uint32_t syn
 		if (obj->bind_op == BOUND)
 			continue;
 
-		bind_info("= [vm: %u] %s => %u %lx %lx\n",
+		bind_info("= [vm: %u] %s => %u %lx %lx %u\n",
 			  ainfo->vm,
 			  obj->bind_op == TO_BIND ? "TO BIND" : "TO UNBIND",
 			  obj->handle, obj->offset,
-			  obj->size);
+			  obj->size, obj->pat_index);
 
 		entry = malloc(sizeof(*entry));
 		entry->handle = obj->handle;
 		entry->offset = obj->offset;
 		entry->size = obj->size;
+		entry->pat_index = obj->pat_index;
 		entry->bind_op = obj->bind_op == TO_BIND ? XE_OBJECT_BIND :
 							   XE_OBJECT_UNBIND;
 		igt_list_add(&entry->link, &obj_list);
@@ -1534,6 +1548,18 @@ static void __xe_op_bind(struct ahnd_info *ainfo, uint32_t sync_in, uint32_t syn
 	}
 }
 
+uint64_t get_offset_pat_index(uint64_t ahnd, uint32_t handle, uint64_t size,
+			      uint64_t alignment, uint8_t pat_index)
+{
+	uint64_t offset;
+
+	offset = __intel_allocator_alloc(ahnd, handle, size, alignment,
+					 pat_index, ALLOC_STRATEGY_NONE);
+	igt_assert(offset != ALLOC_INVALID_ADDRESS);
+
+	return offset;
+}
+
 /**
  * intel_allocator_bind:
  * @allocator_handle: handle to an allocator
diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index f9ff7f1cc..4b6292f06 100644
--- a/lib/intel_allocator.h
+++ b/lib/intel_allocator.h
@@ -144,7 +144,7 @@ struct intel_allocator {
 	void (*get_address_range)(struct intel_allocator *ial,
 				  uint64_t *startp, uint64_t *endp);
 	uint64_t (*alloc)(struct intel_allocator *ial, uint32_t handle,
-			  uint64_t size, uint64_t alignment,
+			  uint64_t size, uint64_t alignment, uint8_t pat_index,
 			  enum allocator_strategy strategy);
 	bool (*is_allocated)(struct intel_allocator *ial, uint32_t handle,
 			     uint64_t size, uint64_t offset);
@@ -186,7 +186,7 @@ bool intel_allocator_close(uint64_t allocator_handle);
 void intel_allocator_get_address_range(uint64_t allocator_handle,
 				       uint64_t *startp, uint64_t *endp);
 uint64_t __intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
-				 uint64_t size, uint64_t alignment,
+				 uint64_t size, uint64_t alignment, uint8_t pat_index,
 				 enum allocator_strategy strategy);
 uint64_t intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
 			       uint64_t size, uint64_t alignment);
@@ -266,6 +266,9 @@ static inline bool put_ahnd(uint64_t ahnd)
 	return !ahnd || intel_allocator_close(ahnd);
 }
 
+uint64_t get_offset_pat_index(uint64_t ahnd, uint32_t handle, uint64_t size,
+			      uint64_t alignment, uint8_t pat_index);
+
 static inline uint64_t get_offset(uint64_t ahnd, uint32_t handle,
 				  uint64_t size, uint64_t alignment)
 {
diff --git a/lib/intel_allocator_msgchannel.h b/lib/intel_allocator_msgchannel.h
index ba38530fd..55e2e0ed6 100644
--- a/lib/intel_allocator_msgchannel.h
+++ b/lib/intel_allocator_msgchannel.h
@@ -60,6 +60,7 @@ struct alloc_req {
 			uint32_t handle;
 			uint64_t size;
 			uint64_t alignment;
+			uint8_t pat_index;
 			uint8_t strategy;
 		} alloc;
 
diff --git a/lib/intel_allocator_reloc.c b/lib/intel_allocator_reloc.c
index 3aa9ebe76..e7d5dce4a 100644
--- a/lib/intel_allocator_reloc.c
+++ b/lib/intel_allocator_reloc.c
@@ -29,6 +29,7 @@ struct intel_allocator_record {
 	uint32_t handle;
 	uint64_t offset;
 	uint64_t size;
+	uint8_t pat_index;
 };
 
 /* Keep the low 256k clear, for negative deltas */
@@ -54,7 +55,7 @@ static void intel_allocator_reloc_get_address_range(struct intel_allocator *ial,
 
 static uint64_t intel_allocator_reloc_alloc(struct intel_allocator *ial,
 					    uint32_t handle, uint64_t size,
-					    uint64_t alignment,
+					    uint64_t alignment, uint8_t pat_index,
 					    enum allocator_strategy strategy)
 {
 	struct intel_allocator_record *rec;
@@ -67,6 +68,7 @@ static uint64_t intel_allocator_reloc_alloc(struct intel_allocator *ial,
 	if (rec) {
 		offset = rec->offset;
 		igt_assert(rec->size == size);
+		igt_assert(rec->pat_index == pat_index);
 	} else {
 		aligned_offset = ALIGN(ialr->offset, alignment);
 
@@ -84,6 +86,7 @@ static uint64_t intel_allocator_reloc_alloc(struct intel_allocator *ial,
 		rec->handle = handle;
 		rec->offset = offset;
 		rec->size = size;
+		rec->pat_index = pat_index;
 
 		igt_map_insert(ialr->objects, &rec->handle, rec);
 
diff --git a/lib/intel_allocator_simple.c b/lib/intel_allocator_simple.c
index 3d5e45870..25b92db11 100644
--- a/lib/intel_allocator_simple.c
+++ b/lib/intel_allocator_simple.c
@@ -48,6 +48,7 @@ struct intel_allocator_record {
 	uint32_t handle;
 	uint64_t offset;
 	uint64_t size;
+	uint8_t pat_index;
 };
 
 #define simple_vma_foreach_hole(_hole, _heap) \
@@ -371,7 +372,7 @@ static bool simple_vma_heap_alloc_addr(struct intel_allocator_simple *ials,
 
 static uint64_t intel_allocator_simple_alloc(struct intel_allocator *ial,
 					     uint32_t handle, uint64_t size,
-					     uint64_t alignment,
+					     uint64_t alignment, uint8_t pat_index,
 					     enum allocator_strategy strategy)
 {
 	struct intel_allocator_record *rec;
@@ -387,6 +388,7 @@ static uint64_t intel_allocator_simple_alloc(struct intel_allocator *ial,
 	if (rec) {
 		offset = rec->offset;
 		igt_assert(rec->size == size);
+		igt_assert(rec->pat_index == pat_index);
 	} else {
 		if (!simple_vma_heap_alloc(&ials->heap, &offset,
 					   size, alignment, strategy))
@@ -396,6 +398,7 @@ static uint64_t intel_allocator_simple_alloc(struct intel_allocator *ial,
 		rec->handle = handle;
 		rec->offset = offset;
 		rec->size = size;
+		rec->pat_index = pat_index;
 
 		igt_map_insert(ials->objects, &rec->handle, rec);
 		ials->allocated_objects++;
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 5fa4d4610..3610e440c 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -148,6 +148,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct igt_list_head *obj_lis
 		ops->addr = obj->offset;
 		ops->range = obj->size;
 		ops->region = 0;
+		ops->pat_index = obj->pat_index;
 
 		bind_info("  [%d]: [%6s] handle: %u, offset: %llx, size: %llx\n",
 			  i, obj->bind_op == XE_OBJECT_BIND ? "BIND" : "UNBIND",
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index e97d236b8..e3bdf3d11 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -36,6 +36,7 @@ struct xe_object {
 	uint32_t handle;
 	uint64_t offset;
 	uint64_t size;
+	uint8_t pat_index;
 	enum xe_bind_op bind_op;
 	struct igt_list_head link;
 };
diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index f3fcf8a34..d19be3ce9 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -9,6 +9,7 @@
 #include "igt.h"
 #include "igt_aux.h"
 #include "intel_allocator.h"
+#include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -131,7 +132,8 @@ static void alloc_simple(int fd)
 
 	intel_allocator_get_address_range(ahnd, &start, &end);
 	offset0 = intel_allocator_alloc(ahnd, 1, end - start, 0);
-	offset1 = __intel_allocator_alloc(ahnd, 2, 4096, 0, ALLOC_STRATEGY_NONE);
+	offset1 = __intel_allocator_alloc(ahnd, 2, 4096, 0, DEFAULT_PAT_INDEX,
+					  ALLOC_STRATEGY_NONE);
 	igt_assert(offset1 == ALLOC_INVALID_ADDRESS);
 	intel_allocator_free(ahnd, 1);
 
-- 
2.41.0
