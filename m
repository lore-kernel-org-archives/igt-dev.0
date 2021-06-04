Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED586EB8E
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jun 2021 20:39:49 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri,  4 Jun 2021 13:39:27 -0700
Message-Id: <20210604203927.494340-7-matthew.d.roper@intel.com>
In-Reply-To: <20210604203927.494340-1-matthew.d.roper@intel.com>
References: <20210604203927.494340-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/6] lib/i915: Add ADL-P plane offset
 restriction for CCS framebuffers
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Imre Deak <imre.deak@intel.com>

All DPT FB plane offsets must be 2MB-aligned. The kernel takes care of
aligning the offset for non-CCS framebuffers.  Make sure that the
allocated CCS FB layout meets the alignment requirement.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/igt_fb.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ce2aa6ce..ab52ea9f 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -804,11 +804,23 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		return (uint64_t) fb->strides[plane] *
 			ALIGN(fb->plane_height[plane], tile_height);
 	} else if (is_gen12_ccs_plane(fb, plane)) {
+		uint64_t size;
+
 		/* The AUX CCS surface must be page aligned */
-		return (uint64_t)fb->strides[plane] *
+		size = (uint64_t)fb->strides[plane] *
 			ALIGN(fb->plane_height[plane], 64);
+
+		/*
+		 * On ADL_P CCS color planes must be 2MB aligned, until remapping
+		 * support is added for CCS FBs.
+		 */
+		if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)))
+			size = ALIGN(size, 2 * 1024 * 1024);
+
+		return size;
 	} else {
 		unsigned int tile_width, tile_height;
+		uint64_t size;
 
 		igt_get_fb_tile_size(fb->fd, fb->modifier, fb->plane_bpp[plane],
 				     &tile_width, &tile_height);
@@ -817,8 +829,18 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		if (is_gen12_ccs_modifier(fb->modifier))
 			tile_height *= 4;
 
-		return (uint64_t) fb->strides[plane] *
+		size = (uint64_t)fb->strides[plane] *
 			ALIGN(fb->plane_height[plane], tile_height);
+
+		/*
+		 * On ADL_P CCS color planes must be 2MB aligned, until remapping
+		 * support is added for CCS FBs.
+		 */
+		if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)) &&
+		    is_ccs_modifier(fb->modifier))
+			size = ALIGN(size, 2 * 1024 * 1024);
+
+		return size;
 	}
 }
 
-- 
2.25.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
