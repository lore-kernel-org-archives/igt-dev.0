Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FEA113342
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 14:29:51 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 31 May 2022 16:28:42 +0200
Message-Id: <20220531142844.278366-12-ryszard.knop@intel.com>
In-Reply-To: <20220531142844.278366-1-ryszard.knop@intel.com>
References: <20220531142844.278366-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 12/14] tools: Remove unused headers
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
 tools/cnl_compute_wrpll.c                     |  1 -
 tools/hsw_compute_wrpll.c                     |  3 ---
 tools/i915-perf/i915_perf_configs.c           |  1 -
 tools/i915-perf/i915_perf_reader.c            |  5 -----
 tools/i915-perf/i915_perf_recorder.c          |  4 ----
 tools/igt_compliance_utils.c                  |  3 ---
 tools/igt_dp_compliance_hotplug.c             |  1 -
 tools/igt_stats.c                             |  3 ---
 tools/intel_audio_dump.c                      |  3 ---
 tools/intel_backlight.c                       |  1 -
 tools/intel_bios_dumper.c                     |  1 -
 tools/intel_display_poller.c                  |  3 ---
 tools/intel_dp_compliance.c                   | 11 -----------
 tools/intel_error_decode.c                    |  3 ---
 tools/intel_firmware_decode.c                 |  3 ---
 tools/intel_forcewaked.c                      |  3 ---
 tools/intel_framebuffer_dump.c                |  3 ---
 tools/intel_gem_info.c                        |  2 --
 tools/intel_gpu_top.c                         |  1 -
 tools/intel_gtt.c                             |  3 ---
 tools/intel_guc_logger.c                      |  4 ----
 tools/intel_gvtg_test.c                       | 15 ---------------
 tools/intel_l3_parity.c                       |  3 ---
 tools/intel_l3_udev_listener.c                |  3 ---
 tools/intel_lid.c                             |  5 -----
 tools/intel_opregion_decode.c                 |  2 --
 tools/intel_panel_fitter.c                    |  2 --
 tools/intel_perf_counters.c                   |  3 ---
 tools/intel_pm_rpm.c                          |  3 ---
 tools/intel_reg.c                             |  1 -
 tools/intel_reg_checker.c                     |  3 ---
 tools/intel_residency.c                       |  1 -
 tools/intel_stepping.c                        |  2 --
 tools/intel_vbt_decode.c                      |  3 +--
 tools/intel_watermark.c                       |  1 -
 tools/lsgpu.c                                 |  3 ---
 tools/msm_dp_compliance.c                     | 11 -----------
 tools/null_state_gen/intel_batchbuffer.c      |  1 -
 tools/null_state_gen/intel_null_state_gen.c   |  1 -
 tools/null_state_gen/intel_renderstate_gen8.c |  1 -
 tools/skl_compute_wrpll.c                     |  2 --
 41 files changed, 1 insertion(+), 127 deletions(-)

diff --git a/tools/cnl_compute_wrpll.c b/tools/cnl_compute_wrpll.c
index 9caf69f1..e4fd09e6 100644
--- a/tools/cnl_compute_wrpll.c
+++ b/tools/cnl_compute_wrpll.c
@@ -22,7 +22,6 @@
  */
 
 #include <assert.h>
-#include <inttypes.h>
 #include <limits.h>
 #include <stdio.h>
 #include <stdbool.h>
diff --git a/tools/hsw_compute_wrpll.c b/tools/hsw_compute_wrpll.c
index b1eeb7c7..5a498608 100644
--- a/tools/hsw_compute_wrpll.c
+++ b/tools/hsw_compute_wrpll.c
@@ -23,11 +23,8 @@
 
 #include <inttypes.h>
 #include <stdio.h>
-#include <stdbool.h>
 #include <stdint.h>
-#include <stdlib.h>
 
-#include "intel_io.h"
 #include "drmtest.h"
 
 #define LC_FREQ 2700
