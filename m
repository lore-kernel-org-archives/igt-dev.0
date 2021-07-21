Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Brost <matthew.brost@intel.com>
Date: Wed, 21 Jul 2021 16:20:00 -0700
Message-Id: <20210721232004.31470-4-matthew.brost@intel.com>
In-Reply-To: <20210721232004.31470-1-matthew.brost@intel.com>
References: <20210721232004.31470-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/7] lib/intel_ctx: Add support for parallel
 contexts to intel_ctx library
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/intel_ctx.c | 28 +++++++++++++++++++++++++++-
 lib/intel_ctx.h |  2 ++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
index f28c15544..11ec6fca4 100644
--- a/lib/intel_ctx.c
+++ b/lib/intel_ctx.c
@@ -83,6 +83,7 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t *cfg, uint32_t *ctx_id)
 {
 	uint64_t ext_root = 0;
 	I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(balance, GEM_MAX_ENGINES);
+	I915_DEFINE_CONTEXT_ENGINES_PARALLEL_SUBMIT(parallel, GEM_MAX_ENGINES);
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, GEM_MAX_ENGINES);
 	struct drm_i915_gem_context_create_ext_setparam engines_param, vm_param;
 	struct drm_i915_gem_context_create_ext_setparam persist_param;
@@ -117,7 +118,29 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t *cfg, uint32_t *ctx_id)
 		unsigned num_logical_engines;
 		memset(&engines, 0, sizeof(engines));
 
-		if (cfg->load_balance) {
+		if (cfg->parallel) {
+			memset(&parallel, 0, sizeof(parallel));
+
+			num_logical_engines = 1;
+
+			parallel.base.name =
+				I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT;
+
+			engines.engines[0].engine_class =
+				I915_ENGINE_CLASS_INVALID;
+			engines.engines[0].engine_instance =
+				I915_ENGINE_CLASS_INVALID_NONE;
+
+			parallel.num_siblings = cfg->num_engines;
+			parallel.width = cfg->width;
+			for (i = 0; i < cfg->num_engines * cfg->width; i++) {
+				igt_assert_eq(cfg->engines[0].engine_class,
+					      cfg->engines[i].engine_class);
+				parallel.engines[i] = cfg->engines[i];
+			}
+
+			engines.extensions = to_user_pointer(&parallel);
+		} else if (cfg->load_balance) {
 			memset(&balance, 0, sizeof(balance));
 
 			/* In this case, the first engine is the virtual
@@ -127,6 +150,9 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t *cfg, uint32_t *ctx_id)
 			igt_assert(cfg->num_engines + 1 <= GEM_MAX_ENGINES);
 			num_logical_engines = cfg->num_engines + 1;
 
+			balance.base.name =
+				I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE;
+
 			engines.engines[0].engine_class =
 				I915_ENGINE_CLASS_INVALID;
 			engines.engines[0].engine_instance =
diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
index 9649f6d96..89c65fcd3 100644
--- a/lib/intel_ctx.h
+++ b/lib/intel_ctx.h
@@ -46,7 +46,9 @@ typedef struct intel_ctx_cfg {
 	uint32_t vm;
 	bool nopersist;
 	bool load_balance;
+	bool parallel;
 	unsigned int num_engines;
+	unsigned int width;
 	struct i915_engine_class_instance engines[GEM_MAX_ENGINES];
 } intel_ctx_cfg_t;
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
