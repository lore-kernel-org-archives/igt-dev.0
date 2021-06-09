Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FF26EA17
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:40:04 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso1860030pjb.5
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:40:04 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  9 Jun 2021 12:38:56 -0500
Message-Id: <20210609173903.249112-37-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
References: <20210609173632.248880-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 86/93] lib/i915: Rework engine API
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

v3 (Jason Ekstrand):
 - Drop gem_has_context_engines and always check I915_QUERY_ENGINE_INFO

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 lib/i915/gem_context.c         |  7 ++++---
 lib/i915/gem_engine_topology.c | 35 ++--------------------------------
 lib/i915/gem_engine_topology.h |  2 --
 tests/i915/gem_ctx_engines.c   | 11 +----------
 tests/i915/gem_exec_balancer.c | 11 +----------
 tests/i915/gem_exec_schedule.c | 11 +----------
 6 files changed, 9 insertions(+), 68 deletions(-)

diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
index 7029f4f0..7cac6617 100644
--- a/lib/i915/gem_context.c
+++ b/lib/i915/gem_context.c
@@ -70,12 +70,13 @@ static int create_ext_ioctl(int i915,
 bool gem_has_contexts(int fd)
 {
 	uint32_t ctx_id = 0;
+	int err;
 
-	__gem_context_create(fd, &ctx_id);
-	if (ctx_id)
+	err = __gem_context_create(fd, &ctx_id);
+	if (!err)
 		gem_context_destroy(fd, ctx_id);
 
-	return ctx_id;
+	return !err;
 }
 
 /**
diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 7c60daf0..969a8d2e 100644
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
@@ -327,11 +316,8 @@ intel_engine_list_for_ctx_cfg(int fd, const intel_ctx_cfg_t *cfg)
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
@@ -360,23 +346,6 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags)
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
index caa97774..bd622b0e 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -46,15 +46,6 @@
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
@@ -561,7 +552,7 @@ igt_main
 		igt_require_gem(i915);
 
 		gem_require_contexts(i915);
-		igt_require(has_context_engines(i915));
+		igt_require(gem_has_engine_topology(i915));
 
 		igt_fork_hang_detector(i915);
 	}
diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 4b4cfdea..46cc53cc 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -2779,15 +2779,6 @@ static bool has_persistence(int i915)
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
@@ -2812,7 +2803,7 @@ igt_main
 		igt_require_gem(i915);
 
 		gem_require_contexts(i915);
-		igt_require(has_context_engines(i915));
+		igt_require(gem_has_engine_topology(i915));
 		igt_require(has_load_balancer(i915));
 		igt_require(has_perf_engines(i915));
 
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index d8397aea..b38b9859 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -1661,15 +1661,6 @@ static void preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
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
@@ -1690,7 +1681,7 @@ static void preempt_engines(int i915,
 	 * timeline that we can reprioritise and shuffle amongst themselves.
 	 */
 
-	igt_require(has_context_engines(i915));
+	igt_require(gem_has_engine_topology(i915));
 
 	for (int n = 0; n < GEM_MAX_ENGINES; n++) {
 		cfg.engines[n].engine_class = e->class;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
