Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D574E113339
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 14:29:42 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 31 May 2022 16:28:34 +0200
Message-Id: <20220531142844.278366-4-ryszard.knop@intel.com>
In-Reply-To: <20220531142844.278366-1-ryszard.knop@intel.com>
References: <20220531142844.278366-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/14] overlay: Remove unused headers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Using CLion's automated code inspection, most unused includes were found
and removed. Some warnings remain as CLion is unable to track code usage
across certain attributes, but the vast majority of unneeded headers are
now gone.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 overlay/config.c          | 2 --
 overlay/gem-interrupts.c  | 1 -
 overlay/gpu-top.c         | 5 -----
 overlay/kms/kms-overlay.c | 2 --
 overlay/overlay.c         | 2 --
 overlay/power.c           | 3 ---
 overlay/rc6.c             | 1 -
 overlay/x11/dri2.c        | 1 -
 overlay/x11/position.c    | 3 ---
 overlay/x11/x11-overlay.c | 2 --
 overlay/x11/x11-window.c  | 2 --
 11 files changed, 24 deletions(-)

diff --git a/overlay/config.c b/overlay/config.c
index b6bd8dc3..30c6c1c7 100644
--- a/overlay/config.c
+++ b/overlay/config.c
@@ -22,7 +22,6 @@
  *
  */
 
-#include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/mman.h>
 #include <stdlib.h>
@@ -31,7 +30,6 @@
 #include <ctype.h>
 #include <unistd.h>
 #include <fcntl.h>
-#include <errno.h>
 
 #include "overlay.h"
 
diff --git a/overlay/gem-interrupts.c b/overlay/gem-interrupts.c
index be73b693..d1de17db 100644
--- a/overlay/gem-interrupts.c
+++ b/overlay/gem-interrupts.c
@@ -22,7 +22,6 @@
  *
  */
 
-#include <sys/stat.h>
 #include <unistd.h>
 #include <fcntl.h>
 #include <errno.h>
diff --git a/overlay/gpu-top.c b/overlay/gpu-top.c
index 32123abd..c073df3f 100644
--- a/overlay/gpu-top.c
+++ b/overlay/gpu-top.c
@@ -23,13 +23,8 @@
  */
 
 #include <stdint.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
 #include <unistd.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <assert.h>
 
 #include "igt_perf.h"
 
diff --git a/overlay/kms/kms-overlay.c b/overlay/kms/kms-overlay.c
index cfb3d5ae..4c936c55 100644
--- a/overlay/kms/kms-overlay.c
+++ b/overlay/kms/kms-overlay.c
@@ -22,7 +22,6 @@
  *
  */
 
-#include <sys/types.h>
 #include <sys/mman.h>
 #include <cairo.h>
 #include <stdio.h>
@@ -38,7 +37,6 @@
 #include <xf86drmMode.h>
 #include <i915_drm.h>
 #include "../overlay.h"
-//#include "rgb2yuv.h"
 
 #ifndef ALIGN
 #define ALIGN(i,m)	(((i) + (m) - 1) & ~((m) - 1))
diff --git a/overlay/overlay.c b/overlay/overlay.c
index fdc62091..dc36af1d 100644
--- a/overlay/overlay.c
+++ b/overlay/overlay.c
@@ -23,7 +23,6 @@
  */
 
 #include <sys/types.h>
-#include <sys/mman.h>
 #include <cairo.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -39,7 +38,6 @@
 
 #include "overlay.h"
 #include "chart.h"
-#include "config.h"
 #include "cpu-top.h"
 #include "debugfs.h"
 #include "gem-interrupts.h"
diff --git a/overlay/power.c b/overlay/power.c
index 76fafea9..1027b28a 100644
--- a/overlay/power.c
+++ b/overlay/power.c
@@ -24,11 +24,9 @@
 
 #include <stdint.h>
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
 #include <unistd.h>
 #include <fcntl.h>
-#include <time.h>
 #include <errno.h>
 #include <ctype.h>
 #include <locale.h>
@@ -37,7 +35,6 @@
 #include "igt_perf.h"
 
 #include "power.h"
-#include "debugfs.h"
 
 static int
 filename_to_buf(const char *filename, char *buf, unsigned int bufsize)
diff --git a/overlay/rc6.c b/overlay/rc6.c
index 69f95f28..33553428 100644
--- a/overlay/rc6.c
+++ b/overlay/rc6.c
@@ -24,7 +24,6 @@
 
 #include <sys/stat.h>
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
 #include <unistd.h>
 #include <fcntl.h>
diff --git a/overlay/x11/dri2.c b/overlay/x11/dri2.c
index 6c9e90d6..7459f31a 100644
--- a/overlay/x11/dri2.c
+++ b/overlay/x11/dri2.c
@@ -30,7 +30,6 @@
  *   Kristian Høgsberg (krh@redhat.com)
  */
 
-#include <stdio.h>
 #include <X11/Xlibint.h>
 #include <X11/extensions/Xext.h>
 #include <X11/extensions/extutil.h>
diff --git a/overlay/x11/position.c b/overlay/x11/position.c
index 9e3db370..e18934d2 100644
--- a/overlay/x11/position.c
+++ b/overlay/x11/position.c
@@ -22,15 +22,12 @@
  *
  */
 
-#include "config.h"
-
 #include <X11/Xlib.h>
 #ifdef HAVE_XRANDR
 #include <X11/extensions/Xrandr.h>
 #endif
 #include <string.h>
 #include <stdio.h>
-#include <stdlib.h>
 
 #include "position.h"
 #include "../overlay.h"
diff --git a/overlay/x11/x11-overlay.c b/overlay/x11/x11-overlay.c
index ac6b5f39..f14fc2d9 100644
--- a/overlay/x11/x11-overlay.c
+++ b/overlay/x11/x11-overlay.c
@@ -24,10 +24,8 @@
 
 #include <X11/Xlib.h>
 #include <X11/extensions/Xvlib.h>
-#include <sys/types.h>
 #include <sys/mman.h>
 #include <cairo.h>
-#include <stdio.h>
 #include <stdlib.h>
 #include <stdbool.h>
 #include <string.h>
diff --git a/overlay/x11/x11-window.c b/overlay/x11/x11-window.c
index 6bdc48c2..3d2ed065 100644
--- a/overlay/x11/x11-window.c
+++ b/overlay/x11/x11-window.c
@@ -25,11 +25,9 @@
 #include <X11/Xlib.h>
 #include <cairo.h>
 #include <cairo-xlib.h>
-#include <stdio.h>
 #include <stdlib.h>
 #include <stdbool.h>
 #include <string.h>
-#include <unistd.h>
 
 #include "../overlay.h"
 #include "position.h"
-- 
2.36.1
