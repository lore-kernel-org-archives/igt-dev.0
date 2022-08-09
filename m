Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B582D4705
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:17 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:29 +0200
Message-Id: <20220809125037.1231032-11-ryszard.knop@intel.com>
In-Reply-To: <20220809125037.1231032-1-ryszard.knop@intel.com>
References: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 10/19] tests/kms*: Remove unused headers
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
 tests/kms_addfb_basic.c        | 4 ----
 tests/kms_atomic.c             | 2 --
 tests/kms_atomic_transition.c  | 1 -
 tests/kms_bw.c                 | 1 -
 tests/kms_chamelium.c          | 2 --
 tests/kms_content_protection.c | 1 -
 tests/kms_cursor_edge_walk.c   | 1 -
 tests/kms_dither.c             | 2 --
 tests/kms_dp_aux_dev.c         | 4 ----
 tests/kms_flip_event_leak.c    | 3 ---
 tests/kms_getfb.c              | 6 ------
 tests/kms_hdmi_inject.c        | 2 --
 tests/kms_hdr.c                | 2 --
 tests/kms_lease.c              | 6 ------
 tests/kms_panel_fitting.c      | 1 -
 tests/kms_pipe_crc_basic.c     | 1 -
 tests/kms_plane.c              | 1 -
 tests/kms_plane_lowres.c       | 2 --
 tests/kms_plane_multiple.c     | 1 -
 tests/kms_plane_scaling.c      | 1 -
 tests/kms_prime.c              | 2 --
 tests/kms_prop_blob.c          | 2 --
 tests/kms_properties.c         | 2 --
 tests/kms_rmfb.c               | 2 --
 tests/kms_sequence.c           | 3 ---
 tests/kms_setmode.c            | 2 --
 tests/kms_vblank.c             | 3 ---
 tests/kms_writeback.c          | 1 -
 28 files changed, 61 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 6b2323a9..3e72c575 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -27,14 +27,10 @@
 
 #include "igt.h"
 #include <unistd.h>
-#include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include "drm.h"
 #include "drm_fourcc.h"
 
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 253829f2..07b6b2ee 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -32,8 +32,6 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <stdint.h>
 #include <string.h>
 #include <errno.h>
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 10b21c92..0f31eece 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -30,7 +30,6 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
-#include <time.h>
 #include <poll.h>
 
 #ifndef DRM_CAP_CURSOR_WIDTH
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 7bb1332e..b4307142 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -22,7 +22,6 @@
 
 #include "drm_mode.h"
 #include "igt.h"
-#include "drm.h"
 #include <stdio.h>
 #include <xf86drmMode.h>
 
diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index d97b439a..aec82b1c 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -24,9 +24,7 @@
  *    Lyude Paul <lyude@redhat.com>
  */
 
-#include "config.h"
 #include "igt.h"
-#include "igt_vc4.h"
 #include "igt_edid.h"
 #include "igt_eld.h"
 #include "igt_infoframe.h"
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3041f1cd..5964a6d7 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -24,7 +24,6 @@
 
 #include <poll.h>
 #include <fcntl.h>
-#include <sys/epoll.h>
 #include <sys/stat.h>
 #include <libudev.h>
 #include "igt.h"
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index b75fc216..4ed3e1d0 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -24,7 +24,6 @@
 
 #include "igt.h"
 #include <errno.h>
-#include <limits.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 43a25e20..72b0762b 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -26,8 +26,6 @@
  */
 
 #include "igt.h"
-#include <fcntl.h>
-#include <termios.h>
 #include <unistd.h>
 
 IGT_TEST_DESCRIPTION("Test Dithering block status");
diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index d3249fa3..e1b26b5b 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -22,10 +22,6 @@
  *
  */
 
-#include "config.h"
-
-#include <sys/types.h>
-#include <sys/stat.h>
 #include <fcntl.h>
 #include <dirent.h>
 
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index ac201293..90c6c547 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -23,9 +23,6 @@
  */
 
 #include "igt.h"
-#include <errno.h>
-#include <stdbool.h>
-#include <stdio.h>
 #include <string.h>
 
 #include "igt_device.h"
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 2e4552a0..58620c84 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -30,18 +30,12 @@
 #include "igt.h"
 #include <unistd.h>
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 
 #include "drm.h"
 #include "drm_fourcc.h"
