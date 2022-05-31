Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16B6113342
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 14:29:49 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 31 May 2022 16:28:41 +0200
Message-Id: <20220531142844.278366-11-ryszard.knop@intel.com>
In-Reply-To: <20220531142844.278366-1-ryszard.knop@intel.com>
References: <20220531142844.278366-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 11/14] tests/*: Remove unused headers
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
 tests/core_auth.c              | 11 +----------
 tests/core_getclient.c         |  1 -
 tests/core_getstats.c          |  1 -
 tests/core_getversion.c        |  1 -
 tests/core_hotunplug.c         |  3 ---
 tests/core_setmaster_vs_auth.c |  2 --
 tests/debugfs_test.c           |  2 --
 tests/drm_import_export.c      |  7 -------
 tests/drm_read.c               |  7 -------
 tests/dumb_buffer.c            |  4 ----
 tests/fbdev.c                  |  6 ------
 tests/msm/msm_mapping.c        |  1 -
 tests/prime_mmap.c             |  5 -----
 tests/prime_nv_pcopy.c         |  2 --
 tests/prime_nv_test.c          |  1 -
 tests/prime_self_import.c      |  2 --
 tests/syncobj_timeline.c       |  1 -
 tests/syncobj_wait.c           |  1 -
 tests/testdisplay.c            |  6 ------
 tests/testdisplay_hotplug.c    |  2 --
 tests/tools_test.c             |  4 ----
 tests/vgem_slow.c              |  2 --
 22 files changed, 1 insertion(+), 71 deletions(-)

diff --git a/tests/core_auth.c b/tests/core_auth.c
index c9ad3fb9..1dd5f2f8 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -28,24 +28,15 @@
 #include "igt.h"
 #include <unistd.h>
 #include <stdlib.h>
-#include <stdint.h>
 #include <stdio.h>
 #include <string.h>
-#include <signal.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sched.h>
-#include <sys/mount.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <sys/poll.h>
 #include <sys/resource.h>
 #include "drm.h"
 
 #ifndef __linux__
-# include <pthread.h>
+#include <pthread.h>
 #endif
 
 IGT_TEST_DESCRIPTION("Call drmGetMagic() and drmAuthMagic() and see if it behaves.");
diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 40a1c194..7c48851a 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -26,7 +26,6 @@
  */
 
 #include "igt.h"
-#include <limits.h>
 #include <sys/ioctl.h>
 #include <stdlib.h>
 #include <errno.h>
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index fde27cdc..76195a31 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -26,7 +26,6 @@
  */
 
 #include "igt.h"
-#include <limits.h>
 #include <sys/ioctl.h>
 #include <sys/types.h>
 
diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index f6953b31..118e5835 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -27,7 +27,6 @@
 
 #include "igt.h"
 #include <string.h>
-#include <sys/ioctl.h>
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
 		     "drmGetVersion() interface to it.");
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index a0d29b79..bf8bc3f2 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -26,10 +26,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
-#include <sys/stat.h>
-#include <sys/types.h>
 #include <unistd.h>
-#include <signal.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
index 0b4b8613..03446c33 100644
--- a/tests/core_setmaster_vs_auth.c
+++ b/tests/core_setmaster_vs_auth.c
@@ -35,8 +35,6 @@
 
 #include "igt.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
 
 #include "igt_device.h"
diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
index 0b4b6e23..e73402ab 100644
--- a/tests/debugfs_test.c
+++ b/tests/debugfs_test.c
@@ -20,13 +20,11 @@
  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
  * IN THE SOFTWARE.
  */
-#include "config.h"
 
 #include "i915/gem.h"
 #include "igt.h"
 #include "igt_sysfs.h"
 #include <fcntl.h>
-#include <sys/types.h>
 #include <dirent.h>
 
 IGT_TEST_DESCRIPTION("Read entries from debugfs and sysfs paths.");
diff --git a/tests/drm_import_export.c b/tests/drm_import_export.c
index 06245e8b..c3c0bc20 100644
--- a/tests/drm_import_export.c
+++ b/tests/drm_import_export.c
@@ -25,20 +25,13 @@
  */
 
 #include "igt.h"
-#include <stdio.h>
 #include <sys/types.h>
-#include <sys/stat.h>
 #include <fcntl.h>
-#include <stdlib.h>
 #include <string.h>
-#include <drm.h>
-#include <i915_drm.h>
-#include <xf86drm.h>
 #include <intel_bufmgr.h>
 #include <errno.h>
 #include <pthread.h>
 #include <unistd.h>
-#include <sys/syscall.h>
 
 #include "i915/gem.h"
 
diff --git a/tests/drm_read.c b/tests/drm_read.c
index 3186e609..e3acdd66 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -31,17 +31,10 @@
 
 #include "igt.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdint.h>
-#include <stdio.h>
 #include <string.h>
 #include <signal.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
 #include <sys/poll.h>
 #include <pthread.h>
 #include "drm.h"
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index cb8d2f51..2e0311c1 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -32,16 +32,12 @@
  */
 
 #include <errno.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <pthread.h>
 #include <signal.h>
 #include <stdatomic.h>
-#include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <sys/ioctl.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 
 #include <drm.h>
