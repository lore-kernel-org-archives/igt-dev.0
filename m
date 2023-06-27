Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977DB10E175
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 12:19:59 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:53:02 +0530
Message-Id: <20230627122305.4097852-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230627122305.4097852-1-himal.prasad.ghimiray@intel.com>
References: <20230627122305.4097852-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 1/4] lib/igt_sysfs: Add support to query number
 of tiles
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

With tile and GT seperation in KMD, we need to know
number of tiles supported by platform.
We will need to access tile associated properties from IGT.
Hence adding iterator for all supported tiles.

v2:
- Calculate number of tiles once within iterator. (Rahul)
- Use snprintf instead of sprintf.

Reviewed-by: Upadhyay <tejas.upadhyay@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/igt_sysfs.c | 30 ++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  8 ++++++++
 2 files changed, 38 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 35a4faa9..495b0288 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -287,6 +287,36 @@ int igt_sysfs_get_num_gt(int device)
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
+	int num_tiles;
+	char sysfs[48];
+	char tiledir[96];
+
+	num_tiles =0;
+	if (!igt_sysfs_path(device, sysfs, sizeof(sysfs)))
+		return -1;
+
+	do {
+		igt_assert(snprintf(tiledir, sizeof(tiledir), "%s/device/tile%d",
+				    sysfs, num_tiles) < sizeof(tiledir));
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
index 978b6906..de2c9a86 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -38,6 +38,11 @@
 	     (dirfd__ = igt_sysfs_gt_open(i915__, gt__)) != -1; \
 	     close(dirfd__), gt__++)
 
+#define for_each_sysfs_tile_dirfd(xe__, tile__, tile_cnt__) \
+	for (tile__ = 0, tile_cnt__ = igt_sysfs_get_num_tiles(xe__); \
+	     tile__ < tile_cnt__; \
+	     ++tile__)
+
 #define i915_for_each_gt for_each_sysfs_gt_dirfd
 
 #define igt_sysfs_rps_write(dir, id, data, len) \
@@ -73,6 +78,8 @@
 #define igt_sysfs_rps_set_boolean(dir, id, value) \
 	igt_sysfs_set_boolean(dir, igt_sysfs_dir_id_to_name(dir, id), value)
 
+#define xe_for_each_tile for_each_sysfs_tile_dirfd
+
 enum i915_attr_id {
 	RPS_ACT_FREQ_MHZ,
 	RPS_CUR_FREQ_MHZ,
@@ -97,6 +104,7 @@ int igt_sysfs_open(int device);
 char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen);
 int igt_sysfs_gt_open(int device, int gt);
 int igt_sysfs_get_num_gt(int device);
+int igt_sysfs_get_num_tiles(int device);
 bool igt_sysfs_has_attr(int dir, const char *attr);
 const char *igt_sysfs_dir_id_to_name(int dir, enum i915_attr_id id);
 const char *igt_sysfs_path_id_to_name(const char *path, enum i915_attr_id id);
-- 
2.25.1
