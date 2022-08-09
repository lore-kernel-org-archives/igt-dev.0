Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550D8D4760
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:10 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:22 +0200
Message-Id: <20220809125037.1231032-4-ryszard.knop@intel.com>
In-Reply-To: <20220809125037.1231032-1-ryszard.knop@intel.com>
References: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 03/19] benchmarks: Remove unused headers
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
 benchmarks/gem_blt.c                     | 5 -----
 benchmarks/gem_busy.c                    | 5 -----
 benchmarks/gem_create.c                  | 6 ------
 benchmarks/gem_exec_ctx.c                | 7 -------
 benchmarks/gem_exec_fault.c              | 7 -------
 benchmarks/gem_exec_nop.c                | 8 --------
 benchmarks/gem_exec_reloc.c              | 6 ------
 benchmarks/gem_exec_trace.c              | 5 -----
 benchmarks/gem_exec_tracer.c             | 6 ------
 benchmarks/gem_latency.c                 | 7 -------
 benchmarks/gem_prw.c                     | 7 -------
 benchmarks/gem_set_domain.c              | 8 --------
 benchmarks/gem_syslatency.c              | 6 ------
 benchmarks/gem_userptr_benchmark.c       | 8 --------
 benchmarks/gem_wsim.c                    | 6 ------
 benchmarks/intel_upload_blit_large.c     | 6 ------
 benchmarks/intel_upload_blit_large_gtt.c | 5 -----
 benchmarks/intel_upload_blit_large_map.c | 5 -----
 benchmarks/intel_upload_blit_small.c     | 4 ----
 benchmarks/kms_vblank.c                  | 5 -----
 benchmarks/prime_lookup.c                | 6 ------
 benchmarks/vgem_mmap.c                   | 5 -----
 22 files changed, 133 deletions(-)

diff --git a/benchmarks/gem_blt.c b/benchmarks/gem_blt.c
index bd8264b4..111e2e72 100644
--- a/benchmarks/gem_blt.c
+++ b/benchmarks/gem_blt.c
@@ -31,12 +31,7 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
 #include <math.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/time.h>
 #include <time.h>
 
diff --git a/benchmarks/gem_busy.c b/benchmarks/gem_busy.c
index 514e3387..22523f14 100644
--- a/benchmarks/gem_busy.c
+++ b/benchmarks/gem_busy.c
@@ -30,13 +30,9 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/poll.h>
 #include <sys/ioctl.h>
-#include <sys/time.h>
 #include <time.h>
 
 #include "drm.h"
@@ -44,7 +40,6 @@
 #include "drmtest.h"
 #include "intel_chipset.h"
 #include "intel_reg.h"
-#include "igt_stats.h"
 #include "i915/gem_create.h"
 #include "i915/gem_mman.h"
 
diff --git a/benchmarks/gem_create.c b/benchmarks/gem_create.c
index 7808f43a..ef9251a9 100644
--- a/benchmarks/gem_create.c
+++ b/benchmarks/gem_create.c
@@ -30,15 +30,9 @@
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
 #include "drmtest.h"
 #include "i915/gem_create.h"
 #include "igt_aux.h"
diff --git a/benchmarks/gem_exec_ctx.c b/benchmarks/gem_exec_ctx.c
index b0c62e4c..58032b85 100644
--- a/benchmarks/gem_exec_ctx.c
+++ b/benchmarks/gem_exec_ctx.c
@@ -30,20 +30,13 @@
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
 
 #include "drm.h"
 #include "drmtest.h"
 #include "i915/gem_create.h"
-#include "intel_io.h"
 #include "intel_reg.h"
-#include "igt_stats.h"
 #include "ioctl_wrappers.h"
 
 enum mode { NOP, CREATE, SWITCH, DEFAULT };
diff --git a/benchmarks/gem_exec_fault.c b/benchmarks/gem_exec_fault.c
index e0484071..03a7fcb1 100644
--- a/benchmarks/gem_exec_fault.c
+++ b/benchmarks/gem_exec_fault.c
@@ -32,19 +32,12 @@
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
 #include "drmtest.h"
 #include "i915/gem_create.h"
 #include "i915/gem_submission.h"
-#include "igt_stats.h"
 #include "intel_allocator.h"
 #include "intel_io.h"
 #include "intel_reg.h"
