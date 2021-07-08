Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22D86E990
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 19:51:38 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id n9so5792482qtk.7
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Jul 2021 12:51:38 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu,  8 Jul 2021 15:51:30 -0400
Message-Id: <20210708195130.2802224-1-markyacoub@chromium.org>
In-Reply-To: <20210707200346.1731702-1-markyacoub@chromium.org>
References: <20210707200346.1731702-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_addfb_basic: Test addfb2 with
 DRM_FORMAT_C8 only if supported.
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
Cc: seanpaul@chromium.org, petri.latvala@intel.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
Some devices such as Trogdor do not support DRM_FORMAT_C8 pixel format.
Skip any addfb2 test on such devices that is expected to succeed such as
subtest size-max.

[How]
Only run the check on devices with DRM_FORMAT_C8 support

Tested on ChromeOS Trogdor

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_addfb_basic.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 91fb6ac9..a76c07d1 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -410,6 +410,7 @@ static void size_tests(int fd)
 	struct drm_mode_fb_cmd2 f_16 = {};
 	struct drm_mode_fb_cmd2 f_8 = {};
 	struct drm_mode_fb_cmd2 *framebuffers[] = {&f, &f_16, &f_8};
+	igt_display_t display;
 	int i;
 
 	f.width = 1024;
@@ -428,6 +429,8 @@ static void size_tests(int fd)
 	f_8.pitches[0] = 1024*2;
 
 	igt_fixture {
+		igt_display_require(&display, fd);
+
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -440,17 +443,19 @@ static void size_tests(int fd)
 	f_16.handles[0] = gem_bo;
 	f_8.handles[0] = gem_bo;
 
-	igt_describe("Check if addfb2 call works with max size of  buffer object");
+	igt_describe("Check if addfb2 call works with max size of buffer object");
 	igt_subtest("size-max") {
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
 		f.fb_id = 0;
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_16) == 0);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_16.fb_id) == 0);
-		f.fb_id = 0;
-		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) == 0);
-		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_8.fb_id) == 0);
-		f.fb_id = 0;
+		f_16.fb_id = 0;
+		if (igt_display_has_format_mod(&display, DRM_FORMAT_C8, 0)) {
+			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) == 0);
+			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_8.fb_id) == 0);
+			f_8.fb_id = 0;
+		}
 	}
 
 	f.width++;
-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