-#include "i915/gem_create.h"
-#include "igt_device.h"
 
 IGT_TEST_DESCRIPTION("Tests GETFB and GETFB2 ioctls.");
 
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index abae0ab4..051c9b4e 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -22,8 +22,6 @@
  *
  */
 
-#include "config.h"
-
 #include <dirent.h>
 
 #include "igt.h"
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index e2650f51..1054c7a1 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -21,8 +21,6 @@
  */
 
 #include "igt.h"
-#include <fcntl.h>
-#include <termios.h>
 #include <unistd.h>
 #include "igt_edid.h"
 
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 0bf102a6..b5b6ea2e 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -34,14 +34,8 @@
 #include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <time.h>
-#include <sys/poll.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 #include <sys/wait.h>
 
-#include <libudev.h>
-
 #include <drm.h>
 #include "igt_device.h"
 
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 478c16bd..9d8c3769 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -23,7 +23,6 @@
  */
 
 #include "igt.h"
-#include <math.h>
 #include <sys/stat.h>
 
 IGT_TEST_DESCRIPTION("Test display panel fitting");
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 2ff40f72..2f3f5380 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -25,7 +25,6 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include <errno.h>
-#include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index c885a813..169363ec 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -26,7 +26,6 @@
 
 #include "igt.h"
 #include "igt_vec.h"
-#include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index f37dbd16..907f3856 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -24,11 +24,9 @@
 
 #include "igt.h"
 #include "drmtest.h"
-#include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
-#include <time.h>
 
 IGT_TEST_DESCRIPTION("Test atomic mode setting with a plane by switching between high and low resolutions");
 
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 1679f7ce..edbb5e25 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -24,7 +24,6 @@
 
 #include "igt.h"
 #include "drmtest.h"
-#include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index fc8250b5..ce448d5a 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -24,7 +24,6 @@
 
 #include "igt.h"
 #include "igt_vec.h"
-#include <math.h>
 
 IGT_TEST_DESCRIPTION("Test display plane scaling");
 
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 3df690e0..93e08c38 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -27,8 +27,6 @@
 #include "igt_sysfs.h"
 #include <fcntl.h>
 
-#include <sys/ioctl.h>
-#include <sys/poll.h>
 #include <time.h>
 
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
index 96aa6d8d..b9571bb9 100644
--- a/tests/kms_prop_blob.c
+++ b/tests/kms_prop_blob.c
@@ -27,8 +27,6 @@
 
 #include "igt.h"
 #include <errno.h>
-#include <stdbool.h>
-#include <stdio.h>
 #include <string.h>
 
 IGT_TEST_DESCRIPTION("Tests behaviour of mass-data 'blob' properties.");
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index dd5a93aa..2fae751e 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -25,9 +25,7 @@
 #include "drmtest.h"
 #include <errno.h>
 #include <stdbool.h>
-#include <stdio.h>
 #include <string.h>
-#include <time.h>
 
 struct additional_test {
 	const char *name;
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 7e43e1bd..fcca3bd8 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -23,11 +23,9 @@
 
 #include "igt.h"
 #include "drmtest.h"
-#include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
-#include <time.h>
 
 #ifndef DRM_CAP_CURSOR_WIDTH
 #define DRM_CAP_CURSOR_WIDTH 0x8
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 1655d7d1..3f7109f0 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -31,13 +31,10 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
 #include <time.h>
 #include <sys/poll.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 #include <sys/wait.h>
 
 #include <drm.h>
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index bfa10891..3fb30e45 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -20,7 +20,6 @@
  * Authors:
  *    Imre Deak <imre.deak@intel.com>
  */
-#include "config.h"
 
 #include "igt.h"
 #include <cairo.h>
@@ -28,7 +27,6 @@
 #include <stdint.h>
 #include <unistd.h>
 #include <string.h>
-#include <sys/time.h>
 #include <math.h>
 
 #define MAX_CONNECTORS  10
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index e65e8522..9f40a67e 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -30,13 +30,10 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
 #include <time.h>
 #include <sys/poll.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 #include <sys/wait.h>
 
 #include <drm.h>
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 9d134585..98bc99bf 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -24,7 +24,6 @@
 
 #include <errno.h>
 #include <stdbool.h>
-#include <stdio.h>
 #include <string.h>
 #include <limits.h>
 
-- 
2.37.1
