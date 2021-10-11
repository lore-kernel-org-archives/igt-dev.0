Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06A689C83
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 14:07:22 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 11 Oct 2021 16:07:19 +0200
Message-Id: <20211011140719.11733-3-tzimmermann@suse.de>
In-Reply-To: <20211011140719.11733-1-tzimmermann@suse.de>
References: <20211011140719.11733-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/fbdev: Add tests for display panning
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

Add tests that perform panning / page flip operations on an fbdev
device. Panning should work when the viewport wi within the virtual
screen and fail otherwise.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index c9903f8b..17727cd0 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -86,6 +86,98 @@ static void mode_tests(int fd)
 			     "vertical virtual resolution (%u) with pitch %u exceeds available video memory\n",
 			     var_info.yres_virtual, fix_info.line_length);
 	}
+
+	igt_describe("Check panning / page flipping");
+	igt_subtest("pan") {
+		struct fb_var_screeninfo pan_var, new_var;
+		int ret;
+
+		/* jump to opposite end of virtual screen */
+		pan_var.xoffset = var_info.xres_virtual - var_info.xres - var_info.xoffset;
+		pan_var.yoffset = var_info.yres_virtual - var_info.yres - var_info.yoffset;
+		ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		igt_assert_f(pan_var.xoffset == new_var.xoffset && pan_var.yoffset == new_var.yoffset,
+			     "panning to (%u, %u) moved to (%u, %u)\n",
+			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+
+		/* jump to (0, 0) */
+		pan_var.xoffset = 0;
+		pan_var.yoffset = 0;
+		ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		igt_assert_f(pan_var.xoffset == new_var.xoffset && pan_var.yoffset == new_var.yoffset,
+			     "panning to (%u, %u) moved to (%u, %u)\n",
+			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+
+		/* jump to maximum extend */
+		pan_var.xoffset = var_info.xres_virtual - var_info.xres;
+		pan_var.yoffset = var_info.yres_virtual - var_info.yres;
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
+		pan_var.xoffset = var_info.xres_virtual - var_info.xres + 1;
+		pan_var.yoffset = 0;
+		ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+		igt_assert_f(ret == -1, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		igt_assert_f(var_info.xoffset == new_var.xoffset && var_info.yoffset == new_var.yoffset,
+			     "panning to (%u, %u) moved to (%u, %u)\n",
+			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+
+		/* jump beyond maximum vertical extend */
+		pan_var.xoffset = 0;
+		pan_var.yoffset = var_info.yres_virtual - var_info.yres + 1;
+		ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+		igt_assert_f(ret == -1, "ioctl(FBIOPAN_DISPLAY), ret=%d\n", ret);
+		ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		igt_assert_f(var_info.xoffset == new_var.xoffset && var_info.yoffset == new_var.yoffset,
+			     "panning to (%u, %u) moved to (%u, %u)\n",
+			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+
+		/* jump beyond horizontal virtual resolution */
+		pan_var.xoffset = var_info.xres_virtual;
+		pan_var.yoffset = 0;
+		ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+		igt_assert_f(ret == -1, "ioctl(FBIOPAN_DISPLAY), ret=%d\n", ret);
+		ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		igt_assert_f(var_info.xoffset == new_var.xoffset && var_info.yoffset == new_var.yoffset,
+			     "panning to (%u, %u) moved to (%u, %u)\n",
+			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
+
+		/* jump beyond vertical virtual resolution */
+		pan_var.xoffset = 0;
+		pan_var.yoffset = var_info.yres_virtual;
+		ret = ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
+		igt_assert_f(ret == -1, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		ret = ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
+		igt_assert_f(ret == 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=%d\n", ret);
+		igt_assert_f(var_info.xoffset == new_var.xoffset && var_info.yoffset == new_var.yoffset,
+			     "panning to (%u, %u) moved to (%u, %u)\n",
+			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
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
