Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Tue, 11 May 2021 17:51:14 +0100
Message-Id: <20210511165117.428062-10-matthew.auld@intel.com>
In-Reply-To: <20210511165117.428062-1-matthew.auld@intel.com>
References: <20210511165117.428062-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 09/12] lib/i915/intel_memory_region/dg1: Add
 new lib to query memory region
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
Cc: Vanshidhar Konda <vanshidhar.r.konda@intel.com>, thomas.hellstrom@linux.intel.com, Michal Winiarski <michal.winiarski@intel.com>, petri.latvala@intel.com, Janulgue Abdiel <abdiel.janulgue@intel.com>, intel-gfx@lists.freedesktop.org, Lukasz Kalamarz <lukasz.kalamarz@intel.com>, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

From: Lukasz Kalamarz <lukasz.kalamarz@intel.com>

With an introduction of Local Memory concept we should be able to
allocate object in specific memory region. This patch implements
helper functions that allow this.

Signed-off-by: Lukasz Kalamarz <lukasz.kalamarz@intel.com>
Cc: Janulgue Abdiel <abdiel.janulgue@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
 lib/i915/intel_memory_region.c | 130 ++++++++++++++++++++-------------
 lib/i915/intel_memory_region.h |   5 ++
 2 files changed, 86 insertions(+), 49 deletions(-)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 412367e4..91d3ef18 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -27,7 +27,6 @@
 #include <sys/time.h>
 #include <sys/types.h>
 #include <sys/stat.h>
-#include <sys/sysinfo.h>
 #include <fcntl.h>
 
 #include "i915/gem_create.h"
@@ -41,10 +40,42 @@
 #include "intel_chipset.h"
 #include "igt_collection.h"
 #include "igt_device.h"
-#include "igt_aux.h"
 
 #include "i915/intel_memory_region.h"
 
+#define i915_query_items(fd, items, n_items) do { \
+		igt_assert_eq(__i915_query_items(fd, items, n_items), 0); \
+		errno = 0; \
+	} while (0)
+#define i915_query_items_err(fd, items, n_items, err) do { \
+		igt_assert_eq(__i915_query_items(fd, items, n_items), -err); \
+	} while (0)
+
+static int
+__i915_query(int fd, struct drm_i915_query *q)
+{
+	if (igt_ioctl(fd, DRM_IOCTL_I915_QUERY, q))
+		return -errno;
+	return 0;
+}
+
+static int
+__i915_query_items(int fd, struct drm_i915_query_item *items, uint32_t n_items)
+{
+	struct drm_i915_query q = {
+		.num_items = n_items,
+		.items_ptr = to_user_pointer(items),
+	};
+	return __i915_query(fd, &q);
+}
+
+bool gem_has_query_support(int fd)
+{
+	struct drm_i915_query query = {};
+
+	return __i915_query(fd, &query) == 0;
+}
+
 const char *get_memory_region_name(uint32_t region)
 {
 	uint16_t class = MEMORY_TYPE_FROM_REGION(region);
@@ -59,76 +90,77 @@ const char *get_memory_region_name(uint32_t region)
  *  gem_get_batch_size:
  *  @fd: open i915 drm file descriptor
  *  @mem_region_type: used memory_region type
+ *
+ *  With introduction of LMEM we observe different page sizes for those two
+ *  memory regions. Without this helper funtion we may be prone to forget
+ *  about setting proper page size.
  */
 uint32_t gem_get_batch_size(int fd, uint8_t mem_region_type)
 {
-	/* temporary solution, to be erased later */
-	(void) fd;
-	(void) mem_region_type;
-
-	return 4096;
+	return (mem_region_type == I915_MEMORY_CLASS_DEVICE) ? 65536 : 4096;
 }
 
-static uint64_t __get_meminfo(const char *info, const char *tag)
+/**
+ * gem_get_query_memory_regions:
+ * @fd: open i915 drm file descriptor
+ *
+ * This function wraps query mechanism for memory regions.
+ *
+ * Returns: Filled struct with available memory regions.
+ */
+struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd)
 {
-	const char *str;
-	unsigned long val;
+	struct drm_i915_query_item item;
+	struct drm_i915_query_memory_regions *query_info;
 
-	str = strstr(info, tag);
-	if (str && sscanf(str + strlen(tag), " %lu", &val) == 1)
-		return (uint64_t)val << 10;
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_MEMORY_REGIONS;
+	i915_query_items(fd, &item, 1);
 
-	igt_warn("Unrecognized /proc/meminfo field: '%s'\n", tag);
-	return 0;
-}
+	query_info = calloc(1, item.length);
 
