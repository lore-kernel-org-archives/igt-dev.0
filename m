Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAF210E547
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 16:41:27 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 Oct 2023 16:06:49 +0000
Message-ID: <20231006160654.3220198-16-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231006160654.3220198-1-marcin.bernatowicz@linux.intel.com>
References: <20231006160654.3220198-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 15/17] benchmarks/gem_wsim: for_each_ctx
 macro
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

__for_each_ctx, for_each_ctx macros to easy traverse contexts.

v2:
- more readable macro name (Tvrtko)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 46 ++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index e33fc285d..fc2960c4b 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -231,6 +231,13 @@ struct workload {
 	unsigned int nrequest[NUM_ENGINES];
 };
 
+#define __for_each_ctx(__ctx, __wrk, __ctx_idx) \
+	for (typeof((__wrk)->nr_ctxs) __ctx_idx = 0; __ctx_idx < (__wrk)->nr_ctxs && \
+	     (__ctx = &(__wrk)->ctx_list[__ctx_idx]); ++__ctx_idx)
+
+#define for_each_ctx(__ctx, __wrk) \
+	__for_each_ctx(__ctx, __wrk, igt_unique(__ctx_idx))
+
 static unsigned int master_prng;
 
 static int verbose = 1;
@@ -1804,16 +1811,15 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 {
 	uint32_t share_vm = 0;
 	struct w_step *w;
-	int i, j;
+	struct ctx *ctx, *ctx2;
+	unsigned int i, j;
 
 	/*
 	 * Transfer over engine map configuration from the workload step.
 	 */
-	for (j = 0; j < wrk->nr_ctxs; j++) {
-		struct ctx *ctx = &wrk->ctx_list[j];
-
+	__for_each_ctx(ctx, wrk, ctx_idx) {
 		for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
-			if (w->context != j)
+			if (w->context != ctx_idx)
 				continue;
 
 			if (w->type == ENGINE_MAP) {
@@ -1850,32 +1856,32 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 	/*
 	 * Create and configure contexts.
 	 */
-	for (i = 0; i < wrk->nr_ctxs; i++) {
+	for_each_ctx(ctx, wrk) {
 		struct drm_i915_gem_context_create_ext_setparam ext = {
 			.base.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
 			.param.param = I915_CONTEXT_PARAM_VM,
 		};
 		struct drm_i915_gem_context_create_ext args = { };
-		struct ctx *ctx = &wrk->ctx_list[i];
 		uint32_t ctx_id;
 
 		igt_assert(!ctx->id);
 
 		/* Find existing context to share ppgtt with. */
-		for (j = 0; !share_vm && j < wrk->nr_ctxs; j++) {
-			struct drm_i915_gem_context_param param = {
-				.param = I915_CONTEXT_PARAM_VM,
-				.ctx_id = wrk->ctx_list[j].id,
-			};
-
-			if (!param.ctx_id)
-				continue;
+		if (!share_vm)
+			for_each_ctx(ctx2, wrk) {
+				struct drm_i915_gem_context_param param = {
+					.param = I915_CONTEXT_PARAM_VM,
+					.ctx_id = ctx2->id,
+				};
+
+				if (!param.ctx_id)
+					continue;
 
-			gem_context_get_param(fd, &param);
-			igt_assert(param.value);
-			share_vm = param.value;
-			break;
-		}
+				gem_context_get_param(fd, &param);
+				igt_assert(param.value);
+				share_vm = param.value;
+				break;
+			}
 
 		if (share_vm) {
 			ext.param.value = share_vm;
-- 
2.42.0
