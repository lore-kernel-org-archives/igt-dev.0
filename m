Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB786EC0F
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Apr 2021 02:12:54 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id j25so359267pfe.2
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 19:12:54 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 31 Mar 2021 21:12:16 -0500
Message-Id: <20210401021243.4147604-4-jason@jlekstrand.net>
In-Reply-To: <20210401021243.4147604-1-jason@jlekstrand.net>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 03/30] lib/i915/gem_engine_topology: Add an iterator
 for intel_ctx_t
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
 lib/i915/gem_engine_topology.c | 41 ++++++++++++++++++++++++++++++++++
 lib/i915/gem_engine_topology.h | 14 ++++++++++--
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 5d196f59..528053a0 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -194,6 +194,47 @@ intel_get_current_physical_engine(struct intel_engine_data *ed)
 	return e;
 }
 
+struct intel_engine_data
+intel_engine_list_for_ctx_cfg(int fd, const intel_ctx_cfg_t *cfg)
+{
+	struct intel_engine_data engine_data = { };
+	int i;
+
+	if (cfg->num_engines) {
+		engine_data.nengines = cfg->num_engines;
+		for (i = 0; i < cfg->num_engines; i++)
+			init_engine(&engine_data.engines[i],
+				    cfg->engines[i].engine_class,
+				    cfg->engines[i].engine_instance,
+				    i);
+	} else {
+		/* This is a legacy context */
+		const struct intel_execution_engine2 *e2;
+
+		igt_debug("using pre-allocated engine list\n");
+
+		__for_each_static_engine(e2) {
+			if (igt_only_list_subtests() ||
+			    (fd < 0) ||
+			    gem_has_ring(fd, e2->flags)) {
+				struct intel_execution_engine2 *__e2 =
+					&engine_data.engines[
+					engine_data.nengines];
+
+				strcpy(__e2->name, e2->name);
+				__e2->instance   = e2->instance;
+				__e2->class      = e2->class;
+				__e2->flags      = e2->flags;
+				__e2->is_virtual = false;
+
+				engine_data.nengines++;
+                        }
+		}
+	}
+
+	return engine_data;
+}
+
 static int gem_topology_get_param(int fd,
 				  struct drm_i915_gem_context_param *p)
 {
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 76b7cd4d..38027608 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -26,8 +26,7 @@
 
 #include "igt_gt.h"
 #include "i915_drm.h"
-
-#define GEM_MAX_ENGINES		I915_EXEC_RING_MASK + 1
+#include "intel_ctx.h"
 
 int __gem_query_engines(int fd,
 			struct drm_i915_query_engine_info *query_engines,
@@ -41,6 +40,8 @@ struct intel_engine_data {
 };
 
 bool gem_has_engine_topology(int fd);
+struct intel_engine_data
+intel_engine_list_for_ctx_cfg(int fd, const intel_ctx_cfg_t *cfg);
 struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id);
 
 /* iteration functions */
@@ -65,6 +66,15 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
 #define __for_each_static_engine(e__) \
 	for ((e__) = intel_execution_engines2; (e__)->name[0]; (e__)++)
 
+#define for_each_ctx_cfg_engine(fd__, ctx_cfg__, e__) \
+	for (struct intel_engine_data i__##e__ = \
+			intel_engine_list_for_ctx_cfg(fd__, ctx_cfg__); \
+	     ((e__) = intel_get_current_engine(&i__##e__)); \
+	     intel_next_engine(&i__##e__))
+
+#define for_each_ctx_engine(fd__, ctx__, e__) \
+	for_each_ctx_cfg_engine(fd__, &(ctx__)->cfg, e__)
+
 #define for_each_context_engine(fd__, ctx__, e__) \
 	for (struct intel_engine_data i__ = intel_init_engine_list(fd__, ctx__); \
 	     ((e__) = intel_get_current_engine(&i__)); \
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
