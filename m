Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369DD6EC7E
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:53:09 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id g16so245159pfq.5
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:53:09 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:52:49 -0500
Message-Id: <20210423215252.877174-8-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 86/89] lib/i915: Rework engine API
 availability checks (v2)
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

Instead of relying on the context param, check for the device query or
attempt to set engines as a create param.

v2 (Jason Ekstrand):
 - Add a common gem_has_context_engines helper

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 lib/i915/gem_context.c         | 30 +++++++++++++++++++++++++++++
 lib/i915/gem_context.h         |  1 +
 lib/i915/gem_engine_topology.c | 35 ++--------------------------------
 lib/i915/gem_engine_topology.h |  2 --
 tests/i915/gem_ctx_engines.c   | 11 +----------
 tests/i915/gem_exec_balancer.c | 11 +----------
 tests/i915/gem_exec_schedule.c | 11 +----------
 7 files changed, 36 insertions(+), 65 deletions(-)

diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
index 7029f4f0..b0f5dade 100644
--- a/lib/i915/gem_context.c
+++ b/lib/i915/gem_context.c
@@ -78,6 +78,36 @@ bool gem_has_contexts(int fd)
 	return ctx_id;
 }
 
+/**
+ * gem_has_context_engines:
+ * @fd: open i915 drm file descriptor
+ *
+ * Queries whether specifying an engine set at context creation is
+ * supported or not.
+ *
+ * Returns: Context creation engine API availability.
+ */
+bool gem_has_context_engines(int fd)
+{
+	struct drm_i915_gem_context_create_ext_setparam e = {
+		.base = {
+			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
+		},
+		.param = {
+			.param = I915_CONTEXT_PARAM_ENGINES,
+			.size = 0,
+		},
+	};
+	uint32_t ctx_id;
+	int err;
+
+	err = __gem_context_create_ext(fd, 0, to_user_pointer(&e), &ctx_id);
+	if (!err)
+		gem_context_destroy(fd, ctx_id);
+
+	return !err;
+}
+
 /**
  * gem_require_contexts:
  * @fd: open i915 drm file descriptor
diff --git a/lib/i915/gem_context.h b/lib/i915/gem_context.h
index f49594cb..66516247 100644
--- a/lib/i915/gem_context.h
+++ b/lib/i915/gem_context.h
@@ -43,6 +43,7 @@ bool gem_contexts_has_shared_gtt(int i915);
 bool gem_has_queues(int i915);
 
 bool gem_has_contexts(int fd);
+bool gem_has_context_engines(int fd);
 void gem_require_contexts(int fd);
 void gem_context_require_bannable(int fd);
 void gem_context_require_param(int fd, uint64_t param);
diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 612519ec..90c4f799 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -86,20 +86,9 @@
  * Limit what we support for simplicity due limitation in how much we
  * can address via execbuf2.
  */
-#define SIZEOF_CTX_PARAM	offsetof(struct i915_context_param_engines, \
-					 engines[GEM_MAX_ENGINES])
 #define SIZEOF_QUERY		offsetof(struct drm_i915_query_engine_info, \
 					 engines[GEM_MAX_ENGINES])
 
-#define DEFINE_CONTEXT_ENGINES_PARAM(e__, p__, c__, N__) \
-		I915_DEFINE_CONTEXT_PARAM_ENGINES(e__, N__); \
-		struct drm_i915_gem_context_param p__ = { \
-			.param = I915_CONTEXT_PARAM_ENGINES, \
-			.ctx_id = c__, \
-			.size = SIZEOF_CTX_PARAM, \
-			.value = to_user_pointer(memset(&e__, 0, sizeof(e__))), \
-		}
-
 static int __gem_query(int fd, struct drm_i915_query *q)
 {
 	int err = 0;
@@ -326,11 +315,8 @@ intel_engine_list_for_ctx_cfg(int fd, const intel_ctx_cfg_t *cfg)
  */
 bool gem_has_engine_topology(int fd)
 {
-	struct drm_i915_gem_context_param param = {
-		.param = I915_CONTEXT_PARAM_ENGINES,
-	};
-
-	return !__gem_context_get_param(fd, &param);
+	struct intel_engine_data ed;
+	return !__query_engine_list(fd, &ed);
 }
 
 struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags)
