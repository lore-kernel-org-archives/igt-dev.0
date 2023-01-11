Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E352410E717
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 08:44:37 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Jan 2023 09:44:15 +0100
Message-Id: <54d1022dd280adc272b688b125e6cd470e1031ea.1673426099.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1673426099.git.karolina.stolarek@intel.com>
References: <cover.1673426099.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/6] lib/i915_blt: Check for Tile-YF in
 fast_copy
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

In older gens Tile4 is not available, we have Tile-YF instead. Check for
both tilings when setting up the fast_copy command.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/i915/i915_blt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index 1bb95b31..ca02676d 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -326,6 +326,11 @@ static enum blt_aux_mode __aux_mode(const struct blt_copy_object *obj)
 	return AM_AUX_NONE;
 }
 
+static bool __new_tile_y_type(enum blt_tiling_type tiling)
+{
+	return tiling == T_TILE4 || tiling == T_YFMAJOR;
+}
+
 static void fill_data(struct gen12_block_copy_data *data,
 		      const struct blt_copy_data *blt,
 		      uint64_t src_offset, uint64_t dst_offset,
@@ -1016,8 +1021,8 @@ uint64_t emit_blt_fast_copy(int i915,
 	data.dw01.color_depth = __fast_color_depth(blt->color_depth);
 	data.dw01.dst_memory = __memory_type(blt->dst.region);
 	data.dw01.src_memory = __memory_type(blt->src.region);
-	data.dw01.dst_type_y = blt->dst.tiling == T_TILE4 ? 1 : 0;
-	data.dw01.src_type_y = blt->src.tiling == T_TILE4 ? 1 : 0;
+	data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
+	data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
 
 	data.dw02.dst_x1 = blt->dst.x1;
 	data.dw02.dst_y1 = blt->dst.y1;
-- 
2.25.1
