Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35529112FB1
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 14:29:52 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 31 May 2022 16:28:43 +0200
Message-Id: <20220531142844.278366-13-ryszard.knop@intel.com>
In-Reply-To: <20220531142844.278366-1-ryszard.knop@intel.com>
References: <20220531142844.278366-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 13/14] tests/i915/gem*: Remove unused headers
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
 tests/i915/gem_bad_reloc.c                  | 11 +----------
 tests/i915/gem_basic.c                      |  4 ----
 tests/i915/gem_caching.c                    |  7 -------
 tests/i915/gem_ccs.c                        |  5 +----
 tests/i915/gem_close_race.c                 |  6 ------
 tests/i915/gem_concurrent_all.c             |  4 ----
 tests/i915/gem_create.c                     |  7 -------
 tests/i915/gem_cs_tlb.c                     |  5 -----
 tests/i915/gem_ctx_bad_destroy.c            |  2 +-
 tests/i915/gem_ctx_engines.c                |  5 -----
 tests/i915/gem_ctx_exec.c                   |  4 ----
 tests/i915/gem_ctx_freq.c                   |  4 ----
 tests/i915/gem_ctx_persistence.c            |  1 -
 tests/i915/gem_ctx_shared.c                 |  8 --------
 tests/i915/gem_ctx_sseu.c                   |  6 ------
 tests/i915/gem_ctx_switch.c                 |  6 ------
 tests/i915/gem_eio.c                        |  2 --
 tests/i915/gem_evict_alignment.c            |  8 --------
 tests/i915/gem_evict_everything.c           |  9 +--------
 tests/i915/gem_exec_alignment.c             |  3 ---
 tests/i915/gem_exec_await.c                 |  4 ----
 tests/i915/gem_exec_balancer.c              |  1 -
 tests/i915/gem_exec_big.c                   |  7 -------
 tests/i915/gem_exec_capture.c               |  1 -
 tests/i915/gem_exec_create.c                |  7 -------
 tests/i915/gem_exec_endless.c               |  1 -
 tests/i915/gem_exec_fair.c                  |  8 --------
 tests/i915/gem_exec_fence.c                 |  1 -
 tests/i915/gem_exec_latency.c               |  9 ---------
 tests/i915/gem_exec_lut_handle.c            |  6 ------
 tests/i915/gem_exec_nop.c                   |  7 -------
 tests/i915/gem_exec_params.c                |  5 -----
 tests/i915/gem_exec_reloc.c                 |  2 --
 tests/i915/gem_exec_schedule.c              |  3 ---
 tests/i915/gem_fd_exhaustion.c              |  6 +-----
 tests/i915/gem_fence_thrash.c               |  7 -------
 tests/i915/gem_fence_upload.c               |  6 ------
 tests/i915/gem_fenced_exec_thrash.c         |  1 -
 tests/i915/gem_flink_basic.c                |  6 +-----
 tests/i915/gem_gpgpu_fill.c                 |  9 ---------
 tests/i915/gem_gtt_cpu_tlb.c                |  7 -------
 tests/i915/gem_gtt_hog.c                    |  7 -------
 tests/i915/gem_gtt_speed.c                  |  7 -------
 tests/i915/gem_huc_copy.c                   |  7 -------
 tests/i915/gem_linear_blits.c               |  7 -------
 tests/i915/gem_lmem_swapping.c              |  6 ------
 tests/i915/gem_lut_handle.c                 |  5 -----
 tests/i915/gem_madvise.c                    |  4 ----
 tests/i915/gem_media_fill.c                 |  8 --------
 tests/i915/gem_media_vme.c                  |  9 ---------
 tests/i915/gem_mmap.c                       |  4 ----
 tests/i915/gem_mmap_gtt.c                   |  1 -
 tests/i915/gem_mmap_offset.c                |  1 -
 tests/i915/gem_mmap_wc.c                    |  5 -----
 tests/i915/gem_partial_pwrite_pread.c       |  6 ------
 tests/i915/gem_pipe_control_store_loop.c    |  6 ------
 tests/i915/gem_ppgtt.c                      |  7 -------
 tests/i915/gem_pread.c                      |  2 --
 tests/i915/gem_pread_after_blit.c           |  7 -------
 tests/i915/gem_pwrite.c                     |  2 --
 tests/i915/gem_pwrite_snooped.c             | 10 +---------
 tests/i915/gem_read_read_speed.c            |  7 -------
 tests/i915/gem_readwrite.c                  |  4 ----
 tests/i915/gem_reg_read.c                   |  1 -
 tests/i915/gem_render_copy.c                |  9 ---------
 tests/i915/gem_render_copy_redux.c          |  9 ---------
 tests/i915/gem_render_linear_blits.c        | 10 ----------
 tests/i915/gem_render_tiled_blits.c         |  9 ---------
 tests/i915/gem_request_retire.c             | 13 -------------
 tests/i915/gem_reset_stats.c                |  4 ----
 tests/i915/gem_ringfill.c                   |  2 --
 tests/i915/gem_set_tiling_vs_blt.c          |  7 -------
 tests/i915/gem_set_tiling_vs_gtt.c          |  7 -------
 tests/i915/gem_set_tiling_vs_pwrite.c       |  7 -------
 tests/i915/gem_streaming_writes.c           |  9 +--------
 tests/i915/gem_stress.c                     |  8 --------
 tests/i915/gem_sync.c                       |  1 -
 tests/i915/gem_tiled_blits.c                |  7 -------
 tests/i915/gem_tiled_partial_pwrite_pread.c |  6 ------
 tests/i915/gem_tiled_pread_basic.c          |  7 -------
 tests/i915/gem_tiled_pread_pwrite.c         |  8 --------
 tests/i915/gem_tiled_swapping.c             |  7 -------
 tests/i915/gem_tiled_wb.c                   |  5 -----
 tests/i915/gem_tiled_wc.c                   |  4 ----
 tests/i915/gem_tiling_max_stride.c          |  5 -----
 tests/i915/gem_unfence_active_buffers.c     |  8 --------
 tests/i915/gem_unref_active_buffers.c       |  1 -
 tests/i915/gem_userptr_blits.c              |  1 -
 tests/i915/gem_vm_create.c                  |  1 -
 tests/i915/gem_watchdog.c                   |  2 --
 90 files changed, 8 insertions(+), 483 deletions(-)

