Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFD5112FB1
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 14:29:53 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 31 May 2022 16:28:44 +0200
Message-Id: <20220531142844.278366-14-ryszard.knop@intel.com>
In-Reply-To: <20220531142844.278366-1-ryszard.knop@intel.com>
References: <20220531142844.278366-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 14/14] tests/i915/*: Remove unused headers
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
index 92f44cec..72f22159 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -22,18 +22,13 @@
  */
 
 #include "igt.h"
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
index 3475d35b..608c0b93 100644
--- a/tests/i915/drm_fdinfo.c
+++ b/tests/i915/drm_fdinfo.c
@@ -24,7 +24,6 @@
 
 #include "igt.h"
 #include "igt_core.h"
-#include "igt_device.h"
 #include "igt_drm_fdinfo.h"
 #include "i915/gem.h"
 #include "intel_ctx.h"
diff --git a/tests/i915/gen3_mixed_blits.c b/tests/i915/gen3_mixed_blits.c
index 184effec..d31db701 100644
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
index f01df69e..5db287e5 100644
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
index 9ebb93be..79911003 100644
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
index b8aa0edc..520c87ea 100644
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
index 2d1b2d8e..b9e81616 100644
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
index 67324061..cd7cf2b7 100644
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
index b35f2cb4..3d7d9f1a 100644
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
index f5f98acc..2801a4e0 100644
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
index 2c2c5086..cd83de12 100644
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
index bf145b6c..390f0901 100644
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
index b37f15c2..7764c72e 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -34,7 +34,6 @@
 #include <signal.h>
 #include <errno.h>
 #include <time.h>
-#include <sys/wait.h>
 
 #include "i915/gem.h"
 #include "igt.h"
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
index 1c464f7a..c9e51950 100644
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
index c94c64c4..76ddac84 100644
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
index 814ddb46..73a3324e 100644
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
index b17e5fdb..75d3cd90 100644
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
index 1ccbd11a..dce758c7 100644
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
index e641d5d2..0b0a752a 100644
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
index 1e385beb..11dbdb2f 100644
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
index bc8d1b3c..db72bbd2 100644
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
2.36.1
