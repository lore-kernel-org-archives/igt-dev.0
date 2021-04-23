Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AD989D5B
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:53:04 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so1896928pjj.3
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:53:04 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:52:46 -0500
Message-Id: <20210423215252.877174-5-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 83/89] lib/i915/gem_engine_topology: Delete
 the old physical engine iterators
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
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 lib/i915/gem_engine_topology.c | 58 ----------------------------------
 lib/i915/gem_engine_topology.h | 15 ---------
 2 files changed, 73 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 1bebe848..1b6ac6d2 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -136,25 +136,6 @@ int __gem_query_engines(int fd,
 	return __gem_query(fd, &query);
 }
 
-static void ctx_map_engines(int fd, struct intel_engine_data *ed,
-			    struct drm_i915_gem_context_param *param)
-{
-	struct i915_context_param_engines *engines =
-			from_user_pointer(param->value);
-	int i = 0;
-
-	for (typeof(engines->engines[0]) *p = &engines->engines[0];
-	     i < ed->nengines; i++, p++) {
-		p->engine_class = ed->engines[i].class;
-		p->engine_instance = ed->engines[i].instance;
-	}
-
-	param->size = offsetof(typeof(*engines), engines[i]);
-	engines->extensions = 0;
-
-	gem_context_set_param(fd, param);
-}
-
 static const char *class_names[] = {
 	[I915_ENGINE_CLASS_RENDER]	  = "rcs",
 	[I915_ENGINE_CLASS_COPY]	  = "bcs",
@@ -215,11 +196,6 @@ static int __query_engine_list(int fd, struct intel_engine_data *ed)
 	return 0;
 }
 
-static void query_engine_list(int fd, struct intel_engine_data *ed)
-{
-	igt_assert_eq(__query_engine_list(fd, ed), 0);
-}
-
 struct intel_execution_engine2 *
 intel_get_current_engine(struct intel_engine_data *ed)
 {
@@ -352,40 +328,6 @@ static int gem_topology_get_param(int fd,
 	return 0;
 }
 
-struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id)
-{
-	DEFINE_CONTEXT_ENGINES_PARAM(engines, param, ctx_id, GEM_MAX_ENGINES);
-	struct intel_engine_data engine_data = { };
-	int i;
-
-	if (gem_topology_get_param(fd, &param)) {
-		/* if kernel does not support engine/context mapping */
-		return intel_engine_list_for_static(fd);
-	}
-
-	if (!param.size) {
-		query_engine_list(fd, &engine_data);
-		ctx_map_engines(fd, &engine_data, &param);
-	} else {
-		/* engine count can be inferred from size */
-		param.size -= sizeof(struct i915_context_param_engines);
-		param.size /= sizeof(struct i915_engine_class_instance);
-
-		igt_assert_f(param.size <= GEM_MAX_ENGINES,
-			     "unsupported engine count\n");
-
-		for (i = 0; i < param.size; i++)
-			init_engine(&engine_data.engines[i],
-				    engines.engines[i].engine_class,
-				    engines.engines[i].engine_instance,
-				    i);
-
-		engine_data.nengines = i;
-	}
-
-	return engine_data;
-}
-
 int gem_context_lookup_engine(int fd, uint64_t engine, uint32_t ctx_id,
 			      struct intel_execution_engine2 *e)
 {
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 92d9a479..8f5987f6 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -51,7 +51,6 @@ struct intel_engine_data {
 bool gem_has_engine_topology(int fd);
 struct intel_engine_data intel_engine_list_of_physical(int fd);
 struct intel_engine_data intel_engine_list_for_ctx_cfg(int fd, const intel_ctx_cfg_t *cfg);
-struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id);
 
 /* iteration functions */
 struct intel_execution_engine2 *
@@ -106,11 +105,6 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
 #define for_each_ctx_engine(fd__, ctx__, e__) \
 	for_each_ctx_cfg_engine(fd__, &(ctx__)->cfg, e__)
 
-#define for_each_context_engine(fd__, ctx__, e__) \
-	for (struct intel_engine_data i__ = intel_init_engine_list(fd__, ctx__); \
-	     ((e__) = intel_get_current_engine(&i__)); \
-	     intel_next_engine(&i__))
-
 /**
  * for_each_physical_engine
  * @fd__: open i915 drm file descriptor
@@ -126,15 +120,6 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
 	     ((e__) = intel_get_current_physical_engine(&i__##e__)); \
 	     intel_next_engine(&i__##e__))
 
-/* needs to replace "for_each_physical_engine" when conflicts are fixed */
-#define ____for_each_physical_engine(fd__, ctx__, e__) \
-	for (struct intel_engine_data i__##e__ = intel_init_engine_list(fd__, ctx__); \
-	     ((e__) = intel_get_current_physical_engine(&i__##e__)); \
-	     intel_next_engine(&i__##e__))
-
-#define __for_each_physical_engine(fd__, e__) \
-	____for_each_physical_engine(fd__, 0, e__)
-
 __attribute__((format(scanf, 4, 5)))
 int gem_engine_property_scanf(int i915, const char *engine, const char *attr,
 			      const char *fmt, ...);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
