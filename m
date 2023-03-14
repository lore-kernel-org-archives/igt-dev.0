Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E0310E84C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 16:10:35 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Date: Tue, 14 Mar 2023 21:35:02 +0530
Message-Id: <20230314160503.2237121-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230314160503.2237121-1-bhanuprakash.modem@intel.com>
References: <20230314160503.2237121-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 4/5] lib/intel_chipset: Add support to XE
 driver to get devid
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

V2: - Separate function for XE (Zbigniew)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/intel_chipset.c | 54 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
index efb6f1771..1d7166aef 100644
--- a/lib/intel_chipset.c
+++ b/lib/intel_chipset.c
@@ -41,6 +41,8 @@
 #include "drmtest.h"
 #include "intel_chipset.h"
 #include "igt_core.h"
+#include "ioctl_wrappers.h"
+#include "xe/xe_query.h"
 
 /**
  * SECTION:intel_chipset
@@ -112,9 +114,45 @@ intel_get_pci_device(void)
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
+static uint32_t __xe_get_drm_devid(int fd)
+{
+	struct drm_xe_query_config *config;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_CONFIG,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	config = malloc(query.size);
+	igt_assert(config);
+
+	query.data = to_user_pointer(config);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	igt_assert(config->num_params > 0);
+
+	return config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
+}
+
 /**
  * intel_get_drm_devid:
- * @fd: open i915 drm file descriptor
+ * @fd: open i915/xe drm file descriptor
  *
  * Queries the kernel for the pci device id corresponding to the drm file
  * descriptor.
@@ -125,22 +163,18 @@ intel_get_pci_device(void)
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
+		return __xe_get_drm_devid(fd);
 }
 
 /**
-- 
2.39.1