diff --git a/tools/i915-perf/i915_perf_configs.c b/tools/i915-perf/i915_perf_configs.c
index bce3bd0f..5ba06bdc 100644
--- a/tools/i915-perf/i915_perf_configs.c
+++ b/tools/i915-perf/i915_perf_configs.c
@@ -33,7 +33,6 @@
 #include <string.h>
 #include <sys/ioctl.h>
 #include <sys/sysmacros.h>
-#include <sys/types.h>
 #include <sys/stat.h>
 #include <unistd.h>
 
diff --git a/tools/i915-perf/i915_perf_reader.c b/tools/i915-perf/i915_perf_reader.c
index e51f5a5d..83242c4a 100644
--- a/tools/i915-perf/i915_perf_reader.c
+++ b/tools/i915-perf/i915_perf_reader.c
@@ -20,23 +20,18 @@
  * SOFTWARE.
  */
 
-#include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <getopt.h>
 #include <inttypes.h>
-#include <stdbool.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <sys/types.h>
-#include <sys/stat.h>
 #include <unistd.h>
 
 #include <i915_drm.h>
 
-#include "igt_core.h"
 #include "intel_chipset.h"
 #include "i915/perf.h"
 #include "i915/perf_data_reader.h"
diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 00195290..f6b7e625 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -21,7 +21,6 @@
  */
 
 #include <assert.h>
-#include <dirent.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <getopt.h>
@@ -35,9 +34,6 @@
 #include <string.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
-#include <sys/sysmacros.h>
-#include <sys/time.h>
-#include <sys/types.h>
 #include <time.h>
 #include <unistd.h>
 
diff --git a/tools/igt_compliance_utils.c b/tools/igt_compliance_utils.c
index 0faf3fc8..e206740d 100644
--- a/tools/igt_compliance_utils.c
+++ b/tools/igt_compliance_utils.c
@@ -24,13 +24,10 @@
  */
 
 #include "igt.h"
-#include <stdio.h>
 #include <string.h>
-#include <stdlib.h>
 #include <signal.h>
 #include <termios.h>
 #include <libgen.h>
-#include <sys/stat.h>
 
 #include "igt_dp_compliance.h"
 
diff --git a/tools/igt_dp_compliance_hotplug.c b/tools/igt_dp_compliance_hotplug.c
index d05e45ca..3e0cf3d5 100644
--- a/tools/igt_dp_compliance_hotplug.c
+++ b/tools/igt_dp_compliance_hotplug.c
@@ -24,7 +24,6 @@
  */
 
 #include "igt.h"
-#include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
 
diff --git a/tools/igt_stats.c b/tools/igt_stats.c
index 105e9bc5..dc4e66ea 100644
--- a/tools/igt_stats.c
+++ b/tools/igt_stats.c
@@ -28,10 +28,7 @@
 
 #include <stdlib.h>
 #include <stdio.h>
-#include <stdint.h>
 #include <string.h>
-#include <errno.h>
-#include <unistd.h>
 
 #include "igt_stats.h"
 
diff --git a/tools/intel_audio_dump.c b/tools/intel_audio_dump.c
index 6d11659e..ecd14ad7 100644
--- a/tools/intel_audio_dump.c
+++ b/tools/intel_audio_dump.c
@@ -26,11 +26,8 @@
  *
  */
 
-#include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <string.h>
-#include <err.h>
 #include <arpa/inet.h>
 #include "intel_io.h"
 #include "intel_reg.h"
diff --git a/tools/intel_backlight.c b/tools/intel_backlight.c
index edf06022..f5e8a3b5 100644
--- a/tools/intel_backlight.c
+++ b/tools/intel_backlight.c
@@ -28,7 +28,6 @@
 #include <stdint.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <string.h>
 
 #include "intel_io.h"
 #include "intel_chipset.h"
