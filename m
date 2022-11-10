Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C874A10E871
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Nov 2022 15:11:10 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Nov 2022 16:10:52 +0100
Message-Id: <20221110151052.40009-1-karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/api_intel_bb: Run misplaced-blitter
 only with supported engines
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

The previous version of the test assumed a fixed set of engines
which might not be supported on some platforms. Make the test
more flexible when initializing the second engine instance in
context config. Skip the test altogether if there is no dedicated
copy engine.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/7493
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 tests/i915/api_intel_bb.c | 53 ++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index d448f02d..1bb047ed 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -1213,28 +1213,53 @@ static void full_batch(struct buf_ops *bops)
 	intel_bb_destroy(ibb);
 }
 
+static void require_engine(const intel_ctx_cfg_t *cfg, enum drm_i915_gem_engine_class class)
+{
+	int i, class_id = -1;
+
+	for (i = 0; i < cfg->num_engines; i++)
+		if (cfg->engines[i].engine_class == class)
+			class_id = i;
+
+	igt_require_f(class_id != -1, "Requested engine not supported\n");
+}
+
 static void misplaced_blitter(struct buf_ops *bops)
 {
 	int i915 = buf_ops_get_fd(bops), i;
 	struct intel_bb *ibb;
 	struct intel_buf *src, *dst;
 	uint64_t value, *psrc, *pdst;
-	int cmp;
+	int cmp, err;
+	const intel_ctx_t *ctx;
+	enum drm_i915_gem_engine_class engine_class;
+	intel_ctx_cfg_t cfg = {}, cfg_all_physical = intel_ctx_cfg_all_physical(i915);
+
+	/* Make sure we have a copy enigne and something to misplace it with */
+	require_engine(&cfg_all_physical, I915_ENGINE_CLASS_COPY);
+	igt_require(cfg_all_physical.num_engines > 1);
+
+	/* Find a supported engine class which is not blitter */
+	for (i = 0; i < cfg_all_physical.num_engines; i++) {
+		engine_class = cfg_all_physical.engines[i].engine_class;
+
+		if (engine_class != I915_ENGINE_CLASS_COPY)
+			break;
+	}
 
 	/* Use custom configuration with blitter at index 0 */
-	const intel_ctx_cfg_t cfg = (intel_ctx_cfg_t) {
-			.num_engines = 2,
-			.engines = {
-				{ .engine_class = I915_ENGINE_CLASS_COPY,
-				  .engine_instance = 0
-				},
-				{ .engine_class = I915_ENGINE_CLASS_RENDER,
-				  .engine_instance = 0
-				},
-			},
-		};
-
-	const intel_ctx_t *ctx = intel_ctx_create(i915, &cfg);
+	cfg.engines[0] = (struct i915_engine_class_instance) {
+				.engine_class = I915_ENGINE_CLASS_COPY,
+				.engine_instance = 0
+			};
+	cfg.engines[1] = (struct i915_engine_class_instance) {
+				.engine_class = engine_class,
+				.engine_instance = 0
+			};
+	cfg.num_engines =  2;
+
+	err = __intel_ctx_create(i915, &cfg, &ctx);
+	igt_assert_eq(err, 0);
 
 	ibb = intel_bb_create_with_context(i915, ctx->id, &ctx->cfg, PAGE_SIZE);
 
-- 
2.25.1
