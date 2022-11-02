Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F62810E45B
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Nov 2022 09:11:05 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Nov 2022 10:10:58 +0100
Message-Id: <7dc83dc7b607f8992c6693f139f6a37a43669ea3.1667378726.git.karolina.drobnik@intel.com>
In-Reply-To: <cover.1667378725.git.karolina.drobnik@intel.com>
References: <cover.1667378725.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/3] lib/intel_batchbuffer: Add support
 for custom engine layouts
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

Don't assume fixed engine ids and use context configuration in
intel_bb to find the appropriate engine when executing the batchbuffer.

Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_batchbuffer.c | 48 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 6c120b5a..19a1fbe4 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1495,6 +1495,28 @@ static bool aux_needs_softpin(int i915)
 	return intel_gen(intel_get_drm_devid(i915)) >= 12;
 }
 
+static bool has_ctx_cfg(struct intel_bb *ibb)
+{
+	return ibb->cfg && ibb->cfg->num_engines > 0;
+}
+
+static uint32_t find_engine(struct intel_bb *ibb, unsigned int class)
+{
+	intel_ctx_cfg_t *cfg;
+	unsigned int i;
+	uint32_t engine_id = -1;
+
+	cfg = ibb->cfg;
+	for (i = 0; i < cfg->num_engines; i++) {
+		if (cfg->engines[i].engine_class == class)
+			engine_id = i;
+	}
+
+	igt_assert_f(engine_id != -1, "Requested engine not found!\n");
+
+	return engine_id;
+}
+
 /**
  * intel_bb_create:
  * @i915: drm fd
@@ -2799,34 +2821,44 @@ void intel_bb_flush(struct intel_bb *ibb, uint32_t ring)
  * intel_bb_flush_render:
  * @ibb: batchbuffer
  *
- * If batch is not empty emit batch buffer end, execute on render ring
- * and reset the batch. Context used to execute is batch context.
+ * If batch is not empty emit batch buffer end, find the render engine id,
+ * execute on the ring and reset the batch. Context used to execute
+ * is batch context.
  */
 void intel_bb_flush_render(struct intel_bb *ibb)
 {
+	uint32_t ring;
+
 	if (intel_bb_emit_flush_common(ibb) == 0)
 		return;
 
-	intel_bb_exec_with_ring(ibb, I915_EXEC_RENDER);
+	if (has_ctx_cfg(ibb))
+		ring = find_engine(ibb, I915_ENGINE_CLASS_RENDER);
+	else
+		ring = I915_EXEC_RENDER;
+
+	intel_bb_exec_with_ring(ibb, ring);
 }
 
 /*
  * intel_bb_flush_blit:
  * @ibb: batchbuffer
  *
- * If batch is not empty emit batch buffer end, execute on default/blit ring
- * (depends on gen) and reset the batch.
+ * If batch is not empty emit batch buffer end, find a suitable ring
+ * (depending on gen and context configuration) and reset the batch.
  * Context used to execute is batch context.
  */
 void intel_bb_flush_blit(struct intel_bb *ibb)
 {
-	uint32_t ring = I915_EXEC_DEFAULT;
+	uint32_t ring;
 
 	if (intel_bb_emit_flush_common(ibb) == 0)
 		return;
 
-	if (HAS_BLT_RING(ibb->devid))
-		ring = I915_EXEC_BLT;
+	if (has_ctx_cfg(ibb))
+		ring = find_engine(ibb, I915_ENGINE_CLASS_COPY);
+	else
+		ring = HAS_BLT_RING(ibb->devid) ? I915_EXEC_BLT : I915_EXEC_DEFAULT;
 
 	intel_bb_exec_with_ring(ibb, ring);
 }
-- 
2.25.1
