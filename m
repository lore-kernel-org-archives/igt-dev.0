Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D430D10E5D1
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 06:51:53 +0000 (UTC)
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 19 May 2023 12:14:50 +0530
Message-Id: <20230519064453.1334690-2-arun.r.murthy@intel.com>
In-Reply-To: <20230519064453.1334690-1-arun.r.murthy@intel.com>
References: <20230519064453.1334690-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCHv2 i-g-t 1/4] tests/kms_async_flips: Get rid of
 i915 specific fb creation
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

No idea why the test wants to create the fb differently between i915
vs. others. Unify it.

v2: some correction in commit message

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 51ffa523..fe27a9ec 100644
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
2.25.1
