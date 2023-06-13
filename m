Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DEB10E262
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 13:33:03 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 19:07:10 +0530
Message-Id: <20230613133713.3315078-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230613133713.3315078-1-himal.prasad.ghimiray@intel.com>
References: <20230613133713.3315078-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/4] lib/igt_sysfs: Add support to query number of
 tiles.
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

With tile and GT seperation in KMD, we need to know
number of tiles supported by platform.
We will need to access tile associated properties from IGT.
Hence adding iterator for all supported tiles.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/igt_sysfs.c | 28 ++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  6 ++++++
 2 files changed, 34 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 8021ba9c..4606adae 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -289,6 +289,34 @@ int igt_sysfs_get_num_gt(int device)
 	return num_gts;
 }
 
+/**
+ * igt_sysfs_get_num_tiles:
+ * @device: fd of the device
+ *
+ * Reads number of tiles sysfs entries.
+ * Asserts for at least one tile entry.
+ *
+ * Returns: Number of tiles.
+ */
+int igt_sysfs_get_num_tiles(int device)
+{
+	int num_tiles = 0;
+	char sysfs[48];
+	char tiledir[96];
+
+	if (!igt_sysfs_path(device, sysfs, sizeof(sysfs)))
+		return -1;
+
+	do {
+		sprintf(tiledir, "%s/device/tile%d", sysfs, num_tiles);
+		num_tiles++;
+	} while (!access(tiledir, F_OK));
+
+	num_tiles--;
+	igt_assert_f(num_tiles > 0, "No tiles sysfs entry is found.");
+	return num_tiles;
+}
+
 /**
  * igt_sysfs_write:
  * @dir: directory for the device from igt_sysfs_open()
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 978b6906..2fb2303c 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -38,6 +38,9 @@
 	     (dirfd__ = igt_sysfs_gt_open(i915__, gt__)) != -1; \
 	     close(dirfd__), gt__++)
 
+#define for_each_sysfs_tile_dirfd(xe__, tile__) \
+	for (tile__ = 0; tile__ < igt_sysfs_get_num_tiles(xe__); ++tile__)
+
 #define i915_for_each_gt for_each_sysfs_gt_dirfd
 
 #define igt_sysfs_rps_write(dir, id, data, len) \
@@ -73,6 +76,8 @@
 #define igt_sysfs_rps_set_boolean(dir, id, value) \
 	igt_sysfs_set_boolean(dir, igt_sysfs_dir_id_to_name(dir, id), value)
 
+#define xe_for_each_tile for_each_sysfs_tile_dirfd
+
 enum i915_attr_id {
 	RPS_ACT_FREQ_MHZ,
 	RPS_CUR_FREQ_MHZ,
@@ -97,6 +102,7 @@ int igt_sysfs_open(int device);
 char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen);
 int igt_sysfs_gt_open(int device, int gt);
 int igt_sysfs_get_num_gt(int device);
+int igt_sysfs_get_num_tiles(int device);
 bool igt_sysfs_has_attr(int dir, const char *attr);
 const char *igt_sysfs_dir_id_to_name(int dir, enum i915_attr_id id);
 const char *igt_sysfs_path_id_to_name(const char *path, enum i915_attr_id id);
-- 
2.25.1
