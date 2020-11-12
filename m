Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054746E2D5
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2020 13:28:45 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu, 12 Nov 2020 15:28:37 +0200
Message-Id: <20201112132837.502142-5-mika.kahola@intel.com>
In-Reply-To: <20201112132837.502142-1-mika.kahola@intel.com>
References: <20201112132837.502142-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v9 4/4] tests/kms_ccs: CCS Clear Color test
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

The patch proposes a method to test CCS with clear color
capability.

The test paints a solid color on primary fb and a small sprite fb.
These are cleared with fast clear feature. A crc is captured and
compared against the reference.

v2: Modify _gen9_render_copyfunc to support fast clear (Matt)
    Enable fast clear bit on 3D sequence (Matt)
    Add helper function to figure out clear color modifier (Matt)
v3: Remove unrelated line additions/removes
v4: Fast clear with color (Imre)
v5: Write raw 32-bit color values to register (Imre)
    Require 32-bit color format
v6: Rebase to use batchbuffer without libdrm dependency
v7: Enable clear color (Nanley)
v8: Various cleanups (Imre)
v9: Splitting patch for smaller hunks (Imre)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_ccs.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 6 deletions(-)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 53abecce..6b5f1ed4 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -120,6 +120,16 @@ static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
 	}
 }
 
+static bool is_ccs_cc_modifier(uint64_t modifier)
+{
+	switch (modifier) {
+	case LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /*
  * The CCS planes of compressed framebuffers contain non-zero bytes if the
  * engine compressed effectively the framebuffer. The actual encoding of these
@@ -134,6 +144,8 @@ static void check_ccs_plane(int drm_fd, igt_fb_t *fb, int plane)
 	void *ccs_p;
 	size_t ccs_size;
 	int i;
+	uint32_t cc_map[4];
+	uint32_t native_color;
 
 	ccs_size = fb->strides[plane] * fb->plane_height[plane];
 	igt_assert(ccs_size);
@@ -148,6 +160,17 @@ static void check_ccs_plane(int drm_fd, igt_fb_t *fb, int plane)
 		if (*(uint32_t *)(ccs_p + i))
 			break;
 
+	memcpy(cc_map, map + fb->offsets[2], 4*sizeof(uint32_t));
+	igt_assert(colors->r == cc_map[0] &&
+		   colors->g == cc_map[1] &&
+		   colors->b == cc_map[2]);
+
+	native_color = (uint8_t)(colors->r * 0xff) << 16 |
+		       (uint8_t)(colors->g * 0xff) << 8 |
+		       (uint8_t)(colors->b * 0xff);
+
+	igt_assert(native_color == cc_map[3]);
+
 	munmap(map, fb->size);
 
 	igt_assert_f(i < ccs_size,
@@ -160,8 +183,7 @@ static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb)
 	int i;
 
 	for (i = 0; i < fb->num_planes; i++) {
-		if (igt_fb_is_ccs_plane(fb, i) &&
-		    !igt_fb_is_gen12_ccs_cc_plane(fb, i))
+		if (igt_fb_is_ccs_plane(fb, i))
 			check_ccs_plane(drm_fd, fb, i);
 	}
 }
@@ -176,6 +198,11 @@ static int get_ccs_plane_index(uint32_t format)
 	return index;
 }
 
+static struct intel_buf *fast_clear_fb(int drm_fd, struct buf_ops *bops, struct igt_fb *fb, const char *name)
+{
+	return igt_fb_create_intel_buf(drm_fd, bops, fb, name);
+}
+
 static void generate_fb(data_t *data, struct igt_fb *fb,
 			int width, int height,
 			enum test_fb_flags fb_flags)
@@ -246,10 +273,31 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	if (!(data->flags & TEST_BAD_PIXEL_FORMAT)) {
 		int c = !!data->plane;
 
-		cr = igt_get_cairo_ctx(data->drm_fd, fb);
-		igt_paint_color(cr, 0, 0, width, height,
-				colors[c].r, colors[c].g, colors[c].b);
-		igt_put_cairo_ctx(cr);
+		if (is_ccs_cc_modifier(modifier)) {
+			float cc_color[4] = {colors[0].r, colors[0].g, colors[0].b, 1.0};
+			struct intel_bb *ibb = intel_bb_create(data->drm_fd, 4096);
+			struct buf_ops *bops = buf_ops_create(data->drm_fd);
+			struct intel_buf *dst = fast_clear_fb(data->drm_fd, bops, fb, "fast clear dst");
+
+			gem_set_domain(data->drm_fd, fb->gem_handle,
+				       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+
+			/*
+			 * We expect the kernel to limit the max fb
+			 * size/stride to something that can still
+			 * rendered with the blitter/render engine.
+			 */
+			 gen12_render_clearfunc(ibb, dst, 0, 0,
+						fb->width,
+						fb->height,
+						cc_color);
+			intel_bb_reset(ibb, true);
+		} else {
+			cr = igt_get_cairo_ctx(data->drm_fd, fb);
+			igt_paint_color(cr, 0, 0, width, height,
+					colors[c].r, colors[c].g, colors[c].b);
+					igt_put_cairo_ctx(cr);
+		}
 	}
 
 	ret = drmIoctl(data->drm_fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f);
@@ -349,6 +397,10 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	if (data->flags & TEST_BAD_ROTATION_90)
 		igt_plane_set_rotation(primary, IGT_ROTATION_90);
 
+	if (!is_ccs_cc_modifier(data->ccs_modifier)
+	   && data->format != DRM_FORMAT_XRGB8888)
+		return false;
+
 	ret = igt_display_try_commit2(display, commit);
 	if (data->flags & TEST_BAD_ROTATION_90) {
 		igt_assert_eq(ret, -EINVAL);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