diff --git a/tests/i915/gem_bad_reloc.c b/tests/i915/gem_bad_reloc.c
index 478e78a6..6bc321b9 100644
--- a/tests/i915/gem_bad_reloc.c
+++ b/tests/i915/gem_bad_reloc.c
@@ -26,18 +26,9 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
 #include <stdint.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-
-#include "drm.h"
+
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
index 17ae190c..5b262bf7 100644
--- a/tests/i915/gem_basic.c
+++ b/tests/i915/gem_basic.c
@@ -27,13 +27,9 @@
 
 #include "igt.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
 
 #include "drm.h"
diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index eb0170ab..d0bbf939 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -27,15 +27,8 @@
  */
 
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-
-#include <drm.h>
 
 #include "i915/gem.h"
 #include "igt.h"
diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index 4ecb3e36..c0db9c05 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -3,12 +3,9 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#include <errno.h>
 #include <glib.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
 #include <malloc.h>
-#include "drm.h"
+
 #include "igt.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
index 93ae07ed..84d4b3c3 100644
--- a/tests/i915/gem_close_race.c
+++ b/tests/i915/gem_close_race.c
@@ -31,15 +31,9 @@
 #include <stdbool.h>
 #include <stdlib.h>
 #include <stdint.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/time.h>
-#include <sys/syscall.h>
 
 #include "drm.h"
 #include "i915/gem.h"
diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
index 2b1788e1..0e104ebc 100644
--- a/tests/i915/gem_concurrent_all.c
+++ b/tests/i915/gem_concurrent_all.c
@@ -39,11 +39,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/resource.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 #include <sys/wait.h>
 
 #include <drm.h>
diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 31fd6526..57dcce3e 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -32,15 +32,10 @@
  */
 
 #include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/time.h>
-#include <getopt.h>
 #include <pthread.h>
 #include <stdatomic.h>
 
@@ -48,8 +43,6 @@
 #include "drmtest.h"
 #include "ioctl_wrappers.h"
 #include "intel_batchbuffer.h"
-#include "intel_io.h"
-#include "intel_chipset.h"
 #include "igt_aux.h"
 #include "igt_dummyload.h"
 #include "igt_x86.h"
diff --git a/tests/i915/gem_cs_tlb.c b/tests/i915/gem_cs_tlb.c
index 2117b41e..b2a52ce1 100644
--- a/tests/i915/gem_cs_tlb.c
+++ b/tests/i915/gem_cs_tlb.c
@@ -36,15 +36,10 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/time.h>
 
 #include <drm.h>
diff --git a/tests/i915/gem_ctx_bad_destroy.c b/tests/i915/gem_ctx_bad_destroy.c
index 50bb9aa0..21882994 100644
--- a/tests/i915/gem_ctx_bad_destroy.c
+++ b/tests/i915/gem_ctx_bad_destroy.c
@@ -30,7 +30,7 @@
   */
 
 #include "igt.h"
-#include <stdio.h>
+
 #include <string.h>
 #include <errno.h>
 
diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index 19cf9b05..be480c2d 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -27,13 +27,8 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
 #include <sched.h>
-#include <sys/ioctl.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 
 #include <drm.h>
 
diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 1f3d1a44..79bcadee 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -29,12 +29,8 @@
 #include <signal.h>
 #include <stdlib.h>
 #include <stdint.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 
diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
index a29fe68b..b68571a7 100644
--- a/tests/i915/gem_ctx_freq.c
+++ b/tests/i915/gem_ctx_freq.c
@@ -22,10 +22,7 @@
  *
  */
 
-#include <errno.h>
-#include <fcntl.h>
 #include <sched.h>
-#include <stdlib.h>
 #include <stdint.h>
 #include <unistd.h>
 
@@ -33,7 +30,6 @@
 #include "igt.h"
 #include "igt_perf.h"
 #include "igt_sysfs.h"
-#include "sw_sync.h"
 
 #define SAMPLE_PERIOD (USEC_PER_SEC / 10)
 #define PMU_TOLERANCE 100
diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 00dda3a8..51381b89 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -27,7 +27,6 @@
 #include <signal.h>
 #include <sys/ioctl.h>
 #include <sys/socket.h>
