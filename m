Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4D510E3F2
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Nov 2023 20:00:02 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  6 Nov 2023 20:59:41 +0100
Message-Id: <20231106195947.14640-3-lukasz.laguna@intel.com>
In-Reply-To: <20231106195947.14640-1-lukasz.laguna@intel.com>
References: <20231106195947.14640-1-lukasz.laguna@intel.com>
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

Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/drmtest.c          | 17 +++++++++++----
 lib/drmtest.h          |  1 +
 lib/igt_sriov_device.c | 48 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  1 +
 4 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index e1da66c87..88965ac6a 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -245,7 +245,16 @@ static void log_opened_device_path(const char *device_path)
 	igt_info("Opened device: %s\n", item->path);
 }
 
-static int open_device(const char *name, unsigned int chipset)
+/**
+ * drm_open_device:
+ * @name: DRM node name
+ * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
+ *
+ * Open a drm legacy device node.
+ *
+ * Returns: DRM file descriptor or -1 on error
+ */
+int drm_open_device(const char *name, unsigned int chipset)
 {
 	const char *forced;
 	char dev_name[16] = "";
@@ -347,7 +356,7 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
 		if (_is_already_opened(name, as_idx))
 			continue;
 
-		fd = open_device(name, chipset);
+		fd = drm_open_device(name, chipset);
 		if (fd != -1)
 			return fd;
 	}
@@ -389,13 +398,13 @@ static int __open_driver_exact(const char *name, unsigned int chipset)
 {
 	int fd;
 
-	fd = open_device(name, chipset);
+	fd = drm_open_device(name, chipset);
 	if (fd != -1)
 		return fd;
 
 	drm_load_module(chipset);
 
-	return open_device(name, chipset);
+	return drm_open_device(name, chipset);
 }
 
 /*
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 97ab6e759..01785f675 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -98,6 +98,7 @@ void __set_forced_driver(const char *name);
  */
 #define ALIGN_DOWN(x, a)	ALIGN((x) - ((a) - 1), (a))
 
+int drm_open_device(const char *name, unsigned int chipset);
 void drm_load_module(unsigned int chipset);
 int drm_open_driver(int chipset);
 int drm_open_driver_master(int chipset);
diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 7d53c2045..2898765f1 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -3,6 +3,9 @@
  * Copyright(c) 2023 Intel Corporation. All rights reserved.
  */
 
+#include <dirent.h>
+
+#include "drmtest.h"
 #include "igt_core.h"
 #include "igt_sriov_device.h"
 #include "igt_sysfs.h"
@@ -172,3 +175,48 @@ bool igt_sriov_disable_driver_autoprobe(int pf)
 {
 	return __pf_attr_set_u32(pf,  "device/sriov_drivers_autoprobe", false);
 }
+
+/**
+ * igt_sriov_open_vf_drm_device:
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
+	char dir_path[PATH_MAX], path[PATH_MAX], dev_name[16];
+	DIR *dir;
+	struct dirent *de;
+	bool found = false;
+
+	igt_assert(vf_num > 0);
+
+	if (!igt_sysfs_path(pf, dir_path, sizeof(dir_path)))
+		return -1;
+	/* vf_num is 1-based, but virtfn is 0-based */
+	snprintf(path, sizeof(path), "/device/virtfn%u/drm", vf_num - 1);
+	strncat(dir_path, path, sizeof(dir_path) - strlen(dir_path));
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
+	return drm_open_device(dev_name, DRIVER_ANY);
+}
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index f2c5c44fa..b58dd4098 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -16,5 +16,6 @@ bool igt_sriov_disable_vfs(int pf);
 bool igt_sriov_is_driver_autoprobe_enabled(int pf);
 bool igt_sriov_enable_driver_autoprobe(int pf);
 bool igt_sriov_disable_driver_autoprobe(int pf);
+int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
 
 #endif /* __IGT_SRIOV_DEVICE_H__ */
-- 
2.40.0
