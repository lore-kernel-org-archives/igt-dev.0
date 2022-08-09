Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03B7D474F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:08 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:20 +0200
Message-Id: <20220809125037.1231032-2-ryszard.knop@intel.com>
In-Reply-To: <20220809125037.1231032-1-ryszard.knop@intel.com>
References: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 01/19] lib: Remove unused headers
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
 lib/drmtest.c                        | 18 ------------------
 lib/i915/gem_mman.c                  |  1 -
 lib/i915/gem_scheduler.c             |  1 -
 lib/i915/i915_blt.c                  |  4 ----
 lib/i915/intel_memory_region.c       |  7 -------
 lib/i915/perf.c                      |  1 -
 lib/i915/perf_data_reader.c          |  2 --
 lib/igt.h                            | 13 +++++++------
 lib/igt_alsa.c                       |  4 ----
 lib/igt_audio.c                      |  2 --
 lib/igt_aux.c                        | 15 ---------------
 lib/igt_chamelium.c                  |  1 -
 lib/igt_chamelium_stream.c           |  2 --
 lib/igt_core.c                       | 11 -----------
 lib/igt_debugfs.c                    |  3 ---
 lib/igt_device.c                     |  1 -
 lib/igt_device_scan.c                |  1 -
 lib/igt_drm_fdinfo.c                 |  1 -
 lib/igt_dummyload.c                  |  1 -
 lib/igt_edid.c                       |  2 --
 lib/igt_eld.c                        |  4 ----
 lib/igt_frame.c                      |  2 --
 lib/igt_gt.c                         |  5 -----
 lib/igt_infoframe.c                  |  2 --
 lib/igt_kms.c                        |  3 ---
 lib/igt_msm.c                        |  3 ---
 lib/igt_nouveau.c                    |  1 -
 lib/igt_os.c                         |  4 ----
 lib/igt_panfrost.c                   |  9 +--------
 lib/igt_params.c                     |  1 -
 lib/igt_pm.c                         |  1 -
 lib/igt_primes.c                     |  1 -
 lib/igt_rapl.c                       |  1 -
 lib/igt_sysfs.c                      |  5 -----
 lib/igt_thread.c                     |  2 --
 lib/igt_v3d.c                        |  8 --------
 lib/igt_vc4.c                        |  7 -------
 lib/igt_x86.c                        |  1 -
 lib/instdone.c                       |  1 -
 lib/intel_allocator_msgchannel.c     |  1 -
 lib/intel_allocator_random.c         |  2 --
 lib/intel_allocator_reloc.c          |  2 --
 lib/intel_allocator_simple.c         |  3 ---
 lib/intel_batchbuffer.c              |  3 ---
 lib/intel_chipset.c                  |  7 -------
 lib/intel_device_info.c              |  2 --
 lib/intel_iosf.c                     |  3 ---
 lib/intel_mmio.c                     |  7 -------
 lib/intel_reg_map.c                  |  3 ---
 lib/ioctl_wrappers.c                 | 15 ---------------
 lib/media_fill.c                     |  1 -
 lib/media_spin.c                     |  1 -
 lib/nouveau/cea0b5.c                 |  2 --
 lib/rendercopy_gen6.c                | 11 -----------
 lib/rendercopy_gen7.c                | 11 -----------
 lib/rendercopy_gen8.c                | 13 -------------
 lib/rendercopy_gen9.c                | 13 -------------
 lib/rendercopy_i830.c                |  9 ---------
 lib/rendercopy_i915.c                |  9 ---------
 lib/sw_sync.c                        |  3 ---
 lib/tests/igt_assert.c               |  3 ---
 lib/tests/igt_audio.c                |  2 --
 lib/tests/igt_conflicting_args.c     |  2 --
 lib/tests/igt_describe.c             |  1 -
 lib/tests/igt_dynamic_subtests.c     |  1 -
 lib/tests/igt_edid.c                 |  2 --
 lib/tests/igt_exit_handler.c         |  1 -
 lib/tests/igt_fork.c                 |  1 -
 lib/tests/igt_fork_helper.c          |  1 -
 lib/tests/igt_invalid_subtest_name.c |  1 -
 lib/tests/igt_segfault.c             |  3 ---
 lib/tests/igt_simulation.c           |  3 ---
 lib/veboxcopy_gen12.c                |  1 -
 73 files changed, 8 insertions(+), 287 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 16e80bdf..7acea58b 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -26,42 +26,24 @@
  *
  */
 
-#ifdef HAVE_LIBGEN_H
-#include <libgen.h>
-#endif
 #include <stdio.h>
 #include <fcntl.h>
 #include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <string.h>
-#include <sys/mman.h>
-#include <signal.h>
-#include <pciaccess.h>
-#include <stdlib.h>
 #include <unistd.h>
-#include <sys/wait.h>
 #include <sys/types.h>
-#include <sys/syscall.h>
-#include <sys/utsname.h>
-#include <termios.h>
 #include <pthread.h>
 
 #include "drmtest.h"
 #include "i915_drm.h"
 #include "i915/gem.h"
