Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4761B6E1A4
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2020 08:30:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri,  6 Nov 2020 09:29:48 +0100
Message-Id: <20201106082955.8939-2-tzimmermann@suse.de>
In-Reply-To: <20201106082955.8939-1-tzimmermann@suse.de>
References: <20201106082955.8939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 1/8] tests/fbdev: Move existing tests into
 separate subgroups
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
To: daniel.vetter@ffwll.ch, chris@chris-wilson.co.uk, petri.latvala@intel.com
Cc: igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

Move the existing tests into subgroups for testing modesetting and
accessing the framebuffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c | 55 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index e5efeb93..b61e1cea 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -37,24 +37,12 @@
 
 #include "igt.h"
 
-igt_main
+static void mode_tests(int fd)
 {
 	struct fb_var_screeninfo var_info;
 	struct fb_fix_screeninfo fix_info;
-	int fd = -1;
 
-	/*
-	 * Should this test focus on the fbdev independent of any drm driver,
-	 * or should it look for fbdev of a particular device?
-	 */
 	igt_fixture {
-		fd = open("/dev/fb0", O_RDWR);
-		if (fd < 0) {
-			drm_load_module(DRIVER_ANY);
-			fd = open("/dev/fb0", O_RDWR);
-		}
-		igt_require_f(fd != -1, "/dev/fb0\n");
-
 		igt_require(ioctl(fd, FBIOGET_VSCREENINFO, &var_info) == 0);
 		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
 	}
@@ -62,6 +50,8 @@ igt_main
 	igt_subtest("info") {
 		unsigned long size;
 
+		igt_describe("Check if screeninfo is valid");
+
 		size = var_info.yres * fix_info.line_length;
 		igt_assert_f(size <= fix_info.smem_len,
 			     "screen size (%d x %d) of pitch %d does not fit within mappable area of size %u\n",
@@ -69,10 +59,21 @@ igt_main
 			     fix_info.line_length,
 			     fix_info.smem_len);
 	}
+}
+
+static void framebuffer_tests(int fd)
+{
+	struct fb_fix_screeninfo fix_info;
+
+	igt_fixture {
+		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
+	}
 
 	igt_subtest("mmap") {
 		void *map;
 
+		igt_describe("Check mmap operations on framebuffer memory");
+
 		igt_require(fix_info.smem_len);
 
 		map = mmap(NULL, fix_info.smem_len,
@@ -82,6 +83,34 @@ igt_main
 		memset(map, 0, fix_info.smem_len);
 		munmap(map, fix_info.smem_len);
 	}
+}
+
+igt_main
+{
+	int fd = -1;
+
+	/*
+	 * Should this test focus on the fbdev independent of any drm driver,
+	 * or should it look for fbdev of a particular device?
+	 */
+	igt_fixture {
+		fd = open("/dev/fb0", O_RDWR);
+		if (fd < 0) {
+			drm_load_module(DRIVER_ANY);
+			fd = open("/dev/fb0", O_RDWR);
+		}
+		igt_require_f(fd != -1, "/dev/fb0\n");
+	}
+
+	igt_subtest_group {
+		igt_describe("Check modesetting");
+		mode_tests(fd);
+	}
+
+	igt_subtest_group {
+		igt_describe("Check framebuffer access");
+		framebuffer_tests(fd);
+	}
 
 	igt_fixture {
 		close(fd);
-- 
2.29.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
