Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D511C10E76F
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 18:46:03 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:45:27 +0000
Message-Id: <20231130184536.7-13-francois.dugast@intel.com>
In-Reply-To: <20231130184536.7-1-francois.dugast@intel.com>
References: <20231130184536.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 12/21] drm-uapi/xe: Align on a common way to
 return arrays (engines)
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

Align with commit ("drm/xe/uapi: Align on a common way to return
arrays (engines)")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h         | 78 +++++++++++++++++++------------
 lib/xe/xe_query.c                 | 24 ++++------
 lib/xe/xe_query.h                 | 11 ++---
 tests/intel/xe_create.c           |  2 +-
 tests/intel/xe_drm_fdinfo.c       |  2 +-
 tests/intel/xe_exec_store.c       |  2 +-
 tests/intel/xe_noexec_ping_pong.c |  2 +-
 tests/intel/xe_waitfence.c        |  2 +-
 8 files changed, 66 insertions(+), 57 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index d37266072..55b3edc93 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -127,9 +127,9 @@ struct xe_user_extension {
 /**
  * struct drm_xe_engine_class_instance - instance of an engine class
  *
- * It is returned as part of the @drm_xe_query_engine_info, but it also is
- * used as the input of engine selection for both @drm_xe_exec_queue_create
- * and @drm_xe_query_engine_cycles
+ * It is returned as part of the @drm_xe_engine, but it also is used as
+ * the input of engine selection for both @drm_xe_exec_queue_create and
+ * @drm_xe_query_engine_cycles
  *
  */
 struct drm_xe_engine_class_instance {
@@ -153,13 +153,9 @@ struct drm_xe_engine_class_instance {
 };
 
 /**
- * struct drm_xe_query_engine_info - describe hardware engine
- *
- * If a query is made with a struct @drm_xe_device_query where .query
- * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
- * struct @drm_xe_query_engine_info in .data.
+ * struct drm_xe_engine - describe hardware engine
  */
-struct drm_xe_query_engine_info {
+struct drm_xe_engine {
 	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
 
@@ -167,6 +163,22 @@ struct drm_xe_query_engine_info {
 	__u64 reserved[3];
 };
 
+/**
+ * struct drm_xe_query_engines - describe engines
+ *
+ * If a query is made with a struct @drm_xe_device_query where .query
+ * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
+ * struct @drm_xe_query_engines in .data.
+ */
+struct drm_xe_query_engines {
+	/** @num_engines: number of engines returned in @engines */
+	__u32 num_engines;
+	/** @pad: MBZ */
+	__u32 pad;
+	/** @engines: The returned engines for this device */
+	struct drm_xe_engine engines[];
+};
+
 /**
  * enum drm_xe_memory_class - Supported memory classes.
  */
@@ -466,28 +478,32 @@ struct drm_xe_query_topology_mask {
  *
  * .. code-block:: C
  *
- *	struct drm_xe_engine_class_instance *hwe;
- *	struct drm_xe_device_query query = {
- *		.extensions = 0,
- *		.query = DRM_XE_DEVICE_QUERY_ENGINES,
- *		.size = 0,
- *		.data = 0,
- *	};
- *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
- *	hwe = malloc(query.size);
- *	query.data = (uintptr_t)hwe;
- *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
- *	int num_engines = query.size / sizeof(*hwe);
- *	for (int i = 0; i < num_engines; i++) {
- *		printf("Engine %d: %s\n", i,
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COPY ? "COPY":
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
- *			"UNKNOWN");
- *	}
- *	free(hwe);
+ *     struct drm_xe_query_engines *engines;
+ *     struct drm_xe_device_query query = {
+ *         .extensions = 0,
+ *         .query = DRM_XE_DEVICE_QUERY_ENGINES,
+ *         .size = 0,
+ *         .data = 0,
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+ *     engines = malloc(query.size);
+ *     query.data = (uintptr_t)engines;
+ *     ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+ *     for (int i = 0; i < engines->num_engines; i++) {
+ *         printf("Engine %d: %s\n", i,
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_COPY ? "COPY":
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
+ *             "UNKNOWN");
+ *     }
+ *     free(engines);
  */
 struct drm_xe_device_query {
 	/** @extensions: Pointer to the first extension struct, if any */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index d00051bd9..fa2b49079 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -72,10 +72,9 @@ static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
 	return regions;
 }
 
-static struct drm_xe_query_engine_info *
-xe_query_engines(int fd, unsigned int *num_engines)
+static struct drm_xe_query_engines *xe_query_engines(int fd)
 {
-	struct drm_xe_query_engine_info *engines;
+	struct drm_xe_query_engines *engines;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
 		.query = DRM_XE_DEVICE_QUERY_ENGINES,
@@ -83,7 +82,6 @@ xe_query_engines(int fd, unsigned int *num_engines)
 		.data = 0,
 	};
 
-	igt_assert(num_engines);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
 	engines = malloc(query.size);
@@ -92,8 +90,6 @@ xe_query_engines(int fd, unsigned int *num_engines)
 	query.data = to_user_pointer(engines);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	*num_engines = query.size / sizeof(*engines);
-
 	return engines;
 }
 
@@ -253,7 +249,7 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
-	xe_dev->engines = xe_query_engines(fd, &xe_dev->number_engines);
+	xe_dev->engines = xe_query_engines(fd);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
 	xe_dev->vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->vram_size));
 	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
@@ -427,7 +423,7 @@ uint64_t vram_if_possible(int fd, int gt)
  *
  * Returns engines array of xe device @fd.
  */
-xe_dev_FN(xe_engines, engines, struct drm_xe_query_engine_info *);
+xe_dev_FN(xe_engines, engines->engines, struct drm_xe_engine *);
 
 /**
  * xe_engine:
@@ -436,15 +432,15 @@ xe_dev_FN(xe_engines, engines, struct drm_xe_query_engine_info *);
  *
  * Returns engine info of xe device @fd and @idx.
  */
-struct drm_xe_query_engine_info *xe_engine(int fd, int idx)
+struct drm_xe_engine *xe_engine(int fd, int idx)
 {
 	struct xe_device *xe_dev;
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
-	igt_assert(idx >= 0 && idx < xe_dev->number_engines);
+	igt_assert(idx >= 0 && idx < xe_dev->engines->num_engines);
 
-	return &xe_dev->engines[idx];
+	return &xe_dev->engines->engines[idx];
 }
 
 /**
@@ -534,7 +530,7 @@ xe_dev_FN(xe_config, config, struct drm_xe_query_config *);
  *
  * Returns number of hw engines of xe device @fd.
  */
-xe_dev_FN(xe_number_engines, number_engines, unsigned int);
+xe_dev_FN(xe_number_engines, engines->num_engines, unsigned int);
 
 /**
  * xe_has_vram:
@@ -657,8 +653,8 @@ bool xe_has_engine_class(int fd, uint16_t engine_class)
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	for (int i = 0; i < xe_dev->number_engines; i++)
-		if (xe_dev->engines[i].instance.engine_class == engine_class)
+	for (int i = 0; i < xe_dev->engines->num_engines; i++)
+		if (xe_dev->engines->engines[i].instance.engine_class == engine_class)
 			return true;
 
 	return false;
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 5862ecba6..883cabb7d 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -32,11 +32,8 @@ struct xe_device {
 	/** @gt_list: bitmask of all memory regions */
 	uint64_t memory_regions;
 
-	/** @engines: array of hardware engines */
-	struct drm_xe_query_engine_info *engines;
-
-	/** @number_engines: length of hardware engines array */
-	unsigned int number_engines;
+	/** @engines: hardware engines */
+	struct drm_xe_query_engines *engines;
 
 	/** @mem_regions: regions memory information and usage */
 	struct drm_xe_query_mem_regions *mem_regions;
@@ -81,8 +78,8 @@ uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 uint64_t vram_memory(int fd, int gt);
 uint64_t vram_if_possible(int fd, int gt);
-struct drm_xe_query_engine_info *xe_engines(int fd);
-struct drm_xe_query_engine_info *xe_engine(int fd, int idx);
+struct drm_xe_engine *xe_engines(int fd);
+struct drm_xe_engine *xe_engine(int fd, int idx);
 struct drm_xe_mem_region *xe_mem_region(int fd, uint64_t region);
 const char *xe_region_name(uint64_t region);
 uint16_t xe_region_class(int fd, uint64_t region);
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 773f1446b..bbdddc7c9 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -149,7 +149,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
 	igt_nsec_elapsed(&tv);
 
 	igt_fork(n, nproc) {
-		struct drm_xe_query_engine_info *engine;
+		struct drm_xe_engine *engine;
 		uint32_t exec_queue, exec_queues[exec_queues_per_process];
 		int idx, err, i;
 
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index fc39649ea..ec457b1c1 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -40,7 +40,7 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption using fdinfo
 #define BO_SIZE (65536)
 
 /* Subtests */
-static void test_active(int fd, struct drm_xe_query_engine_info *engine)
+static void test_active(int fd, struct drm_xe_engine *engine)
 {
 	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(fd), region;
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 48e843af5..2927214e3 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -63,7 +63,7 @@ static void store(int fd)
 		.syncs = to_user_pointer(&sync),
 	};
 	struct data *data;
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	uint32_t vm;
 	uint32_t exec_queue;
 	uint32_t syncobj;
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 585af413d..9659272b5 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -43,7 +43,7 @@
   *	there is worked queued on one of the VM's compute exec_queues.
  */
 
-static void test_ping_pong(int fd, struct drm_xe_query_engine_info *engine)
+static void test_ping_pong(int fd, struct drm_xe_engine *engine)
 {
 	size_t vram_size = xe_vram_size(fd, 0);
 	size_t align = xe_get_default_alignment(fd);
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index bab2bed42..a902ad408 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -81,7 +81,7 @@ enum waittype {
 static void
 waitfence(int fd, enum waittype wt)
 {
-	struct drm_xe_query_engine_info *engine = NULL;
+	struct drm_xe_engine *engine = NULL;
 	struct timespec ts;
 	int64_t current, signalled;
 	uint32_t bo_1;
-- 
2.34.1