-#include "intel_chipset.h"
-#include "intel_io.h"
 #include "igt_debugfs.h"
 #include "igt_device.h"
-#include "igt_gt.h"
 #include "igt_kmod.h"
 #include "igt_params.h"
-#include "igt_sysfs.h"
 #include "igt_device_scan.h"
 #include "version.h"
 #include "config.h"
-#include "intel_reg.h"
-#include "ioctl_wrappers.h"
 #include "igt_dummyload.h"
 
 /**
diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index aa9ac6f3..ec9feccf 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -27,7 +27,6 @@
 #include <errno.h>
 
 #include "igt_core.h"
-#include "igt_gt.h"
 #include "igt_device.h"
 #include "ioctl_wrappers.h"
 #include "intel_chipset.h"
diff --git a/lib/i915/gem_scheduler.c b/lib/i915/gem_scheduler.c
index 0087df90..e80c775a 100644
--- a/lib/i915/gem_scheduler.c
+++ b/lib/i915/gem_scheduler.c
@@ -28,7 +28,6 @@
 #include "igt_core.h"
 #include "ioctl_wrappers.h"
 
-#include "i915/i915_drm_local.h"
 #include "i915/gem_scheduler.h"
 #include "i915/gem_submission.h"
 
diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index 8d46e51f..d2d13a53 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -3,12 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
 #include <malloc.h>
 #include <cairo.h>
-#include "drm.h"
 #include "igt.h"
 #include "gem_create.h"
 #include "i915_blt.h"
diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 93a18982..d4071db2 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -21,12 +21,9 @@
  * IN THE SOFTWARE.
  */
 
-#include <linux/limits.h>
 #include <signal.h>
 #include <sys/ioctl.h>
-#include <sys/time.h>
 #include <sys/types.h>
-#include <sys/stat.h>
 #include <fcntl.h>
 #include <pthread.h>
 
@@ -36,12 +33,8 @@
 #include "ioctl_wrappers.h"
 #include "igt_aux.h"
 #include "igt_dummyload.h"
-#include "igt_gt.h"
-#include "igt_params.h"
-#include "igt_sysfs.h"
 #include "intel_chipset.h"
 #include "igt_collection.h"
-#include "igt_device.h"
 #include "gem_mman.h"
 
 #include "i915/intel_memory_region.h"
diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index d88835ff..ebb038c6 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -30,7 +30,6 @@
 #include <sys/ioctl.h>
 #include <sys/stat.h>
 #include <sys/sysmacros.h>
-#include <sys/types.h>
 #include <unistd.h>
 
 #include <i915_drm.h>
diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
index e69189ac..d73a7e31 100644
--- a/lib/i915/perf_data_reader.c
+++ b/lib/i915/perf_data_reader.c
@@ -26,9 +26,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/mman.h>
-#include <sys/types.h>
 #include <sys/stat.h>
-#include <unistd.h>
 
 #include <i915_drm.h>
 
diff --git a/lib/igt.h b/lib/igt.h
index 96a368e1..869515e8 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -39,12 +39,6 @@
 #include "igt_params.h"
 #include "igt_pm.h"
 #include "igt_stats.h"
-#ifdef HAVE_CHAMELIUM
-#include "igt_alsa.h"
-#include "igt_audio.h"
-#include "igt_chamelium.h"
-#include "igt_chamelium_stream.h"
-#endif
 #include "instdone.h"
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
@@ -56,4 +50,11 @@
 #include "i915/gem_mman.h"
 #include "i915/gem_engine_topology.h"
 
+#ifdef HAVE_CHAMELIUM
+#include "igt_alsa.h"
+#include "igt_audio.h"
+#include "igt_chamelium.h"
+#include "igt_chamelium_stream.h"
+#endif
+
 #endif /* IGT_H */
diff --git a/lib/igt_alsa.c b/lib/igt_alsa.c
index e1836be7..67ac7c37 100644
--- a/lib/igt_alsa.c
+++ b/lib/igt_alsa.c
@@ -24,10 +24,6 @@
  *  Paul Kocialkowski <paul.kocialkowski@linux.intel.com>
  */
 
-#include "config.h"
-
-#include <limits.h>
-
 #include "igt_alsa.h"
 #include "igt_aux.h"
 #include "igt_core.h"
diff --git a/lib/igt_audio.c b/lib/igt_audio.c
index e0b1bafe..ec020e95 100644
--- a/lib/igt_audio.c
+++ b/lib/igt_audio.c
@@ -24,8 +24,6 @@
  *  Paul Kocialkowski <paul.kocialkowski@linux.intel.com>
  */
 
-#include "config.h"
-
 #include <errno.h>
 #include <fcntl.h>
 #include <gsl/gsl_fft_real.h>
diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index d80a1935..c222ddac 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -37,17 +37,12 @@
 #include <string.h>
 #include <sys/mman.h>
 #include <signal.h>
-#include <pciaccess.h>
 #include <stdlib.h>
 #include <time.h>
 #include <unistd.h>
 #include <sys/poll.h>
 #include <sys/wait.h>
 #include <sys/resource.h>
