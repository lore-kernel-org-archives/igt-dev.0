Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C0710E286
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 15:01:16 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon, 14 Feb 2022 20:30:05 +0530
Message-Id: <20220214150009.26815-13-jeevan.b@intel.com>
In-Reply-To: <20220214150009.26815-1-jeevan.b@intel.com>
References: <20220214150009.26815-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 12/16] igt/tests: Add support for
 Tile4(TileF) format to tests/kms_addfb_basic
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
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Adding subtest to test new tiling format

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_addfb_basic.c | 44 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index b7b3b0f2..2fc99eb4 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -155,7 +155,6 @@ static void invalid_tests(int fd)
 		uint64_t size;
 
 		igt_require_intel(fd);
-		igt_require(gem_has_lmem(fd));
 		igt_calc_fb_size(fd, f.width, f.height,
 				DRM_FORMAT_XRGB8888, 0, &size, &stride);
 		handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
@@ -676,6 +675,47 @@ static void addfb25_ytile(int fd)
 	}
 }
 
+static void addfb25_4tile(int fd)
+{
+	struct drm_mode_fb_cmd2 f = {};
+	igt_display_t display;
+
+	igt_fixture {
+		igt_display_require(&display, fd);
+
+		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
+				DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
+		igt_assert(gem_bo);
+
+		memset(&f, 0, sizeof(f));
+
+		f.width = 1024;
+		f.height = 1024;
+		f.pixel_format = DRM_FORMAT_XRGB8888;
+		f.pitches[0] = 1024*4;
+		f.flags = DRM_MODE_FB_MODIFIERS;
+		f.modifier[0] = DRM_FORMAT_MOD_LINEAR;
+
+		f.handles[0] = gem_bo;
+	}
+
+	igt_subtest("addfb25-4-tiled") {
+		igt_require_fb_modifiers(fd);
+
+		f.modifier[0] = I915_FORMAT_MOD_4_TILED;
+		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) ==
+			   addfb_expected_ret(&display, &f));
+		if (!addfb_expected_ret(&display, &f))
+			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
+		f.fb_id = 0;
+	}
+
+	igt_fixture {
+		gem_close(fd, gem_bo);
+		igt_display_fini(&display);
+	}
+}
+
 static void prop_tests(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -826,6 +866,8 @@ igt_main
 
 	addfb25_ytile(fd);
 
+	addfb25_4tile(fd);
+
 	tiling_tests(fd);
 
 	prop_tests(fd);
-- 
2.17.1
