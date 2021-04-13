Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911BE6E2ED
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:55:42 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id u7so5679454plr.6
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:55:42 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:50 -0500
Message-Id: <20210413035350.261794-75-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 74/74] lib/i915/gem_engine_topology: Delete
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

---
 lib/i915/gem_engine_topology.c | 58 ----------------------------------
 lib/i915/gem_engine_topology.h | 15 ---------
 2 files changed, 73 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index ec891dab..38da2003 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -79,25 +79,6 @@ int __gem_query_engines(int fd,
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
@@ -158,11 +139,6 @@ static int __query_engine_list(int fd, struct intel_engine_data *ed)
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
@@ -267,40 +243,6 @@ static int gem_topology_get_param(int fd,
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
index b2e15c1e..d0fa4590 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -43,7 +43,6 @@ bool gem_has_engine_topology(int fd);
 struct intel_engine_data intel_engine_list_of_physical(int fd);
 struct intel_engine_data
 intel_engine_list_for_ctx_cfg(int fd, const intel_ctx_cfg_t *cfg);
-struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id);
 
 /* iteration functions */
 struct intel_execution_engine2 *
@@ -76,25 +75,11 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
 #define for_each_ctx_engine(fd__, ctx__, e__) \
 	for_each_ctx_cfg_engine(fd__, &(ctx__)->cfg, e__)
 
-#define for_each_context_engine(fd__, ctx__, e__) \
-	for (struct intel_engine_data i__ = intel_init_engine_list(fd__, ctx__); \
-	     ((e__) = intel_get_current_engine(&i__)); \
-	     intel_next_engine(&i__))
-
 #define for_each_physical_engine(fd__, e__) \
 	for (struct intel_engine_data i__##e__ = intel_engine_list_of_physical(fd__); \
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