-#include <sys/time.h>
-#include <sys/types.h>
-#include <sys/syscall.h>
-#include <sys/utsname.h>
 #include <termios.h>
 #include <assert.h>
 #include <grp.h>
@@ -56,24 +51,14 @@
 #include <libudev.h>
 
 #include "drmtest.h"
-#include "i915_drm.h"
-#include "intel_chipset.h"
 #include "igt_aux.h"
 #include "igt_debugfs.h"
-#include "igt_gt.h"
 #include "igt_params.h"
 #include "igt_rand.h"
 #include "igt_sysfs.h"
 #include "config.h"
-#include "intel_reg.h"
 #include "ioctl_wrappers.h"
-#include "igt_kms.h"
 #include "igt_stats.h"
-#include "igt_sysfs.h"
-
-#ifdef HAVE_LIBGEN_H
-#include <libgen.h>   /* for dirname() */
-#endif
 
 /**
  * SECTION:igt_aux
diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 7b790064..e6fc3d61 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -28,7 +28,6 @@
 
 #include <stdbool.h>
 #include <string.h>
-#include <errno.h>
 #include <math.h>
 #include <xmlrpc-c/base.h>
 #include <xmlrpc-c/client.h>
diff --git a/lib/igt_chamelium_stream.c b/lib/igt_chamelium_stream.c
index a8cd19e5..58f30d97 100644
--- a/lib/igt_chamelium_stream.c
+++ b/lib/igt_chamelium_stream.c
@@ -23,8 +23,6 @@
  * Authors: Simon Ser <simon.ser@intel.com>
  */
 
-#include "config.h"
-
 #include <arpa/inet.h>
 #include <errno.h>
 #include <netdb.h>
diff --git a/lib/igt_core.c b/lib/igt_core.c
index e7425326..73a8b22c 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -32,10 +32,7 @@
 #include <stdio.h>
 #include <assert.h>
 #include <fcntl.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <string.h>
-#include <sys/mman.h>
 #include <signal.h>
 #include <pciaccess.h>
 #include <getopt.h>
@@ -48,7 +45,6 @@
 #endif
 #include <pthread.h>
 #include <sys/utsname.h>
-#include <termios.h>
 #include <errno.h>
 #include <time.h>
 #include <ctype.h>
@@ -61,8 +57,6 @@
 #include "i915/gem_create.h"
 #include "intel_allocator.h"
 #include "intel_batchbuffer.h"
-#include "intel_chipset.h"
-#include "intel_io.h"
 #include "igt_debugfs.h"
 #include "igt_dummyload.h"
 #include "version.h"
@@ -72,7 +66,6 @@
 #include "igt_aux.h"
 #include "igt_sysfs.h"
 #include "igt_sysrq.h"
-#include "igt_rc.h"
 #include "igt_list.h"
 #include "igt_device_scan.h"
 #include "igt_thread.h"
@@ -81,10 +74,6 @@
 #include <libunwind.h>
 #include <elfutils/libdwfl.h>
 
-#ifdef HAVE_LIBGEN_H
-#include <libgen.h>   /* for basename() on Solaris */
-#endif
-
 /**
  * SECTION:igt_core
  * @short_description: Core i-g-t testing support
diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a56688a5..ca893c12 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -26,15 +26,12 @@
 #include <sys/stat.h>
 #include <sys/mount.h>
 #include <sys/sysmacros.h>
-#include <dirent.h>
 #include <errno.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <limits.h>
 #include <string.h>
 #include <fcntl.h>
 #include <unistd.h>
-#include <i915_drm.h>
 #include <poll.h>
 
 #include "drmtest.h"
diff --git a/lib/igt_device.c b/lib/igt_device.c
index fddfba72..83ae7b21 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -21,7 +21,6 @@
  * IN THE SOFTWARE.
  *
  */
-#include <sys/types.h>
 #include <fcntl.h>
 
 #include <sys/stat.h>
diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index d6fae065..ada14f54 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -28,7 +28,6 @@
 #include "intel_chipset.h"
 
 #include <ctype.h>
-#include <dirent.h>
 #include <fcntl.h>
 #include <glib.h>
 #include <libudev.h>
diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 250d9e89..15ad6207 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -24,7 +24,6 @@
 
 #include <ctype.h>
 #include <sys/types.h>
-#include <sys/stat.h>
 #include <fcntl.h>
 #include <stdio.h>
 #include <string.h>
diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index dc1bd51e..0c949177 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -35,7 +35,6 @@
 #include "i915/gem_engine_topology.h"
 #include "i915/gem_mman.h"
 #include "i915/gem_submission.h"
-#include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_device.h"
 #include "igt_dummyload.h"
diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index bff13a0d..cfdb1649 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -23,8 +23,6 @@
  * Authors: Simon Ser <simon.ser@intel.com>
  */
 
-#include "config.h"
-
 #include <assert.h>
 #include <string.h>
 #include <stdint.h>