diff --git a/benchmarks/gem_exec_nop.c b/benchmarks/gem_exec_nop.c
index 9f8634a7..583f3470 100644
--- a/benchmarks/gem_exec_nop.c
+++ b/benchmarks/gem_exec_nop.c
@@ -30,19 +30,11 @@
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
 #include "drmtest.h"
 #include "i915/gem_create.h"
-#include "igt_stats.h"
-#include "intel_io.h"
 #include "intel_reg.h"
 #include "ioctl_wrappers.h"
 
diff --git a/benchmarks/gem_exec_reloc.c b/benchmarks/gem_exec_reloc.c
index dadc064f..912775b9 100644
--- a/benchmarks/gem_exec_reloc.c
+++ b/benchmarks/gem_exec_reloc.c
@@ -30,17 +30,11 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 
-#include "drm.h"
 #include "drmtest.h"
 #include "i915/gem_create.h"
 #include "i915/gem_mman.h"
-#include "igt_debugfs.h"
 #include "intel_reg.h"
 #include "ioctl_wrappers.h"
 
diff --git a/benchmarks/gem_exec_trace.c b/benchmarks/gem_exec_trace.c
index 4263ccb0..2a970491 100644
--- a/benchmarks/gem_exec_trace.c
+++ b/benchmarks/gem_exec_trace.c
@@ -31,10 +31,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
 #include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/time.h>
 #include <time.h>
 #include <assert.h>
@@ -42,8 +39,6 @@
 #include "drm.h"
 #include "drmtest.h"
 #include "i915/gem_create.h"
