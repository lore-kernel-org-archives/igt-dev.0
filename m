Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39C410EC59
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 06:22:35 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 08:22:09 +0200
Message-Id: <20230428062224.21322-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230428062224.21322-1-zbigniew.kempczynski@intel.com>
References: <20230428062224.21322-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 02/17] lib/xe_query: Add region helpers
 and missing doc
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

For easier iterate over memory regions and produce dynamic subtests
add xe_region_name() helper.

As Xe requires buffer size alignment during creating bo add
xe_min_page_size() helper.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_query.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  2 ++
 2 files changed, 47 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 2b627a78ac..bd5eb1d189 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -422,6 +422,13 @@ struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx)
 	return &xe_dev->hw_engines[idx];
 }
 
+/**
+ * xe_mem_region:
+ * @fd: xe device fd
+ * @region: region mask
+ *
+ * Returns memory region structure for @region mask.
+ */
 struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region)
 {
 	struct xe_device *xe_dev;
@@ -434,6 +441,44 @@ struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region)
 	return &xe_dev->mem_usage->regions[region_idx];
 }
 
+/**
+ * xe_region_name:
+ * @region: region mask
+ *
+ * Returns region string like "system" or "vram-n" where n=0...62.
+ */
+const char *xe_region_name(uint64_t region)
+{
+	static char **vrams;
+	int region_idx = ffs(region) - 1;
+
+	/* Populate the array */
+	if (!vrams) {
+		vrams = calloc(64, sizeof(char *));
+		for (int i = 0; i < 64; i++) {
+			if (i != 0)
+				asprintf(&vrams[i], "vram-%d", i - 1);
+			else
+				asprintf(&vrams[i], "system");
+			igt_assert(vrams[i]);
+		}
+	}
+
+	return vrams[region_idx];
+}
+
+/**
+ * xe_min_page_size:
+ * @fd: xe device fd
+ * @region: region mask
+ *
+ * Returns minimum page size for @region.
+ */
+uint32_t xe_min_page_size(int fd, uint64_t region)
+{
+	return xe_mem_region(fd, region)->min_page_size;
+}
+
 /**
  * xe_number_hw_engine:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 0d4b810a10..f49acb1d7b 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -84,6 +84,8 @@ uint64_t vram_if_possible(int fd, int gt);
 struct drm_xe_engine_class_instance *xe_hw_engines(int fd);
 struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
 struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
+const char *xe_region_name(uint64_t region);
+uint32_t xe_min_page_size(int fd, uint64_t region);
 unsigned int xe_number_hw_engines(int fd);
 bool xe_has_vram(int fd);
 //uint64_t xe_vram_size(int fd);
-- 
2.34.1
