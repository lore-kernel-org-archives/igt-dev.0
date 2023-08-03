Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4467010E002
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 11:42:47 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Aug 2023 13:42:32 +0200
Message-Id: <20230803114232.15120-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] lib/xe_query: add helper getting
 available VRAM
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: mauro.chehab@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Helper allows to read available VRAM of a specified device and GT.

v2:
- Query for current memory usage instead of using cached one (Zbigniew)

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/xe/xe_query.c | 30 ++++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 8963c7b06..ef515b088 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -630,6 +630,36 @@ uint64_t xe_visible_vram_size(int fd, int gt)
 
 	return visible_size;
 }
+/**
+ * xe_vram_available:
+ * @fd: xe device fd
+ * @gt: gt
+ *
+ * Returns available vram of xe device @fd and @gt.
+ */
+uint64_t xe_vram_available(int fd, int gt)
+{
+	struct xe_device *xe_dev;
+	int region_idx;
+	struct drm_xe_query_mem_region *mem_region;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	region_idx = ffs(native_region_for_gt(xe_dev->gts, gt)) - 1;
+	mem_region = &xe_dev->mem_usage->regions[region_idx];
+
+	if (XE_IS_CLASS_VRAM(mem_region)) {
+		pthread_mutex_lock(&cache.cache_mutex);
+		free(xe_dev->mem_usage);
+		xe_dev->mem_usage = xe_query_mem_usage_new(fd);
+		pthread_mutex_unlock(&cache.cache_mutex);
+
+		return mem_region->total_size - mem_region->used;
+	}
+
+	return 0;
+}
 
 /**
  * xe_get_default_alignment:
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 1b74c58ab..20dbfa12c 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -97,6 +97,7 @@ unsigned int xe_number_hw_engines(int fd);
 bool xe_has_vram(int fd);
 uint64_t xe_vram_size(int fd, int gt);
 uint64_t xe_visible_vram_size(int fd, int gt);
+uint64_t xe_vram_available(int fd, int gt);
 uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
-- 
2.40.0
