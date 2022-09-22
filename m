Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 10:13:53 +0200
Message-Id: <20220922081353.1759082-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_persistence: adjust
 saturated-hostile test timeout
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

GPU occasionally can hang during saturated-hostile test. Detection of
such case and reset can take up to 5 seconds. While at it fix typo in
definition of RESET_TIMEOUT_MS.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1551
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 50196edb19f..603fdd84438 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -46,7 +46,8 @@
 #include "intel_allocator.h"
 #include "sw_sync.h"
 
-#define RESET_TIMEOUT_MS 2 * MSEC_PER_SEC; /* default: 640ms */
+#define RESET_TIMEOUT_MS (2 * MSEC_PER_SEC) /* default: 640ms */
+#define RESET_TIMEOUT_GPU_HANG_MS (10000 * MSEC_PER_SEC)
 static unsigned long reset_timeout_ms = RESET_TIMEOUT_MS;
 #define NSEC_PER_MSEC (1000 * 1000ull)
 
@@ -370,7 +371,7 @@ static void test_nohangcheck_hostile(int i915, const intel_ctx_cfg_t *cfg)
 	igt_require(__enable_hangcheck(dir, false));
 
 	for_each_ctx_cfg_engine(i915, cfg, e) {
-		int64_t timeout = 10000 * NSEC_PER_MSEC;
+		int64_t timeout = RESET_TIMEOUT_GPU_HANG_MS;
 		const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
 		uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 		igt_spin_t *spin;
@@ -951,7 +952,7 @@ test_saturated_hostile_all(int i915, const intel_ctx_t *base_ctx,
 	intel_ctx_destroy(i915, ctx);
 
 	/* Hostile request requires a GPU reset to terminate */
-	igt_assert_eq(wait_for_status(spin->out_fence, reset_timeout_ms), -EIO);
+	igt_assert_eq(wait_for_status(spin->out_fence, RESET_TIMEOUT_GPU_HANG_MS), -EIO);
 
 	/* All other spinners should be left unharmed */
 	gem_quiescent_gpu(i915);
-- 
2.34.1
