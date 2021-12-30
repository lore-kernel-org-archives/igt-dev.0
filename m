Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110C910E7F7
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Dec 2021 18:26:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 30 Dec 2021 19:26:11 +0100
Message-Id: <20211230182613.35827-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211230182613.35827-1-zbigniew.kempczynski@intel.com>
References: <20211230182613.35827-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/intel_memory_region: Add start
 offset and alignment detection
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

With era of new gens we're enforced to use no-reloc (softpin). This
brings few problems like vm range limitations which were well solved
by the kernel. This can be handled also in userspace code by adding
gen related conditionals or by trying to detect the constraints.

Lets try to do this dynamically and detect safe start offset and
alignment for each memory region we got. This should be universal solution
regardless hw limitations and bugs. As such detection is not lightweight
technique add also some caching structures to handle consequtive calls
about same data.

v2: unify cache
v3: move allocation of cache entry out of mutex
v4: remove assert on allocation newentry, just skip adding to cache

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/intel_memory_region.c | 371 +++++++++++++++++++++++++++++++++
 lib/i915/intel_memory_region.h |   5 +
 2 files changed, 376 insertions(+)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index dfbb8acf0..a4431046f 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -28,11 +28,13 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
+#include <pthread.h>
 
 #include "i915/gem_create.h"
 #include "intel_reg.h"
 #include "drmtest.h"
 #include "ioctl_wrappers.h"
+#include "igt_aux.h"
 #include "igt_dummyload.h"
 #include "igt_gt.h"
 #include "igt_params.h"
@@ -40,6 +42,7 @@
 #include "intel_chipset.h"
 #include "igt_collection.h"
 #include "igt_device.h"
+#include "gem_mman.h"
 
 #include "i915/intel_memory_region.h"
 
@@ -480,3 +483,371 @@ uint64_t gpu_meminfo_region_available(const struct drm_i915_query_memory_regions
 
 	return 0;
 }
