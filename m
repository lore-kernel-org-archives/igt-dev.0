Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96D710E4BE
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 22:55:39 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 15:55:07 -0700
Message-Id: <20230323225534.3739835-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
References: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 03/30] i915/perf: Use default engine for
 sseu tests
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

Explicitly pass the default engine for the sseu tests.

v2: Pass context id in sseu tests to fix CI failure

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index f7883de6..75e698ec 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -4440,11 +4440,12 @@ make_valid_reduced_sseu_config(struct drm_i915_gem_context_param_sseu default_ss
 }
 
 static void
-test_global_sseu_config_invalid(void)
+test_global_sseu_config_invalid(const intel_ctx_t *ctx)
 {
 	struct drm_i915_gem_context_param_sseu default_sseu;
 	struct drm_i915_gem_context_param_sseu sseu_param;
 	struct drm_i915_gem_context_param ctx_gp = {
+		.ctx_id = ctx->id,
 		.param = I915_CONTEXT_PARAM_SSEU,
 		.size = sizeof(default_sseu),
 		.value = to_user_pointer(&default_sseu),
@@ -4469,6 +4470,9 @@ test_global_sseu_config_invalid(void)
 	};
 
 	memset(&default_sseu, 0, sizeof(default_sseu));
+	default_sseu.flags = I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX;
+	default_sseu.engine.engine_class = default_e2.class;
+	default_sseu.engine.engine_instance = default_e2.flags;
 	igt_require(__gem_context_get_param(drm_fd, &ctx_gp) == 0);
 
 	igt_debug("Default context sseu:\n");
@@ -4515,11 +4519,12 @@ test_global_sseu_config_invalid(void)
 }
 
 static void
-test_global_sseu_config(void)
+test_global_sseu_config(const intel_ctx_t *ctx)
 {
 	struct drm_i915_gem_context_param_sseu default_sseu;
 	struct drm_i915_gem_context_param_sseu sseu_param;
 	struct drm_i915_gem_context_param ctx_gp = {
+		.ctx_id = ctx->id,
 		.param = I915_CONTEXT_PARAM_SSEU,
 		.size = sizeof(default_sseu),
 		.value = to_user_pointer(&default_sseu),
@@ -4544,6 +4549,9 @@ test_global_sseu_config(void)
 	};
 
 	memset(&default_sseu, 0, sizeof(default_sseu));
+	default_sseu.flags = I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX;
+	default_sseu.engine.engine_class = default_e2.class;
+	default_sseu.engine.engine_instance = default_e2.flags;
 	igt_require(__gem_context_get_param(drm_fd, &ctx_gp) == 0);
 
 	igt_debug("Default context sseu:\n");
@@ -5297,11 +5305,11 @@ igt_main
 
 		igt_describe("Verify invalid SSEU opening parameters");
 		igt_subtest("global-sseu-config-invalid")
-			test_global_sseu_config_invalid();
+			test_global_sseu_config_invalid(ctx);
 
 		igt_describe("Verify specifying SSEU opening parameters");
 		igt_subtest("global-sseu-config")
-			test_global_sseu_config();
+			test_global_sseu_config(ctx);
 	}
 
 	igt_subtest("invalid-create-userspace-config")
-- 
2.36.1