diff --git a/tools/intel_bios_dumper.c b/tools/intel_bios_dumper.c
index 85bea97b..2c5246ee 100644
--- a/tools/intel_bios_dumper.c
+++ b/tools/intel_bios_dumper.c
@@ -28,7 +28,6 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <stdarg.h>
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <unistd.h>
diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
index 30d9242c..673a682a 100644
--- a/tools/intel_display_poller.c
+++ b/tools/intel_display_poller.c
@@ -23,19 +23,16 @@
  */
 
 #include <assert.h>
-#include <fcntl.h>
 #include <getopt.h>
 #include <unistd.h>
 #include <signal.h>
 #include <stdbool.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <err.h>
 #include <string.h>
 #include "intel_chipset.h"
 #include "intel_io.h"
 #include "intel_reg.h"
-#include "igt_debugfs.h"
 #include "drmtest.h"
 #include "igt_aux.h"
 
diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 2e20d7f0..7390348f 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -109,27 +109,16 @@
 #include "igt.h"
 #include <errno.h>
 #include <getopt.h>
-#include <math.h>
 #include <stdint.h>
 #include <stdbool.h>
 #include <strings.h>
 #include <unistd.h>
-#include <termios.h>
-#include <sys/poll.h>
-#include <sys/time.h>
-#include <sys/ioctl.h>
-#include <sys/types.h>
 #include <sys/stat.h>
-#include <sys/select.h>
-#include <assert.h>
-#include <signal.h>
 #include <fcntl.h>
-#include <time.h>
 
 #include "igt_dp_compliance.h"
 
 #include <stdlib.h>
-#include <signal.h>
 
 /* User Input definitions */
 #define HELP_DESCRIPTION 1
diff --git a/tools/intel_error_decode.c b/tools/intel_error_decode.c
index 90a18a07..bb16110e 100644
--- a/tools/intel_error_decode.c
+++ b/tools/intel_error_decode.c
@@ -41,7 +41,6 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <stdarg.h>
 #include <string.h>
 #include <unistd.h>
 #include <inttypes.h>
@@ -54,10 +53,8 @@
 #include <ctype.h>
 
 #include "intel_chipset.h"
-#include "intel_io.h"
 #include "instdone.h"
 #include "intel_reg.h"
-#include "drmtest.h"
 
 static uint32_t
 print_head(unsigned int reg)
diff --git a/tools/intel_firmware_decode.c b/tools/intel_firmware_decode.c
index 61ce3a53..b750a771 100644
--- a/tools/intel_firmware_decode.c
+++ b/tools/intel_firmware_decode.c
@@ -28,10 +28,7 @@
 #include <inttypes.h>
 #include <stdio.h>
 #include <stdint.h>
-#include <stdlib.h>
 #include <string.h>
-#include <unistd.h>
-#include <sys/types.h>
 #include <sys/mman.h>
 #include <sys/stat.h>
 
diff --git a/tools/intel_forcewaked.c b/tools/intel_forcewaked.c
index 87b26d43..0864357c 100644
--- a/tools/intel_forcewaked.c
+++ b/tools/intel_forcewaked.c
@@ -26,9 +26,7 @@
  */
 
 #include <assert.h>
-#include <err.h>
 #include <string.h>
-#include <stdarg.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -36,7 +34,6 @@
 #include <unistd.h>
 #include "intel_io.h"
 #include "intel_chipset.h"
-#include "drmtest.h"
 
 bool daemonized;
 
diff --git a/tools/intel_framebuffer_dump.c b/tools/intel_framebuffer_dump.c
index 79c0688b..420167b8 100644
--- a/tools/intel_framebuffer_dump.c
+++ b/tools/intel_framebuffer_dump.c
@@ -26,15 +26,12 @@
  * Read back all the KMS framebuffers attached to the CRTC and record as PNG.
  */
 
-#include <stdint.h>
-#include <sys/types.h>
 #include <sys/mman.h>
 #include <errno.h>
 #include <xf86drmMode.h>
 #include <i915_drm.h>
 #include <cairo.h>
 
