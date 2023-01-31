Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7FC10E337
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jan 2023 12:06:59 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 Jan 2023 14:06:43 +0200
Message-Id: <20230131120646.27434-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
References: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/6] tests/kms_async_flips: Ger rid of i915
 specific fb creation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

No idea why the test wants to create the fb differently between i915
vs. others. Unify it.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 55be0bd874ad..f8c97e029c59 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -115,6 +115,15 @@ static void wait_flip_event(data_t *data)
 	}
 }
 
+static uint64_t default_modifier(data_t *data)
+{
+	if (igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888,
+				       I915_FORMAT_MOD_X_TILED))
+		return I915_FORMAT_MOD_X_TILED;
+	else
+		return DRM_FORMAT_MOD_LINEAR;
+}
+
 static void make_fb(data_t *data, struct igt_fb *fb,
 		    uint32_t width, uint32_t height, int index)
 {
@@ -123,14 +132,8 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 
 	rec_width = width / (ARRAY_SIZE(data->bufs) * 2);
 
-	if (is_i915_device(data->drm_fd)) {
-		igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-			      I915_FORMAT_MOD_X_TILED, fb);
-		igt_draw_fill_fb(data->drm_fd, fb, 0x88);
-	} else {
-		igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-				    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.5, fb);
-	}
+	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
+			    default_modifier(data), 0.0, 0.0, 0.5, fb);
 
 	cr = igt_get_cairo_ctx(data->drm_fd, fb);
 	igt_paint_color_rand(cr, rec_width * 2 + rec_width * index, 0, rec_width, height);
-- 
2.39.1
