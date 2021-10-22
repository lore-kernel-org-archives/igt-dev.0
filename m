Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DDC6E91D
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Oct 2021 09:25:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 22 Oct 2021 11:25:36 +0200
Message-Id: <20211022092537.3089-2-tzimmermann@suse.de>
In-Reply-To: <20211022092537.3089-1-tzimmermann@suse.de>
References: <20211022092537.3089-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 1/2] tests/fbdev: Test for validity of video
 mode settings
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

Add basic tests for video mode resolution and color on fbdev
devices.

v2:
	* respect FB_VMODE_YWRAP (Ville)
	* test horizontal resolution against line length

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/fbdev.c | 49 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 443a43dc..2cf137d2 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -27,6 +27,7 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <limits.h>
 #include <string.h>
 #include <sys/ioctl.h>
 #include <sys/mman.h>
@@ -50,14 +51,46 @@ static void mode_tests(int fd)
 
 	igt_describe("Check if screeninfo is valid");
 	igt_subtest("info") {
-		unsigned long size;
-
-		size = var_info.yres * fix_info.line_length;
-		igt_assert_f(size <= fix_info.smem_len,
-			     "screen size (%d x %d) of pitch %d does not fit within mappable area of size %u\n",
-			     var_info.xres, var_info.yres,
-			     fix_info.line_length,
-			     fix_info.smem_len);
+		unsigned long nbits, nlines;
+
+		/* video memory configuration */
+		igt_assert_f(fix_info.line_length, "line length not set\n");
+		igt_assert_f(fix_info.smem_len, "size of video memory not set\n");
+		igt_assert_f(fix_info.line_length <= fix_info.smem_len,
+			     "line length (%u) exceeds available video memory (%u)\n",
+			     fix_info.line_length, fix_info.smem_len);
+
+		/* color format */
+		igt_assert_f(var_info.bits_per_pixel, "bits-per-pixel not set\n");
+
+		/* horizontal resolution */
+		igt_assert_f(var_info.xres, "horizontal resolution not set\n");
+		igt_assert_f(var_info.xres_virtual, "horizontal virtual resolution not set\n");
+		igt_assert_f(var_info.xres <= var_info.xres_virtual,
+			     "horizontal virtual resolution (%u) less than horizontal resolution (%u)\n",
+			     var_info.xres_virtual, var_info.xres);
+		igt_assert_f(var_info.xoffset <= (var_info.xres_virtual - var_info.xres),
+			     "screen horizontal offset (%u) overflow\n",
+			     var_info.xoffset);
+		nbits = fix_info.line_length * CHAR_BIT;
+		igt_assert_f((var_info.xres_virtual * var_info.bits_per_pixel) <= nbits,
+			     "vertical virtual resolution (%u) with bpp %u exceeds line length %u\n",
+			     var_info.yres_virtual, var_info.bits_per_pixel, fix_info.line_length);
+
+		/* vertical resolution */
+		igt_assert_f(var_info.yres, "vertical resolution not set\n");
+		igt_assert_f(var_info.yres_virtual, "vertical virtual resolution not set\n");
+		igt_assert_f(var_info.yres <= var_info.yres_virtual,
+			     "vertical virtual resolution (%u) less than vertical resolution (%u)\n",
+			     var_info.yres_virtual, var_info.yres);
+		igt_assert_f((var_info.vmode & FB_VMODE_YWRAP) ||
+			     (var_info.yoffset <= (var_info.yres_virtual - var_info.yres)),
+			     "screen vertical offset (%u) overflow\n",
+			     var_info.yoffset);
+		nlines = fix_info.smem_len / fix_info.line_length;
+		igt_assert_f(var_info.yres_virtual <= nlines,
+			     "vertical virtual resolution (%u) with line length %u exceeds available video memory\n",
+			     var_info.yres_virtual, fix_info.line_length);
 	}
 }
 
-- 
2.33.0
