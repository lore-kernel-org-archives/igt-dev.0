Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345BB10E2D4
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 18:11:58 +0000 (UTC)
From: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, John.C.Harrison@Intel.com,
 kamil.konieczny@linux.intel.com
Date: Thu, 28 Jul 2022 18:11:52 +0000
Message-Id: <20220728181152.7304-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/hangman: Fix gt hang/error tests
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

gt-engine-hang and gt-engine-error tests were still using reset=2
setting so that ended up just doing an engine reset. Fix the tests so
that they actually do the gt specific reset and set the expectations
correctly.

In some rare failures, some of the background spinners show up as
innocent and keep spinning after the hang recovery. This can only happen
if the spinners did not start for some reason. Check that the spinners
actually started before submitting a hanging batch.

For engine specific hang, only one context is marked guilty, but for a
gt hang all contexts are marked guilty. Check for different expected
behavior for engine vs. gt reset.

v2:
- gt-reset resets all contexts on all engines. The execlist implementation
  of gt-engine-* tests expected that a preemptible background spinner
  running on the target engine should be marked innocent. While i915 can
  mark such a context for execlist mode, GuC scheduling does not guarantee
  that the background spinner can be marked as innocent. Since the state
  of the background spinner depends on the scheduling backend, do no
  validate the state of the background spinner for the target engine.

v3:
- omit checking background spinner state only for gt-reset case

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/i915_hangman.c | 85 +++++++++++++++++++++++++--------------
 1 file changed, 54 insertions(+), 31 deletions(-)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index c7d69fdd..5b804997 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -295,9 +295,15 @@ static void context_unban(int fd, unsigned ctx)
 	gem_context_set_param(fd, &param);
 }
 