-#include <sys/types.h>
 #include <unistd.h>
 
 #include "drmtest.h"
diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index eb3b024f..c363b1f8 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -28,14 +28,7 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-
-#include <drm.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
@@ -43,7 +36,6 @@
 #include "i915/gem_vm.h"
 #include "igt.h"
 #include "igt_rand.h"
-#include "igt_vgem.h"
 #include "sw_sync.h"
 #include "sync_file.h"
 
diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
index 7685511f..dd0b4711 100644
--- a/tests/i915/gem_ctx_sseu.c
+++ b/tests/i915/gem_ctx_sseu.c
@@ -26,20 +26,14 @@
  */
 
 #include <stdio.h>
-#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
-#include <fcntl.h>
-#include <signal.h>
 #include <errno.h>
-#include <time.h>
 #include <sys/mman.h>
-#include <sys/wait.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
-#include "igt.h"
 #include "igt_dummyload.h"
 #include "igt_perf.h"
 #include "igt_sysfs.h"
diff --git a/tests/i915/gem_ctx_switch.c b/tests/i915/gem_ctx_switch.c
index 4e46b763..899cedfc 100644
--- a/tests/i915/gem_ctx_switch.c
+++ b/tests/i915/gem_ctx_switch.c
@@ -31,15 +31,9 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/time.h>
 #include <time.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "i915/gem_ring.h"
diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 913a21f9..ef6084f4 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -30,13 +30,11 @@
 #include <dirent.h>
 #include <errno.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <sched.h>
 #include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <sys/ioctl.h>
 #include <time.h>
 #include <unistd.h>
 
diff --git a/tests/i915/gem_evict_alignment.c b/tests/i915/gem_evict_alignment.c
index 4a05f7cd..3ad4b35d 100644
--- a/tests/i915/gem_evict_alignment.c
+++ b/tests/i915/gem_evict_alignment.c
@@ -33,16 +33,8 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdint.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-
-#include <drm.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
diff --git a/tests/i915/gem_evict_everything.c b/tests/i915/gem_evict_everything.c
index 37343b53..8f0fa9be 100644
--- a/tests/i915/gem_evict_everything.c
+++ b/tests/i915/gem_evict_everything.c
@@ -35,14 +35,7 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-
-#include "drm.h"
+
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
index c88fc327..3e283e4a 100644
--- a/tests/i915/gem_exec_alignment.c
+++ b/tests/i915/gem_exec_alignment.c
@@ -30,14 +30,11 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
 #include <signal.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 #include <sys/ioctl.h>
-#include <signal.h>
 #include <sched.h>
 
 #include "drm.h"
diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index fe176595..571796cb 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -22,15 +22,11 @@
  *
  */
 
-#include <sys/ioctl.h>
 #include <sys/signal.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
