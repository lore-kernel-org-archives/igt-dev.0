Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB0010E6A8
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 18:21:08 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Sep 2023 17:45:24 +0000
Message-ID: <20230928174535.2074462-10-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
References: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/17] benchmarks/gem_wsim: use lib code to
 query engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Use code in lib/i915/gem_engine_topology to query engines.

v2:
- keep i unsigned, restore igt_assert(count)
  in num_engines_in_class (Tvrtko)

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 153 +++++-------------------------------------
 1 file changed, 17 insertions(+), 136 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 10ad6cf75..8cd68058d 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -456,146 +456,27 @@ static int str_to_engine(const char *str)
 	return -1;
 }
 
-static bool __engines_queried;
-static unsigned int __num_engines;
-static struct i915_engine_class_instance *__engines;
-
-static int
-__i915_query(int i915, struct drm_i915_query *q)
-{
-	if (igt_ioctl(i915, DRM_IOCTL_I915_QUERY, q))
-		return -errno;
-	return 0;
-}
-
-static int
-__i915_query_items(int i915, struct drm_i915_query_item *items, uint32_t n_items)
-{
-	struct drm_i915_query q = {
-		.num_items = n_items,
-		.items_ptr = to_user_pointer(items),
-	};
-	return __i915_query(i915, &q);
-}
-
-static void
-i915_query_items(int i915, struct drm_i915_query_item *items, uint32_t n_items)
-{
-	igt_assert_eq(__i915_query_items(i915, items, n_items), 0);
-}
-
-static bool has_engine_query(int i915)
-{
-	struct drm_i915_query_item item = {
-		.query_id = DRM_I915_QUERY_ENGINE_INFO,
-	};
-
-	return __i915_query_items(i915, &item, 1) == 0 && item.length > 0;
-}
-
-static void query_engines(void)
+static struct intel_engine_data *query_engines(void)
 {
-	struct i915_engine_class_instance *engines;
-	unsigned int num;
-
-	if (__engines_queried)
-		return;
-
-	__engines_queried = true;
-
-	if (!has_engine_query(fd)) {
-		unsigned int num_bsd = gem_has_bsd(fd) + gem_has_bsd2(fd);
-		unsigned int i = 0;
-
-		igt_assert(num_bsd);
-
-		num = 1 + num_bsd;
+	static struct intel_engine_data engines = {};
 
-		if (gem_has_blt(fd))
-			num++;
+	if (engines.nengines)
+		return &engines;
 
-		if (gem_has_vebox(fd))
-			num++;
-
-		engines = calloc(num,
-				 sizeof(struct i915_engine_class_instance));
-		igt_assert(engines);
-
-		engines[i].engine_class = I915_ENGINE_CLASS_RENDER;
-		engines[i].engine_instance = 0;
-		i++;
-
-		if (gem_has_blt(fd)) {
-			engines[i].engine_class = I915_ENGINE_CLASS_COPY;
-			engines[i].engine_instance = 0;
-			i++;
-		}
-
-		if (gem_has_bsd(fd)) {
-			engines[i].engine_class = I915_ENGINE_CLASS_VIDEO;
-			engines[i].engine_instance = 0;
-			i++;
-		}
-
-		if (gem_has_bsd2(fd)) {
-			engines[i].engine_class = I915_ENGINE_CLASS_VIDEO;
-			engines[i].engine_instance = 1;
-			i++;
-		}
-
-		if (gem_has_vebox(fd)) {
-			engines[i].engine_class =
-				I915_ENGINE_CLASS_VIDEO_ENHANCE;
-			engines[i].engine_instance = 0;
-			i++;
-		}
-	} else {
-		struct drm_i915_query_engine_info *engine_info;
-		struct drm_i915_query_item item = {
-			.query_id = DRM_I915_QUERY_ENGINE_INFO,
-		};
-		const unsigned int sz = 4096;
-		unsigned int i;
-
-		engine_info = malloc(sz);
-		igt_assert(engine_info);
-		memset(engine_info, 0, sz);
-
-		item.data_ptr = to_user_pointer(engine_info);
-		item.length = sz;
-
-		i915_query_items(fd, &item, 1);
-		igt_assert(item.length > 0);
-		igt_assert(item.length <= sz);
-
-		num = engine_info->num_engines;
-
-		engines = calloc(num,
-				 sizeof(struct i915_engine_class_instance));
-		igt_assert(engines);
-
-		for (i = 0; i < num; i++) {
-			struct drm_i915_engine_info *engine =
-				(struct drm_i915_engine_info *)&engine_info->engines[i];
-
-			engines[i] = engine->engine;
-		}
-	}
-
-	__engines = engines;
-	__num_engines = num;
+	engines = intel_engine_list_of_physical(fd);
+	igt_assert(engines.nengines);
+	return &engines;
 }
 
 static unsigned int num_engines_in_class(enum intel_engine_id class)
 {
+	const struct intel_engine_data *engines = query_engines();
 	unsigned int i, count = 0;
 
 	igt_assert(class == VCS);
 
-	query_engines();
-
-	for (i = 0; i < __num_engines; i++) {
-		if (__engines[i].engine_class == I915_ENGINE_CLASS_VIDEO)
+	for (i = 0; i < engines->nengines; i++) {
+		if (engines->engines[i].class == I915_ENGINE_CLASS_VIDEO)
 			count++;
 	}
 
@@ -607,16 +488,15 @@ static void
 fill_engines_id_class(enum intel_engine_id *list,
 		      enum intel_engine_id class)
 {
+	const struct intel_engine_data *engines = query_engines();
 	enum intel_engine_id engine = VCS1;
 	unsigned int i, j = 0;
 
 	igt_assert(class == VCS);
 	igt_assert(num_engines_in_class(VCS) <= 2);
 
-	query_engines();
-
-	for (i = 0; i < __num_engines; i++) {
-		if (__engines[i].engine_class != I915_ENGINE_CLASS_VIDEO)
+	for (i = 0; i < engines->nengines; i++) {
+		if (engines->engines[i].class != I915_ENGINE_CLASS_VIDEO)
 			continue;
 
 		list[j++] = engine++;
@@ -626,17 +506,18 @@ fill_engines_id_class(enum intel_engine_id *list,
 static unsigned int
 find_physical_instance(enum intel_engine_id class, unsigned int logical)
 {
+	const struct intel_engine_data *engines = query_engines();
 	unsigned int i, j = 0;
 
 	igt_assert(class == VCS);
 
-	for (i = 0; i < __num_engines; i++) {
-		if (__engines[i].engine_class != I915_ENGINE_CLASS_VIDEO)
+	for (i = 0; i < engines->nengines; i++) {
+		if (engines->engines[i].class != I915_ENGINE_CLASS_VIDEO)
 			continue;
 
 		/* Map logical to physical instances. */
 		if (logical == j++)
-			return __engines[i].engine_instance;
+			return engines->engines[i].instance;
 	}
 
 	igt_assert(0);
-- 
2.42.0
