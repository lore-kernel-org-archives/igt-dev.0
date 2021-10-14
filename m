Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727026EADA
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 13:45:21 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 14 Oct 2021 15:45:17 +0200
Message-Id: <20211014134517.26473-3-tzimmermann@suse.de>
In-Reply-To: <20211014134517.26473-1-tzimmermann@suse.de>
References: <20211014134517.26473-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 2/2] tests/fbdev: Add tests for display panning
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

v2:
	* set offset to respect panning offsets (Ville)
	* respect FB_VMODE_YWRAP (Ville)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c | 135 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 2cf137d2..e1f18718 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -39,6 +39,20 @@
 
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
 static void mode_tests(int fd)
 {
 	struct fb_var_screeninfo var_info;
@@ -92,6 +106,127 @@ static void mode_tests(int fd)
 			     "vertical virtual resolution (%u) with line length %u exceeds available video memory\n",
 			     var_info.yres_virtual, fix_info.line_length);
 	}
+
+	igt_describe("Check panning / page flipping");
+	igt_subtest("pan") {
+		struct fb_var_screeninfo pan_var, new_var;
+		int ret;
+
+		/* jump to opposite end of virtual screen */
+		pan_var.xoffset = XOFFSET(var_info.xres_virtual - var_info.xres - var_info.xoffset);
+		pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres - var_info.yoffset);
+		ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		igt_assert_f(pan_var.xoffset == new_var.xoffset && pan_var.yoffset == new_var.yoffset,
+			     "panning to (%u, %u) moved to (%u, %u)\n",
+			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+
+		/* jump to (0, 0) */
+		pan_var.xoffset = XOFFSET(0);
+		pan_var.yoffset = YOFFSET(0);
+		ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		igt_assert_f(pan_var.xoffset == new_var.xoffset && pan_var.yoffset == new_var.yoffset,
+			     "panning to (%u, %u) moved to (%u, %u)\n",
+			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+
+		/* jump to maximum extend */
+		pan_var.xoffset = XOFFSET(var_info.xres_virtual - var_info.xres);
+		pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres);
+		ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		igt_assert_f(pan_var.xoffset == new_var.xoffset && pan_var.yoffset == new_var.yoffset,
+			     "panning to (%u, %u) moved to (%u, %u)\n",
+			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+
+		/* return to original offsets for next tests */
+		ret = ioctl(fd, FBIOPAN_DISPLAY, &var_info);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+
+		/* jump beyond maximum horizontal extend */
+		pan_var.xoffset = XOFFSET(var_info.xres_virtual - var_info.xres + PANSTEP(fix_info.xpanstep));
+		pan_var.yoffset = YOFFSET(0);
+		ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+		igt_assert_f(ret == -1, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		igt_assert_f(var_info.xoffset == new_var.xoffset && var_info.yoffset == new_var.yoffset,
+			     "panning to (%u, %u) moved to (%u, %u)\n",
+			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+
+		/* jump beyond horizontal virtual resolution */
+		pan_var.xoffset = XOFFSET(var_info.xres_virtual);
+		pan_var.yoffset = YOFFSET(0);
+		ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+		igt_assert_f(ret == -1, "ioctl(FBIOPAN_DISPLAY), ret=%d\n", ret);
+		ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		igt_assert_f(var_info.xoffset == new_var.xoffset && var_info.yoffset == new_var.yoffset,
+			     "panning to (%u, %u) moved to (%u, %u)\n",
+			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+
+		/*
+		 * With FB_MODE_YWRAP set, the display is expected to wrap around when reaching
+		 * the limits of the vertical resolution. Otherwise, this should fail.
+		 */
+
+		if (var_info.vmode & FB_VMODE_YWRAP) {
+			/* jump beyond maximum vertical extend */
+			pan_var.xoffset = XOFFSET(0);
+			pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres + PANSTEP(fix_info.ypanstep));
+			ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+			igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY), ret=%d\n", ret);
+			ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+			igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+			igt_assert_f(pan_var.xoffset == new_var.xoffset && pan_var.yoffset == new_var.yoffset,
+				     "panning to (%u, %u) moved to (%u, %u)\n",
+				     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+
+			/* jump beyond vertical virtual resolution */
+			pan_var.xoffset = XOFFSET(0);
+			pan_var.yoffset = YOFFSET(var_info.yres_virtual);
+			ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+			igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+			ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+			igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+			igt_assert_f(pan_var.xoffset == new_var.xoffset && pan_var.yoffset == new_var.yoffset,
+				     "panning to (%u, %u) moved to (%u, %u)\n",
+				     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+		} else {
+			/* jump beyond maximum vertical extend */
+			pan_var.xoffset = XOFFSET(0);
+			pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres + PANSTEP(fix_info.ypanstep));
+			ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+			igt_assert_f(ret == -1, "ioctl(FBIOPAN_DISPLAY), ret=%d\n", ret);
+			ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+			igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+			igt_assert_f(var_info.xoffset == new_var.xoffset && var_info.yoffset == new_var.yoffset,
+				     "panning to (%u, %u) moved to (%u, %u)\n",
+				     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+
+			/* jump beyond vertical virtual resolution */
+			pan_var.xoffset = XOFFSET(0);
+			pan_var.yoffset = YOFFSET(var_info.yres_virtual);
+			ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+			igt_assert_f(ret == -1, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+			ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+			igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+			igt_assert_f(var_info.xoffset == new_var.xoffset && var_info.yoffset == new_var.yoffset,
+				     "panning to (%u, %u) moved to (%u, %u)\n",
+				     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+		}
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
