Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Wed,  3 Nov 2021 10:04:48 -0700
Message-Id: <20211103170449.1614314-8-John.C.Harrison@Intel.com>
In-Reply-To: <20211103170449.1614314-1-John.C.Harrison@Intel.com>
References: <20211103170449.1614314-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 i-g-t 7/8] lib/igt_gt: Allow per engine reset
 testing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

With GuC submission, engine resets are handled entirely within GuC
rather than within i915. Traditionally, IGT has disallowed engine
based resets becuase they don't send the uevent which IGT uses to
check for unexpected resets. However, it is important to be able to
test all reset mechanisms that can be used, so allow engine based
resets to be enabled.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/igt_gt.c | 44 +++++++++++++++++++++++++++++---------------
 lib/igt_gt.h |  1 +
 2 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index a0ba04cc1..7c7df95ee 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -56,23 +56,28 @@
  * engines.
  */
 
+static int reset_query_once = -1;
+
 static bool has_gpu_reset(int fd)
 {
-	static int once = -1;
-	if (once < 0) {
-		struct drm_i915_getparam gp;
-		int val = 0;
-
-		memset(&gp, 0, sizeof(gp));
-		gp.param = 35; /* HAS_GPU_RESET */
-		gp.value = &val;
-
-		if (ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp))
-			once = intel_gen(intel_get_drm_devid(fd)) >= 5;
-		else
-			once = val > 0;
+	if (reset_query_once < 0) {
+		reset_query_once = gem_gpu_reset_type(fd);
+
+		/* Very old kernels did not support the query */
+		if (reset_query_once == -1)
+			reset_query_once =
+			      (intel_gen(intel_get_drm_devid(fd)) >= 5) ? 1 : 0;
 	}
-	return once;
+
+	return reset_query_once > 0;
+}
+
+static bool has_engine_reset(int fd)
+{
+	if (reset_query_once < 0)
+		has_gpu_reset(fd);
+
+	return reset_query_once > 1;
 }
 
 static void eat_error_state(int dev)
@@ -176,7 +181,11 @@ igt_hang_t igt_allow_hang(int fd, unsigned ctx, unsigned flags)
 		igt_skip("hang injection disabled by user [IGT_HANG=0]\n");
 	gem_context_require_bannable(fd);
 
-	allow_reset = 1;
+	if (flags & HANG_WANT_ENGINE_RESET)
+		allow_reset = 2;
+	else
+		allow_reset = 1;
+
 	if ((flags & HANG_ALLOW_CAPTURE) == 0) {
 		param.param = I915_CONTEXT_PARAM_NO_ERROR_CAPTURE;
 		param.value = 1;
@@ -187,11 +196,16 @@ igt_hang_t igt_allow_hang(int fd, unsigned ctx, unsigned flags)
 		__gem_context_set_param(fd, &param);
 		allow_reset = INT_MAX; /* any reset method */
 	}
+
 	igt_require(igt_params_set(fd, "reset", "%d", allow_reset));
+	reset_query_once = -1;  /* Re-query after changing param */
 
 	if (!igt_check_boolean_env_var("IGT_HANG_WITHOUT_RESET", false))
 		igt_require(has_gpu_reset(fd));
 
+	if (flags & HANG_WANT_ENGINE_RESET)
+		igt_require(has_engine_reset(fd));
+
 	ban = context_get_ban(fd, ctx);
 	if ((flags & HANG_ALLOW_BAN) == 0)
 		context_set_ban(fd, ctx, 0);
diff --git a/lib/igt_gt.h b/lib/igt_gt.h
index ceb044b86..c5059817b 100644
--- a/lib/igt_gt.h
+++ b/lib/igt_gt.h
@@ -51,6 +51,7 @@ igt_hang_t igt_hang_ctx_with_ahnd(int fd, uint64_t ahnd, uint32_t ctx, int ring,
 
 #define HANG_ALLOW_BAN 1
 #define HANG_ALLOW_CAPTURE 2
+#define HANG_WANT_ENGINE_RESET 4
 
 igt_hang_t igt_hang_ring(int fd, int ring);
 igt_hang_t igt_hang_ring_with_ahnd(int fd, int ring, uint64_t ahnd);
-- 
2.25.1
