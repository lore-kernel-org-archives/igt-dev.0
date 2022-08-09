Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6139D4773
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:18 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:32 +0200
Message-Id: <20220809125037.1231032-14-ryszard.knop@intel.com>
In-Reply-To: <20220809125037.1231032-1-ryszard.knop@intel.com>
References: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 13/19] tests/i915/*: Remove unused headers
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
 tests/i915/api_intel_bb.c             | 5 -----
 tests/i915/drm_fdinfo.c               | 1 -
 tests/i915/gen3_mixed_blits.c         | 7 -------
 tests/i915/gen3_render_linear_blits.c | 6 ------
 tests/i915/gen3_render_mixed_blits.c  | 7 -------
 tests/i915/gen3_render_tiledx_blits.c | 7 -------
 tests/i915/gen3_render_tiledy_blits.c | 7 -------
 tests/i915/gen7_exec_parse.c          | 2 --
 tests/i915/gen9_exec_parse.c          | 1 -
 tests/i915/i915_hangman.c             | 3 ---
 tests/i915/i915_module_load.c         | 4 ----
 tests/i915/i915_pm_backlight.c        | 1 -
 tests/i915/i915_pm_dc.c               | 1 -
 tests/i915/i915_pm_lpsp.c             | 1 -
 tests/i915/i915_pm_rpm.c              | 4 ----
 tests/i915/i915_pm_rps.c              | 1 -
 tests/i915/i915_pm_sseu.c             | 1 -
 tests/i915/i915_suspend.c             | 6 ------
 tests/i915/kms_dsc.c                  | 8 --------
 tests/i915/kms_fbcon_fbt.c            | 1 -
 tests/i915/kms_fence_pin_leak.c       | 3 ---
 tests/i915/kms_frontbuffer_tracking.c | 1 -
 tests/i915/kms_mmap_write_crc.c       | 2 --
 tests/i915/kms_psr.c                  | 1 -
 tests/i915/kms_psr2_sf.c              | 2 --
 tests/i915/kms_psr2_su.c              | 2 --
 tests/i915/kms_psr_stress_test.c      | 3 ---
 tests/i915/kms_pwrite_crc.c           | 4 ----
 tests/i915/perf.c                     | 3 ---
 tests/i915/perf_pmu.c                 | 6 ------
 tests/i915/sysfs_clients.c            | 4 ----
 tests/i915/sysfs_defaults.c           | 3 ---
 tests/i915/sysfs_heartbeat_interval.c | 5 -----
 tests/i915/sysfs_preempt_timeout.c    | 3 ---
 tests/i915/sysfs_timeslice_duration.c | 3 ---
 35 files changed, 119 deletions(-)

diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 1f663d2a..58151c7c 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -23,18 +23,13 @@
 
 #include "igt.h"
 #include "igt_crc.h"
-#include "i915/gem.h"
 #include "i915/gem_create.h"
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <cairo.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <glib.h>
 #include <zlib.h>
 #include "intel_bufops.h"
diff --git a/tests/i915/drm_fdinfo.c b/tests/i915/drm_fdinfo.c
index 65b8b830..59e8da55 100644
--- a/tests/i915/drm_fdinfo.c
+++ b/tests/i915/drm_fdinfo.c
@@ -24,7 +24,6 @@
 
 #include "igt.h"
 #include "igt_core.h"
-#include "igt_device.h"
 #include "igt_drm_fdinfo.h"
 #include "i915/gem.h"
 #include "i915/gem_vm.h"
diff --git a/tests/i915/gen3_mixed_blits.c b/tests/i915/gen3_mixed_blits.c
index 242b9985..5f2ffbeb 100644
--- a/tests/i915/gen3_mixed_blits.c
+++ b/tests/i915/gen3_mixed_blits.c
@@ -34,16 +34,9 @@
  */
 
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <sys/ioctl.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "i915_reg.h"
diff --git a/tests/i915/gen3_render_linear_blits.c b/tests/i915/gen3_render_linear_blits.c
index 9c6b4c70..88294efb 100644
--- a/tests/i915/gen3_render_linear_blits.c
+++ b/tests/i915/gen3_render_linear_blits.c
@@ -34,15 +34,9 @@
  */
 
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "i915_reg.h"
diff --git a/tests/i915/gen3_render_mixed_blits.c b/tests/i915/gen3_render_mixed_blits.c
index 1393055f..4fdb60c2 100644
--- a/tests/i915/gen3_render_mixed_blits.c
+++ b/tests/i915/gen3_render_mixed_blits.c
@@ -34,16 +34,9 @@
  */
 
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <sys/ioctl.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "i915_reg.h"
diff --git a/tests/i915/gen3_render_tiledx_blits.c b/tests/i915/gen3_render_tiledx_blits.c
index ece86749..d7e6e330 100644
--- a/tests/i915/gen3_render_tiledx_blits.c
+++ b/tests/i915/gen3_render_tiledx_blits.c
@@ -34,16 +34,9 @@
  */
 
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <sys/ioctl.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "i915_reg.h"
diff --git a/tests/i915/gen3_render_tiledy_blits.c b/tests/i915/gen3_render_tiledy_blits.c
index 30097be6..8a738118 100644
--- a/tests/i915/gen3_render_tiledy_blits.c
+++ b/tests/i915/gen3_render_tiledy_blits.c
@@ -34,15 +34,8 @@
  */
 
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <sys/ioctl.h>
-#include "drm.h"
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
index 69b768ed..b7ae3ea6 100644
--- a/tests/i915/gen7_exec_parse.c
+++ b/tests/i915/gen7_exec_parse.c
@@ -27,8 +27,6 @@
 #include <stdio.h>
 #include <errno.h>
 
