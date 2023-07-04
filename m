Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4CA10E2BC
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 09:01:39 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Jul 2023 11:00:59 +0200
Message-Id: <20230704090104.120219-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
References: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/12] lib/intel_allocator: Add
 intel_allocator_bind()
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

Synchronize allocator state to vm.

This change allows xe user to execute vm-bind/unbind for allocator
alloc()/free() operations which occurred since last binding/unbinding.
Before doing exec user should call intel_allocator_bind() to ensure
all vma's are in place.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_allocator.c | 161 ++++++++++++++++++++++++++++++++++++++++++
 lib/intel_allocator.h |   3 +
 2 files changed, 164 insertions(+)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index c98c410b3b..20d2c10f50 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -17,6 +17,7 @@
 #include "intel_allocator.h"
 #include "intel_allocator_msgchannel.h"
 #include "xe/xe_query.h"
+#include "xe/xe_util.h"
 
 //#define ALLOCDBG
 #ifdef ALLOCDBG
@@ -46,6 +47,14 @@ static inline const char *reqstr(enum reqtype request_type)
 #define alloc_debug(...) {}
 #endif
 
+#ifdef ALLOCBINDDBG
+#define bind_info igt_info
+#define bind_debug igt_debug
+#else
+#define bind_info(...) {}
+#define bind_debug(...) {}
+#endif
+
 /*
  * We limit allocator space to avoid hang when batch would be
  * pinned in the last page.
@@ -58,6 +67,7 @@ struct allocator {
 	uint32_t vm;
 	_Atomic(int32_t) refcount;
 	struct intel_allocator *ial;
+	struct igt_map *bind_map;
 };
 
 struct handle_entry {
@@ -65,6 +75,21 @@ struct handle_entry {
 	struct allocator *al;
 };
 
+/* For tracking alloc()/free() for Xe */
+enum allocator_bind_op {
+	BOUND,
+	TO_BIND,
+	TO_UNBIND,
+};
+
+struct allocator_object {
+	uint32_t handle;
+	uint64_t offset;
+	uint64_t size;
+
+	enum allocator_bind_op bind_op;
+};
+
 struct intel_allocator *
 intel_allocator_reloc_create(int fd, uint64_t start, uint64_t end);
 struct intel_allocator *
