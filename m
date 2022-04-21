Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6396110E5F3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 15:00:35 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, petri.latvala@intel.com,
 ashutosh.dixit@intel.com, umesh.nerlige.ramappa@intel.com,
 arjun.melkaveri@intel.com, krishnaiah.bommu@intel.com,
 igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 20:22:07 +0530
Message-Id: <20220421145211.464313-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
References: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] lib/igt_sysfs: Add helpers to iterate
 over GTs
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Provide iterators to:
- construct the subdirectory string for a gt
- obtain fd for the subdirectory of the interface

v2: Separated out RPS functionality into seaparate patch (Ashutosh)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Andi Shyti <andi.shyti@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
---
 lib/igt_sysfs.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h | 13 +++++++++
 2 files changed, 84 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index f8ef23e2..b167c050 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -54,6 +54,21 @@
  * provides basic support for like igt_sysfs_open().
  */
 
+/**
+ * igt_sysfs_has_attr:
+ * @dir: sysfs directory fd
+ * @attr: attr inside sysfs dir that needs to be checked for existence
+ *
+ * This checks if specified attr exists in device sysfs directory.
+ *
+ * Returns:
+ * true if attr exists in sysfs, false otherwise.
+ */
+bool igt_sysfs_has_attr(int dir, const char *attr)
+{
+	return !faccessat(dir, attr, F_OK, 0);
+}
+
 /**
  * igt_sysfs_path:
  * @device: fd of the device
@@ -104,6 +119,62 @@ int igt_sysfs_open(int device)
 	return open(path, O_RDONLY);
 }
 
+/**
+ * igt_sysfs_gt_path:
+ * @device: fd of the device
+ * @gt: gt number
+ * @path: buffer to fill with the sysfs gt path to the device
+ * @pathlen: length of @path buffer
+ *
+ * This finds the sysfs directory corresponding to @device and @gt. If the gt
+ * specific directory is not available and gt is 0, path is filled with sysfs
+ * base directory.
+ *
+ * Returns:
+ * The directory path, or NULL on failure.
+ */
+char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen)
+{
+	struct stat st;
+
+	if (device < 0)
+		return NULL;
+
+	if (igt_debug_on(fstat(device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
+		return NULL;
+
+	snprintf(path, pathlen, "/sys/dev/char/%d:%d/gt/gt%d",
+		 major(st.st_rdev), minor(st.st_rdev), gt);
+
+	if (!igt_debug_on(access(path, F_OK)))
+		return path;
+	else if (!igt_debug_on(gt != 0))
+		return igt_sysfs_path(device, path, pathlen);
+
+	return NULL;
+}
+
+/**
+ * igt_sysfs_gt_open:
+ * @device: fd of the device
+ * @gt: gt number
+ *
+ * This opens the sysfs gt directory corresponding to device and gt for use
+ * with igt_sysfs_set() and igt_sysfs_get().
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_sysfs_gt_open(int device, int gt)
+{
+	char path[96];
+
+	if (igt_debug_on(!igt_sysfs_gt_path(device, gt, path, sizeof(path))))
+		return -1;
+
+	return open(path, O_RDONLY);
+}
+
 /**
  * igt_sysfs_write:
  * @dir: directory for the device from igt_sysfs_open()
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 56741a0a..33317a96 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -28,8 +28,21 @@
 #include <stdbool.h>
 #include <stdarg.h>
 
+#define for_each_sysfs_gt_path(i915__, path__, pathlen__) \
+	for (int gt__ = 0; \
+	     igt_sysfs_gt_path(i915__, gt__, path__, pathlen__) != NULL; \
+	     gt__++)
+
+#define for_each_sysfs_gt_dirfd(i915__, dirfd__, gt__) \
+	for (gt__ = 0; \
+	     (dirfd__ = igt_sysfs_gt_open(i915__, gt__)) != -1; \
+	     close(dirfd__), gt__++)
+
 char *igt_sysfs_path(int device, char *path, int pathlen);
 int igt_sysfs_open(int device);
+char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen);
+int igt_sysfs_gt_open(int device, int gt);
+bool igt_sysfs_has_attr(int dir, const char *attr);
 
 int igt_sysfs_read(int dir, const char *attr, void *data, int len);
 int igt_sysfs_write(int dir, const char *attr, const void *data, int len);
-- 
2.25.1
