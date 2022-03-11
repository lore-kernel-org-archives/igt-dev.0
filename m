Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2EE10E959
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 12:13:27 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Mar 2022 13:13:13 +0100
Message-Id: <20220311121318.112757-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220311121318.112757-1-zbigniew.kempczynski@intel.com>
References: <20220311121318.112757-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/6] lib/i915/gem_create: Introduce gem-pool
 bo cache
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

Handling batchbuffers with softpin requires tracking its state otherwise
we can write to inflight batchbuffer and encounter gpu hang. Gem pool
adds such tracking (similar to libdrm bo cache) and provides free and
ready to use bo. If pool has no free bo new one is created what means pool
can be growing during test execution. When test completes freeing buffers
and memory is called from igt_core so no additional cleanup is necessary.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/i915/gem_create.c                         | 271 ++++++++++++++++++
 lib/i915/gem_create.h                         |   4 +
 lib/igt_core.c                                |   2 +
 4 files changed, 278 insertions(+)

diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
index 0dc5a0b7e7..c22e70b712 100644
--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
@@ -56,6 +56,7 @@
   </chapter>
   <chapter>
     <title>igt/i915 API Reference</title>
+    <xi:include href="xml/gem_create.xml"/>
     <xi:include href="xml/gem_context.xml"/>
     <xi:include href="xml/gem_engine_topology.xml"/>
     <xi:include href="xml/gem_scheduler.xml"/>
diff --git a/lib/i915/gem_create.c b/lib/i915/gem_create.c
index b2e8d5595f..605c45139d 100644
--- a/lib/i915/gem_create.c
+++ b/lib/i915/gem_create.c
@@ -4,12 +4,25 @@
  */
 
 #include <errno.h>
+#include <pthread.h>
 
+#include "drmtest.h"
 #include "gem_create.h"
 #include "i915_drm.h"
 #include "igt_core.h"
+#include "igt_list.h"
+#include "igt_map.h"
 #include "ioctl_wrappers.h"
 
