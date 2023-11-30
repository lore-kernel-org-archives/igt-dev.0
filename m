Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705A210E23E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 12:49:04 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 13:48:35 +0100
Message-Id: <20231130124841.16248-3-lukasz.laguna@intel.com>
In-Reply-To: <20231130124841.16248-1-lukasz.laguna@intel.com>
References: <20231130124841.16248-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/8] lib/igt_sriov_device: add helper for
 opening VF device
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

From: Katarzyna Dec <katarzyna.dec@intel.com>

Helper opens DRM device node and returns its file descriptor.

v2:
 - s/drm_open_device/__drm_open_device (Kamil)
 - combine string with one go (Kamil)
v3:
 - change description of __drm_open_device() (Kamil)

Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/drmtest.c          | 22 ++++++++++++++++----
 lib/drmtest.h          |  1 +
 lib/igt_sriov_device.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  1 +
 4 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index f0b97e362..c98754798 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -245,7 +245,21 @@ static void log_opened_device_path(const char *device_path)
 	igt_info("Opened device: %s\n", item->path);
 }
 
-static int open_device(const char *name, unsigned int chipset)
+/**
+ * __drm_open_device:
+ * @name: DRM node name
+ * @chipset: OR'd flags for chipset to be opened
+ *
+ * Open a drm legacy device node with given @name and compatible with given
+ * @chipset flag.
+ *
+ * A special case is the use of the IGT_FORCE_DRIVER environment variable. In
+ * such case, even if opened device is compatible with given @chipset flag, the
+ * function returns error if forced driver is not compatible with @chipset.
+ *
+ * Returns: DRM file descriptor or -1 on error
+ */
+int __drm_open_device(const char *name, unsigned int chipset)
 {
 	const char *forced;
 	char dev_name[16] = "";
@@ -350,7 +364,7 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
 		if (_is_already_opened(name, as_idx))
 			continue;
 
-		fd = open_device(name, chipset);
+		fd = __drm_open_device(name, chipset);
 		if (fd != -1)
 			return fd;
 	}
@@ -392,13 +406,13 @@ static int __open_driver_exact(const char *name, unsigned int chipset)
 {
 	int fd;
 
-	fd = open_device(name, chipset);
+	fd = __drm_open_device(name, chipset);
 	if (fd != -1)
 		return fd;
 
 	drm_load_module(chipset);
 
-	return open_device(name, chipset);
+	return __drm_open_device(name, chipset);
 }
 
 /*
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 909a0c12c..271a93e8b 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -98,6 +98,7 @@ void __set_forced_driver(const char *name);
  */
 #define ALIGN_DOWN(x, a)	ALIGN((x) - ((a) - 1), (a))
 
+int __drm_open_device(const char *name, unsigned int chipset);
 void drm_load_module(unsigned int chipset);
 int drm_open_driver(int chipset);
 int drm_open_driver_master(int chipset);
diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index c5c594c2c..8e4d30b91 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -3,8 +3,10 @@
  * Copyright(c) 2023 Intel Corporation. All rights reserved.
  */
 
+#include <dirent.h>
 #include <errno.h>
 
+#include "drmtest.h"
 #include "igt_core.h"
 #include "igt_sriov_device.h"
 #include "igt_sysfs.h"
@@ -211,3 +213,47 @@ void igt_sriov_disable_driver_autoprobe(int pf)
 {
 	pf_attr_set_u32(pf,  "device/sriov_drivers_autoprobe", false);
 }
+
+/**
+ * igt_sriov_open_vf_drm_device - Open VF DRM device node
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based to identify single VF)
+ *
+ * Open DRM device node for given VF.
+ *
+ * Return:
+ * VF file descriptor or -1 on error.
+ */
+int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
+{
+	char dir_path[PATH_MAX], path[256], dev_name[16];
+	DIR *dir;
+	struct dirent *de;
+	bool found = false;
+
+	igt_assert(vf_num > 0);
+
+	if (!igt_sysfs_path(pf, path, sizeof(path)))
+		return -1;
+	/* vf_num is 1-based, but virtfn is 0-based */
+	snprintf(dir_path, sizeof(dir_path), "%s/device/virtfn%u/drm", path, vf_num - 1);
+
+	dir = opendir(dir_path);
+	if (!dir)
+		return -1;
+	while ((de = readdir(dir))) {
+		unsigned int card_num;
+
+		if (sscanf(de->d_name, "card%d", &card_num) == 1) {
+			snprintf(dev_name, sizeof(dev_name), "/dev/dri/card%u", card_num);
+			found = true;
+			break;
+		}
+	}
+	closedir(dir);
+
+	if (!found)
+		return -1;
+
+	return __drm_open_device(dev_name, DRIVER_ANY);
+}
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 337fdf84b..4e57f0dcb 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -25,5 +25,6 @@ void igt_sriov_disable_vfs(int pf);
 bool igt_sriov_is_driver_autoprobe_enabled(int pf);
 void igt_sriov_enable_driver_autoprobe(int pf);
 void igt_sriov_disable_driver_autoprobe(int pf);
+int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
 
 #endif /* __IGT_SRIOV_DEVICE_H__ */
-- 
2.40.0
