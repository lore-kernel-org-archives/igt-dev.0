Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF266EC8D
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:50:50 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 e8-20020a17090a7288b029014e51f5a6baso1905012pjg.2
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:50:50 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:48:32 -0500
Message-Id: <20210423214853.876911-69-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 68/89] lib/intel_ctx: Add load balancing
 support
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

We use the same convention as the load balancing tests and, when
balancing is requested, we make a context with N+1 engines where the
first one is the balanced engine and the others are physical engines.
---
 lib/i915/gem_engine_topology.c | 27 ++++++++++++++----
 lib/intel_ctx.c                | 50 +++++++++++++++++++++++++++++++---
 lib/intel_ctx.h                |  2 ++
 3 files changed, 69 insertions(+), 10 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index ac707cb3..1bebe848 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -311,12 +311,27 @@ intel_engine_list_for_ctx_cfg(int fd, const intel_ctx_cfg_t *cfg)
 		struct intel_engine_data engine_data = { };
 		int i;
 
-		engine_data.nengines = cfg->num_engines;
-		for (i = 0; i < cfg->num_engines; i++)
-			init_engine(&engine_data.engines[i],
-				    cfg->engines[i].engine_class,
-				    cfg->engines[i].engine_instance,
-				    i);
+		if (cfg->load_balance) {
+			engine_data.nengines = cfg->num_engines + 1;
+
+			init_engine(&engine_data.engines[0],
+				    I915_ENGINE_CLASS_INVALID,
+				    I915_ENGINE_CLASS_INVALID_NONE,
+				    0);
+
+			for (i = 0; i < cfg->num_engines; i++)
+				init_engine(&engine_data.engines[i + 1],
+					    cfg->engines[i].engine_class,
+					    cfg->engines[i].engine_instance,
+					    i + 1);
+		} else {
+			engine_data.nengines = cfg->num_engines;
+			for (i = 0; i < cfg->num_engines; i++)
+				init_engine(&engine_data.engines[i],
+					    cfg->engines[i].engine_class,
+					    cfg->engines[i].engine_instance,
+					    i);
+		}
 
 		return engine_data;
 	} else {
diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
index f6b147e0..e2c13294 100644
--- a/lib/intel_ctx.c
+++ b/lib/intel_ctx.c
@@ -100,6 +100,7 @@ static int
 __context_create_cfg(int fd, const intel_ctx_cfg_t *cfg, uint32_t *ctx_id)
 {
 	uint64_t ext_root = 0;
+	I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(balance, GEM_MAX_ENGINES);
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, GEM_MAX_ENGINES);
 	struct drm_i915_gem_context_create_ext_setparam engines_param, vm_param;
 	struct drm_i915_gem_context_create_ext_setparam persist_param;
@@ -131,9 +132,39 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t *cfg, uint32_t *ctx_id)
 	}
 
 	if (cfg->num_engines) {
+		unsigned num_logical_engines = 0;
 		memset(&engines, 0, sizeof(engines));
-		for (i = 0; i < cfg->num_engines; i++)
-			engines.engines[i] = cfg->engines[i];
+
+		if (cfg->load_balance) {
+			memset(&balance, 0, sizeof(balance));
+
+			/* In this case, the first engine is the virtual
+			 * balanced engine and the subsequent engines are
+			 * the actual requested engines.
+			 */
+			assert(cfg->num_engines + 1 <= GEM_MAX_ENGINES);
+			num_logical_engines = cfg->num_engines + 1;
+
+			engines.engines[0].engine_class =
+				I915_ENGINE_CLASS_INVALID;
+			engines.engines[0].engine_instance =
+				I915_ENGINE_CLASS_INVALID_NONE;
+
+			balance.num_siblings = cfg->num_engines;
+			for (i = 0; i < cfg->num_engines; i++) {
+				igt_assert_eq(cfg->engines[0].engine_class,
+					      cfg->engines[i].engine_class);
+				balance.engines[i] = cfg->engines[i];
+				engines.engines[i + 1] = cfg->engines[i];
+			}
+
+			engines.extensions = to_user_pointer(&balance);
+		} else {
+			assert(cfg->num_engines <= GEM_MAX_ENGINES);
+			num_logical_engines = cfg->num_engines;
+			for (i = 0; i < cfg->num_engines; i++)
+				engines.engines[i] = cfg->engines[i];
+		}
 
 		engines_param = (struct drm_i915_gem_context_create_ext_setparam) {
 			.base = {
@@ -141,11 +172,13 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t *cfg, uint32_t *ctx_id)
 			},
 			.param = {
 				.param = I915_CONTEXT_PARAM_ENGINES,
-				.size = sizeof_param_engines(cfg->num_engines),
+				.size = sizeof_param_engines(num_logical_engines),
 				.value = to_user_pointer(&engines),
 			},
 		};
 		add_user_ext(&ext_root, &engines_param.base);
+	} else {
+		igt_assert(!cfg->load_balance);
 	}
 
 	return __gem_context_create_ext(fd, cfg->flags, ext_root, ctx_id);
@@ -276,7 +309,16 @@ void intel_ctx_destroy(int fd, const intel_ctx_t *ctx)
  */
 unsigned int intel_ctx_engine_class(const intel_ctx_t *ctx, unsigned int engine)
 {
-	if (ctx->cfg.num_engines) {
+	if (ctx->cfg.load_balance) {
+		if (engine == 0) {
+			/* This is our virtual engine */
+			return ctx->cfg.engines[0].engine_class;
+		} else {
+			/* This is a physical engine */
+			igt_assert(engine - 1 < ctx->cfg.num_engines);
+			return ctx->cfg.engines[engine - 1].engine_class;
+		}
+	} else if (ctx->cfg.num_engines) {
 		igt_assert(engine < ctx->cfg.num_engines);
 		return ctx->cfg.engines[engine].engine_class;
 	} else {
diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
index 06a14302..2f2ea31b 100644
--- a/lib/intel_ctx.h
+++ b/lib/intel_ctx.h
@@ -35,6 +35,7 @@
  * @flags: Context create flags
  * @vm: VM to inherit or 0 for using a per-context VM
  * @nopersist: set I915_CONTEXT_PARAM_PERSISTENCE to 0
+ * @load_balance: True if the first engine should be a load balancing engine
  * @num_engines: Number of client-specified engines or 0 for legacy mode
  * @engines: Client-specified engines
  *
@@ -44,6 +45,7 @@ typedef struct intel_ctx_cfg {
 	uint32_t flags;
 	uint32_t vm;
 	bool nopersist;
+	bool load_balance;
 	unsigned int num_engines;
 	struct i915_engine_class_instance engines[GEM_MAX_ENGINES];
 } intel_ctx_cfg_t;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
