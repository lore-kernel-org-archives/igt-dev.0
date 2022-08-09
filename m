Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA80D4721
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:21 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:36 +0200
Message-Id: <20220809125037.1231032-18-ryszard.knop@intel.com>
In-Reply-To: <20220809125037.1231032-1-ryszard.knop@intel.com>
References: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 17/19] tools,
 lib: Replace igt.h with individual header imports
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

Prevents pulling in unnecessary definitions in the library, tools etc.
Also makes it easier and faster to automatically analyze library files.
It's fine to use it in tests, benchmarks and the runner.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/nouveau/cea0b5.c              |  2 +-
 lib/veboxcopy_gen12.c             |  2 +-
 tools/amd_hdmi_compliance.c       |  4 +++-
 tools/igt_compliance_utils.c      |  2 +-
 tools/igt_dp_compliance_hotplug.c |  6 ++++--
 tools/intel_dp_compliance.c       |  8 ++++++--
 tools/intel_gem_info.c            |  4 +++-
 tools/intel_guc_logger.c          |  3 ++-
 tools/intel_gvtg_test.c           |  3 ++-
 tools/intel_pm_rpm.c              |  8 +++++++-
 tools/intel_reg.c                 | 14 ++++++++++----
 tools/intel_residency.c           |  4 +++-
 tools/lsgpu.c                     |  5 +++--
 tools/msm_dp_compliance.c         |  4 +++-
 14 files changed, 49 insertions(+), 20 deletions(-)

diff --git a/lib/nouveau/cea0b5.c b/lib/nouveau/cea0b5.c
index 2df80b05..6b0630af 100644
--- a/lib/nouveau/cea0b5.c
+++ b/lib/nouveau/cea0b5.c
@@ -22,7 +22,7 @@
 
 #include <inttypes.h>
 
-#include "igt.h"
+#include "igt_fb.h"
 #include "igt_nouveau.h"
 
 #include "nouveau/nvif/push906f.h"
diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
index 38878e49..be6803f1 100644
--- a/lib/veboxcopy_gen12.c
+++ b/lib/veboxcopy_gen12.c
@@ -21,8 +21,8 @@
  * IN THE SOFTWARE.
  */
 
-#include "igt.h"
 #include "intel_aux_pgtable.h"
+#include "intel_chipset.h"
 #include "veboxcopy.h"
 
 #define YCRCB_NORMAL	0
diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index 1a759299..b70fbd1d 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -20,7 +20,9 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include "igt.h"
+#include "igt_core.h"
+#include "igt_kms.h"
+#include "drmtest.h"
 
 /* Common test data */
 typedef struct data {
diff --git a/tools/igt_compliance_utils.c b/tools/igt_compliance_utils.c
index e206740d..d84bab8d 100644
--- a/tools/igt_compliance_utils.c
+++ b/tools/igt_compliance_utils.c
@@ -23,12 +23,12 @@
  * IN THE SOFTWARE.
  */
 
-#include "igt.h"
 #include <string.h>
 #include <signal.h>
 #include <termios.h>
 #include <libgen.h>
 
+#include "igt_core.h"
 #include "igt_dp_compliance.h"
 
 static int tio_fd;
diff --git a/tools/igt_dp_compliance_hotplug.c b/tools/igt_dp_compliance_hotplug.c
index 3e0cf3d5..69229dd0 100644
--- a/tools/igt_dp_compliance_hotplug.c
+++ b/tools/igt_dp_compliance_hotplug.c
@@ -23,14 +23,16 @@
  * IN THE SOFTWARE.
  */
 
-#include "igt.h"
 #include <string.h>
 #include <stdlib.h>
 
 #include <sys/stat.h>
 
-#include "igt_dp_compliance.h"
 #include <libudev.h>
+
+#include "igt_core.h"
+#include "igt_dp_compliance.h"
+
 static struct udev_monitor *uevent_monitor;
 static struct udev *udev;
 static GIOChannel *udevchannel;
diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 7390348f..f86ec369 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -106,8 +106,8 @@
  * DRM modeset example
  *
  */
-#include "igt.h"
 #include <errno.h>
+#include <stdlib.h>
 #include <getopt.h>
 #include <stdint.h>
 #include <stdbool.h>
@@ -117,8 +117,12 @@
 #include <fcntl.h>
 
 #include "igt_dp_compliance.h"
+#include "igt_core.h"
+#include "igt_kms.h"
+#include "drmtest.h"
+#include "intel_chipset.h"
 
-#include <stdlib.h>
+#include "i915/gem_mman.h"
 
 /* User Input definitions */
 #define HELP_DESCRIPTION 1
diff --git a/tools/intel_gem_info.c b/tools/intel_gem_info.c
index 3700d20e..0763d0e6 100644
--- a/tools/intel_gem_info.c
+++ b/tools/intel_gem_info.c
@@ -1,9 +1,11 @@
-#include "igt.h"
 #include <sys/ioctl.h>
 #include <errno.h>
 #include <signal.h>
+
 #include <i915_drm.h>
 
+#include "igt_core.h"
+#include "drmtest.h"
 
 int main(void)
 {
diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index ec76eb30..7fb8611b 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -36,7 +36,8 @@
 #include <sys/mman.h>
 #include <pthread.h>
 
-#include "igt.h"
+#include "igt_core.h"
+#include "igt_debugfs.h"
 
 #define MB(x) ((uint64_t)(x) * 1024 * 1024)
 #ifndef PAGE_SIZE
diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c
index 4ede5f08..dac5e5b1 100644
--- a/tools/intel_gvtg_test.c
+++ b/tools/intel_gvtg_test.c
@@ -29,7 +29,6 @@
  * Enable more GVT-g related test cases.
  */
 
-#include "igt.h"
 #include <errno.h>
 #include <getopt.h>
 #include <strings.h>
@@ -40,6 +39,8 @@
 #include <pwd.h>
 #include <dirent.h>
 
+#include "igt_core.h"
+
 #define RANDOM(x) (rand() % x)
 
 
diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index 85ae115a..4851dc06 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -26,11 +26,17 @@
 #include <stdlib.h>
 #include <string.h>
 #include <stdbool.h>
-#include "igt.h"
+
+#include "igt_core.h"
 #include "igt_device.h"
 #include "igt_device_scan.h"
+#include "igt_kms.h"
 #include "igt_pm.h"
 
+#include "intel_chipset.h"
+
+#include <drm.h>
+
 #define DONT_SET_AUTOSUSPEND_DELAY (1 << 0)
 #define SET_I915_AUTOSUSPEND_DELAY (1 << 1)
 
diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 6ff34b4e..392d11a8 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -31,14 +31,20 @@
 #include <sys/stat.h>
 #include <unistd.h>
 
-#include "i915/gem_create.h"
-#include "igt.h"
+#include "i915_drm.h"
+
 #include "igt_gt.h"
-#include "intel_io.h"
-#include "intel_chipset.h"
+#include "drmtest.h"
+#include "ioctl_wrappers.h"
 
+#include "intel_io.h"
+#include "intel_reg.h"
 #include "intel_reg_spec.h"
+#include "intel_chipset.h"
 
+#include "i915/gem_mman.h"
+#include "i915/gem_create.h"
+#include "i915/gem_engine_topology.h"
 
 #ifdef HAVE_SYS_IO_H
 #include <sys/io.h>
diff --git a/tools/intel_residency.c b/tools/intel_residency.c
index 1d329e1f..cf46ed3e 100644
--- a/tools/intel_residency.c
+++ b/tools/intel_residency.c
@@ -32,7 +32,9 @@
 #include <signal.h>
 #include <time.h>
 #include <getopt.h>
-#include "igt.h"
+
+#include "igt_kms.h"
+#include "igt_draw.h"
 
 #define IA32_TIME_STAMP_COUNTER		0x10
 
diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 0a5c114a..05b79e8d 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -22,12 +22,13 @@
  *
  */
 
-#include "igt_device_scan.h"
-#include "igt.h"
 #include <string.h>
 #include <signal.h>
 #include <glib.h>
 
+#include "igt_device_scan.h"
+#include "igt_core.h"
+
 /**
  * SECTION:lsgpu
  * @short_description: lsgpu
diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
index e7d4524e..9b11110c 100644
--- a/tools/msm_dp_compliance.c
+++ b/tools/msm_dp_compliance.c
@@ -107,7 +107,6 @@
  * DRM modeset example
  *
  */
-#include "igt.h"
 #include <errno.h>
 #include <getopt.h>
 #include <stdint.h>
@@ -117,6 +116,9 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 
+#include "igt_core.h"
+#include "igt_kms.h"
+#include "drmtest.h"
 #include "igt_dp_compliance.h"
 
 #include <stdlib.h>
-- 
2.37.1