-#include "igt_rand.h"
-#include "igt_sysfs.h"
-#include "igt_vgem.h"
 
 static double elapsed(const struct timespec *start, const struct timespec *end)
 {
diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 857d0085..b646a076 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -30,7 +30,6 @@
 #include "i915/gem.h"
 #include "i915/gem_engine_topology.h"
 #include "i915/gem_create.h"
-#include "i915/gem_vm.h"
 #include "igt.h"
 #include "igt_gt.h"
 #include "igt_perf.h"
diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
index 2f47de39..8296197f 100644
--- a/tests/i915/gem_exec_big.c
+++ b/tests/i915/gem_exec_big.c
@@ -35,16 +35,9 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdint.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 60f8df04..9b399e26 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -29,7 +29,6 @@
 #include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_device.h"
-#include "igt_rand.h"
 #include "igt_sysfs.h"
 
 #define MAX_RESET_TIME	600
diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
index 78d5ffb3..368fdc86 100644
--- a/tests/i915/gem_exec_create.c
+++ b/tests/i915/gem_exec_create.c
@@ -30,17 +30,10 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/time.h>
 #include <time.h>
 
-#include "drm.h"
 #include "i915/gem.h"
-#include "i915/gem_create.h"
 #include "i915/gem_ring.h"
 #include "igt.h"
 
diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
index b83d5a2c..f1c1c44d 100644
--- a/tests/i915/gem_exec_endless.c
+++ b/tests/i915/gem_exec_endless.c
@@ -28,7 +28,6 @@
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_sysfs.h"
-#include "sw_sync.h"
 
 #define MAX_ENGINES 64
 
diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index 935f9c4a..d4a475a6 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -3,16 +3,11 @@
  * Copyright © 2016 Intel Corporation
  */
 
-#include "config.h"
-
 #include <pthread.h>
 #include <sys/poll.h>
 #include <sys/ioctl.h>
 #include <sys/mman.h>
 #include <sys/resource.h>
-#include <sys/syscall.h>
-#include <sched.h>
-#include <signal.h>
 #include <unistd.h>
 
 #include "sync_file.h"
@@ -20,11 +15,8 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
-#include "igt_rand.h"
-#include "igt_rapl.h"
 #include "igt_sysfs.h"
 #include "igt_syncobj.h"
-#include "igt_vgem.h"
 #include "ioctl_wrappers.h"
 #include "sw_sync.h"
 
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 47ddf308..9669ac7e 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -31,7 +31,6 @@
 #include "igt_store.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
-#include "igt_vgem.h"
 #include "intel_ctx.h"
 #include "sw_sync.h"
 
diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
index fcdf7787..e187a5c7 100644
--- a/tests/i915/gem_exec_latency.c
+++ b/tests/i915/gem_exec_latency.c
@@ -27,14 +27,6 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <sys/signal.h>
-#include <time.h>
 #include <sched.h>
 
 #include "drm.h"
@@ -42,7 +34,6 @@
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_sysfs.h"
-#include "igt_vgem.h"
 #include "igt_dummyload.h"
 #include "igt_stats.h"
 
diff --git a/tests/i915/gem_exec_lut_handle.c b/tests/i915/gem_exec_lut_handle.c
index 06430866..a4b0c088 100644
--- a/tests/i915/gem_exec_lut_handle.c
+++ b/tests/i915/gem_exec_lut_handle.c
@@ -27,16 +27,10 @@
 
 /* Exercises the basic execbuffer using the handle LUT interface */
 
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index f35cc840..7fa36851 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -30,16 +30,9 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/poll.h>
-#include <sys/time.h>
 #include <time.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index da36af74..57be5d0c 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -28,14 +28,9 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdint.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
-#include <sys/time.h>
 
 #include "drm.h"
 #include "i915/gem.h"
diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 03d65dc6..4aafe7f9 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -22,7 +22,6 @@
  */
 
 #include <signal.h>
-#include <sys/ioctl.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
@@ -30,7 +29,6 @@
 #include "igt_device.h"
 #include "igt_dummyload.h"
 #include "igt_kms.h"
-#include "sw_sync.h"
 
 IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl relocations.");
 
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index cf2625cb..f03091b9 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -21,8 +21,6 @@
  * IN THE SOFTWARE.
  */
 
-#include "config.h"
-
 #include <linux/userfaultfd.h>
 
 #include <pthread.h>
@@ -41,7 +39,6 @@
 #include "igt_rand.h"
 #include "igt_rapl.h"
 #include "igt_sysfs.h"
-#include "igt_vgem.h"
 #include "intel_ctx.h"
 #include "sw_sync.h"
 
diff --git a/tests/i915/gem_fd_exhaustion.c b/tests/i915/gem_fd_exhaustion.c
index a6463685..ff4b2f74 100644
--- a/tests/i915/gem_fd_exhaustion.c
+++ b/tests/i915/gem_fd_exhaustion.c
@@ -26,12 +26,8 @@
  */
 
 #include "igt.h"
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/resource.h>
-#include <sys/time.h>
+
 #include <fcntl.h>
-#include <limits.h>
 
 #include "i915/gem_create.h"
 
diff --git a/tests/i915/gem_fence_thrash.c b/tests/i915/gem_fence_thrash.c
index 89a5ae29..6543295e 100644
--- a/tests/i915/gem_fence_thrash.c
+++ b/tests/i915/gem_fence_thrash.c
@@ -26,19 +26,12 @@
  *
  */
 
-#include "config.h"
-
 #include <unistd.h>
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <pthread.h>
-#include "drm.h"
 
 #include "i915/gem_create.h"
 #include "igt.h"
diff --git a/tests/i915/gem_fence_upload.c b/tests/i915/gem_fence_upload.c
index 67487d67..3fecf260 100644
--- a/tests/i915/gem_fence_upload.c
+++ b/tests/i915/gem_fence_upload.c
@@ -25,20 +25,14 @@
  *
  */
 
-#include "config.h"
-
 #include "igt.h"
-#include <unistd.h>
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
 #include <sys/time.h>
 #include <pthread.h>
 
-#include "drm.h"
 #include "i915_drm.h"
 #include "i915/gem_create.h"
 
diff --git a/tests/i915/gem_fenced_exec_thrash.c b/tests/i915/gem_fenced_exec_thrash.c
index a9597d80..16bf007f 100644
--- a/tests/i915/gem_fenced_exec_thrash.c
+++ b/tests/i915/gem_fenced_exec_thrash.c
@@ -27,7 +27,6 @@
 
 #include <stdlib.h>
 #include <string.h>
-#include <inttypes.h>
 #include <errno.h>
 
 #include "i915/gem.h"
diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
index 4e207c2a..cc4e893e 100644
--- a/tests/i915/gem_flink_basic.c
+++ b/tests/i915/gem_flink_basic.c
@@ -26,13 +26,9 @@
  */
 
 #include "igt.h"
-#include <stdlib.h>
-#include <stdio.h>
+
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
 #include "drm.h"
 
diff --git a/tests/i915/gem_gpgpu_fill.c b/tests/i915/gem_gpgpu_fill.c
index 74a227f6..bd8a94b5 100644
--- a/tests/i915/gem_gpgpu_fill.c
+++ b/tests/i915/gem_gpgpu_fill.c
@@ -30,19 +30,10 @@
  * workload for the GPGPU pipeline.
  */
 
-#include <stdbool.h>
-#include <unistd.h>
 #include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "igt.h"
 #include "igt_collection.h"
diff --git a/tests/i915/gem_gtt_cpu_tlb.c b/tests/i915/gem_gtt_cpu_tlb.c
index 8000e58c..5dfc0baa 100644
--- a/tests/i915/gem_gtt_cpu_tlb.c
+++ b/tests/i915/gem_gtt_cpu_tlb.c
@@ -32,16 +32,9 @@
 
 #include "igt.h"
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
 #include "i915/gem_create.h"
 
 IGT_TEST_DESCRIPTION("Check whether gtt tlbs for cpu access are correctly"
diff --git a/tests/i915/gem_gtt_hog.c b/tests/i915/gem_gtt_hog.c
index 15a6139e..902acf8f 100644
--- a/tests/i915/gem_gtt_hog.c
+++ b/tests/i915/gem_gtt_hog.c
@@ -28,15 +28,8 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdint.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/time.h>
-#include <sys/wait.h>
 
 #include "drm.h"
 #include "i915/gem.h"
diff --git a/tests/i915/gem_gtt_speed.c b/tests/i915/gem_gtt_speed.c
index 272091fd..6ba2fcb9 100644
--- a/tests/i915/gem_gtt_speed.c
+++ b/tests/i915/gem_gtt_speed.c
@@ -31,16 +31,9 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdint.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/time.h>
 
-#include "drm.h"
 #include "i915/gem_create.h"
 
 #define OBJECT_SIZE 16384
diff --git a/tests/i915/gem_huc_copy.c b/tests/i915/gem_huc_copy.c
index ea32b705..3c42fa1e 100644
--- a/tests/i915/gem_huc_copy.c
+++ b/tests/i915/gem_huc_copy.c
@@ -21,17 +21,10 @@
  * IN THE SOFTWARE.
  */
 #include "igt.h"
-#include <stdbool.h>
 #include <unistd.h>
 #include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 #include "drm.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
index 9f049863..bed7abf1 100644
--- a/tests/i915/gem_linear_blits.c
+++ b/tests/i915/gem_linear_blits.c
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
-
-#include <drm.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 5d93e9da..d081f8fa 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -5,7 +5,6 @@
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
-#include "i915/gem_vm.h"
 #include "i915/intel_memory_region.h"
 #include "igt.h"
 #include "igt_kmod.h"
@@ -14,14 +13,9 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/time.h>
 #include <sys/wait.h>
-#include "drm.h"
 #include "i915/i915_blt.h"
 #include "i915/intel_mocs.h"
 
diff --git a/tests/i915/gem_lut_handle.c b/tests/i915/gem_lut_handle.c
index 32f76aaa..c3361c72 100644
--- a/tests/i915/gem_lut_handle.c
+++ b/tests/i915/gem_lut_handle.c
@@ -29,15 +29,10 @@
 
 #include "igt.h"
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 
-#include "drm.h"
 #include "i915/gem_create.h"
 
 IGT_TEST_DESCRIPTION("Exercises the basic execbuffer using the handle LUT"
diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
index 2502d84c..5567ec1f 100644
--- a/tests/i915/gem_madvise.c
+++ b/tests/i915/gem_madvise.c
@@ -27,16 +27,12 @@
 
 #include "igt.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
 #include <setjmp.h>
 #include <signal.h>
 
-#include "drm.h"
 #include "i915/gem_create.h"
 
 IGT_TEST_DESCRIPTION("Checks that the kernel reports EFAULT when trying to use"
diff --git a/tests/i915/gem_media_fill.c b/tests/i915/gem_media_fill.c
index 1d08df24..35473b79 100644
--- a/tests/i915/gem_media_fill.c
+++ b/tests/i915/gem_media_fill.c
@@ -30,19 +30,11 @@
  * workload for the Media pipeline.
  */
 
-#include <stdbool.h>
-#include <unistd.h>
 #include <stdlib.h>
-#include <sys/ioctl.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "igt.h"
 
diff --git a/tests/i915/gem_media_vme.c b/tests/i915/gem_media_vme.c
index 3ea70386..30a149c9 100644
--- a/tests/i915/gem_media_vme.c
+++ b/tests/i915/gem_media_vme.c
@@ -20,19 +20,10 @@
  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
  * IN THE SOFTWARE.
  */
-#include <stdbool.h>
-#include <unistd.h>
-#include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "igt.h"
 
diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
index 297ae3ad..8b86be6f 100644
--- a/tests/i915/gem_mmap.c
+++ b/tests/i915/gem_mmap.c
@@ -28,13 +28,9 @@
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
 #include "i915/gem_create.h"
diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index 92bbb5d2..57a51f7a 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -37,7 +37,6 @@
 #include <signal.h>
 #include <sys/ioctl.h>
 #include <sys/ptrace.h>
-#include <sys/stat.h>
 #include <sys/wait.h>
 #include "drm.h"
 
diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index abb6ee4e..5aa26f5f 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -28,7 +28,6 @@
 #include <stdatomic.h>
 #include <sys/ioctl.h>
 #include <sys/ptrace.h>
-#include <sys/stat.h>
 #include <sys/wait.h>
 #include <unistd.h>
 #include "drm.h"
diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
index 6dc7bae4..c6df3ca2 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -27,15 +27,10 @@
 
 #include "igt.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <pthread.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 
 #include "drm.h"
 #include "i915/gem_create.h"
diff --git a/tests/i915/gem_partial_pwrite_pread.c b/tests/i915/gem_partial_pwrite_pread.c
index 474149d4..90e494e0 100644
--- a/tests/i915/gem_partial_pwrite_pread.c
+++ b/tests/i915/gem_partial_pwrite_pread.c
@@ -28,13 +28,7 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-
-#include <drm.h>
 
 #include "i915/gem.h"
 #include "igt.h"
diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
index 305ac7ae..d8105549 100644
--- a/tests/i915/gem_pipe_control_store_loop.c
+++ b/tests/i915/gem_pipe_control_store_loop.c
@@ -31,16 +31,10 @@
  * Writes a counter-value into an always newly allocated target bo (by disabling
  * buffer reuse). Decently trashes on tlb inconsistencies, too.
  */
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "igt.h"
 
diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
index 4c9691e3..65ccc209 100644
--- a/tests/i915/gem_ppgtt.c
+++ b/tests/i915/gem_ppgtt.c
@@ -24,17 +24,10 @@
 #include <stdbool.h>
 #include <unistd.h>
 #include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 
-#include <drm.h>
-
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
diff --git a/tests/i915/gem_pread.c b/tests/i915/gem_pread.c
index a8bf2b05..485a7f63 100644
--- a/tests/i915/gem_pread.c
+++ b/tests/i915/gem_pread.c
@@ -34,11 +34,9 @@
 #include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
 #include <sys/ioctl.h>
 #include <sys/resource.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 #include <pthread.h>
 
diff --git a/tests/i915/gem_pread_after_blit.c b/tests/i915/gem_pread_after_blit.c
index 3b56f787..df64528c 100644
--- a/tests/i915/gem_pread_after_blit.c
+++ b/tests/i915/gem_pread_after_blit.c
@@ -34,16 +34,9 @@
  * ranged-buffer-flush paths in the kernel.
  */
 
-#include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-
-#include <drm.h>
 
 #include "i915/gem.h"
 #include "igt.h"
diff --git a/tests/i915/gem_pwrite.c b/tests/i915/gem_pwrite.c
index e8e8c7ad..6f8ccec5 100644
--- a/tests/i915/gem_pwrite.c
+++ b/tests/i915/gem_pwrite.c
@@ -34,11 +34,9 @@
 #include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
 #include <sys/ioctl.h>
 #include <sys/resource.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 
 #include "drm.h"
diff --git a/tests/i915/gem_pwrite_snooped.c b/tests/i915/gem_pwrite_snooped.c
index e6a10747..18446a61 100644
--- a/tests/i915/gem_pwrite_snooped.c
+++ b/tests/i915/gem_pwrite_snooped.c
@@ -25,16 +25,8 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdint.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-
-#include "drm.h"
+
 #include "i915/gem.h"
 #include "igt.h"
 
diff --git a/tests/i915/gem_read_read_speed.c b/tests/i915/gem_read_read_speed.c
index 7c5c90f7..bf82678d 100644
--- a/tests/i915/gem_read_read_speed.c
+++ b/tests/i915/gem_read_read_speed.c
@@ -26,19 +26,12 @@
  * This is a test of performance with multiple readers from the same source.
  */
 
-#include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
 #include <time.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 #include <sys/wait.h>
 
-#include <drm.h>
-
 #include "i915/gem.h"
 #include "igt.h"
 #include "igt_sysfs.h"
diff --git a/tests/i915/gem_readwrite.c b/tests/i915/gem_readwrite.c
index 2d437dec..5ebd6337 100644
--- a/tests/i915/gem_readwrite.c
+++ b/tests/i915/gem_readwrite.c
@@ -27,13 +27,9 @@
 
 #include "igt.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
 
 #include "drm.h"
diff --git a/tests/i915/gem_reg_read.c b/tests/i915/gem_reg_read.c
index 79facc1f..4841f260 100644
--- a/tests/i915/gem_reg_read.c
+++ b/tests/i915/gem_reg_read.c
@@ -26,7 +26,6 @@
  */
 
 #include "igt.h"
-#include <stdio.h>
 #include <string.h>
 #include <errno.h>
 #include <sys/utsname.h>
diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
index 3da29ec4..c4e6e676 100644
--- a/tests/i915/gem_render_copy.c
+++ b/tests/i915/gem_render_copy.c
@@ -30,19 +30,10 @@
  */
 
 #include <stdbool.h>
-#include <unistd.h>
 #include <cairo.h>
 #include <stdlib.h>
-#include <sys/ioctl.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-
-#include <drm.h>
 
 #include "i915/gem.h"
 #include "igt.h"
diff --git a/tests/i915/gem_render_copy_redux.c b/tests/i915/gem_render_copy_redux.c
index 525c14d1..51c961c6 100644
--- a/tests/i915/gem_render_copy_redux.c
+++ b/tests/i915/gem_render_copy_redux.c
@@ -34,17 +34,8 @@
 
 #include <stdbool.h>
 #include <unistd.h>
-#include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-
-#include <drm.h>
 
 #include "i915/gem.h"
 #include "igt.h"
diff --git a/tests/i915/gem_render_linear_blits.c b/tests/i915/gem_render_linear_blits.c
index 8e646127..2334848e 100644
--- a/tests/i915/gem_render_linear_blits.c
+++ b/tests/i915/gem_render_linear_blits.c
@@ -33,19 +33,9 @@
  * The goal is to simply ensure the basics work.
  */
 
-#include "config.h"
-
 #include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-
-#include <drm.h>
 
 #include "i915/gem.h"
 #include "igt.h"
diff --git a/tests/i915/gem_render_tiled_blits.c b/tests/i915/gem_render_tiled_blits.c
index 187714d6..5530e3d4 100644
--- a/tests/i915/gem_render_tiled_blits.c
+++ b/tests/i915/gem_render_tiled_blits.c
@@ -34,18 +34,9 @@
  */
 
 #include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 #include <sys/mman.h>
 
-#include <drm.h>
-
 #include "i915/gem.h"
 #include "igt.h"
 
diff --git a/tests/i915/gem_request_retire.c b/tests/i915/gem_request_retire.c
index da9d405e..dbb5d4f5 100644
--- a/tests/i915/gem_request_retire.c
+++ b/tests/i915/gem_request_retire.c
@@ -30,21 +30,8 @@
  * Collection of tests targeting request retirement code paths.
  */
 
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <sys/mman.h>
-#include <signal.h>
-#include <pthread.h>
-#include <time.h>
-
-#include "drm.h"
-#include "i915_drm.h"
 
 #include "i915/gem.h"
 #include "igt.h"
diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
index baa10151..ad772533 100644
--- a/tests/i915/gem_reset_stats.c
+++ b/tests/i915/gem_reset_stats.c
@@ -31,12 +31,8 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
-#include <sys/mman.h>
 #include <time.h>
 #include <signal.h>
 #include <poll.h>
diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index ecfa0bea..e1b07fc3 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -37,10 +37,8 @@
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_gt.h"
-#include "igt_vgem.h"
 
 #include <signal.h>
-#include <sys/ioctl.h>
 
 #define INTERRUPTIBLE 0x1
 #define HANG 0x2
diff --git a/tests/i915/gem_set_tiling_vs_blt.c b/tests/i915/gem_set_tiling_vs_blt.c
index 5e3bf6a1..a624b4c7 100644
--- a/tests/i915/gem_set_tiling_vs_blt.c
+++ b/tests/i915/gem_set_tiling_vs_blt.c
@@ -44,17 +44,10 @@
  * transitions (i.e. changing stride).
  */
 
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 #include <stdbool.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "igt.h"
 
diff --git a/tests/i915/gem_set_tiling_vs_gtt.c b/tests/i915/gem_set_tiling_vs_gtt.c
index 2f890e83..acf64fbd 100644
--- a/tests/i915/gem_set_tiling_vs_gtt.c
+++ b/tests/i915/gem_set_tiling_vs_gtt.c
@@ -27,16 +27,9 @@
 
 #include "igt.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 
-#include "drm.h"
 #include "i915/gem_create.h"
 
 IGT_TEST_DESCRIPTION("Check set_tiling vs gtt mmap coherency.");
diff --git a/tests/i915/gem_set_tiling_vs_pwrite.c b/tests/i915/gem_set_tiling_vs_pwrite.c
index 6bec7f27..bd2e419b 100644
--- a/tests/i915/gem_set_tiling_vs_pwrite.c
+++ b/tests/i915/gem_set_tiling_vs_pwrite.c
@@ -27,16 +27,9 @@
 
 #include "igt.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 
-#include "drm.h"
 #include "i915/gem_create.h"
 
 IGT_TEST_DESCRIPTION("Check set_tiling vs pwrite coherency.");
diff --git a/tests/i915/gem_streaming_writes.c b/tests/i915/gem_streaming_writes.c
index 883fe429..8dcce69b 100644
--- a/tests/i915/gem_streaming_writes.c
+++ b/tests/i915/gem_streaming_writes.c
@@ -29,14 +29,7 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <pthread.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-
-#include "drm.h"
+
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
diff --git a/tests/i915/gem_stress.c b/tests/i915/gem_stress.c
index 3765ab14..1afab191 100644
--- a/tests/i915/gem_stress.c
+++ b/tests/i915/gem_stress.c
@@ -51,16 +51,8 @@
 
 #include "igt.h"
 #include <stdlib.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-
-#include <drm.h>
 
 IGT_TEST_DESCRIPTION("General gem coherency test.");
 
diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index 8c435845..91744d96 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -31,7 +31,6 @@
 #include "igt_dummyload.h"
 #include "igt_gt.h"
 #include "igt.h"
-#include "igt_sysfs.h"
 
 #define MAX_PRIO I915_CONTEXT_MAX_USER_PRIORITY
 #define MIN_PRIO I915_CONTEXT_MIN_USER_PRIORITY
diff --git a/tests/i915/gem_tiled_blits.c b/tests/i915/gem_tiled_blits.c
index c93d04d6..a8e64fcc 100644
--- a/tests/i915/gem_tiled_blits.c
+++ b/tests/i915/gem_tiled_blits.c
@@ -42,15 +42,8 @@
  */
 
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-
-#include <drm.h>
 
 #include "i915/gem.h"
 #include "igt.h"
diff --git a/tests/i915/gem_tiled_partial_pwrite_pread.c b/tests/i915/gem_tiled_partial_pwrite_pread.c
index 95fb69c6..cc5df371 100644
--- a/tests/i915/gem_tiled_partial_pwrite_pread.c
+++ b/tests/i915/gem_tiled_partial_pwrite_pread.c
@@ -26,13 +26,7 @@
  */
 
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 
 #include <drm.h>
 
diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
index 2b4cec6e..1809a101 100644
--- a/tests/i915/gem_tiled_pread_basic.c
+++ b/tests/i915/gem_tiled_pread_basic.c
@@ -37,16 +37,9 @@
 
 #include "igt.h"
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
 #include "i915/gem_create.h"
 
 IGT_TEST_DESCRIPTION("Test pread behavior on tiled objects with respect to the"
diff --git a/tests/i915/gem_tiled_pread_pwrite.c b/tests/i915/gem_tiled_pread_pwrite.c
index f77cd3bd..1a15efb6 100644
--- a/tests/i915/gem_tiled_pread_pwrite.c
+++ b/tests/i915/gem_tiled_pread_pwrite.c
@@ -46,17 +46,9 @@
 
 #include "igt.h"
 #include "igt_x86.h"
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <sys/ioctl.h>
 
-#include "drm.h"
 #include "i915/gem_create.h"
 
 IGT_TEST_DESCRIPTION("Test swizzling by testing pwrite does the inverse of"
diff --git a/tests/i915/gem_tiled_swapping.c b/tests/i915/gem_tiled_swapping.c
index d66b6ca7..8b9a3ab5 100644
--- a/tests/i915/gem_tiled_swapping.c
+++ b/tests/i915/gem_tiled_swapping.c
@@ -46,17 +46,10 @@
 
 #include "igt.h"
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <sys/ioctl.h>
 #include <pthread.h>
 
-#include "drm.h"
 #include "i915/gem_create.h"
 
 IGT_TEST_DESCRIPTION("Exercise swizzle code for swapping.");
diff --git a/tests/i915/gem_tiled_wb.c b/tests/i915/gem_tiled_wb.c
index e9efbdf2..bfbc158d 100644
--- a/tests/i915/gem_tiled_wb.c
+++ b/tests/i915/gem_tiled_wb.c
@@ -34,14 +34,9 @@
 
 #include "igt.h"
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <sys/ioctl.h>
 
 #include "drm.h"
 #include "i915/gem_create.h"
diff --git a/tests/i915/gem_tiled_wc.c b/tests/i915/gem_tiled_wc.c
index 1f245eb7..c4fb7079 100644
--- a/tests/i915/gem_tiled_wc.c
+++ b/tests/i915/gem_tiled_wc.c
@@ -34,14 +34,10 @@
 
 #include "igt.h"
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/time.h>
-#include <sys/ioctl.h>
 
 #include "drm.h"
 #include "i915/gem_create.h"
diff --git a/tests/i915/gem_tiling_max_stride.c b/tests/i915/gem_tiling_max_stride.c
index 513d579d..14810945 100644
--- a/tests/i915/gem_tiling_max_stride.c
+++ b/tests/i915/gem_tiling_max_stride.c
@@ -28,16 +28,11 @@
 #include "igt.h"
 #include <unistd.h>
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
 #include <limits.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 
-#include "drm.h"
 #include "i915/gem_create.h"
 
 IGT_TEST_DESCRIPTION("Check that max fence stride works.");
diff --git a/tests/i915/gem_unfence_active_buffers.c b/tests/i915/gem_unfence_active_buffers.c
index 532eed2e..befb094d 100644
--- a/tests/i915/gem_unfence_active_buffers.c
+++ b/tests/i915/gem_unfence_active_buffers.c
@@ -38,17 +38,9 @@
  * problem - the race window is too small.
  */
 
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <stdbool.h>
 
-#include "drm.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
diff --git a/tests/i915/gem_unref_active_buffers.c b/tests/i915/gem_unref_active_buffers.c
index 3b8c981d..3cd88469 100644
--- a/tests/i915/gem_unref_active_buffers.c
+++ b/tests/i915/gem_unref_active_buffers.c
@@ -33,7 +33,6 @@
  */
 #include <errno.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <sys/ioctl.h>
 #include <sys/signal.h>
 #include <sys/time.h>
diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index ec3f2755..f75bf909 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -47,7 +47,6 @@
 #include <setjmp.h>
 #include <sys/ioctl.h>
 #include <sys/mman.h>
-#include <sys/stat.h>
 #include <sys/syscall.h>
 #include <sys/time.h>
 #include <glib.h>
diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
index 3005d347..fa8ca9ee 100644
--- a/tests/i915/gem_vm_create.c
+++ b/tests/i915/gem_vm_create.c
@@ -25,7 +25,6 @@
 #include "i915/gem_create.h"
 #include "i915/gem_vm.h"
 #include "igt.h"
-#include "igt_rand.h"
 #include "igt_dummyload.h"
 
 static int vm_create_ioctl(int i915, struct drm_i915_gem_vm_control *ctl)
diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
index fc1ba007..4baee01c 100644
--- a/tests/i915/gem_watchdog.c
+++ b/tests/i915/gem_watchdog.c
@@ -21,8 +21,6 @@
  * IN THE SOFTWARE.
  */
 
-#include "config.h"
-
 #include <fcntl.h>
 #include <sys/ioctl.h>
 #include <stdio.h>
-- 
2.36.1