diff --git a/tests/fbdev.c b/tests/fbdev.c
index 794882a6..64c86c08 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -21,8 +21,6 @@
  * IN THE SOFTWARE.
  */
 
-#include "config.h"
-
 #include "igt.h"
 
 #include <errno.h>
@@ -31,14 +29,10 @@
 #include <string.h>
 #include <sys/ioctl.h>
 #include <sys/mman.h>
-#include <sys/stat.h>
-#include <sys/types.h>
 #include <unistd.h>
 
 #include <linux/fb.h>
 
-#include "igt.h"
-
 #define PANSTEP(panstep_) \
 	((panstep_) ? (panstep_) : 1)
 
diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index e1474f9f..21775aa8 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -26,7 +26,6 @@
 #include <glob.h>
 #include <string.h>
 #include <sys/poll.h>
-#include <sys/stat.h>
 
 #include "igt.h"
 #include "igt_msm.h"
diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
index d53185ff..0c075214 100644
--- a/tests/prime_mmap.c
+++ b/tests/prime_mmap.c
@@ -34,11 +34,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <pthread.h>
 
 #include "drm.h"
 #include "drmtest.h"
@@ -47,7 +43,6 @@
 #include "i915_drm.h"
 #include "i915/gem_create.h"
 #include "i915/gem_mman.h"
-#include "igt_debugfs.h"
 #include "ioctl_wrappers.h"
 #include "i915/intel_memory_region.h"
 
diff --git a/tests/prime_nv_pcopy.c b/tests/prime_nv_pcopy.c
index e465e5fc..e98e48ee 100644
--- a/tests/prime_nv_pcopy.c
+++ b/tests/prime_nv_pcopy.c
@@ -22,8 +22,6 @@
 #include <fcntl.h>
 #include <string.h>
 #include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <errno.h>
 
 #include "intel_bufmgr.h"
 #include "nouveau.h"
diff --git a/tests/prime_nv_test.c b/tests/prime_nv_test.c
index 81d142f4..eb647668 100644
--- a/tests/prime_nv_test.c
+++ b/tests/prime_nv_test.c
@@ -21,7 +21,6 @@
 #include <fcntl.h>
 #include <string.h>
 #include <sys/stat.h>
-#include <sys/ioctl.h>
 
 #include "intel_bufmgr.h"
 #include "nouveau.h"
diff --git a/tests/prime_self_import.c b/tests/prime_self_import.c
index bf548619..1494b86a 100644
--- a/tests/prime_self_import.c
+++ b/tests/prime_self_import.c
@@ -34,12 +34,10 @@
 #include "igt.h"
 #include <unistd.h>
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <pthread.h>
 
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index 20375cdd..b4858673 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -26,7 +26,6 @@
 #include "igt_syncobj.h"
 #include <unistd.h>
 #include <time.h>
-#include <sys/ioctl.h>
 #include <pthread.h>
 #include <signal.h>
 #include "drm.h"
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index 669d0adf..19995544 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -26,7 +26,6 @@
 #include "igt_syncobj.h"
 #include <unistd.h>
 #include <time.h>
-#include <sys/ioctl.h>
 #include <pthread.h>
 #include <signal.h>
 #include "drm.h"
diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index e9fbd260..7d79439e 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -45,23 +45,17 @@
  *  - DP commands (e.g. poweroff)
  * - verify outputs against VBT/physical connectors
  */
-#include "config.h"
 
 #include "igt.h"
 #include <cairo.h>
 #include <errno.h>
 #include <getopt.h>
 #include <libgen.h>
-#include <math.h>
 #include <stdint.h>
 #include <stdbool.h>
 #include <strings.h>
 #include <unistd.h>
 #include <termios.h>
-#include <sys/poll.h>
-#include <sys/time.h>
-#include <sys/ioctl.h>
-#include <sys/types.h>
 #include <sys/stat.h>
 
 #include "testdisplay.h"
diff --git a/tests/testdisplay_hotplug.c b/tests/testdisplay_hotplug.c
index cd784895..f77554ca 100644
--- a/tests/testdisplay_hotplug.c
+++ b/tests/testdisplay_hotplug.c
@@ -22,14 +22,12 @@
  */
 
 #include "igt.h"
-#include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
 
 #include <sys/stat.h>
 
 #include "testdisplay.h"
-#include "config.h"
 
 
 #include <libudev.h>
diff --git a/tests/tools_test.c b/tests/tools_test.c
index 237f0433..476b2434 100644
--- a/tests/tools_test.c
+++ b/tests/tools_test.c
@@ -20,12 +20,8 @@
  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
  * IN THE SOFTWARE.
  */
-#include "config.h"
 #include "igt.h"
 #include <stdio.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
 #include <libgen.h>
 #include <unistd.h>
 #include <linux/limits.h>
diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
index 58b09e42..91fe6f20 100644
--- a/tests/vgem_slow.c
+++ b/tests/vgem_slow.c
@@ -28,8 +28,6 @@
 
 #include <sys/mman.h>
 #include <sys/poll.h>
-#include <sys/stat.h>
-#include <dirent.h>
 
 IGT_TEST_DESCRIPTION("Extended sanity check of Virtual GEM module (vGEM).");
 
-- 
2.36.1
