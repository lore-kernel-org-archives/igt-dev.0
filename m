Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E1B10E1CC
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Dec 2021 13:57:53 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 29 Dec 2021 14:57:40 +0100
Message-Id: <20211229135742.37177-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211229135742.37177-1-zbigniew.kempczynski@intel.com>
References: <20211229135742.37177-1-zbigniew.kempczynski@intel.com>
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

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/intel_memory_region.c | 269 +++++++++++++++++++++++++++++++++
 lib/i915/intel_memory_region.h |   5 +
 2 files changed, 274 insertions(+)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index dfbb8acf0..4bf116dc9 100644
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
 
@@ -480,3 +483,269 @@ uint64_t gpu_meminfo_region_available(const struct drm_i915_query_memory_regions
 
 	return 0;
 }
+
+#define PAGE_SIZE 4096
+#define START_OFFSET PAGE_SIZE
+
+struct devid_start {
+	uint16_t devid;
+	uint64_t start;
+	uint32_t region;
+	struct igt_list_head link;
+};
+
+static IGT_LIST_HEAD(start_cache);
+static pthread_mutex_t start_cache_mutex = PTHREAD_MUTEX_INITIALIZER;
+
+static uint64_t detect_start_offset(int i915, uint32_t region_bb)
+{
+	struct drm_i915_gem_exec_object2 obj;
+	struct drm_i915_gem_execbuffer2 eb;
+	uint64_t start_offset = START_OFFSET;
+	uint64_t bb_size = PAGE_SIZE;
+	uint32_t *batch;
+	uint16_t devid = intel_get_drm_devid(i915);
+	struct devid_start *entry;
+
+	pthread_mutex_lock(&start_cache_mutex);
+	igt_list_for_each_entry(entry, &start_cache, link) {
+		if (entry->devid == devid && entry->region == region_bb)
+			goto out;
+	}
+	pthread_mutex_unlock(&start_cache_mutex);
+
+	memset(&obj, 0, sizeof(obj));
+	memset(&eb, 0, sizeof(eb));
+
+	eb.buffers_ptr = to_user_pointer(&obj);
+	eb.buffer_count = 1;
+	eb.flags = I915_EXEC_DEFAULT;
+	igt_assert(__gem_create_in_memory_regions(i915, &obj.handle, &bb_size, region_bb) == 0);
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
+		start_offset <<= 1;
+
+		igt_assert(start_offset <= 1ull << 32);
+	}
+	gem_close(i915, obj.handle);
+
+	/* Check does other thread did the job before */
+	pthread_mutex_lock(&start_cache_mutex);
+	igt_list_for_each_entry(entry, &start_cache, link) {
+		if (entry->devid == devid && entry->region == region_bb)
+			goto out;
+	}
+
+	entry = malloc(sizeof(*entry));
+	if (entry)
+		pthread_mutex_unlock(&start_cache_mutex);
+	igt_assert(entry);
+	entry->devid = devid;
+	entry->start = start_offset;
+	entry->region = region_bb;
+	igt_list_add(&entry->link, &start_cache);
+
+out:
+	pthread_mutex_unlock(&start_cache_mutex);
+
+	return entry->start;
+}
+
+/**
+ * gem_get_start_offset_for_region:
+ * @i915: drm fd
+ * @region: memory region
+ *
+ * Returns: start offset at which kernel allows placing objects for memory
+ *          region.
+ */
+uint64_t gem_get_start_offset_for_region(int i915, uint32_t region)
+{
+	return detect_start_offset(i915, region);
+}
+
+/**
+ * gem_get_safe_start_offset:
+ * @i915: drm fd
+ *
+ * Returns: finds start offset which can be used as first one regardless
+ *          memory region. Useful if for some reason some regions don't allow
+ *          starting from 0x0 offset.
+ */
+uint64_t gem_get_safe_start_offset(int i915)
+{
+	struct drm_i915_query_memory_regions *query_info;
+	struct igt_collection *regions, *set;
+	uint32_t region;
+	uint64_t offset = 0;
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
+		offset = max(offset, gem_get_start_offset_for_region(i915, region));
+	}
+	free(query_info);
+	igt_collection_destroy(set);
+
+	return offset;
+}
+
+static uint64_t detect_alignment(int i915, uint32_t region_bb, uint32_t region_obj)
+{
+	struct drm_i915_gem_exec_object2 obj[2];
+	struct drm_i915_gem_execbuffer2 eb;
+	uint64_t default_alignment = PAGE_SIZE;
+	uint64_t bb_size = PAGE_SIZE, obj_size = PAGE_SIZE;
+	uint32_t *batch;
+
+	memset(obj, 0, sizeof(obj));
+	memset(&eb, 0, sizeof(eb));
+
+	/* Establish bb offset first */
+	eb.buffers_ptr = to_user_pointer(obj);
+	eb.buffer_count = 1;
+	eb.flags = I915_EXEC_BATCH_FIRST | I915_EXEC_DEFAULT;
+	igt_assert(__gem_create_in_memory_regions(i915, &obj[0].handle, &bb_size, region_bb) == 0);
+	obj[0].flags = EXEC_OBJECT_PINNED;
+
+	batch = gem_mmap__device_coherent(i915, obj[0].handle, 0, bb_size, PROT_WRITE);
+	*batch = MI_BATCH_BUFFER_END;
+	munmap(batch, bb_size);
+
+	obj[0].offset = detect_start_offset(i915, region_bb);
+
+	/* Find appropriate alignment of object */
+	eb.buffer_count = ARRAY_SIZE(obj);
+	igt_assert(__gem_create_in_memory_regions(i915, &obj[1].handle, &obj_size, region_obj) == 0);
+	obj[1].handle = gem_create_in_memory_regions(i915, PAGE_SIZE, region_obj);
+	obj[1].flags = EXEC_OBJECT_PINNED;
+	while (1) {
+		obj[1].offset = ALIGN(obj[0].offset + bb_size, default_alignment);
+		igt_assert(obj[1].offset <= 1ull << 32);
+
+		if (__gem_execbuf(i915, &eb) == 0)
+			break;
+
+		default_alignment <<= 1;
+	}
+
+	gem_close(i915, obj[0].handle);
+	gem_close(i915, obj[1].handle);
+
+	return default_alignment;
+}
+
+/**
+ * gem_get_alignment_for_regions:
+ * @i915: drm fd
+ * @region1: first region
+ * @region2: second region
+ *
+ * Returns: alignment which must be used when objects from @region1 and
+ * @region2 are going to interact.
+ */
+uint64_t gem_get_alignment_for_regions(int i915, uint32_t region1, uint32_t region2)
+{
+	return detect_alignment(i915, region1, region2);
+}
+
+struct devid_align {
+	uint16_t devid;
+	uint64_t alignment;
+	struct igt_list_head link;
+};
+
+static IGT_LIST_HEAD(alignment_cache);
+static pthread_mutex_t alignment_cache_mutex = PTHREAD_MUTEX_INITIALIZER;
+
+/**
+ * gem_get_safe_alignment:
+ * @i915: drm fd
+ *
+ * Returns: safe (maximum) alignment for all memory regions on @i915 device.
+ */
+uint64_t gem_get_safe_alignment(int i915)
+{
+	struct drm_i915_query_memory_regions *query_info;
+	struct igt_collection *regions, *set;
+	uint64_t default_alignment = 0;
+	uint32_t region_bb, region_obj;
+	uint16_t devid = intel_get_drm_devid(i915);
+	struct devid_align *entry;
+
+	/* non-discrete uses 4K page size */
+	if (!gem_has_lmem(i915))
+		return PAGE_SIZE;
+
+	pthread_mutex_lock(&alignment_cache_mutex);
+	igt_list_for_each_entry(entry, &alignment_cache, link) {
+		if (entry->devid == devid)
+			goto out;
+	}
+	/*
+	 * Unlock mutex in hope parallel alignment detection will happen
+	 * on different devid-s.
+	 */
+	pthread_mutex_unlock(&alignment_cache_mutex);
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
+		alignment = detect_alignment(i915, region_bb, region_obj);
+		if (default_alignment < alignment)
+			default_alignment = alignment;
+	}
+
+	free(query_info);
+	igt_collection_destroy(set);
+
+	/* Try again, check does we have cache updated in the meantime. */
+	pthread_mutex_lock(&alignment_cache_mutex);
+	igt_list_for_each_entry(entry, &alignment_cache, link) {
+		if (entry->devid == devid)
+			goto out;
+	}
+
+	entry = malloc(sizeof(*entry));
+	if (!entry)
+		pthread_mutex_unlock(&alignment_cache_mutex);
+	igt_assert(entry);
+	entry->devid = devid;
+	entry->alignment = default_alignment;
+	igt_list_add(&entry->link, &alignment_cache);
+
+out:
+	pthread_mutex_unlock(&alignment_cache_mutex);
+
+	return entry->alignment;
+}
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index 8b427b7e7..4d994f1ad 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -129,4 +129,9 @@ uint64_t gpu_meminfo_region_available(const struct drm_i915_query_memory_regions
 				      uint16_t memory_class,
 				      uint16_t memory_instance);
 
+uint64_t gem_get_start_offset_for_region(int i915, uint32_t region);
+uint64_t gem_get_safe_start_offset(int i915);
+uint64_t gem_get_alignment_for_regions(int i915, uint32_t region1, uint32_t region2);
+uint64_t gem_get_safe_alignment(int i915);
+
 #endif /* INTEL_MEMORY_REGION_H */
-- 
2.32.0
