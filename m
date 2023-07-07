Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFAA10E562
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jul 2023 11:26:21 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Jul 2023 17:00:52 +0530
Message-Id: <20230707113055.648662-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230707113055.648662-1-himal.prasad.ghimiray@intel.com>
References: <20230707113055.648662-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 1/4] lib/igt_sysfs: Add support to query
 number of tiles
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

v3:
- Remove unrequired for_each_sysfs_tile_dirfd (Ashutosh)

v4:
- Implement tiles related functions in lib. (Ashutosh)

v5:
- Fix comments and remove not required conditional check. (Ashutosh)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/igt_sysfs.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h | 10 +++++++
 2 files changed, 81 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 0876f4c6b..eb35a8088 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -903,3 +903,74 @@ void igt_sysfs_engines(int xe, int engines, const char **property,
 		close(engine_fd);
 	}
 }
+
+/**
+ * xe_sysfs_tile_path:
+ * @xe_device: fd of the device
+ * @tile: tile number
+ * @path: buffer to fill with the sysfs tile path to the device
+ * @pathlen: length of @path buffer
+ *
+ * Returns:
+ * The directory path, or NULL on failure.
+ */
+char *xe_sysfs_tile_path(int xe_device, int tile, char *path, int pathlen)
+{
+	struct stat st;
+
+	if (xe_device < 0)
+		return NULL;
+
+	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
+		return NULL;
+
+	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d",
+		 major(st.st_rdev), minor(st.st_rdev), tile);
+
+	if (!access(path, F_OK))
+		return path;
+	return NULL;
+}
+
+/**
+ * xe_sysfs_tile_open:
+ * @xe_device: fd of the device
+ * @tile: tile number
+ *
+ * This opens the sysfs tile directory corresponding to device and tile for use
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int xe_sysfs_tile_open(int xe_device, int tile)
+{
+	char path[96];
+
+	if (!xe_sysfs_tile_path(xe_device, tile, path, sizeof(path)))
+		return -1;
+
+	return open(path, O_RDONLY);
+}
+
+/**
+ * xe_sysfs_get_num_tiles:
+ * @xe_device: fd of the device
+ *
+ * Reads number of tile sysfs entries.
+ * Asserts for at least one tile entry.
+ * (see xe_sysfs_tile_path).
+ *
+ * Returns: Number of tiles.
+ */
+int xe_sysfs_get_num_tiles(int xe_device)
+{
+	int num_tiles = 0;
+	char path[96];
+
+	while (xe_sysfs_tile_path(xe_device, num_tiles, path, sizeof(path)))
+		++num_tiles;
+
+	igt_assert_f(num_tiles > 0, "No GT sysfs entry is found.");
+
+	return num_tiles;
+}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 5635fc690..5d584b1c7 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -38,6 +38,11 @@
 	     (dirfd__ = igt_sysfs_gt_open(i915__, gt__)) != -1; \
 	     close(dirfd__), gt__++)
 
+#define for_each_sysfs_tile_dirfd(xe__, dirfd__, tile__) \
+	for (tile__ = 0; \
+	     (dirfd__ = xe_sysfs_tile_open(xe__, tile__)) != -1; \
+	     close(dirfd__), tile__++)
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
@@ -150,4 +157,7 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
 void igt_sysfs_engines(int xe, int engines, const char **property,
 		       void (*test)(int, int, const char **));
 
+char *xe_sysfs_tile_path(int xe_device, int tile, char *path, int pathlen);
+int xe_sysfs_tile_open(int xe_device, int tile);
+int xe_sysfs_get_num_tiles(int xe_device);
 #endif /* __IGT_SYSFS_H__ */
-- 
2.25.1
