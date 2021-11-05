Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0809C6E104
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Nov 2021 10:55:37 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri,  5 Nov 2021 12:54:12 +0200
Message-Id: <20211105105413.23998-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/fbdev: Add debug traces to
 subtest pan
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
Cc: Petri Latvala <petri.latvala@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

This helps debugging
https://gitlab.freedesktop.org/drm/intel/-/issues/4435

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/fbdev.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 7a2a5c4e..794882a6 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -139,15 +139,15 @@ static void mode_tests(int fd)
 		 * Tests that are expected to succeed.
 		 */
 
-		/* jump to opposite end of virtual screen */
+		igt_debug("Jump to opposite end of virtual screen\n");
 		pan_var.xoffset = XOFFSET(var_info.xres_virtual - var_info.xres - var_info.xoffset);
 		pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres - var_info.yoffset);
 		pan_test(fd, &pan_var, 0);
-		/* jump to (0, 0) */
+		igt_debug("Jump to (0, 0)\n");
 		pan_var.xoffset = XOFFSET(0);
 		pan_var.yoffset = YOFFSET(0);
 		pan_test(fd, &pan_var, 0);
-		/* jump to maximum extend */
+		igt_debug("Jump to maximum extend\n");
 		pan_var.xoffset = XOFFSET(var_info.xres_virtual - var_info.xres);
 		pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres);
 		pan_test(fd, &pan_var, 0);
@@ -156,11 +156,11 @@ static void mode_tests(int fd)
 		 * Tests that are expected to fail.
 		 */
 
-		/* jump beyond maximum horizontal extend */
+		igt_debug("Jump beyond maximum horizontal extend\n");
 		pan_var.xoffset = XOFFSET(var_info.xres_virtual - var_info.xres + PANSTEP(fix_info.xpanstep));
 		pan_var.yoffset = YOFFSET(0);
 		pan_test(fd, &pan_var, -1);
-		/* jump beyond horizontal virtual resolution */
+		igt_debug("Jump beyond horizontal virtual resolution\n");
 		pan_var.xoffset = XOFFSET(var_info.xres_virtual);
 		pan_var.yoffset = YOFFSET(0);
 		pan_test(fd, &pan_var, -1);
@@ -184,11 +184,11 @@ static void mode_tests(int fd)
 			expected_ret = -1;
 		}
 
-		/* jump beyond maximum vertical extend */
+		igt_debug("Jump beyond maximum vertical extend\n");
 		pan_var.xoffset = XOFFSET(0);
 		pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres + PANSTEP(fix_info.ypanstep));
 		pan_test(fd, &pan_var, expected_ret);
-		/* jump beyond vertical virtual resolution */
+		igt_debug("Jump beyond vertical virtual resolution\n");
 		pan_var.xoffset = XOFFSET(0);
 		pan_var.yoffset = YOFFSET(var_info.yres_virtual);
 		pan_test(fd, &pan_var, expected_ret);
-- 
2.29.2
