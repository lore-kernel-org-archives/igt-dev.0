Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1076E91C
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Oct 2021 09:25:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 22 Oct 2021 11:25:37 +0200
Message-Id: <20211022092537.3089-3-tzimmermann@suse.de>
In-Reply-To: <20211022092537.3089-1-tzimmermann@suse.de>
References: <20211022092537.3089-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 2/2] tests/fbdev: Add tests for display panning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
Cc: Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

Add tests that perform panning / page flip operations on an fbdev
device. Panning should work when the viewport wi within the virtual
screen and fail otherwise.

v4:
	* return early if PAN ioctl failed in pan_test()
v3:
	* moved ioctls and assertions into helper (Ville)
	* set FB_VMODE_YWRAP for rsp tests
	* additional comments on YWRAP
v2:
	* set offset to respect panning offsets (Ville)
	* respect FB_VMODE_YWRAP (Ville)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/fbdev.c | 108 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 2cf137d2..7a2a5c4e 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -39,6 +39,41 @@
 
 #include "igt.h"
 
+#define PANSTEP(panstep_) \
+	((panstep_) ? (panstep_) : 1)
+
+static unsigned int __panoffset(unsigned int offset, unsigned int panstep)
+{
+	return offset - (offset % PANSTEP(panstep));
+}
+
+#define XOFFSET(offset_) \
+	__panoffset(offset_, fix_info.xpanstep)
+
+#define YOFFSET(offset_) \
+	__panoffset(offset_, fix_info.ypanstep)
+
+static void pan_test(int fd, const struct fb_var_screeninfo *var, int expected_ret)
+{
+	struct fb_var_screeninfo pan_var, new_var;
+	int ret;
+
+	memcpy(&pan_var, var, sizeof(pan_var));
+
+	ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+	igt_assert_f(ret == expected_ret,
+		     "ioctl(FBIOPAN_DISPLAY) returned ret=%d, expected %d\n", ret, expected_ret);
+
+	if (ret)
+		return; /* panning failed; skip additional tests */
+
+	ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+	igt_assert_f(ret == 0, "ioctl(FBIOGET_VSCREENINFO) failed, ret=%d\n", ret);
+	igt_assert_f(pan_var.xoffset == new_var.xoffset && pan_var.yoffset == new_var.yoffset,
+		     "panning to (%u, %u) moved to (%u, %u)\n",
+		     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+}
+
 static void mode_tests(int fd)
 {
 	struct fb_var_screeninfo var_info;
@@ -92,6 +127,79 @@ static void mode_tests(int fd)
 			     "vertical virtual resolution (%u) with line length %u exceeds available video memory\n",
 			     var_info.yres_virtual, fix_info.line_length);
 	}
+
+	igt_describe("Check panning / page flipping");
+	igt_subtest("pan") {
+		struct fb_var_screeninfo pan_var;
+		int expected_ret;
+
+		memset(&pan_var, 0, sizeof(pan_var));
+
+		/*
+		 * Tests that are expected to succeed.
+		 */
+
+		/* jump to opposite end of virtual screen */
+		pan_var.xoffset = XOFFSET(var_info.xres_virtual - var_info.xres - var_info.xoffset);
+		pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres - var_info.yoffset);
+		pan_test(fd, &pan_var, 0);
+		/* jump to (0, 0) */
+		pan_var.xoffset = XOFFSET(0);
+		pan_var.yoffset = YOFFSET(0);
+		pan_test(fd, &pan_var, 0);
+		/* jump to maximum extend */
+		pan_var.xoffset = XOFFSET(var_info.xres_virtual - var_info.xres);
+		pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres);
+		pan_test(fd, &pan_var, 0);
+
+		/*
+		 * Tests that are expected to fail.
+		 */
+
+		/* jump beyond maximum horizontal extend */
+		pan_var.xoffset = XOFFSET(var_info.xres_virtual - var_info.xres + PANSTEP(fix_info.xpanstep));
+		pan_var.yoffset = YOFFSET(0);
+		pan_test(fd, &pan_var, -1);
+		/* jump beyond horizontal virtual resolution */
+		pan_var.xoffset = XOFFSET(var_info.xres_virtual);
+		pan_var.yoffset = YOFFSET(0);
+		pan_test(fd, &pan_var, -1);
+
+		/*
+		 * The FB_VMODE_YWRAP flag is configurable as part of ioctl(FBIOPAN_DISPLAY),
+		 * but it's hard to know which drivers support it and which don't. Testing for
+		 * FBINFO_HWACCEL_YWRAP does not produce meaningful results. So we got with the
+		 * device's current setting.
+		 *
+		 * With FB_VMODE_YWRAP set, the display is expected to wrap around when
+		 * reaching the limits of the vertical resolution. Otherwise, this should
+		 * fail.
+		 *
+		 */
+
+		if (var_info.vmode & FB_VMODE_YWRAP) {
+			pan_var.vmode |= FB_VMODE_YWRAP;
+			expected_ret = 0;
+		} else {
+			expected_ret = -1;
+		}
+
+		/* jump beyond maximum vertical extend */
+		pan_var.xoffset = XOFFSET(0);
+		pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres + PANSTEP(fix_info.ypanstep));
+		pan_test(fd, &pan_var, expected_ret);
+		/* jump beyond vertical virtual resolution */
+		pan_var.xoffset = XOFFSET(0);
+		pan_var.yoffset = YOFFSET(var_info.yres_virtual);
+		pan_test(fd, &pan_var, expected_ret);
+
+		pan_var.vmode &= ~FB_VMODE_YWRAP;
+	}
+
+	igt_fixture {
+		/* restore original panning offsets */
+		ioctl(fd, FBIOPAN_DISPLAY, &var_info);
+	}
 }
 
 static void framebuffer_tests(int fd)
-- 
2.33.0