@@ -234,6 +259,7 @@ static struct allocator *__allocator_create(int fd, uint32_t ctx, uint32_t vm,
 	al->vm = vm;
 	atomic_init(&al->refcount, 0);
 	al->ial = ial;
+	al->bind_map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
 
 	igt_map_insert(map, al, al);
 
@@ -404,6 +430,7 @@ static bool allocator_close(uint64_t ahnd)
 	released = __allocator_put(al);
 	if (released) {
 		is_empty = al->ial->is_empty(al->ial);
+		igt_map_destroy(al->bind_map, map_entry_free_func);
 		intel_allocator_destroy(al->ial);
 	}
 
@@ -1108,6 +1135,60 @@ void intel_allocator_get_address_range(uint64_t allocator_handle,
 		*endp = resp.address_range.end;
 }
 
+static bool is_same(struct allocator_object *obj,
+		    uint32_t handle, uint64_t offset, uint64_t size,
+		    enum allocator_bind_op bind_op)
+{
+	return obj->handle == handle &&	obj->offset == offset && obj->size == size &&
+	       (obj->bind_op == bind_op || obj->bind_op == BOUND);
+}
+
+static void track_object(uint64_t allocator_handle, uint32_t handle,
+			 uint64_t offset, uint64_t size,
+			 enum allocator_bind_op bind_op)
+{
+	struct allocator_object *obj;
+	struct allocator *al;
+
+	bind_info("track: [%s] ahnd: %lld, handle: %u, offset: %llx, size: %llx\n",
+		  bind_op == TO_BIND ? "BIND" : "UNBIND",
+		  (long long)allocator_handle,
+		  handle, (long long)offset, (long long)size);
+	al = __allocator_find_by_handle(allocator_handle);
+	igt_assert(al);
+
+	if (al->ial->driver == INTEL_DRIVER_I915)
+		return; /* no-op for i915, at least now */
+
+	obj = igt_map_search(al->bind_map, &handle);
+	if (obj) {
+		/*
+		 * User may call alloc() couple of times, check object is the
+		 * same. For free() there's simple case, just remove from
+		 * bind_map.
+		 */
+		if (bind_op == TO_BIND)
+			igt_assert_eq(is_same(obj, handle, offset, size, bind_op), true);
+		else if (bind_op == TO_UNBIND) {
+			if (obj->bind_op == TO_BIND)
+				igt_map_remove(al->bind_map, &obj->handle, map_entry_free_func);
+			else if (obj->bind_op == BOUND)
+				obj->bind_op = bind_op;
+		}
+	} else {
+		/* Ignore to unbind bo which wasn't previously inserted */
+		if (bind_op == TO_UNBIND)
+			return;
+
+		obj = calloc(1, sizeof(*obj));
+		obj->handle = handle;
+		obj->offset = offset;
+		obj->size = size;
+		obj->bind_op = bind_op;
+		igt_map_insert(al->bind_map, &obj->handle, obj);
+	}
+}
+
 /**
  * __intel_allocator_alloc:
  * @allocator_handle: handle to an allocator
@@ -1139,6 +1220,8 @@ uint64_t __intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
 	igt_assert(handle_request(&req, &resp) == 0);
 	igt_assert(resp.response_type == RESP_ALLOC);
 
+	track_object(allocator_handle, handle, resp.alloc.offset, size, TO_BIND);
+
 	return resp.alloc.offset;
 }
 
@@ -1216,6 +1299,8 @@ bool intel_allocator_free(uint64_t allocator_handle, uint32_t handle)
 	igt_assert(handle_request(&req, &resp) == 0);
 	igt_assert(resp.response_type == RESP_FREE);
 
+	track_object(allocator_handle, handle, 0, 0, TO_UNBIND);
+
 	return resp.free.freed;
 }
 
@@ -1400,6 +1485,82 @@ void intel_allocator_print(uint64_t allocator_handle)
 	}
 }
 
+static void __xe_op_bind(struct allocator *al, uint32_t sync_in, uint32_t sync_out)
+{
+	struct allocator_object *obj;
+	struct igt_map_entry *pos;
+	struct igt_list_head obj_list;
+	struct xe_object *entry, *tmp;
+
+	IGT_INIT_LIST_HEAD(&obj_list);
+
+	igt_map_foreach(al->bind_map, pos) {
+		obj = pos->data;
+
+		if (obj->bind_op == BOUND)
+			continue;
+
+		bind_info("= [vm: %u] %s => %u %lx %lx\n",
+			  al->ctx,
+			  obj->bind_op == TO_BIND ? "TO BIND" : "TO UNBIND",
+			  obj->handle, obj->offset,
+			  obj->size);
+
+		entry = malloc(sizeof(*entry));
+		entry->handle = obj->handle;
+		entry->offset = obj->offset;
+		entry->size = obj->size;
+		entry->bind_op = obj->bind_op == TO_BIND ? XE_OBJECT_BIND :
+							   XE_OBJECT_UNBIND;
+		entry->priv = obj;
+		igt_list_add(&entry->link, &obj_list);
+	}
+
+	xe_bind_unbind_async(al->fd, al->ctx, 0, &obj_list, sync_in, sync_out);
+
+	igt_list_for_each_entry_safe(entry, tmp, &obj_list, link) {
+		obj = entry->priv;
+		if (obj->bind_op == TO_BIND)
+			obj->bind_op = BOUND;
+		else
+			igt_map_remove(al->bind_map, &obj->handle, map_entry_free_func);
+
+		igt_list_del(&entry->link);
+		free(entry);
+	}
+}
+
+/**
+ * intel_allocator_bind:
+ * @allocator_handle: handle to an allocator
+ * @sync_in: syncobj (fence-in)
+ * @sync_out: syncobj (fence-out)
+ *
+ * Function binds and unbinds all objects added to the allocator which weren't
+ * previously binded/unbinded.
+ *
+ **/
+void intel_allocator_bind(uint64_t allocator_handle,
+			  uint32_t sync_in, uint32_t sync_out)
+{
+	struct allocator *al;
+
+	igt_assert(allocator_handle);
+
+	al = __allocator_find_by_handle(allocator_handle);
+	igt_assert(al);
+
+	if (al->ial->driver == INTEL_DRIVER_I915)
+		return; /* no-op for i915, at least now */
+
+	/*
+	 * We collect bind/unbind operations on alloc()/free() to do group
+	 * operationgetting @sync_in as syncobj handle (fence-in). If user
+	 * passes 0 as @sync_out we bind/unbind synchronously.
+	 */
+	__xe_op_bind(al, sync_in, sync_out);
+}
+
 static int equal_handles(const void *key1, const void *key2)
 {
 	const struct handle_entry *h1 = key1, *h2 = key2;
diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index ed3a78485d..ad86dc5524 100644
--- a/lib/intel_allocator.h
+++ b/lib/intel_allocator.h
@@ -214,6 +214,9 @@ bool intel_allocator_reserve_if_not_allocated(uint64_t allocator_handle,
 
 void intel_allocator_print(uint64_t allocator_handle);
 
+void intel_allocator_bind(uint64_t allocator_handle,
+			  uint32_t sync_in, uint32_t sync_out);
+
 #define ALLOC_INVALID_ADDRESS (-1ull)
 #define INTEL_ALLOCATOR_NONE   0
 #define INTEL_ALLOCATOR_RELOC  1
-- 
2.34.1