-static uint64_t __get_available_smem(int fd)
-{
-	uint64_t retval;
-	char *info;
-	int proc_fd;
+	item.data_ptr = to_user_pointer(query_info);
+	i915_query_items(fd, &item, 1);
 
-	intel_purge_vm_caches(fd);
+	return query_info;
+}
 
-	proc_fd = open("/proc", O_RDONLY);
-	info = igt_sysfs_get(proc_fd, "meminfo");
-	close(proc_fd);
+/**
+ * gem_get_lmem_region_count:
+ * @fd: open i915 drm file descriptor
+ *
+ * Helper function to check how many lmem regions are available on device.
+ *
+ * Returns: Number of found lmem regions.
+ */
+uint8_t gem_get_lmem_region_count(int fd)
+{
+	struct drm_i915_query_memory_regions *query_info;
+	uint8_t num_regions;
+	uint8_t lmem_regions = 0;
 
-	if (info) {
-		retval = __get_meminfo(info, "MemAvailable:");
-	} else {
-		struct sysinfo sysinf;
+	query_info = gem_get_query_memory_regions(fd);
+	num_regions = query_info->num_regions;
 
-		igt_assert(sysinfo(&sysinf) == 0);
-		retval = sysinf.freeram;
-		retval *= sysinf.mem_unit;
+	for (int i = 0; i < num_regions; i++) {
+		if (query_info->regions[i].region.memory_class == I915_MEMORY_CLASS_DEVICE)
+			lmem_regions += 1;
 	}
 
-	return retval;
+	return lmem_regions;
 }
 
 /**
- * gem_get_query_memory_regions:
+ * gem_has_lmem:
  * @fd: open i915 drm file descriptor
  *
- * This function is prepared as a wrapper for the upcoming memory
- * regions implementation.
+ * Helper function to check if lmem is available on device.
  *
- * Returns: Filled struct with available memory regions.
+ * Returns: True if at least one lmem region was found.
  */
-struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd)
+bool gem_has_lmem(int fd)
 {
-	struct drm_i915_query_memory_regions *query_info;
-
-	query_info = calloc(1, sizeof(struct drm_i915_query_memory_regions)
-			    + sizeof(struct drm_i915_memory_region_info));
-
-	query_info->num_regions = 1;
-	query_info->regions[0].region.memory_class = I915_MEMORY_CLASS_SYSTEM;
-	query_info->regions[0].probed_size = intel_get_total_ram_mb() << 20;
-	query_info->regions[0].unallocated_size = __get_available_smem(fd);
-
-	return query_info;
+	return gem_get_lmem_region_count(fd) > 0;
 }
 
 /* A version of gem_create_in_memory_region_list which can be allowed to
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index 0ddc9f98..3e53d8de 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -39,11 +39,16 @@
 
 #define REGION_SMEM    INTEL_MEMORY_REGION_ID(I915_MEMORY_CLASS_SYSTEM, 0)
 
+bool gem_has_query_support(int fd);
+
 const char *get_memory_region_name(uint32_t region);
 uint32_t gem_get_batch_size(int fd, uint8_t mem_region_type);
 
 struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd);
 
+uint8_t gem_get_lmem_region_count(int fd);
+
+bool gem_has_lmem(int fd);
 
 int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t size,
 				       struct drm_i915_gem_memory_class_instance *mem_regions,
-- 
2.26.3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