+enum reset_type {
+	GT_RESET = 1,
+	ENGINE_RESET = 2,
+};
+
 static void
 test_engine_hang(const intel_ctx_t *ctx,
-		 const struct intel_execution_engine2 *e, unsigned int flags)
+		 const struct intel_execution_engine2 *e, unsigned int flags,
+		 enum reset_type reset)
 {
 	const struct intel_execution_engine2 *other;
 	const intel_ctx_t *local_ctx[GEM_MAX_ENGINES];
@@ -309,6 +315,7 @@ test_engine_hang(const intel_ctx_t *ctx,
 	igt_skip_on(flags & IGT_SPIN_INVALID_CS &&
 		    gem_engine_has_cmdparser(device, &ctx->cfg, e->flags));
 
+	igt_assert(reset == GT_RESET || reset == ENGINE_RESET);
 	/*
 	 * Fill all engines with background load.
 	 * This verifies that independent engines are unaffected and gives
@@ -324,7 +331,10 @@ test_engine_hang(const intel_ctx_t *ctx,
 				      .ahnd = ahndN,
 				      .ctx = local_ctx[num_ctx],
 				      .engine = other->flags,
-				      .flags = IGT_SPIN_FENCE_OUT);
+				      .flags = IGT_SPIN_FENCE_OUT |
+					       IGT_SPIN_POLL_RUN);
+		igt_spin_busywait_until_started(spin);
+
 		num_ctx++;
 
 		igt_list_move(&spin->link, &list);
@@ -344,14 +354,44 @@ test_engine_hang(const intel_ctx_t *ctx,
 	igt_assert_eq(sync_fence_status(spin->out_fence), -EIO);
 	igt_spin_free(device, spin);
 
-	/* But no other engines/clients should be affected */
-	igt_list_for_each_entry_safe(spin, next, &list, link) {
+	/*
+	 * engine-engine-hang: Other engines/clients should not be affected for
+	 * engine reset, so innocent contexts complete successfully once the
+	 * spinner is ended.
+	 *
+	 * gt-engine-hang: All engines/clients are guilty and complete with a
+	 * -EIO fence status, however the background task that was submitted to
+	 * the target engine is innocent and is expected to complete
+	 * successfully.
+	 */
+	igt_list_for_each_entry_safe_reverse(spin, next, &list, link) {
+		bool innocent = reset == ENGINE_RESET;
+		int expect = innocent ? 1 : -EIO;
+
 		ahndN = spin->opts.ahnd;
-		igt_assert(sync_fence_wait(spin->out_fence, 0) == -ETIME);
-		igt_spin_end(spin);
+		if (innocent) {
+			igt_assert_eq(sync_fence_wait(spin->out_fence, 0), -ETIME);
+			igt_spin_end(spin);
+		}
 
-		igt_assert(sync_fence_wait(spin->out_fence, 500) == 0);
-		igt_assert_eq(sync_fence_status(spin->out_fence), 1);
+		if (reset == GT_RESET && spin->opts.engine == e->flags) {
+			/*
+			 * gt-reset resets everything. The execlist
+			 * implementation of gt-engine-* tests expect that a
+			 * preemptible background spinner running on the target
+			 * engine should be marked innocent. While i915 can mark
+			 * such a context innocent for execlist mode, GuC
+			 * scheduling does not guarantee that the background
+			 * spinner can be marked as innocent. Since the state of
+			 * the background spinner depends on the scheduling
+			 * backend, do no validate the state of the background
+			 * spinner for the target engine when doing a gt-reset.
+			 */
+			igt_spin_end(spin);
+		} else {
+			igt_assert_eq(sync_fence_wait(spin->out_fence, 500), 0);
+			igt_assert_eq(sync_fence_status(spin->out_fence), expect);
+		}
 		igt_spin_free(device, spin);
 		put_ahnd(ahndN);
 	}
@@ -439,6 +479,10 @@ static void do_tests(const char *name, const char *prefix,
 {
 	const struct intel_execution_engine2 *e;
 	char buff[256];
+	enum reset_type reset = ENGINE_RESET;
+
+	if (!strncmp(prefix, "gt", 2))
+		reset = GT_RESET;
 
 	snprintf(buff, sizeof(buff), "Per engine error capture (%s reset)", name);
 	igt_describe(buff);
@@ -454,20 +498,9 @@ static void do_tests(const char *name, const char *prefix,
 	igt_describe(buff);
 	snprintf(buff, sizeof(buff), "%s-engine-hang", prefix);
 	igt_subtest_with_dynamic(buff) {
-                int has_gpu_reset = 0;
-		struct drm_i915_getparam gp = {
-			.param = I915_PARAM_HAS_GPU_RESET,
-			.value = &has_gpu_reset,
-		};
-
-		igt_require(gem_scheduler_has_preemption(device));
-		igt_params_set(device, "reset", "%u", -1);
-                ioctl(device, DRM_IOCTL_I915_GETPARAM, &gp);
-		igt_require(has_gpu_reset > 1);
-
 		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				test_engine_hang(ctx, e, 0);
+				test_engine_hang(ctx, e, 0, reset);
 		}
 	}
 
@@ -475,19 +508,9 @@ static void do_tests(const char *name, const char *prefix,
 	igt_describe(buff);
 	snprintf(buff, sizeof(buff), "%s-engine-error", prefix);
 	igt_subtest_with_dynamic(buff) {
-		int has_gpu_reset = 0;
-		struct drm_i915_getparam gp = {
-			.param = I915_PARAM_HAS_GPU_RESET,
-			.value = &has_gpu_reset,
-		};
-
-		igt_params_set(device, "reset", "%u", -1);
-		ioctl(device, DRM_IOCTL_I915_GETPARAM, &gp);
-		igt_require(has_gpu_reset > 1);
-
 		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				test_engine_hang(ctx, e, IGT_SPIN_INVALID_CS);
+				test_engine_hang(ctx, e, IGT_SPIN_INVALID_CS, reset);
 		}
 	}
 }
-- 
2.25.1
