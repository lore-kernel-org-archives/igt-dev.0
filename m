Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8603A6E225
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 05:59:27 +0000 (UTC)
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Date: Tue, 17 Dec 2019 21:59:19 -0800
Message-Id: <20191218055925.705070-5-vanshidhar.r.konda@intel.com>
In-Reply-To: <20191218055925.705070-1-vanshidhar.r.konda@intel.com>
References: <20191218055925.705070-1-vanshidhar.r.konda@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 04/10] lib/igt_fb: Remove set_tiling calls on
 devices without HW tiling support
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
Cc: brian.welty@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On devices that don't support tiling/de-tiling in HW, skip the usage
of the SET_TILING IOCTL and use blitter for drawing.

Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
---
 lib/igt_fb.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 35a50eeb..2843ab4d 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -922,9 +922,11 @@ static int create_bo_for_fb(struct igt_fb *fb)
 
 		if (is_i915_device(fd)) {
 			fb->gem_handle = gem_create(fd, fb->size);
-			gem_set_tiling(fd, fb->gem_handle,
-				       igt_fb_mod_to_tiling(fb->modifier),
-				       fb->strides[0]);
+			if (gem_has_legacy_hw_tiling(fd)) {
+				gem_set_tiling(fd, fb->gem_handle,
+					       igt_fb_mod_to_tiling(fb->modifier),
+					       fb->strides[0]);
+			}
 		} else if (is_vc4_device(fd)) {
 			fb->gem_handle = igt_vc4_create_bo(fd, fb->size);
 
@@ -1962,9 +1964,14 @@ static bool use_enginecopy(const struct igt_fb *fb)
 
 static bool use_blitter(const struct igt_fb *fb)
 {
+	if (!blitter_ok(fb))
+		return false;
+
+	if (!gem_has_legacy_hw_tiling(fb->fd))
+		return true;
+
 	return (fb->modifier == I915_FORMAT_MOD_Y_TILED ||
-		fb->modifier == I915_FORMAT_MOD_Yf_TILED) &&
-		blitter_ok(fb);
+		fb->modifier == I915_FORMAT_MOD_Yf_TILED);
 }
 
 static void init_buf(struct fb_blit_upload *blit,
@@ -3381,8 +3388,10 @@ cairo_surface_t *igt_get_cairo_surface(int fd, struct igt_fb *fb)
 		else if (use_blitter(fb) || use_enginecopy(fb) ||
 			 igt_vc4_is_tiled(fb->modifier))
 			create_cairo_surface__gpu(fd, fb);
-		else
+		else if (gem_has_mappable_ggtt(fd))
 			create_cairo_surface__gtt(fd, fb);
+		else
+			igt_assert_f(false, "Configuration not supported.\n");
 	}
 
 	igt_assert(cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS);
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