-#include <drm.h>
-
 #include "igt.h"
 #include "igt_device.h"
 #include "i915/gem.h"
diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index c8743a78..228a3d73 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -26,7 +26,6 @@
 #include <stdbool.h>
 #include <stdint.h>
 #include <stdio.h>
-#include <stdlib.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index c7d69fdd..7d55a1e0 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -26,10 +26,7 @@
  *
  */
 
-#include <limits.h>
 #include <sys/ioctl.h>
-#include <sys/stat.h>
-#include <sys/types.h>
 #include <fcntl.h>
 #include <signal.h>
 
diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index 4c72157c..70b2f4a7 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -22,10 +22,6 @@
  */
 #include "igt.h"
 #include <dirent.h>
-#include <sys/utsname.h>
-#include <linux/limits.h>
-#include <signal.h>
-#include <libgen.h>
 #include <signal.h>
 #include <sys/ioctl.h>
 #include <fcntl.h>
diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index cafae7f7..c30e924d 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -27,7 +27,6 @@
 
 #include "igt.h"
 #include <limits.h>
-#include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <stdio.h>
diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index f664a2a2..78fe096b 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -25,7 +25,6 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <stdbool.h>
-#include <stdio.h>
 #include <string.h>
 #include "igt.h"
 #include "igt_kmod.h"
diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 3ad8b260..fc85c9f7 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -28,7 +28,6 @@
 #include "igt_kmod.h"
 #include "igt_pm.h"
 #include "igt_sysfs.h"
-#include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <unistd.h>
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index e95875dc..912b9e4d 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -25,8 +25,6 @@
  *
  */
 
-#include "config.h"
-
 #include <stdio.h>
 #include <stdint.h>
 #include <stdbool.h>
@@ -38,8 +36,6 @@
 #include <dirent.h>
 #include <sys/ioctl.h>
 #include <sys/mman.h>
-#include <sys/types.h>
-#include <sys/stat.h>
 #include <linux/i2c.h>
 #include <linux/i2c-dev.h>
 
diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index a45a6905..3c744d75 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -34,7 +34,6 @@
 #include <signal.h>
 #include <errno.h>
 #include <time.h>
-#include <sys/wait.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
diff --git a/tests/i915/i915_pm_sseu.c b/tests/i915/i915_pm_sseu.c
index 1b428c9b..2e2101e4 100644
--- a/tests/i915/i915_pm_sseu.c
+++ b/tests/i915/i915_pm_sseu.c
@@ -27,7 +27,6 @@
 #include <fcntl.h>
 #include <unistd.h>
 #include <string.h>
-#include <errno.h>
 #include <time.h>
 
 #include "i915_drm.h"
diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index 94935595..a54ff612 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -30,13 +30,7 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-
-#include <drm.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index be15238e..b66a5c43 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -30,19 +30,11 @@
  *
  */
 #include "igt.h"
-#include "igt_sysfs.h"
-#include <errno.h>
-#include <getopt.h>
-#include <math.h>
 #include <stdint.h>
 #include <stdbool.h>
 #include <strings.h>
 #include <unistd.h>
 #include <stdlib.h>
-#include <signal.h>
-#include <time.h>
-#include <fcntl.h>
-#include <termios.h>
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
index 98c452c4..ab59883d 100644
--- a/tests/i915/kms_fbcon_fbt.c
+++ b/tests/i915/kms_fbcon_fbt.c
@@ -28,7 +28,6 @@
 #include "igt_device.h"
 #include "igt_psr.h"
 #include "igt_sysfs.h"
-#include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
 
diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
index 16eb595f..500258b1 100644
--- a/tests/i915/kms_fence_pin_leak.c
+++ b/tests/i915/kms_fence_pin_leak.c
@@ -22,10 +22,7 @@
  *
  */
 
-#include <errno.h>
-#include <limits.h>
 #include <stdbool.h>
-#include <stdio.h>
 #include <string.h>
 
 #include "i915/gem.h"
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 9518c706..5ca614de 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -25,7 +25,6 @@
  */
 
 #include <sys/types.h>
-#include <sys/stat.h>
 #include <fcntl.h>
 #include <poll.h>
 #include <pthread.h>
diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index a57938b5..33823d2e 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -25,9 +25,7 @@
  */
 
 #include <errno.h>
-#include <limits.h>
 #include <stdbool.h>
-#include <stdio.h>
 #include <string.h>
 
 #include "drmtest.h"
diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
index 480e2cc7..4b52c0ee 100644
--- a/tests/i915/kms_psr.c
+++ b/tests/i915/kms_psr.c
@@ -23,7 +23,6 @@
  */
 
 #include "igt.h"
-#include "igt_sysfs.h"
 #include "igt_psr.h"
 #include <errno.h>
 #include <stdbool.h>
diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 6612587c..a8de28b0 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -23,9 +23,7 @@
  */
 
 #include "igt.h"
-#include "igt_sysfs.h"
 #include "igt_psr.h"
-#include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index caccf713..41180374 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -23,9 +23,7 @@
  */
 
 #include "igt.h"
-#include "igt_sysfs.h"
 #include "igt_psr.h"
-#include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
diff --git a/tests/i915/kms_psr_stress_test.c b/tests/i915/kms_psr_stress_test.c
index daac41d4..444ae074 100644
--- a/tests/i915/kms_psr_stress_test.c
+++ b/tests/i915/kms_psr_stress_test.c
@@ -1,10 +1,7 @@
 #include "igt.h"
-#include "igt_sysfs.h"
 #include "igt_psr.h"
-#include <errno.h>
 #include <poll.h>
 #include <stdbool.h>
-#include <stdio.h>
 #include <string.h>
 #include <sys/timerfd.h>
 
diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index 584e6a19..7455b427 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -23,10 +23,6 @@
  */
 
 #include "igt.h"
-#include <errno.h>
-#include <limits.h>
-#include <stdbool.h>
-#include <stdio.h>
 #include <string.h>
 
 
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 5502a3fb..5ddd4f39 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -30,13 +30,10 @@
 #include <errno.h>
 #include <signal.h>
 #include <sys/stat.h>
-#include <sys/time.h>
 #include <sys/times.h>
 #include <sys/types.h>
-#include <dirent.h>
 #include <time.h>
 #include <poll.h>
-#include <math.h>
 
 #include "i915/gem.h"
 #include "i915/perf.h"
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index f363db2b..20a83212 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -29,14 +29,8 @@
 #include <inttypes.h>
 #include <errno.h>
 #include <signal.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <sys/times.h>
-#include <sys/types.h>
-#include <dirent.h>
 #include <time.h>
 #include <poll.h>
-#include <sched.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
diff --git a/tests/i915/sysfs_clients.c b/tests/i915/sysfs_clients.c
index ab79ff18..b1d41d89 100644
--- a/tests/i915/sysfs_clients.c
+++ b/tests/i915/sysfs_clients.c
@@ -5,15 +5,11 @@
 
 #include <ctype.h>
 #include <dirent.h>
-#include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>
-#include <limits.h>
 #include <math.h>
 #include <sched.h>
 #include <sys/socket.h>
-#include <sys/stat.h>
-#include <sys/types.h>
 #include <unistd.h>
 
 #include "drmtest.h"
diff --git a/tests/i915/sysfs_defaults.c b/tests/i915/sysfs_defaults.c
index dda27a0a..6ab73491 100644
--- a/tests/i915/sysfs_defaults.c
+++ b/tests/i915/sysfs_defaults.c
@@ -22,11 +22,8 @@
  */
 
 #include <dirent.h>
-#include <errno.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <sys/stat.h>
-#include <sys/types.h>
 #include <unistd.h>
 
 #include "drmtest.h"
diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
index 8cebf627..60661862 100644
--- a/tests/i915/sysfs_heartbeat_interval.c
+++ b/tests/i915/sysfs_heartbeat_interval.c
@@ -24,11 +24,7 @@
 #include <dirent.h>
 #include <errno.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <signal.h>
-#include <sys/stat.h>
-#include <sys/types.h>
-#include <sys/wait.h>
 #include <unistd.h>
 
 #include "igt_params.h"
@@ -37,7 +33,6 @@
 #include "i915/gem_context.h"
 #include "i915/gem_engine_topology.h"
 #include "intel_allocator.h"
-#include "igt_debugfs.h"
 #include "igt_dummyload.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/i915/sysfs_preempt_timeout.c
index 51503828..572a0e75 100644
--- a/tests/i915/sysfs_preempt_timeout.c
+++ b/tests/i915/sysfs_preempt_timeout.c
@@ -24,9 +24,7 @@
 #include <dirent.h>
 #include <errno.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <sched.h>
-#include <sys/types.h>
 #include <unistd.h>
 
 #include "igt.h"
@@ -35,7 +33,6 @@
 #include "i915/gem.h"
 #include "i915/gem_context.h"
 #include "i915/gem_engine_topology.h"
-#include "igt_debugfs.h"
 #include "igt_dummyload.h"
 #include "igt_sysfs.h"
 #include "intel_allocator.h"
diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
index 8a2f1c2f..ef5d7f3d 100644
--- a/tests/i915/sysfs_timeslice_duration.c
+++ b/tests/i915/sysfs_timeslice_duration.c
@@ -24,9 +24,6 @@
 #include <dirent.h>
 #include <errno.h>
 #include <fcntl.h>
-#include <inttypes.h>
-#include <sys/stat.h>
-#include <sys/types.h>
 #include <unistd.h>
 
 #include "igt_params.h"
-- 
2.37.1