-#include "igt_stats.h"
-#include "intel_io.h"
 #include "ioctl_wrappers.h"
 
 enum {
diff --git a/benchmarks/gem_exec_tracer.c b/benchmarks/gem_exec_tracer.c
index e6973991..70bbc9bf 100644
--- a/benchmarks/gem_exec_tracer.c
+++ b/benchmarks/gem_exec_tracer.c
@@ -25,22 +25,16 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdint.h>
-#include <stdbool.h>
 #include <stdarg.h>
 #include <fcntl.h>
 #include <sys/types.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <unistd.h>
 #include <errno.h>
-#include <sys/mman.h>
 #include <dlfcn.h>
 #include <i915_drm.h>
 #include <pthread.h>
 
-#include "intel_aub.h"
-#include "intel_chipset.h"
-
 static int (*libc_close)(int fd);
 static int (*libc_ioctl)(int fd, unsigned long request, void *argp);
 
diff --git a/benchmarks/gem_latency.c b/benchmarks/gem_latency.c
index cc8b3de5..7edc33e9 100644
--- a/benchmarks/gem_latency.c
+++ b/benchmarks/gem_latency.c
@@ -32,17 +32,10 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <limits.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
 #include <sys/poll.h>
 #include <sys/resource.h>
 
-#include "drm.h"
 #include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_device.h"
diff --git a/benchmarks/gem_prw.c b/benchmarks/gem_prw.c
index c6f3e066..ae00c022 100644
--- a/benchmarks/gem_prw.c
+++ b/benchmarks/gem_prw.c
@@ -30,18 +30,11 @@
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
 #include "drmtest.h"
 #include "i915/gem_create.h"
-#include "igt_aux.h"
 #include "igt_stats.h"
 #include "ioctl_wrappers.h"
 
diff --git a/benchmarks/gem_set_domain.c b/benchmarks/gem_set_domain.c
index c92beea4..373aaf0e 100644
--- a/benchmarks/gem_set_domain.c
+++ b/benchmarks/gem_set_domain.c
@@ -29,19 +29,11 @@
 #include <stdlib.h>
 #include <stdint.h>
 #include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/time.h>
 #include <time.h>
 
-#include "drm.h"
 #include "drmtest.h"
 #include "i915/gem_create.h"
-#include "igt_aux.h"
 #include "ioctl_wrappers.h"
 
 static double elapsed(const struct timespec *start,
diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
index 035ee934..2fe85ee0 100644
--- a/benchmarks/gem_syslatency.c
+++ b/benchmarks/gem_syslatency.c
@@ -30,19 +30,13 @@
 #include <string.h>
 #include <fcntl.h>
 #include <ftw.h>
-#include <inttypes.h>
 #include <pthread.h>
 #include <sched.h>
 #include <signal.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/time.h>
 #include <time.h>
 #include <limits.h>
-#include "drm.h"
-
-#include <linux/unistd.h>
 
 #include "i915/gem_create.h"
 #include "i915/gem_ring.h"
diff --git a/benchmarks/gem_userptr_benchmark.c b/benchmarks/gem_userptr_benchmark.c
index 3b589432..3ea24d5c 100644
--- a/benchmarks/gem_userptr_benchmark.c
+++ b/benchmarks/gem_userptr_benchmark.c
@@ -35,21 +35,13 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
 #include <assert.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 #include <sys/mman.h>
 #include <signal.h>
 
-#include "drm.h"
-#include "i915_drm.h"
-
 #include "drmtest.h"
-#include "intel_batchbuffer.h"
-#include "intel_chipset.h"
 #include "ioctl_wrappers.h"
 #include "igt_aux.h"
 
diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 2d601358..412cfc13 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -29,16 +29,12 @@
 #include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
 #include <poll.h>
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <sys/ioctl.h>
-#include <sys/time.h>
-#include <sys/wait.h>
 #include <time.h>
-#include <assert.h>
 #include <limits.h>
 #include <pthread.h>
 #include <math.h>
@@ -50,10 +46,8 @@
 #include "intel_reg.h"
 #include "ioctl_wrappers.h"
 
-#include "intel_io.h"
 #include "igt_aux.h"
 #include "igt_rand.h"
-#include "igt_perf.h"
 #include "sw_sync.h"
 
 #include "i915/gem_create.h"
diff --git a/benchmarks/intel_upload_blit_large.c b/benchmarks/intel_upload_blit_large.c
index 12bbae3d..23c48223 100644
--- a/benchmarks/intel_upload_blit_large.c
+++ b/benchmarks/intel_upload_blit_large.c
@@ -45,17 +45,11 @@
  */
 
 #include "igt.h"
-#include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <assert.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 
-#include <drm.h>
 #include <i915_drm.h>
 
 #define OBJECT_WIDTH	1280
diff --git a/benchmarks/intel_upload_blit_large_gtt.c b/benchmarks/intel_upload_blit_large_gtt.c
index 0b704b57..8fd82b9e 100644
--- a/benchmarks/intel_upload_blit_large_gtt.c
+++ b/benchmarks/intel_upload_blit_large_gtt.c
@@ -45,14 +45,9 @@
  */
 
 #include "igt.h"
-#include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <assert.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 
 #define OBJECT_WIDTH	1280
diff --git a/benchmarks/intel_upload_blit_large_map.c b/benchmarks/intel_upload_blit_large_map.c
index ae05434f..11f19469 100644
--- a/benchmarks/intel_upload_blit_large_map.c
+++ b/benchmarks/intel_upload_blit_large_map.c
@@ -48,14 +48,9 @@
  */
 
 #include "igt.h"
-#include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <assert.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 
 #define OBJECT_WIDTH	1280
diff --git a/benchmarks/intel_upload_blit_small.c b/benchmarks/intel_upload_blit_small.c
index 7e3346eb..91034a6b 100644
--- a/benchmarks/intel_upload_blit_small.c
+++ b/benchmarks/intel_upload_blit_small.c
@@ -44,11 +44,7 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <assert.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 
 /* Happens to be 128k, the size of the VBOs used by i965's Mesa driver. */
diff --git a/benchmarks/kms_vblank.c b/benchmarks/kms_vblank.c
index f32cc9e3..d7050fbc 100644
--- a/benchmarks/kms_vblank.c
+++ b/benchmarks/kms_vblank.c
@@ -30,13 +30,8 @@
 #include <stdio.h>
 #include <string.h>
 #include <unistd.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
 #include <time.h>
-#include <sys/stat.h>
 #include <sys/time.h>
-#include <sys/wait.h>
 
 #include <drm.h>
 #include <xf86drm.h>
diff --git a/benchmarks/prime_lookup.c b/benchmarks/prime_lookup.c
index 9c885367..3523a4f1 100644
--- a/benchmarks/prime_lookup.c
+++ b/benchmarks/prime_lookup.c
@@ -27,16 +27,10 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <sys/resource.h>
 #include <sys/time.h>
 #include <time.h>
 
-#include "drm.h"
 #include "drmtest.h"
 #include "i915/gem_create.h"
 #include "igt_rand.h"
diff --git a/benchmarks/vgem_mmap.c b/benchmarks/vgem_mmap.c
index 7e4e459e..3deed448 100644
--- a/benchmarks/vgem_mmap.c
+++ b/benchmarks/vgem_mmap.c
@@ -27,11 +27,6 @@
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
 
-- 
2.37.1
