Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BCF10E77B
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 10:58:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Date: Tue, 14 Mar 2023 16:24:51 +0530
Message-Id: <20230314105452.2169208-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230314105452.2169208-1-bhanuprakash.modem@intel.com>
References: <20230314105452.2169208-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 4/5] lib/intel_chipset: Add support to XE driver
 to get devid
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

As many tests are using intel devid, add a helper to get it for
XE driver.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/intel_chipset.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
index efb6f1771..73dbd813d 100644
--- a/lib/intel_chipset.c
+++ b/lib/intel_chipset.c
@@ -41,6 +41,7 @@
 #include "drmtest.h"
 #include "intel_chipset.h"
 #include "igt_core.h"
+#include "xe/xe_query.h"
 
 /**
  * SECTION:intel_chipset
@@ -112,9 +113,22 @@ intel_get_pci_device(void)
 	return pci_dev;
 }
 
+static uint32_t __i915_get_drm_devid(int fd)
+{
+	struct drm_i915_getparam gp;
+	int devid = 0;
+
+	memset(&gp, 0, sizeof(gp));
+	gp.param = I915_PARAM_CHIPSET_ID;
+	gp.value = &devid;
+	ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp));
+
+	return devid;
+}
+
 /**
  * intel_get_drm_devid:
- * @fd: open i915 drm file descriptor
+ * @fd: open i915/xe drm file descriptor
  *
  * Queries the kernel for the pci device id corresponding to the drm file
  * descriptor.
@@ -125,22 +139,18 @@ intel_get_pci_device(void)
 uint32_t
 intel_get_drm_devid(int fd)
 {
-	struct drm_i915_getparam gp;
 	const char *override;
-	int devid = 0;
 
-	igt_assert(is_i915_device(fd));
+	igt_assert(is_intel_device(fd));
 
 	override = getenv("INTEL_DEVID_OVERRIDE");
 	if (override)
 		return strtol(override, NULL, 0);
 
-	memset(&gp, 0, sizeof(gp));
-	gp.param = I915_PARAM_CHIPSET_ID;
-	gp.value = &devid;
-	ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp));
-
-	return devid;
+	if (is_i915_device(fd))
+		return __i915_get_drm_devid(fd);
+	else
+		return xe_dev_id(fd);
 }
 
 /**
-- 
2.39.1
