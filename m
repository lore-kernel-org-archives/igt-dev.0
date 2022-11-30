Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4381F10E416
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Nov 2022 07:08:20 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 30 Nov 2022 08:07:59 +0100
Message-Id: <7ccb29a2e47d491737cc1cae57f30a5c1bdf1e0f.1669791691.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1669791691.git.karolina.stolarek@intel.com>
References: <cover.1669791691.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_batchbuffer: Make
 find_engine() more flexible
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

find_engine() depends on intel_bb struct, making it hard to
use outside of this context. As this function cares only about
intel_ctx_cfg, not intel_bb itself, let's pass the context
config in directly.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/intel_batchbuffer.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 19a1fbe4..00a263f2 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1500,13 +1500,11 @@ static bool has_ctx_cfg(struct intel_bb *ibb)
 	return ibb->cfg && ibb->cfg->num_engines > 0;
 }
 
-static uint32_t find_engine(struct intel_bb *ibb, unsigned int class)
+static uint32_t find_engine(const intel_ctx_cfg_t *cfg, unsigned int class)
 {
-	intel_ctx_cfg_t *cfg;
 	unsigned int i;
 	uint32_t engine_id = -1;
 
-	cfg = ibb->cfg;
 	for (i = 0; i < cfg->num_engines; i++) {
 		if (cfg->engines[i].engine_class == class)
 			engine_id = i;
@@ -2833,7 +2831,7 @@ void intel_bb_flush_render(struct intel_bb *ibb)
 		return;
 
 	if (has_ctx_cfg(ibb))
-		ring = find_engine(ibb, I915_ENGINE_CLASS_RENDER);
+		ring = find_engine(ibb->cfg, I915_ENGINE_CLASS_RENDER);
 	else
 		ring = I915_EXEC_RENDER;
 
@@ -2856,7 +2854,7 @@ void intel_bb_flush_blit(struct intel_bb *ibb)
 		return;
 
 	if (has_ctx_cfg(ibb))
-		ring = find_engine(ibb, I915_ENGINE_CLASS_COPY);
+		ring = find_engine(ibb->cfg, I915_ENGINE_CLASS_COPY);
 	else
 		ring = HAS_BLT_RING(ibb->devid) ? I915_EXEC_BLT : I915_EXEC_DEFAULT;
 
-- 
2.25.1