diff --git a/lib/igt_eld.c b/lib/igt_eld.c
index ef6625df..ece2d304 100644
--- a/lib/igt_eld.c
+++ b/lib/igt_eld.c
@@ -23,12 +23,8 @@
  * Authors: Simon Ser <simon.ser@intel.com>
  */
 
-#include "config.h"
-
 #include <dirent.h>
-#include <errno.h>
 #include <glob.h>
-#include <stdint.h>
 #include <stdio.h>
 #include <string.h>
 
diff --git a/lib/igt_frame.c b/lib/igt_frame.c
index 45523a79..2a41b9c6 100644
--- a/lib/igt_frame.c
+++ b/lib/igt_frame.c
@@ -24,8 +24,6 @@
  *  Paul Kocialkowski <paul.kocialkowski@linux.intel.com>
  */
 
-#include "config.h"
-
 #include <fcntl.h>
 #include <pixman.h>
 #include <cairo.h>
diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index d4a825e6..85f9561e 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -26,14 +26,10 @@
 #include <strings.h>
 #include <signal.h>
 #include <errno.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <fcntl.h>
 
 #include "drmtest.h"
 #include "i915/gem.h"
-#include "i915/gem_engine_topology.h"
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_gt.h"
@@ -41,7 +37,6 @@
 #include "igt_sysfs.h"
 #include "igt_debugfs.h"
 #include "ioctl_wrappers.h"
-#include "intel_reg.h"
 #include "intel_chipset.h"
 #include "igt_dummyload.h"
 
diff --git a/lib/igt_infoframe.c b/lib/igt_infoframe.c
index 2e14fe70..618b33e4 100644
--- a/lib/igt_infoframe.c
+++ b/lib/igt_infoframe.c
@@ -23,8 +23,6 @@
  * Authors: Simon Ser <simon.ser@intel.com>
  */
 
-#include "config.h"
-
 #include <string.h>
 
 #include "igt_core.h"
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1ba3bd2a..0022ca4d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -34,7 +34,6 @@
 #include <stdio.h>
 #include <stdarg.h>
 #include <fcntl.h>
-#include <sys/stat.h>
 #include <string.h>
 #include <stdlib.h>
 #ifdef HAVE_LINUX_KD_H
@@ -54,11 +53,9 @@
 #include "igt_kms.h"
 #include "igt_aux.h"
 #include "igt_edid.h"
-#include "intel_chipset.h"
 #include "igt_debugfs.h"
 #include "igt_device.h"
 #include "igt_sysfs.h"
-#include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
diff --git a/lib/igt_msm.c b/lib/igt_msm.c
index e9cf588f..6841d1e0 100644
--- a/lib/igt_msm.c
+++ b/lib/igt_msm.c
@@ -26,13 +26,10 @@
 #include <signal.h>
 #include <errno.h>
 #include <sys/mman.h>
-#include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
-#include <fcntl.h>
 
 #include "drmtest.h"
-#include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_msm.h"
 #include "ioctl_wrappers.h"
diff --git a/lib/igt_nouveau.c b/lib/igt_nouveau.c
index fdf6020a..0a1326e9 100644
--- a/lib/igt_nouveau.c
+++ b/lib/igt_nouveau.c
@@ -32,7 +32,6 @@
 #include "igt_nouveau.h"
 
 #include "nouveau/nvif/push.h"
-#include "nouveau/nvhw/class/cla0b5.h"
 #include "nouveau/priv.h"
 
 #define PASCAL_DMA_COPY_A                                                            (0x0000C0B5)
diff --git a/lib/igt_os.c b/lib/igt_os.c
index bdd5d933..74d06181 100644
--- a/lib/igt_os.c
+++ b/lib/igt_os.c
@@ -34,11 +34,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <errno.h>
-#include <err.h>
-#include <assert.h>
-#include <sys/ioctl.h>
 #include <fcntl.h>
-#include <sys/stat.h>
 #include <sys/mman.h>
 #ifdef HAVE_STRUCT_SYSINFO_TOTALRAM
 #include <sys/sysinfo.h>
diff --git a/lib/igt_panfrost.c b/lib/igt_panfrost.c
index f63611b9..e331ed82 100644
--- a/lib/igt_panfrost.c
+++ b/lib/igt_panfrost.c
@@ -22,22 +22,15 @@
  * IN THE SOFTWARE.
  */
 
-#include <assert.h>
 #include <string.h>
-#include <signal.h>
+#include <stddef.h>
 #include <errno.h>
 #include <sys/mman.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <fcntl.h>
 
 #include "drmtest.h"
-#include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_panfrost.h"
 #include "ioctl_wrappers.h"
-#include "intel_reg.h"
 #include "intel_chipset.h"
 #include "panfrost_drm.h"
 #include "panfrost-job.h"
diff --git a/lib/igt_params.c b/lib/igt_params.c
index 3dad317a..f3a985c5 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -27,7 +27,6 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <sys/ioctl.h>
-#include <sys/stat.h>
 
 #include <i915_drm.h>
 
diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 6ebbad33..d453b5e6 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -34,7 +34,6 @@
 #include <unistd.h>
 #include <sys/stat.h>
 #include <sys/sysmacros.h>
-#include <sys/types.h>
 #include <dirent.h>
 
 #include "drmtest.h"
diff --git a/lib/igt_primes.c b/lib/igt_primes.c
index 3941bb21..10671d31 100644
--- a/lib/igt_primes.c
+++ b/lib/igt_primes.c
@@ -24,7 +24,6 @@
 #include "igt_primes.h"
 
 #include <stdlib.h>
-#include <stdbool.h>
 #include <string.h>
 #include <math.h>
 
diff --git a/lib/igt_rapl.c b/lib/igt_rapl.c
index 03e49226..fb1b75c1 100644
--- a/lib/igt_rapl.c
+++ b/lib/igt_rapl.c
@@ -1,4 +1,3 @@
-#include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <locale.h>
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 40c9a2e3..857773e8 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -25,7 +25,6 @@
 #include <inttypes.h>
 #include <sys/stat.h>
 #include <sys/sysmacros.h>
-#include <sys/mount.h>
 #include <errno.h>
 #include <stdarg.h>
 #include <stdio.h>
@@ -34,14 +33,10 @@
 #include <string.h>
 #include <fcntl.h>
 #include <unistd.h>
-#include <i915_drm.h>
 #include <dirent.h>
-#include <unistd.h>
-#include <fcntl.h>
 
 #include "igt_core.h"
 #include "igt_sysfs.h"
-#include "igt_device.h"
 #include "igt_io.h"
 
 /**
diff --git a/lib/igt_thread.c b/lib/igt_thread.c
index 5bdda410..06ea72b3 100644
--- a/lib/igt_thread.c
+++ b/lib/igt_thread.c
@@ -22,8 +22,6 @@
  */
 
 #include <pthread.h>
-#include <stdlib.h>
-#include <stdatomic.h>
 
 #include "igt_core.h"
 #include "igt_thread.h"
diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
index 619c072c..88ec75f6 100644
--- a/lib/igt_v3d.c
+++ b/lib/igt_v3d.c
@@ -21,22 +21,14 @@
  * IN THE SOFTWARE.
  */
 
-#include <assert.h>
 #include <string.h>
-#include <signal.h>
 #include <errno.h>
 #include <sys/mman.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <fcntl.h>
 
 #include "drmtest.h"
-#include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_v3d.h"
 #include "ioctl_wrappers.h"
-#include "intel_reg.h"
 #include "intel_chipset.h"
 #include "v3d_drm.h"
 
diff --git a/lib/igt_vc4.c b/lib/igt_vc4.c
index 4415fa32..e3f76765 100644
--- a/lib/igt_vc4.c
+++ b/lib/igt_vc4.c
@@ -23,21 +23,14 @@
 
 #include <assert.h>
 #include <string.h>
-#include <signal.h>
 #include <errno.h>
 #include <sys/mman.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <fcntl.h>
 
 #include "drmtest.h"
-#include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_fb.h"
 #include "igt_vc4.h"
 #include "ioctl_wrappers.h"
-#include "intel_reg.h"
 #include "intel_chipset.h"
 #include "vc4_drm.h"
 #include "vc4_packet.h"
diff --git a/lib/igt_x86.c b/lib/igt_x86.c
index 6ac700df..4dce3be5 100644
--- a/lib/igt_x86.c
+++ b/lib/igt_x86.c
@@ -38,7 +38,6 @@
 #include "igt_x86.h"
 #include "igt_aux.h"
 
-#include <stdint.h>
 #include <stdio.h>
 #include <string.h>
 
diff --git a/lib/instdone.c b/lib/instdone.c
index a83f8836..d3d8d8e7 100644
--- a/lib/instdone.c
+++ b/lib/instdone.c
@@ -25,7 +25,6 @@
  *
  */
 
-#include <assert.h>
 #include "instdone.h"
 
 #include "intel_chipset.h"
diff --git a/lib/intel_allocator_msgchannel.c b/lib/intel_allocator_msgchannel.c
index cd0f0a5d..d1f6486c 100644
--- a/lib/intel_allocator_msgchannel.c
+++ b/lib/intel_allocator_msgchannel.c
@@ -6,7 +6,6 @@
 #include <sys/types.h>
 #include <sys/ipc.h>
 #include <sys/msg.h>
-#include <sys/stat.h>
 #include <fcntl.h>
 #include "igt.h"
 #include "intel_allocator_msgchannel.h"
diff --git a/lib/intel_allocator_random.c b/lib/intel_allocator_random.c
index d22f8176..9ed92383 100644
--- a/lib/intel_allocator_random.c
+++ b/lib/intel_allocator_random.c
@@ -3,10 +3,8 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <sys/ioctl.h>
 #include <stdlib.h>
 #include "igt.h"
-#include "igt_x86.h"
 #include "igt_rand.h"
 #include "intel_allocator.h"
 
