Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5A66E214
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:54:13 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id f29so10997135pgm.8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:54:13 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:52:48 -0500
Message-Id: <20210413035350.261794-13-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 12/74] lib/i915/gem_engine_topology: Add an
 iterator for intel_ctx_t
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
 lib/i915/gem_engine_topology.c | 21 +++++++++++++++++++++
 lib/i915/gem_engine_topology.h | 14 ++++++++++++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 4319895f..ec891dab 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -234,6 +234,27 @@ struct intel_engine_data intel_engine_list_of_physical(int fd)
 	return intel_engine_list_for_static(fd);
 }
 
+struct intel_engine_data
+intel_engine_list_for_ctx_cfg(int fd, const intel_ctx_cfg_t *cfg)
+{
+	if (fd >= 0 && cfg->num_engines) {
+		struct intel_engine_data engine_data = { };
+		int i;
+
+		engine_data.nengines = cfg->num_engines;
+		for (i = 0; i < cfg->num_engines; i++)
+			init_engine(&engine_data.engines[i],
+				    cfg->engines[i].engine_class,
+				    cfg->engines[i].engine_instance,
+				    i);
+
+		return engine_data;
+	} else {
+		/* This is a legacy context */
+		return intel_engine_list_for_static(fd);
+	}
+}
+
 static int gem_topology_get_param(int fd,
 				  struct drm_i915_gem_context_param *p)
 {
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 69565240..b2e15c1e 100644
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
@@ -42,6 +41,8 @@ struct intel_engine_data {
 
 bool gem_has_engine_topology(int fd);
 struct intel_engine_data intel_engine_list_of_physical(int fd);
+struct intel_engine_data
+intel_engine_list_for_ctx_cfg(int fd, const intel_ctx_cfg_t *cfg);
 struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id);
 
 /* iteration functions */
@@ -66,6 +67,15 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
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
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
