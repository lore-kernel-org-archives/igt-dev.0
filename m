Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E891410EA12
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:57 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:20 +0000
Message-Id: <20231103144359.7-26-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 25/64] drm-uapi/xe: Align with
 drm_xe_query_engine_info
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Align with kernel commit ("drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 12 ++++++++++++
 lib/xe/xe_query.c         | 14 +++++++-------
 lib/xe/xe_query.h         |  4 ++--
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 9cd1f623a..35dfd82a4 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -161,6 +161,18 @@ struct drm_xe_engine_class_instance {
 	__u16 pad;
 };
 
+/**
+ * struct drm_xe_query_engine_info - describe hardware engine
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
+ * struct drm_xe_query_engine_info in .data.
+ */
+struct drm_xe_query_engine_info {
+	struct drm_xe_engine_class_instance instance;
+	__u64 rsvd[3];
+};
+
 /**
  * enum drm_xe_memory_class - Supported memory classes.
  */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 377482a33..4c1715b18 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -70,10 +70,10 @@ static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
 	return regions;
 }
 
-static struct drm_xe_engine_class_instance *
-xe_query_engines_new(int fd, unsigned int *num_engines)
+static struct drm_xe_query_engine_info *
+xe_query_engines(int fd, unsigned int *num_engines)
 {
-	struct drm_xe_engine_class_instance *engines;
+	struct drm_xe_query_engine_info *engines;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
 		.query = DRM_XE_DEVICE_QUERY_ENGINES,
@@ -251,7 +251,7 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
-	xe_dev->engines = xe_query_engines_new(fd, &xe_dev->number_engines);
+	xe_dev->engines = xe_query_engines(fd, &xe_dev->number_engines);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
 	xe_dev->vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->vram_size));
 	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
@@ -415,7 +415,7 @@ uint64_t vram_if_possible(int fd, int gt)
  *
  * Returns engines array of xe device @fd.
  */
-xe_dev_FN(xe_engines, engines, struct drm_xe_engine_class_instance *);
+xe_dev_FN(xe_engines, engines, struct drm_xe_query_engine_info *);
 
 /**
  * xe_engine:
@@ -432,7 +432,7 @@ struct drm_xe_engine_class_instance *xe_engine(int fd, int idx)
 	igt_assert(xe_dev);
 	igt_assert(idx >= 0 && idx < xe_dev->number_engines);
 
-	return &xe_dev->engines[idx];
+	return &xe_dev->engines[idx].instance;
 }
 
 /**
@@ -642,7 +642,7 @@ bool xe_has_engine_class(int fd, uint16_t engine_class)
 	igt_assert(xe_dev);
 
 	for (int i = 0; i < xe_dev->number_engines; i++)
-		if (xe_dev->engines[i].engine_class == engine_class)
+		if (xe_dev->engines[i].instance.engine_class == engine_class)
 			return true;
 
 	return false;
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index bf9f2b955..149606c37 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -33,7 +33,7 @@ struct xe_device {
 	uint64_t memory_regions;
 
 	/** @engines: array of hardware engines */
-	struct drm_xe_engine_class_instance *engines;
+	struct drm_xe_query_engine_info *engines;
 
 	/** @number_engines: length of hardware engines array */
 	unsigned int number_engines;
@@ -81,7 +81,7 @@ uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 uint64_t vram_memory(int fd, int gt);
 uint64_t vram_if_possible(int fd, int gt);
-struct drm_xe_engine_class_instance *xe_engines(int fd);
+struct drm_xe_query_engine_info *xe_engines(int fd);
 struct drm_xe_engine_class_instance *xe_engine(int fd, int idx);
 struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
 const char *xe_region_name(uint64_t region);
-- 
2.34.1