diff --git a/lib/intel_allocator_reloc.c b/lib/intel_allocator_reloc.c
index ee3ad43f..bf4d9c43 100644
--- a/lib/intel_allocator_reloc.c
+++ b/lib/intel_allocator_reloc.c
@@ -3,10 +3,8 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <sys/ioctl.h>
 #include <stdlib.h>
 #include "igt.h"
-#include "igt_x86.h"
 #include "igt_rand.h"
 #include "intel_allocator.h"
 
diff --git a/lib/intel_allocator_simple.c b/lib/intel_allocator_simple.c
index 8d5105f1..22828ae5 100644
--- a/lib/intel_allocator_simple.c
+++ b/lib/intel_allocator_simple.c
@@ -3,10 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <sys/ioctl.h>
 #include <stdlib.h>
-#include "igt.h"
-#include "igt_x86.h"
 #include "intel_allocator.h"
 #include "intel_bufops.h"
 #include "igt_map.h"
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index ef1b5947..dcb06afc 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -26,14 +26,11 @@
  **************************************************************************/
 
 #include <inttypes.h>
-#include <poll.h>
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <assert.h>
 #include <search.h>
 
-#include "drm.h"
 #include "drmtest.h"
 #include "i915/gem_create.h"
 #include "intel_batchbuffer.h"
diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
index efb6f177..438961c1 100644
--- a/lib/intel_chipset.c
+++ b/lib/intel_chipset.c
@@ -25,17 +25,10 @@
  *
  */
 
-#include <unistd.h>
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <errno.h>
 #include <err.h>
-#include <assert.h>
 #include <sys/ioctl.h>
-#include <fcntl.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
 #include "i915_drm.h"
 
 #include "drmtest.h"
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index ebfcea73..09721e57 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -2,8 +2,6 @@
 #include "i915_pciids.h"
 #include "i915_pciids_local.h"
 
