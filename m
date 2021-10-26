Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E21D6E49B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Oct 2021 21:26:26 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 27 Oct 2021 00:26:19 +0300
Message-Id: <20211026212620.2718277-4-imre.deak@intel.com>
In-Reply-To: <20211026212620.2718277-1-imre.deak@intel.com>
References: <20211026212620.2718277-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] lib/igt_fb/tgl+: Remove CCS FB 4 tile
 height alignment restriction
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The spec is somewhat unclear about this and suggests a 4x4 tile layout
on the main surface of TGL+ CCS FBs. So far IGT ensured that the height
of the main surface is 4 tiles aligned accordingly. However, the layout
of tiles is just the usual Y-tiled one where consecutive tiles in memory
order fill one full tile-row at a time, continuing with the next
tile-row afterwards. Perhaps the spec referred to the layout where CCS
cachelines mapped to the main surface in the "vertical" cacheline-pair
mode. However up until ADLP the horizontal cacheline-pair mode is used,
where consecutive CCS cachelines in memory order map to consecutive main
surface tiles mapping one full tile-row first and then continuing with
the next tile-row.

Accordingly we don't need to align the surface height to 4 tiles, remove
this restriction.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c       | 6 +-----
 lib/intel_bufops.c | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 86d0ae426..ddb530c99 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -670,7 +670,7 @@ static unsigned fb_plane_height(const struct igt_fb *fb, int plane)
 		if (ccs_to_main_plane(fb, plane))
 			height = DIV_ROUND_UP(height, format->vsub);
 
-		return DIV_ROUND_UP(height, 128) * 4;
+		return DIV_ROUND_UP(height, 32);
 	} else if (is_ccs_plane(fb, plane)) {
 		return DIV_ROUND_UP(fb->height, 512) * 32;
 	}
@@ -838,10 +838,6 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		igt_get_fb_tile_size(fb->fd, fb->modifier, fb->plane_bpp[plane],
 				     &tile_width, &tile_height);
 
-		/* A main surface using a CCS AUX surface must be 4x4 tiles aligned. */
-		if (is_gen12_ccs_modifier(fb->modifier))
-			tile_height *= 4;
-
 		size = (uint64_t)fb->strides[plane] *
 			ALIGN(fb->plane_height[plane], tile_height);
 
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 80c5bb80b..f13063fa9 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -771,7 +771,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 			buf->surface[0].stride = ALIGN(width * (bpp / 8), 128);
 
 		if (bops->intel_gen >= 12)
-			height = ALIGN(height, 4 * 32);
+			height = ALIGN(height, 32);
 
 		buf->surface[0].size = buf->surface[0].stride * height;
 		buf->tiling = tiling;
-- 
2.27.0