@@ -359,23 +345,6 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags)
 	return e2__;
 }
 
-bool gem_context_has_engine_map(int fd, uint32_t ctx)
-{
-	struct drm_i915_gem_context_param param = {
-		.param = I915_CONTEXT_PARAM_ENGINES,
-		.ctx_id = ctx
-	};
-
-	/*
-	 * If the kernel is too old to support PARAM_ENGINES,
-	 * then naturally the context has no engine map.
-	 */
-	if (__gem_context_get_param(fd, &param))
-		return false;
-
-	return param.size;
-}
-
 bool gem_engine_is_equal(const struct intel_execution_engine2 *e1,
 			 const struct intel_execution_engine2 *e2)
 {
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 991d0ff8..4cfab560 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -61,8 +61,6 @@ intel_get_current_physical_engine(struct intel_engine_data *ed);
 
 void intel_next_engine(struct intel_engine_data *ed);
 
-bool gem_context_has_engine_map(int fd, uint32_t ctx);
-
 bool gem_engine_is_equal(const struct intel_execution_engine2 *e1,
 			 const struct intel_execution_engine2 *e2);
 
diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index 0f4b903f..e8d88aa4 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -45,15 +45,6 @@
 #define engine_class(e, n) ((e)->engines[(n)].engine_class)
 #define engine_instance(e, n) ((e)->engines[(n)].engine_instance)
 
-static bool has_context_engines(int i915)
-{
-	struct drm_i915_gem_context_param param = {
-		.ctx_id = 0,
-		.param = I915_CONTEXT_PARAM_ENGINES,
-	};
-	return __gem_context_set_param(i915, &param) == 0;
-}
-
 static void invalid_engines(int i915)
 {
 	struct i915_context_param_engines stack = {}, *engines;
@@ -560,7 +551,7 @@ igt_main
 		igt_require_gem(i915);
 
 		gem_require_contexts(i915);
-		igt_require(has_context_engines(i915));
+		igt_require(gem_has_context_engines(i915));
 
 		igt_fork_hang_detector(i915);
 	}
diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index c15c4313..4f1fa390 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -2778,15 +2778,6 @@ static bool has_persistence(int i915)
 	return __gem_context_set_param(i915, &p) == 0;
 }
 
-static bool has_context_engines(int i915)
-{
-	struct drm_i915_gem_context_param p = {
-		.param = I915_CONTEXT_PARAM_ENGINES,
-	};
-
-	return __gem_context_set_param(i915, &p) == 0;
-}
-
 static bool has_load_balancer(int i915)
 {
 	const intel_ctx_cfg_t cfg = {
@@ -2811,7 +2802,7 @@ igt_main
 		igt_require_gem(i915);
 
 		gem_require_contexts(i915);
-		igt_require(has_context_engines(i915));
+		igt_require(gem_has_context_engines(i915));
 		igt_require(has_load_balancer(i915));
 		igt_require(has_perf_engines(i915));
 
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index fdb719fb..929e6e24 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -1664,15 +1664,6 @@ static void preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
 	}
 }
 
-static bool has_context_engines(int i915)
-{
-	struct drm_i915_gem_context_param param = {
-		.ctx_id = 0,
-		.param = I915_CONTEXT_PARAM_ENGINES,
-	};
-	return __gem_context_set_param(i915, &param) == 0;
-}
-
 static void preempt_engines(int i915,
 			    const struct intel_execution_engine2 *e,
 			    unsigned int flags)
@@ -1693,7 +1684,7 @@ static void preempt_engines(int i915,
 	 * timeline that we can reprioritise and shuffle amongst themselves.
 	 */
 
-	igt_require(has_context_engines(i915));
+	igt_require(gem_has_context_engines(i915));
 
 	for (int n = 0; n < GEM_MAX_ENGINES; n++) {
 		cfg.engines[n].engine_class = e->class;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