-#include <strings.h> /* ffs() */
-
 static const struct intel_device_info intel_generic_info = {
 	.graphics_ver = 0,
 	.display_ver = 0,
diff --git a/lib/intel_iosf.c b/lib/intel_iosf.c
index 40525b06..3e0a33de 100644
--- a/lib/intel_iosf.c
+++ b/lib/intel_iosf.c
@@ -1,7 +1,4 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <err.h>
 #include <errno.h>
 
 #include "intel_io.h"
diff --git a/lib/intel_mmio.c b/lib/intel_mmio.c
index 10b07aab..29ae898b 100644
--- a/lib/intel_mmio.c
+++ b/lib/intel_mmio.c
@@ -28,16 +28,9 @@
 
 #include <unistd.h>
 #include <fcntl.h>
-#include <stdio.h>
-#include <stdarg.h>
-#include <stdlib.h>
 #include <stdint.h>
 #include <stdbool.h>
 #include <string.h>
-#include <errno.h>
-#include <err.h>
-#include <assert.h>
-#include <sys/ioctl.h>
 #include <sys/stat.h>
 #include <sys/mman.h>
 
diff --git a/lib/intel_reg_map.c b/lib/intel_reg_map.c
index 0e2ee06c..882ae16d 100644
--- a/lib/intel_reg_map.c
+++ b/lib/intel_reg_map.c
@@ -26,9 +26,6 @@
  */
 
 #include <stdio.h>
-#include <stdarg.h>
-#include <stdlib.h>
-#include <sys/types.h>
 
 #include "intel_io.h"
 #include "intel_chipset.h"
diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 09eb3ce7..dfb32686 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -26,25 +26,12 @@
  *
  */
 
-#ifdef HAVE_LIBGEN_H
-#include <libgen.h>
-#endif
 #include <stdio.h>
 #include <fcntl.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <string.h>
 #include <sys/mman.h>
-#include <signal.h>
-#include <pciaccess.h>
-#include <getopt.h>
-#include <stdlib.h>
 #include <unistd.h>
-#include <sys/wait.h>
-#include <sys/types.h>
-#include <sys/syscall.h>
-#include <sys/utsname.h>
-#include <termios.h>
 #include <errno.h>
 
 #include "drmtest.h"
@@ -52,8 +39,6 @@
 #include "i915/gem_create.h"
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
-#include "intel_io.h"
-#include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include "igt_x86.h"
 #include "config.h"
diff --git a/lib/media_fill.c b/lib/media_fill.c
index d758f1f5..b910f8a9 100644
--- a/lib/media_fill.c
+++ b/lib/media_fill.c
@@ -30,7 +30,6 @@
 #include "intel_reg.h"
 #include "drmtest.h"
 #include "gpu_cmds.h"
-#include <assert.h>
 
 static const uint32_t gen7_media_kernel[][4] = {
 	{ 0x00400001, 0x20200231, 0x00000020, 0x00000000 },
diff --git a/lib/media_spin.c b/lib/media_spin.c
index d2345d15..7bbee0f2 100644
--- a/lib/media_spin.c
+++ b/lib/media_spin.c
@@ -26,7 +26,6 @@
 
 #include <i915_drm.h>
 #include "intel_reg.h"
-#include "drmtest.h"
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
 #include "media_spin.h"
diff --git a/lib/nouveau/cea0b5.c b/lib/nouveau/cea0b5.c
index 0986a3f8..2df80b05 100644
--- a/lib/nouveau/cea0b5.c
+++ b/lib/nouveau/cea0b5.c
@@ -22,8 +22,6 @@
 
 #include <inttypes.h>
 
-#include <nouveau_drm.h>
-
 #include "igt.h"
 #include "igt_nouveau.h"
 
diff --git a/lib/rendercopy_gen6.c b/lib/rendercopy_gen6.c
index e941257e..940f5638 100644
--- a/lib/rendercopy_gen6.c
+++ b/lib/rendercopy_gen6.c
@@ -1,15 +1,5 @@
-#include <assert.h>
-#include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <assert.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include "drm.h"
 #include "i915_drm.h"
 #include "drmtest.h"
 #include "intel_bufops.h"
@@ -17,7 +7,6 @@
 #include "intel_io.h"
 #include "rendercopy.h"
 #include "gen6_render.h"
-#include "intel_reg.h"
 
 #define VERTEX_SIZE (3*4)
 
diff --git a/lib/rendercopy_gen7.c b/lib/rendercopy_gen7.c
index 267f6f80..903de9f2 100644
--- a/lib/rendercopy_gen7.c
+++ b/lib/rendercopy_gen7.c
@@ -1,15 +1,5 @@
-#include <assert.h>
-#include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <assert.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include "drm.h"
 #include "i915_drm.h"
 #include "drmtest.h"
 #include "intel_bufops.h"
@@ -18,7 +8,6 @@
 #include "intel_chipset.h"
 #include "rendercopy.h"
 #include "gen7_render.h"
-#include "intel_reg.h"
 
 #if DEBUG_RENDERCPY
 static void dump_batch(struct intel_bb *ibb)
diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
index ba7897fb..948e721b 100644
--- a/lib/rendercopy_gen8.c
+++ b/lib/rendercopy_gen8.c
@@ -1,26 +1,13 @@
-#include <assert.h>
-#include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <assert.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 
-#include <drm.h>
 #include <i915_drm.h>
 
-#include "drmtest.h"
 #include "intel_bufops.h"
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
-#include "intel_io.h"
 #include "rendercopy.h"
 #include "gen8_render.h"
-#include "intel_reg.h"
 #include "igt_aux.h"
 
 #define VERTEX_SIZE (3*4)
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index ae0f775a..9d55613e 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -1,24 +1,11 @@
-#include <assert.h>
-#include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <assert.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <getopt.h>
 
-#include <drm.h>
 #include <i915_drm.h>
 
-#include "drmtest.h"
 #include "intel_aux_pgtable.h"
 #include "intel_bufops.h"
 #include "intel_batchbuffer.h"
-#include "intel_io.h"
 #include "rendercopy.h"
 #include "gen9_render.h"
 #include "intel_reg.h"
diff --git a/lib/rendercopy_i830.c b/lib/rendercopy_i830.c
index 4c427149..1f621872 100644
--- a/lib/rendercopy_i830.c
+++ b/lib/rendercopy_i830.c
@@ -1,14 +1,5 @@
-#include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <assert.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include "drm.h"
 #include "i915_drm.h"
 #include "drmtest.h"
 #include "intel_bufops.h"
diff --git a/lib/rendercopy_i915.c b/lib/rendercopy_i915.c
index 3e421301..4adddee6 100644
--- a/lib/rendercopy_i915.c
+++ b/lib/rendercopy_i915.c
@@ -1,14 +1,5 @@
-#include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <assert.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include "drm.h"
 #include "i915_drm.h"
 #include "drmtest.h"
 #include "intel_bufops.h"
diff --git a/lib/sw_sync.c b/lib/sw_sync.c
index 6c762c8b..cbadff4b 100644
--- a/lib/sw_sync.c
+++ b/lib/sw_sync.c
@@ -24,9 +24,6 @@
  *    Robert Foss <robert.foss@collabora.com>
  */
 
-#ifdef HAVE_LIBGEN_H
-#include <libgen.h>
-#endif
 #include <fcntl.h>
 #include <poll.h>
 #include <stdbool.h>
diff --git a/lib/tests/igt_assert.c b/lib/tests/igt_assert.c
index 3523a464..9d794655 100644
--- a/lib/tests/igt_assert.c
+++ b/lib/tests/igt_assert.c
@@ -22,7 +22,6 @@
  *
  */
 
-#include <errno.h>
 #include <float.h>
 #include <limits.h>
 #include <math.h>
@@ -30,8 +29,6 @@
 #include <stdint.h>
 #include <stdlib.h>
 #include <unistd.h>
-#include <sys/types.h>
-#include <sys/wait.h>
 
 #include "igt_core.h"
 #include "drmtest.h"
diff --git a/lib/tests/igt_audio.c b/lib/tests/igt_audio.c
index c0727673..64649772 100644
--- a/lib/tests/igt_audio.c
+++ b/lib/tests/igt_audio.c
@@ -23,8 +23,6 @@
  * Author: Simon Ser <simon.ser@intel.com>
  */
 
-#include "config.h"
-
 #include <stdlib.h>
 
 #include "igt_core.h"
diff --git a/lib/tests/igt_conflicting_args.c b/lib/tests/igt_conflicting_args.c
index b5fe2d78..073d5717 100644
--- a/lib/tests/igt_conflicting_args.c
+++ b/lib/tests/igt_conflicting_args.c
@@ -27,8 +27,6 @@
  */
 
 #include <signal.h>
-#include <sys/wait.h>
-#include <errno.h>
 
 #include "drmtest.h"
 #include "igt_core.h"
diff --git a/lib/tests/igt_describe.c b/lib/tests/igt_describe.c
index d71e051e..1b35a353 100644
--- a/lib/tests/igt_describe.c
+++ b/lib/tests/igt_describe.c
@@ -23,7 +23,6 @@
 
 #include <sys/wait.h>
 #include <string.h>
-#include <stdlib.h>
 
 #include "drmtest.h"
 #include "igt_tests_common.h"
diff --git a/lib/tests/igt_dynamic_subtests.c b/lib/tests/igt_dynamic_subtests.c
index b18cfae6..a1840317 100644
--- a/lib/tests/igt_dynamic_subtests.c
+++ b/lib/tests/igt_dynamic_subtests.c
@@ -21,7 +21,6 @@
  * IN THE SOFTWARE.
  */
 
-#include <errno.h>
 #include <sys/wait.h>
 
 #include "igt_core.h"
diff --git a/lib/tests/igt_edid.c b/lib/tests/igt_edid.c
index 8474d29e..0bfead87 100644
--- a/lib/tests/igt_edid.c
+++ b/lib/tests/igt_edid.c
@@ -23,8 +23,6 @@
  * Authors: Simon Ser <simon.ser@intel.com>
  */
 
-#include "config.h"
-
 #include <stdbool.h>
 
 #include "igt_core.h"
diff --git a/lib/tests/igt_exit_handler.c b/lib/tests/igt_exit_handler.c
index 892a7f14..1e00e8ec 100644
--- a/lib/tests/igt_exit_handler.c
+++ b/lib/tests/igt_exit_handler.c
@@ -23,7 +23,6 @@
 
 #include <unistd.h>
 #include <fcntl.h>
-#include <sys/types.h>
 #include <sys/wait.h>
 #include "igt_core.h"
 #include "drmtest.h"
diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c
index d19d0945..d9d0e316 100644
--- a/lib/tests/igt_fork.c
+++ b/lib/tests/igt_fork.c
@@ -23,7 +23,6 @@
  */
 
 #include <errno.h>
-#include <stdint.h>
 #include <stdlib.h>
 #include <unistd.h>
 #include <sys/types.h>
diff --git a/lib/tests/igt_fork_helper.c b/lib/tests/igt_fork_helper.c
index b4cf27eb..57584e18 100644
--- a/lib/tests/igt_fork_helper.c
+++ b/lib/tests/igt_fork_helper.c
@@ -25,7 +25,6 @@
  *
  */
 
-#include "drmtest.h"
 #include "igt_aux.h"
 
 int main(int argc, char **argv)
diff --git a/lib/tests/igt_invalid_subtest_name.c b/lib/tests/igt_invalid_subtest_name.c
index b790482c..2891e7eb 100644
--- a/lib/tests/igt_invalid_subtest_name.c
+++ b/lib/tests/igt_invalid_subtest_name.c
@@ -21,7 +21,6 @@
  * IN THE SOFTWARE.
  */
 
-#include <errno.h>
 #include <sys/wait.h>
 
 #include "igt_core.h"
diff --git a/lib/tests/igt_segfault.c b/lib/tests/igt_segfault.c
index 56efa912..8c00a0c1 100644
--- a/lib/tests/igt_segfault.c
+++ b/lib/tests/igt_segfault.c
@@ -35,10 +35,7 @@
  */
 
 #include <signal.h>
-#include <stdlib.h>
-#include <sys/wait.h>
 #include <sys/types.h>
-#include <errno.h>
 
 #include "drmtest.h"
 #include "igt_core.h"
diff --git a/lib/tests/igt_simulation.c b/lib/tests/igt_simulation.c
index 9a2cf2aa..bad917c1 100644
--- a/lib/tests/igt_simulation.c
+++ b/lib/tests/igt_simulation.c
@@ -26,11 +26,8 @@
  */
 
 #include <stdlib.h>
-#include <sys/wait.h>
 #include <sys/types.h>
-#include <errno.h>
 
-#include "drmtest.h"
 #include "igt_core.h"
 
 #include "igt_tests_common.h"
diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
index aa90939b..38878e49 100644
--- a/lib/veboxcopy_gen12.c
+++ b/lib/veboxcopy_gen12.c
@@ -20,7 +20,6 @@
  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
  * IN THE SOFTWARE.
  */
-#include <drm.h>
 
 #include "igt.h"
 #include "intel_aux_pgtable.h"
-- 
2.37.1
