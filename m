Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBF66E12D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 15:27:37 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id u20so21530348lja.13
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 08:27:37 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 22 Mar 2021 17:26:58 +0200
Message-Id: <20210322152659.2731-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_addfb_basic: simplify
 addfb25_ytile tests
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

use igt_display_has_format_mod(..) to test if tile supported
or no.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_addfb_basic.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 1302b1c7b..1fb18d668 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -581,26 +581,20 @@ static void addfb25_tests(int fd)
 		gem_close(fd, gem_bo);
 }
 
-static int addfb_expected_ret(int fd, uint64_t modifier)
+static int addfb_expected_ret(igt_display_t *display, struct local_drm_mode_fb_cmd2 *f)
 {
-	int gen;
-
-	if (!is_i915_device(fd))
-		return 0;
-
-	gen = intel_gen(intel_get_drm_devid(fd));
-
-	if (modifier == LOCAL_I915_FORMAT_MOD_Yf_TILED)
-		return gen >= 9 && gen < 12 ? 0 : -1;
-	return gen >= 9 ? 0 : -1;
+	return igt_display_has_format_mod(display, f->pixel_format,
+					  f->modifier[0]) ? 0 : -1;
 }
 
 static void addfb25_ytile(int fd)
 {
 	struct local_drm_mode_fb_cmd2 f = {};
-	int gen;
+	igt_display_t display;
 
 	igt_fixture {
+		igt_display_require(&display, fd);
+
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -627,8 +621,8 @@ static void addfb25_ytile(int fd)
 
 		f.modifier[0] = LOCAL_I915_FORMAT_MOD_Y_TILED;
 		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) ==
-			   addfb_expected_ret(fd, f.modifier[0]));
-		if (!addfb_expected_ret(fd, f.modifier[0]))
+			   addfb_expected_ret(&display, &f));
+		if (!addfb_expected_ret(&display, &f))
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
 		f.fb_id = 0;
 	}
@@ -640,8 +634,8 @@ static void addfb25_ytile(int fd)
 
 		f.modifier[0] = LOCAL_I915_FORMAT_MOD_Yf_TILED;
 		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) ==
-			   addfb_expected_ret(fd, f.modifier[0]));
-		if (!addfb_expected_ret(fd, f.modifier[0]))
+			   addfb_expected_ret(&display, &f));
+		if (!addfb_expected_ret(&display, &f))
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
 		f.fb_id = 0;
 	}
@@ -651,12 +645,10 @@ static void addfb25_ytile(int fd)
 		igt_require_fb_modifiers(fd);
 		igt_require_intel(fd);
 
-		gen = intel_gen(intel_get_drm_devid(fd));
-		igt_require(gen >= 9);
-
 		f.modifier[0] = LOCAL_I915_FORMAT_MOD_Y_TILED;
 		f.height = 1023;
 		f.handles[0] = gem_bo_small;
+		igt_require(addfb_expected_ret(&display, &f) == 0);
 		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
 		f.fb_id = 0;
 	}
@@ -664,6 +656,7 @@ static void addfb25_ytile(int fd)
 	igt_fixture {
 		gem_close(fd, gem_bo);
 		gem_close(fd, gem_bo_small);
+		igt_display_fini(&display);
 	}
 }
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
