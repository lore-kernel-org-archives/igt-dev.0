Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F011789C56
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 14:07:22 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 11 Oct 2021 16:07:18 +0200
Message-Id: <20211011140719.11733-2-tzimmermann@suse.de>
In-Reply-To: <20211011140719.11733-1-tzimmermann@suse.de>
References: <20211011140719.11733-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/fbdev: Test for validity of video mode
 settings
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

Add basic tests for video mode resolution and color on fbdev
devices.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 443a43dc..c9903f8b 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -50,14 +50,41 @@ static void mode_tests(int fd)
 
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
+		unsigned long nlines;
+
+		/* video memory configuration */
+		igt_assert_f(fix_info.line_length, "line pitch not set\n");
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
+
+		/* vertical resolution */
+		igt_assert_f(var_info.yres, "vertical resolution not set\n");
+		igt_assert_f(var_info.yres_virtual, "vertical virtual resolution not set\n");
+		igt_assert_f(var_info.yres <= var_info.yres_virtual,
+			     "vertical virtual resolution (%u) less than vertical resolution (%u)\n",
+			     var_info.yres_virtual, var_info.yres);
+		igt_assert_f(var_info.yoffset <= (var_info.yres_virtual - var_info.yres),
+			     "screen vertical offset (%u) overflow\n",
+			     var_info.yoffset);
+		nlines = fix_info.smem_len / fix_info.line_length;
+		igt_assert_f(var_info.yres_virtual <= nlines,
+			     "vertical virtual resolution (%u) with pitch %u exceeds available video memory\n",
+			     var_info.yres_virtual, fix_info.line_length);
 	}
 }
 
-- 
2.33.0
