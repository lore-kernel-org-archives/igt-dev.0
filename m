Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A1310E33C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jan 2023 10:54:46 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 Jan 2023 11:54:38 +0100
Message-Id: <20230123105439.11804-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] lib/i915/intel_memory_region: Add
 gem_has_smallbar
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add gem_has_smallbar() to detect a device with smallbar.

v2: fix the doc.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 lib/i915/intel_memory_region.c | 32 ++++++++++++++++++++++++++++++++
 lib/i915/intel_memory_region.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 84e1bceb3..a1829e799 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -183,6 +183,38 @@ bool gem_has_lmem(int fd)
 	return gem_get_lmem_region_count(fd) > 0;
 }
 
+/**
+ * gem_has_smallbar:
+ * @fd: open i915 drm file descriptor
+ *
+ * Helper function to check if the device comes with small-bar.
+ *
+ * Returns: True if the device has small-bar.
+ */
+bool gem_has_smallbar(int fd)
+{
+	struct drm_i915_query_memory_regions *info;
+	struct drm_i915_memory_region_info *rf;
+	bool ret = false;
+
+	info = gem_get_query_memory_regions(fd);
+	igt_assert(info);
+
+	for (int i = 0; i < info->num_regions; i++) {
+		rf = &info->regions[i];
+		if (rf->region.memory_class == I915_MEMORY_CLASS_DEVICE) {
+			if (rf->probed_size > rf->probed_cpu_visible_size) {
+				ret = true;
+				break;
+			}
+		}
+	}
+	free(info);
+
+	return ret;
+}
+
+
 /* A version of gem_create_in_memory_region_list which can be allowed to
    fail so that the object creation can be retried */
 int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index 425bda0ec..9e24bd8fb 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -62,6 +62,7 @@ struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd);
 unsigned int gem_get_lmem_region_count(int fd);
 
 bool gem_has_lmem(int fd);
+bool gem_has_smallbar(int fd);
 
 int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
 				       const struct drm_i915_gem_memory_class_instance *mem_regions,
-- 
2.39.0