+/**
+ * SECTION:gem_create
+ * @short_description: Helpers for dealing with objects creation
+ * @title: GEM Create
+ *
+ * This helper library contains functions used for handling creating gem
+ * objects.
+ */
+
 int __gem_create(int fd, uint64_t *size, uint32_t *handle)
 {
 	struct drm_i915_gem_create create = {
@@ -88,3 +101,261 @@ uint32_t gem_create_ext(int fd, uint64_t size, struct i915_user_extension *ext)
 
 	return handle;
 }
+
+static struct igt_map *pool;
+static pthread_mutex_t pool_mutex = PTHREAD_MUTEX_INITIALIZER;
+
+struct pool_entry {
+	int fd;
+	uint32_t handle;
+	uint64_t size;		/* requested bo size */
+	uint64_t bo_size;	/* created bo size */
+	uint32_t region;
+	struct igt_list_head link;
+};
+
+struct pool_list {
+	uint64_t size;
+	struct igt_list_head list;
+};
+
+static struct pool_entry *find_or_create(int fd, struct pool_list *pl,
+					 uint64_t size, uint32_t region)
+{
+	struct pool_entry *pe;
+	bool found = false;
+
+	igt_list_for_each_entry(pe, &pl->list, link) {
+		if (pe->fd == fd && pe->size == size && pe->region == region &&
+		    !gem_bo_busy(fd, pe->handle)) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		pe = calloc(1, sizeof(*pe));
+		if (!pe)
+			goto out;
+
+		pe->fd = fd;
+		pe->bo_size = size;
+		if (__gem_create_in_memory_regions(fd, &pe->handle, &pe->bo_size, region)) {
+			free(pe);
+			pe = NULL;
+			goto out;
+		}
+		pe->size = size;
+		pe->region = region;
+
+		igt_list_add_tail(&pe->link, &pl->list);
+	}
+
+out:
+	return pe;
+}
+
+/**
+ * gem_create_from_pool:
+ * @fd: open i915 drm file descriptor
+ * @size: pointer to size, on input it points to requested bo size,
+ * on output created bo size will be stored there
+ * @region: region in which bo should be created
+ *
+ * Function returns bo handle which is free to use (not busy). Internally
+ * it iterates over previously allocated bo and returns first free. If there
+ * are no free bo a new one is created.
+ *
+ * Returns: bo handle + created bo size (via pointer to size)
+ */
+uint32_t gem_create_from_pool(int fd, uint64_t *size, uint32_t region)
+{
+	struct pool_list *pl;
+	struct pool_entry *pe;
+
+	pthread_mutex_lock(&pool_mutex);
+
+	pl = igt_map_search(pool, size);
+	if (!pl) {
+		pl = calloc(1, sizeof(*pl));
+		if (!pl)
+			goto out;
+
+		IGT_INIT_LIST_HEAD(&pl->list);
+		pl->size = *size;
+		igt_map_insert(pool, &pl->size, pl);
+	}
+	pe = find_or_create(fd, pl, *size, region);
+
+out:
+	pthread_mutex_unlock(&pool_mutex);
+
+	igt_assert(pl && pe);
+
+	return pe->handle;
+}
+
+static void __pool_list_free_func(struct igt_map_entry *entry)
+{
+	free(entry->data);
+}
+
+static void __destroy_pool(struct igt_map *map, pthread_mutex_t *mutex)
+{
+	struct igt_map_entry *pos;
+	const struct pool_list *pl;
+	struct pool_entry *pe, *tmp;
+
+	if (!map)
+		return;
+
+	pthread_mutex_lock(mutex);
+
+	igt_map_foreach(map, pos) {
+		pl = pos->key;
+		igt_list_for_each_entry_safe(pe, tmp, &pl->list, link) {
+			gem_close(pe->fd, pe->handle);
+			igt_list_del(&pe->link);
+			free(pe);
+		}
+	}
+
+	pthread_mutex_unlock(mutex);
+
+	igt_map_destroy(map, __pool_list_free_func);
+}
+
+void gem_pool_dump(void)
+{
+	struct igt_map_entry *pos;
+	const struct pool_list *pl;
+	struct pool_entry *pe;
+
+	if (!pool)
+		return;
+
+	pthread_mutex_lock(&pool_mutex);
+
+	igt_debug("[pool]\n");
+	igt_map_foreach(pool, pos) {
+		pl = pos->key;
+		igt_debug("bucket [%llx]\n", (long long) pl->size);
+		igt_list_for_each_entry(pe, &pl->list, link)
+			igt_debug(" - handle: %u, size: %llx, bo_size: %llx, region: %x\n",
+				  pe->handle, (long long) pe->size,
+				  (long long) pe->bo_size, pe->region);
+	}
+
+	pthread_mutex_unlock(&pool_mutex);
+}
+
+#define GOLDEN_RATIO_PRIME_64 0x9e37fffffffc0001ULL
+static inline uint32_t hash_pool(const void *val)
+{
+	uint64_t hash = *(uint64_t *) val;
+
+	hash = hash * GOLDEN_RATIO_PRIME_64;
+	return hash >> 32;
+}
+
+static int equal_pool(const void *a, const void *b)
+{
+	struct pool_list *p1 = (struct pool_list *) a;
+	struct pool_list *p2 = (struct pool_list *) b;
+
+	return p1->size == p2->size;
+}
+
+/**
+ * gem_pool_init:
+ *
+ * Function initializes bo pool (kind of bo cache). Main purpose of it is to
+ * support working with softpin to achieve pipelined execution on gpu (without
+ * stalls).
+ *
+ * For example imagine code as follows:
+ *
+ * |[<!-- language="C" -->
+ * uint32_t bb = gem_create(fd, 4096);
+ * uint32_t *bbptr = gem_mmap__device_coherent(fd, bb, ...)
+ * uint32_t *cmd = bbptr;
+ * ...
+ * *cmd++ = ...gpu commands...
+ * ...
+ * *cmd++ = MI_BATCH_BUFFER_END;
+ * ...
+ * gem_execbuf(fd, execbuf); // bb is part of execbuf   <--- first execbuf
+ *
+ * cmd = bbptr;
+ * ...
+ * *cmd++ = ... next gpu commands...
+ * ...
+ * *cmd++ = MI_BATCH_BUFFER_END;
+ * ...
+ * gem_execbuf(fd, execbuf); // bb is part of execbuf   <--- second execbuf
+ * ]|
+ *
+ * Above code is prone to gpu hang because when bb was submitted to gpu
+ * we immediately started writing to it. If gpu started executing commands
+ * from first execbuf we're overwriting it leading to unpredicted behavior
+ * (partially execute from first and second commands or we get gpu hang).
+ * To avoid this we can sync after first execbuf but we will get stall
+ * in execution. For some tests it might be accepted but such "isolated"
+ * execution hides bugs (synchronization, cache flushes, etc).
+ *
+ * So, to achive pipelined execution we need to use another bb. If we would
+ * like to enqueue more work which is serialized we would need more bbs
+ * (depends on execution speed). Handling this manually is cumbersome as
+ * we need to track all bb and their status (busy or free).
+ *
+ * Solution to above is gem pool. It returns first handle of requested size
+ * which is not busy (or create a new one if there's none or all of bo are
+ * in use). Here's an example how to use it:
+ *
+ * |[<!-- language="C" -->
+ * uint64_t bbsize = 4096;
+ * uint32_t bb = gem_create_from_pool(fd, &bbsize, REGION_SMEM);
+ * uint32_t *bbptr = gem_mmap__device_coherent(fd, bb, ...)
+ * uint32_t *cmd = bbptr;
+ * ...
+ * *cmd++ = ...gpu commands...
+ * ...
+ * *cmd++ = MI_BATCH_BUFFER_END;
+ * gem_munmap(bbptr, bbsize);
+ * ...
+ * gem_execbuf(fd, execbuf); // bb is part of execbuf   <--- first execbuf
+ *
+ * bbsize = 4096;
+ * bb = gem_create_from_pool(fd, &bbsize, REGION_SMEM);
+ * cmd = bbptr;
+ * ...
+ * *cmd++ = ... next gpu commands...
+ * ...
+ * *cmd++ = MI_BATCH_BUFFER_END;
+ * gem_munmap(bbptr, bbsize);
+ * ...
+ * gem_execbuf(fd, execbuf); // bb is part of execbuf   <--- second execbuf
+ * ]|
+ *
+ * Assuming first execbuf is executed we will get new bb handle when we call
+ * gem_create_from_pool(). When test completes pool is freed automatically
+ * in igt core (all handles will be closed, memory will be freed and gem pool
+ * will be reinitialized for next test).
+ *
+ * Some explanation is needed why we need to put pointer to size instead of
+ * passing absolute value. On discrete regarding memory placement (region)
+ * object created in the memory can be bigger than requested. Especially when
+ * we use allocator to handle vm space and we allocate vma with requested
+ * size (which is smaller than bo created) we can overlap with next allocation
+ * and get -ENOSPC.
+ */
+void gem_pool_init(void)
+{
+	pthread_mutex_init(&pool_mutex, NULL);
+	__destroy_pool(pool, &pool_mutex);
+	pool = igt_map_create(hash_pool, equal_pool);
+}
+
+igt_constructor {
+	gem_pool_init();
+}
diff --git a/lib/i915/gem_create.h b/lib/i915/gem_create.h
index c2b531b4d7..c32a815d60 100644
--- a/lib/i915/gem_create.h
+++ b/lib/i915/gem_create.h
@@ -16,4 +16,8 @@ int __gem_create_ext(int fd, uint64_t *size, uint32_t *handle,
                      struct i915_user_extension *ext);
 uint32_t gem_create_ext(int fd, uint64_t size, struct i915_user_extension *ext);
 
+void gem_pool_init(void);
+void gem_pool_dump(void);
+uint32_t gem_create_from_pool(int fd, uint64_t *size, uint32_t region);
+
 #endif /* GEM_CREATE_H */
diff --git a/lib/igt_core.c b/lib/igt_core.c
index f2c701deab..6dad3c8485 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -58,6 +58,7 @@
 #include <glib.h>
 
 #include "drmtest.h"
+#include "i915/gem_create.h"
 #include "intel_allocator.h"
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
@@ -1428,6 +1429,7 @@ __noreturn static void exit_subtest(const char *result)
 	 */
 	intel_allocator_init();
 	intel_bb_reinit_allocator();
+	gem_pool_init();
 
 	if (!in_dynamic_subtest)
 		_igt_dynamic_tests_executed = -1;
-- 
2.32.0