-#include "intel_io.h"
 #include "drmtest.h"
 
 int main(int argc, char **argv)
diff --git a/tools/intel_gem_info.c b/tools/intel_gem_info.c
index 75444438..3700d20e 100644
--- a/tools/intel_gem_info.c
+++ b/tools/intel_gem_info.c
@@ -1,8 +1,6 @@
 #include "igt.h"
 #include <sys/ioctl.h>
-#include <fcntl.h>
 #include <errno.h>
-#include <string.h>
 #include <signal.h>
 #include <i915_drm.h>
 
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 26986a82..7c1c7444 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -40,7 +40,6 @@
 #include <string.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
-#include <sys/types.h>
 #include <unistd.h>
 #include <termios.h>
 #include <sys/sysmacros.h>
diff --git a/tools/intel_gtt.c b/tools/intel_gtt.c
index 311694ba..80ba0293 100644
--- a/tools/intel_gtt.c
+++ b/tools/intel_gtt.c
@@ -30,11 +30,8 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <stdarg.h>
 #include <pciaccess.h>
-#include <unistd.h>
 
-#include "intel_io.h"
 #include "intel_chipset.h"
 
 #define KB(x) ((x) * 1024)
diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index 5f1de8db..ec76eb30 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -26,18 +26,14 @@
 #include <stdio.h>
 #include <fcntl.h>
 #include <sched.h>
-#include <sys/ioctl.h>
 #include <string.h>
 #include <errno.h>
 #include <signal.h>
 #include <stdlib.h>
 #include <unistd.h>
 #include <sys/poll.h>
-#include <sys/wait.h>
 #include <sys/types.h>
-#include <sys/syscall.h>
 #include <sys/mman.h>
-#include <assert.h>
 #include <pthread.h>
 
 #include "igt.h"
diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c
index ad5ee6a6..4ede5f08 100644
--- a/tools/intel_gvtg_test.c
+++ b/tools/intel_gvtg_test.c
@@ -28,31 +28,16 @@
  * TODO:
  * Enable more GVT-g related test cases.
  */
-#include "config.h"
 
 #include "igt.h"
 #include <errno.h>
 #include <getopt.h>
-#include <math.h>
-#include <stdint.h>
-#include <stdbool.h>
 #include <strings.h>
 #include <unistd.h>
-#include <termios.h>
-#include <sys/poll.h>
-#include <sys/time.h>
-#include <sys/ioctl.h>
-#include <sys/types.h>
-#include <sys/stat.h>
 #include <string.h>
 #include <stdlib.h>
-#include <signal.h>
 #include <stdio.h>
-#include <stdlib.h>
-#include <time.h>
-#include <unistd.h>
 #include <pwd.h>
-#include <limits.h>
 #include <dirent.h>
 
 #define RANDOM(x) (rand() % x)
diff --git a/tools/intel_l3_parity.c b/tools/intel_l3_parity.c
index 8225b272..2faac29e 100644
--- a/tools/intel_l3_parity.c
+++ b/tools/intel_l3_parity.c
@@ -25,8 +25,6 @@
  *
  */
 
-#include <sys/types.h>
-#include <sys/stat.h>
 #include <assert.h>
 #include <fcntl.h>
 #include <stdio.h>
@@ -39,7 +37,6 @@
 #include "igt_device.h"
 #include "igt_sysfs.h"
 #include "drmtest.h"
-#include "config.h"
 #include <libudev.h>
 #include <syslog.h>
 #include "intel_l3_parity.h"
diff --git a/tools/intel_l3_udev_listener.c b/tools/intel_l3_udev_listener.c
index ff62f407..084ed689 100644
--- a/tools/intel_l3_udev_listener.c
+++ b/tools/intel_l3_udev_listener.c
@@ -21,13 +21,10 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-#include "config.h"
-
 #include <libudev.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <unistd.h>
 #include <assert.h>
 #include <syslog.h>
 #include "i915_drm.h"
