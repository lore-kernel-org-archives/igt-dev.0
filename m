Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FC910E782
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Mar 2022 20:54:31 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Mar 2022 02:24:12 +0530
Message-Id: <20220317205414.13668-3-jeevan.b@intel.com>
In-Reply-To: <20220317205414.13668-1-jeevan.b@intel.com>
References: <20220317205414.13668-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/4] igt/tests: Add support for
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
List-ID: <igt-dev@lists.freedesktop.org>

Adding subtest to test new tiling format

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_addfb_basic.c | 46 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index b7b3b0f2..6b2323a9 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -676,6 +676,50 @@ static void addfb25_ytile(int fd)
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
+
+	}
+
+	igt_describe("Check if addfb2 call works for tiling-4");
+	igt_subtest("addfb25-4-tiled") {
+		igt_require_fb_modifiers(fd);
+		igt_require_intel(fd);
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
@@ -826,6 +870,8 @@ igt_main
 
 	addfb25_ytile(fd);
 
+	addfb25_4tile(fd);
+
 	tiling_tests(fd);
 
 	prop_tests(fd);
-- 
2.35.1
