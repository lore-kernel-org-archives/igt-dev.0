Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E618970E
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 20:03:54 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id q16so3272442qke.10
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 13:03:54 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed,  7 Jul 2021 16:03:46 -0400
Message-Id: <20210707200346.1731702-1-markyacoub@chromium.org>
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

Tested on Trogdor.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_addfb_basic.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 91fb6ac9..20597b69 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -411,6 +411,7 @@ static void size_tests(int fd)
 	struct drm_mode_fb_cmd2 f_8 = {};
 	struct drm_mode_fb_cmd2 *framebuffers[] = {&f, &f_16, &f_8};
 	int i;
+	bool is_c8_format_supported = !is_msm_device(fd);
 
 	f.width = 1024;
 	f.height = 1024;
@@ -440,17 +441,19 @@ static void size_tests(int fd)
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
+		if (is_c8_format_supported) {
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
