Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131B96F49B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Apr 2021 19:26:38 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Thu, 29 Apr 2021 22:26:28 +0300
Message-Id: <20210429192628.4056795-4-imre.deak@intel.com>
In-Reply-To: <20210429192628.4056795-1-imre.deak@intel.com>
References: <20210429192628.4056795-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] lib/igt_fb: Remove redundant VC4 SAND
 plane size alignment
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

Special casing the tile_height > plane_height by rounding up the
plane_height to tile_height is redundant, since in that case the
following return statement will do exactly the same. Remove the special
casing.

The only exception would be if plane_height was 0, but the commit adding the
special case doesn't mention this as a possiblity and I presume that as an
framebuffer configuration.

Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 209bfacf0..f8f02766e 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -801,13 +801,6 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		if (is_gen12_ccs_modifier(fb->modifier))
 			tile_height *= 4;
 
-		/* Special case where the "tile height" represents a
-		 * height-based stride, such as with VC4 SAND tiling modes.
-		 */
-
-		if (tile_height > fb->plane_height[plane])
-			return fb->strides[plane] * tile_height;
-
 		return (uint64_t) fb->strides[plane] *
 			ALIGN(fb->plane_height[plane], tile_height);
 	}
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