+
+#define PAGE_SIZE 4096
+
+enum cache_entry_type {
+	MIN_START_OFFSET,
+	MIN_ALIGNMENT,
+	SAFE_START_OFFSET,
+	SAFE_ALIGNMENT,
+};
+
+struct cache_entry {
+	uint16_t devid;
+	enum cache_entry_type type;
+
+	union {
+		/* for MIN_START_OFFSET */
+		struct {
+			uint64_t offset;
+			uint32_t region;
+		} start;
+
+		/* for MIN_ALIGNMENT */
+		struct {
+			uint64_t alignment;
+			uint64_t region1;
+			uint64_t region2;
+		} minalign;
+
+		/* for SAFE_START_OFFSET */
+		uint64_t safe_start_offset;
+
+		/* for SAFE_ALIGNMENT */
+		uint64_t safe_alignment;
+	};
+	struct igt_list_head link;
+};
+
+static IGT_LIST_HEAD(cache);
+static pthread_mutex_t cache_mutex = PTHREAD_MUTEX_INITIALIZER;
+
+static struct cache_entry *find_entry_unlocked(enum cache_entry_type type,
+					       uint16_t devid,
+					       uint32_t region1,
+					       uint32_t region2)
+{
+	struct cache_entry *entry;
+
+	igt_list_for_each_entry(entry, &cache, link) {
+		if (entry->type != type || entry->devid != devid)
+			continue;
+
+		switch (entry->type) {
+		case MIN_START_OFFSET:
+			if (entry->start.region == region1)
+				return entry;
+			continue;
+
+		case MIN_ALIGNMENT:
+			if (entry->minalign.region1 == region1 &&
+			    entry->minalign.region2 == region2)
+				return entry;
+			continue;
+
+		case SAFE_START_OFFSET:
+		case SAFE_ALIGNMENT:
+			return entry;
+		}
+	}
+
+	return NULL;
+}
+
+/**
+ * gem_detect_min_start_offset_for_region:
+ * @i915: drm fd
+ * @region: memory region
+ *
+ * Returns: minimum start offset at which kernel allows placing objects
+ *          for memory region.
+ */
+uint64_t gem_detect_min_start_offset_for_region(int i915, uint32_t region)
+{
+	struct drm_i915_gem_exec_object2 obj;
+	struct drm_i915_gem_execbuffer2 eb;
+	uint64_t start_offset = 0;
+	uint64_t bb_size = PAGE_SIZE;
+	uint32_t *batch;
+	uint16_t devid = intel_get_drm_devid(i915);
+	struct cache_entry *entry, *newentry;
+
+	pthread_mutex_lock(&cache_mutex);
+	entry = find_entry_unlocked(MIN_START_OFFSET, devid, region, 0);
+	if (entry)
+		goto out;
+	pthread_mutex_unlock(&cache_mutex);
+
+	memset(&obj, 0, sizeof(obj));
+	memset(&eb, 0, sizeof(eb));
+
+	eb.buffers_ptr = to_user_pointer(&obj);
+	eb.buffer_count = 1;
+	eb.flags = I915_EXEC_DEFAULT;
+	igt_assert(__gem_create_in_memory_regions(i915, &obj.handle, &bb_size, region) == 0);
+	obj.flags = EXEC_OBJECT_PINNED;
+
+	batch = gem_mmap__device_coherent(i915, obj.handle, 0, bb_size, PROT_WRITE);
+	*batch = MI_BATCH_BUFFER_END;
+	munmap(batch, bb_size);
+
+	while (1) {
+		obj.offset = start_offset;
+
+		if (__gem_execbuf(i915, &eb) == 0)
+			break;
+
+		if (start_offset)
+			start_offset <<= 1;
+		else
+			start_offset = PAGE_SIZE;
+
+		igt_assert(start_offset <= 1ull << 48);
+	}
+	gem_close(i915, obj.handle);
+
+	newentry = malloc(sizeof(*newentry));
+	if (!newentry)
+		return start_offset;
+
+	/* Check does other thread did the job before */
+	pthread_mutex_lock(&cache_mutex);
+	entry = find_entry_unlocked(MIN_START_OFFSET, devid, region, 0);
+	if (entry)
+		goto out;
+
+	entry = newentry;
+	entry->devid = devid;
+	entry->type = MIN_START_OFFSET;
+	entry->start.offset = start_offset;
+	entry->start.region = region;
+	igt_list_add(&entry->link, &cache);
+
+out:
+	pthread_mutex_unlock(&cache_mutex);
+
+	return entry->start.offset;
+}
+
+/**
+ * gem_detect_safe_start_offset:
+ * @i915: drm fd
+ *
+ * Returns: finds start offset which can be used as first one regardless
+ *          memory region. Useful if for some reason some regions don't allow
+ *          starting from 0x0 offset.
+ */
+uint64_t gem_detect_safe_start_offset(int i915)
+{
+	struct drm_i915_query_memory_regions *query_info;
+	struct igt_collection *regions, *set;
+	uint32_t region;
+	uint64_t offset = 0;
+	uint16_t devid = intel_get_drm_devid(i915);
+	struct cache_entry *entry, *newentry;
+
+	pthread_mutex_lock(&cache_mutex);
+	entry = find_entry_unlocked(SAFE_START_OFFSET, devid, 0, 0);
+	if (entry)
+		goto out;
+	pthread_mutex_unlock(&cache_mutex);
+
+	query_info = gem_get_query_memory_regions(i915);
+	igt_assert(query_info);
+
+	set = get_memory_region_set(query_info,
+				    I915_SYSTEM_MEMORY,
+				    I915_DEVICE_MEMORY);
+
+	for_each_combination(regions, 1, set) {
+		region = igt_collection_get_value(regions, 0);
+		offset = max(offset,
+			     gem_detect_min_start_offset_for_region(i915, region));
+	}
+	free(query_info);
+	igt_collection_destroy(set);
+
+	newentry = malloc(sizeof(*newentry));
+	if (!newentry)
+		return offset;
+
+	pthread_mutex_lock(&cache_mutex);
+	entry = find_entry_unlocked(SAFE_START_OFFSET, devid, 0, 0);
+	if (entry)
+		goto out;
+
+	entry = newentry;
+	entry->devid = devid;
+	entry->type = SAFE_START_OFFSET;
+	entry->safe_start_offset = offset;
+	igt_list_add(&entry->link, &cache);
+
+out:
+	pthread_mutex_unlock(&cache_mutex);
+
+	return entry->safe_start_offset;
+}
+
+/**
+ * gem_detect_min_alignment_for_regions:
+ * @i915: drm fd
+ * @region1: first region
+ * @region2: second region
+ *
+ * Returns: minimum alignment which must be used when objects from @region1 and
+ * @region2 are going to interact.
+ */
+uint64_t gem_detect_min_alignment_for_regions(int i915,
+					      uint32_t region1,
+					      uint32_t region2)
+{
+	struct drm_i915_gem_exec_object2 obj[2];
+	struct drm_i915_gem_execbuffer2 eb;
+	uint64_t min_alignment = PAGE_SIZE;
+	uint64_t bb_size = PAGE_SIZE, obj_size = PAGE_SIZE;
+	uint32_t *batch;
+	uint16_t devid = intel_get_drm_devid(i915);
+	struct cache_entry *entry, *newentry;
+
+	pthread_mutex_lock(&cache_mutex);
+	entry = find_entry_unlocked(MIN_ALIGNMENT, devid, region1, region2);
+	if (entry)
+		goto out;
+	pthread_mutex_unlock(&cache_mutex);
+
+	memset(obj, 0, sizeof(obj));
+	memset(&eb, 0, sizeof(eb));
+
+	/* Establish bb offset first */
+	eb.buffers_ptr = to_user_pointer(obj);
+	eb.buffer_count = 1;
+	eb.flags = I915_EXEC_BATCH_FIRST | I915_EXEC_DEFAULT;
+	igt_assert(__gem_create_in_memory_regions(i915, &obj[0].handle,
+						  &bb_size, region1) == 0);
+	obj[0].flags = EXEC_OBJECT_PINNED;
+
+	batch = gem_mmap__device_coherent(i915, obj[0].handle, 0, bb_size,
+					  PROT_WRITE);
+	*batch = MI_BATCH_BUFFER_END;
+	munmap(batch, bb_size);
+
+	obj[0].offset = gem_detect_min_start_offset_for_region(i915, region1);
+
+	/* Find appropriate alignment of object */
+	eb.buffer_count = ARRAY_SIZE(obj);
+	igt_assert(__gem_create_in_memory_regions(i915, &obj[1].handle,
+						  &obj_size, region2) == 0);
+	obj[1].handle = gem_create_in_memory_regions(i915, PAGE_SIZE, region2);
+	obj[1].flags = EXEC_OBJECT_PINNED;
+	while (1) {
+		obj[1].offset = ALIGN(obj[0].offset + bb_size, min_alignment);
+		igt_assert(obj[1].offset <= 1ull << 32);
+
+		if (__gem_execbuf(i915, &eb) == 0)
+			break;
+
+		min_alignment <<= 1;
+	}
+
+	gem_close(i915, obj[0].handle);
+	gem_close(i915, obj[1].handle);
+
+	newentry = malloc(sizeof(*newentry));
+	if (!newentry)
+		return min_alignment;
+
+	pthread_mutex_lock(&cache_mutex);
+	entry = find_entry_unlocked(MIN_ALIGNMENT, devid, region1, region2);
+	if (entry)
+		goto out;
+
+	entry = newentry;
+	entry->devid = devid;
+	entry->type = MIN_ALIGNMENT;
+	entry->minalign.alignment = min_alignment;
+	entry->minalign.region1 = region1;
+	entry->minalign.region2 = region2;
+	igt_list_add(&entry->link, &cache);
+
+out:
+	pthread_mutex_unlock(&cache_mutex);
+
+	return entry->minalign.alignment;
+}
+
+/**
+ * gem_get_safe_alignment:
+ * @i915: drm fd
+ *
+ * Returns: safe alignment for all memory regions on @i915 device.
+ * Safe in this case means max() from all minimum alignment for each
+ * region.
+ */
+uint64_t gem_detect_safe_alignment(int i915)
+{
+	struct drm_i915_query_memory_regions *query_info;
+	struct igt_collection *regions, *set;
+	uint64_t default_alignment = 0;
+	uint32_t region_bb, region_obj;
+	uint16_t devid = intel_get_drm_devid(i915);
+	struct cache_entry *entry, *newentry;
+
+	/* non-discrete uses 4K page size */
+	if (!gem_has_lmem(i915))
+		return PAGE_SIZE;
+
+	pthread_mutex_lock(&cache_mutex);
+	entry = find_entry_unlocked(SAFE_ALIGNMENT, devid, 0, 0);
+	if (entry)
+		goto out;
+	pthread_mutex_unlock(&cache_mutex);
+
+	query_info = gem_get_query_memory_regions(i915);
+	igt_assert(query_info);
+
+	set = get_memory_region_set(query_info,
+				    I915_SYSTEM_MEMORY,
+				    I915_DEVICE_MEMORY);
+
+	for_each_variation_r(regions, 2, set) {
+		uint64_t alignment;
+
+		region_bb = igt_collection_get_value(regions, 0);
+		region_obj = igt_collection_get_value(regions, 1);
+
+		/* We're interested in triangular matrix */
+		if (region_bb > region_obj)
+			continue;
+
+		alignment = gem_detect_min_alignment_for_regions(i915,
+								 region_bb,
+								 region_obj);
+		if (default_alignment < alignment)
+			default_alignment = alignment;
+	}
+
+	free(query_info);
+	igt_collection_destroy(set);
+
+	newentry = malloc(sizeof(*newentry));
+	if (!newentry)
+		return default_alignment;
+
+	/* Try again, check does we have cache updated in the meantime. */
+	pthread_mutex_lock(&cache_mutex);
+	entry = find_entry_unlocked(SAFE_ALIGNMENT, devid,  0, 0);
+	if (entry)
+		goto out;
+
+	entry = newentry;
+	entry->devid = devid;
+	entry->type = SAFE_ALIGNMENT;
+	entry->safe_alignment = default_alignment;
+	igt_list_add(&entry->link, &cache);
+
+out:
+	pthread_mutex_unlock(&cache_mutex);
+
+	return entry->minalign.alignment;
+}
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index 8b427b7e7..936e7d1c8 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -129,4 +129,9 @@ uint64_t gpu_meminfo_region_available(const struct drm_i915_query_memory_regions
 				      uint16_t memory_class,
 				      uint16_t memory_instance);
 
+uint64_t gem_detect_min_start_offset_for_region(int i915, uint32_t region);
+uint64_t gem_detect_safe_start_offset(int i915);
+uint64_t gem_detect_min_alignment_for_regions(int i915, uint32_t region1, uint32_t region2);
+uint64_t gem_detect_safe_alignment(int i915);
+
 #endif /* INTEL_MEMORY_REGION_H */
-- 
2.32.0