diff --git a/tools/intel_lid.c b/tools/intel_lid.c
index 2a1d9800..a9b46d5f 100644
--- a/tools/intel_lid.c
+++ b/tools/intel_lid.c
@@ -28,14 +28,9 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <stdarg.h>
-#include <pciaccess.h>
-#include <err.h>
 #include <fcntl.h>
 #include <unistd.h>
 #include <dirent.h>
-#include <sys/stat.h>
-#include <sys/types.h>
 
 #include "intel_io.h"
 #include "intel_reg.h"
diff --git a/tools/intel_opregion_decode.c b/tools/intel_opregion_decode.c
index b0a503e1..f75c3c4b 100644
--- a/tools/intel_opregion_decode.c
+++ b/tools/intel_opregion_decode.c
@@ -36,9 +36,7 @@
 #include <unistd.h>
 #include <sys/mman.h>
 #include <sys/stat.h>
-#include <sys/types.h>
 
-#include "intel_io.h"
 #include "drmtest.h"
 
 #define OPREGION_HEADER_OFFSET		0
diff --git a/tools/intel_panel_fitter.c b/tools/intel_panel_fitter.c
index c6ee2101..6f65542a 100644
--- a/tools/intel_panel_fitter.c
+++ b/tools/intel_panel_fitter.c
@@ -29,11 +29,9 @@
 #include <stdio.h>
 #include <unistd.h>
 #include <stdlib.h>
-#include <string.h>
 #include "intel_io.h"
 #include "intel_chipset.h"
 #include "intel_reg.h"
-#include "drmtest.h"
 
 int gen;
 
diff --git a/tools/intel_perf_counters.c b/tools/intel_perf_counters.c
index d297f2e8..1b85c992 100644
--- a/tools/intel_perf_counters.c
+++ b/tools/intel_perf_counters.c
@@ -39,10 +39,7 @@
 #include <stdbool.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <err.h>
-#include <sys/ioctl.h>
 
-#include "drm.h"
 #include "i915_drm.h"
 #include "igt_device.h"
 #include "drmtest.h"
diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index 53ad252d..85ae115a 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -22,10 +22,7 @@
  *
  */
 
-#include <errno.h>
 #include <getopt.h>
-#include <glib.h>
-#include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <stdbool.h>
diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 584a2ccd..6ff34b4e 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -29,7 +29,6 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/stat.h>
-#include <sys/types.h>
 #include <unistd.h>
 
 #include "i915/gem_create.h"
diff --git a/tools/intel_reg_checker.c b/tools/intel_reg_checker.c
index 2aefabc6..01074a6d 100644
--- a/tools/intel_reg_checker.c
+++ b/tools/intel_reg_checker.c
@@ -21,10 +21,7 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
 #include <stdio.h>
-#include <err.h>
-#include <string.h>
 #include <stdbool.h>
 #include "intel_io.h"
 #include "intel_chipset.h"
diff --git a/tools/intel_residency.c b/tools/intel_residency.c
index 0932e362..1d329e1f 100644
--- a/tools/intel_residency.c
+++ b/tools/intel_residency.c
@@ -25,7 +25,6 @@
  */
 
 #include <sys/time.h>
-#include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <inttypes.h>
diff --git a/tools/intel_stepping.c b/tools/intel_stepping.c
index 7839ef59..88b37856 100644
--- a/tools/intel_stepping.c
+++ b/tools/intel_stepping.c
@@ -28,11 +28,9 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <stdarg.h>
 #include <pciaccess.h>
 #include <err.h>
 #include "intel_chipset.h"
-#include "intel_io.h"
 #include "intel_reg.h"
 
 static void
diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index b063af84..95641901 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1,5 +1,5 @@
 /*
- * Copyright © 2006 Intel Corporation
+ * Copyright ï¿½ 2006 Intel Corporation
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -35,7 +35,6 @@
 #include <unistd.h>
 #include <sys/mman.h>
 #include <sys/stat.h>
-#include <sys/types.h>
 
 #include "igt_aux.h"
 #include "intel_io.h"
diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
index 1e235ed3..51e1e8c0 100644
--- a/tools/intel_watermark.c
+++ b/tools/intel_watermark.c
@@ -27,7 +27,6 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <stdbool.h>
-#include <err.h>
 #include <string.h>
 #include "intel_io.h"
 #include "intel_chipset.h"
diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 27e76f26..fefb13be 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -24,9 +24,6 @@
 
 #include "igt_device_scan.h"
 #include "igt.h"
-#include <sys/ioctl.h>
-#include <fcntl.h>
-#include <errno.h>
 #include <string.h>
 #include <signal.h>
 #include <glib.h>
diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
index 6941d385..e7d4524e 100644
--- a/tools/msm_dp_compliance.c
+++ b/tools/msm_dp_compliance.c
@@ -110,27 +110,16 @@
 #include "igt.h"
 #include <errno.h>
 #include <getopt.h>
-#include <math.h>
 #include <stdint.h>
 #include <stdbool.h>
 #include <strings.h>
 #include <unistd.h>
-#include <termios.h>
-#include <sys/poll.h>
-#include <sys/time.h>
-#include <sys/ioctl.h>
-#include <sys/types.h>
 #include <sys/stat.h>
-#include <sys/select.h>
-#include <assert.h>
-#include <signal.h>
 #include <fcntl.h>
-#include <time.h>
 
 #include "igt_dp_compliance.h"
 
 #include <stdlib.h>
-#include <signal.h>
 
 /* User Input definitions */
 #define HELP_DESCRIPTION 1
diff --git a/tools/null_state_gen/intel_batchbuffer.c b/tools/null_state_gen/intel_batchbuffer.c
index 2ead22e1..7f5de7ad 100644
--- a/tools/null_state_gen/intel_batchbuffer.c
+++ b/tools/null_state_gen/intel_batchbuffer.c
@@ -31,7 +31,6 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <errno.h>
 #include <assert.h>
 
 #include "intel_batchbuffer.h"
diff --git a/tools/null_state_gen/intel_null_state_gen.c b/tools/null_state_gen/intel_null_state_gen.c
index 7d5887eb..9cefe183 100644
--- a/tools/null_state_gen/intel_null_state_gen.c
+++ b/tools/null_state_gen/intel_null_state_gen.c
@@ -28,7 +28,6 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <errno.h>
-#include <assert.h>
 
 #include "intel_renderstate.h"
 #include "intel_batchbuffer.h"
diff --git a/tools/null_state_gen/intel_renderstate_gen8.c b/tools/null_state_gen/intel_renderstate_gen8.c
index 17822c44..de2ef06f 100644
--- a/tools/null_state_gen/intel_renderstate_gen8.c
+++ b/tools/null_state_gen/intel_renderstate_gen8.c
@@ -28,7 +28,6 @@
 #include "intel_batchbuffer.h"
 #include <lib/gen8_render.h>
 #include <lib/intel_reg.h>
-#include <string.h>
 
 static void gen8_emit_wm(struct intel_batchbuffer *batch)
 {
diff --git a/tools/skl_compute_wrpll.c b/tools/skl_compute_wrpll.c
index 0e5965cf..65438aed 100644
--- a/tools/skl_compute_wrpll.c
+++ b/tools/skl_compute_wrpll.c
@@ -23,11 +23,9 @@
 
 #include <assert.h>
 #include <inttypes.h>
-#include <limits.h>
 #include <stdio.h>
 #include <stdbool.h>
 #include <stdint.h>
-#include <stdlib.h>
 #include <string.h>
 
 #include "igt_stats.h"
-- 
2.36.1
