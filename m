Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E439E10E562
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jul 2023 11:26:21 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Jul 2023 17:00:53 +0530
Message-Id: <20230707113055.648662-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230707113055.648662-1-himal.prasad.ghimiray@intel.com>
References: <20230707113055.648662-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 2/4] lib/igt_sysfs: Handling gt related
 sysfs uapi changes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Patch https://patchwork.freedesktop.org/series/118927/
is moving gt sysfs parent under tile folder.

With the above patch path for sysfs changes:
from: /sys/class/drm/cardX/device/gtN/
to : /sys/class/drm/cardX/device/tileN/gtN

Adding xe_gt_sysfs_path function to access new path.

v2:
- Calculate number of tiles once within iterator. (Rahul)

v3:
- Drop usage of local variable for tilecount.
- Change order of tile and gt. (Ashutosh)

v4:
- Drop xe_for_each_gt_under_each_tile macro
  add xe_gt_sysfs_path to return path. (Ashutosh)
- Support older dir path along with new. (kamil)

v5:
- Dont use fixed paths. Find gt in available tiles. (Ashutosh)

v6:
- Define gt related functions for xe. (Ashutosh)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/igt_sysfs.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  2 ++
 2 files changed, 56 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index eb35a8088..5bed91304 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -45,6 +45,7 @@
 #include "igt_sysfs.h"
 #include "igt_device.h"
 #include "igt_io.h"
+#include "intel_chipset.h"
 
 /**
  * SECTION:igt_sysfs
@@ -904,6 +905,59 @@ void igt_sysfs_engines(int xe, int engines, const char **property,
 	}
 }
 
+/**
+ * xe_sysfs_gt_path:
+ * @xe_device: fd of the device
+ * @gt: gt number
+ * @path: buffer to fill with the sysfs gt path to the device
+ * @pathlen: length of @path buffer
+ *
+ * Returns:
+ * The directory path, or NULL on failure.
+ */
+char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
+{
+	struct stat st;
+
+	if (xe_device < 0)
+		return NULL;
+
+	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
+		return NULL;
+
+	if (IS_METEORLAKE(xe_device))
+		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile0/gt%d",
+			 major(st.st_rdev), minor(st.st_rdev), gt);
+	else
+		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
+			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
+
+	if (!access(path, F_OK))
+		return path;
+
+	return NULL;
+}
+
+/**
+ * xe_sysfs_gt_open:
+ * @xe_device: fd of the device
+ * @gt: gt number
+ *
+ * This opens the sysfs gt directory corresponding to device and tile for use
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int xe_sysfs_gt_open(int xe_device, int gt)
+{
+	char path[96];
+
+	if (!xe_sysfs_gt_path(xe_device, gt, path, sizeof(path)))
+		return -1;
+
+	return open(path, O_RDONLY);
+}
+
 /**
  * xe_sysfs_tile_path:
  * @xe_device: fd of the device
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 5d584b1c7..afcafb07c 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -157,6 +157,8 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
 void igt_sysfs_engines(int xe, int engines, const char **property,
 		       void (*test)(int, int, const char **));
 
+char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen);
+int xe_sysfs_gt_open(int xe_device, int gt);
 char *xe_sysfs_tile_path(int xe_device, int tile, char *path, int pathlen);
 int xe_sysfs_tile_open(int xe_device, int tile);
 int xe_sysfs_get_num_tiles(int xe_device);
-- 
2.25.1
