Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Fri, 14 Jan 2022 10:17:00 -0800
Message-Id: <20220114181713.1798514-3-John.C.Harrison@Intel.com>
In-Reply-To: <20220114181713.1798514-1-John.C.Harrison@Intel.com>
References: <20220114181713.1798514-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v5 i-g-t 02/15] lib/hang: Fix
 igt_require_hang_ring to work with all engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The above function was checking for valid rings via the old interface.
The new scheme is to check for engines on contexts as there are now
more engines than could be supported.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/igt_gt.c              | 6 +++---
 lib/igt_gt.h              | 2 +-
 tests/i915/i915_hangman.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 7c7df95ee..50da512f2 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -122,12 +122,12 @@ static void eat_error_state(int dev)
  * to be done under hang injection.
  * Default: false
  */
-void igt_require_hang_ring(int fd, int ring)
+void igt_require_hang_ring(int fd, uint32_t ctx, int ring)
 {
 	if (!igt_check_boolean_env_var("IGT_HANG", true))
 		igt_skip("hang injection disabled by user [IGT_HANG=0]\n");
 
-	gem_require_ring(fd, ring);
+        igt_require(gem_context_has_engine(fd, ctx, ring));
 	gem_context_require_bannable(fd);
 	if (!igt_check_boolean_env_var("IGT_HANG_WITHOUT_RESET", false))
 		igt_require(has_gpu_reset(fd));
@@ -290,7 +290,7 @@ static igt_hang_t __igt_hang_ctx(int fd, uint64_t ahnd, uint32_t ctx, int ring,
 	igt_spin_t *spin;
 	unsigned ban;
 
-	igt_require_hang_ring(fd, ring);
+	igt_require_hang_ring(fd, ctx, ring);
 
 	/* check if non-default ctx submission is allowed */
 	igt_require(ctx == 0 || has_ctx_exec(fd, ring, ctx));
diff --git a/lib/igt_gt.h b/lib/igt_gt.h
index c5059817b..3d10349e4 100644
--- a/lib/igt_gt.h
+++ b/lib/igt_gt.h
@@ -31,7 +31,7 @@
 #include "i915/i915_drm_local.h"
 #include "i915_drm.h"
 
-void igt_require_hang_ring(int fd, int ring);
+void igt_require_hang_ring(int fd, uint32_t ctx, int ring);
 
 typedef struct igt_hang {
 	igt_spin_t *spin;
diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index b9c4d9983..f64b8819d 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -295,7 +295,7 @@ test_engine_hang(const intel_ctx_t *ctx,
  * case and it takes a lot more time to wrap, so the acthd can potentially keep
  * increasing for a long time
  */
-static void hangcheck_unterminated(void)
+static void hangcheck_unterminated(const intel_ctx_t *ctx)
 {
 	/* timeout needs to be greater than ~5*hangcheck */
 	int64_t timeout_ns = 100ull * NSEC_PER_SEC; /* 100 seconds */
@@ -304,7 +304,7 @@ static void hangcheck_unterminated(void)
 	uint32_t handle;
 
 	igt_require(gem_uses_full_ppgtt(device));
-	igt_require_hang_ring(device, 0);
+	igt_require_hang_ring(device, ctx->id, 0);
 
 	handle = gem_create(device, 4096);
 
@@ -394,7 +394,7 @@ igt_main
 
 	igt_describe("Check that executing unintialised memory causes a hang");
 	igt_subtest("hangcheck-unterminated")
-		hangcheck_unterminated();
+		hangcheck_unterminated(ctx);
 
 	igt_fixture {
 		igt_disallow_hang(device, hang);
-- 
2.25.1
