Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5FC10E4CE
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 10:40:24 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Jul 2023 16:14:58 +0530
Message-Id: <20230706104500.595707-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230706104500.595707-1-himal.prasad.ghimiray@intel.com>
References: <20230706104500.595707-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 2/4] lib/igt_sysfs: Handling gt related
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

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/igt_sysfs.c | 40 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index dcb38cfc9..445f2d325 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -980,3 +980,43 @@ int xe_sysfs_get_num_tiles(int xe_device)
 
 	return num_tiles;
 }
+
+static bool dir_exists_in_sysfd(int dirfd, char *path)
+{
+	struct stat pathstat;
+
+	if (!fstatat(dirfd, path, &pathstat, 0) && S_ISDIR(pathstat.st_mode))
+		return true;
+
+	return false;
+}
+
+/*
+ * xe_gt_sysfs_path::
+ * @sysfs: fd of sysfs
+ * @gt_id: gt id
+ *
+ * This function returns the path for gtX directory
+ */
+char *xe_gt_sysfs_path(int sysfs, int gt_id)
+{
+	char tiledir[24];
+	char gtdir[32];
+	char *gt_path;
+	int i = 0;
+
+	snprintf(tiledir, sizeof(tiledir), "device/tile0/");
+	snprintf(gtdir, sizeof(gtdir), "%s/gt%d", tiledir, gt_id);
+
+	while (dir_exists_in_sysfd(sysfs, tiledir)) {
+		if (dir_exists_in_sysfd(sysfs, gtdir)) {
+			gt_path = malloc(sizeof(gtdir));
+			strcpy(gt_path, gtdir);
+			return gt_path;
+		} else {
+			snprintf(tiledir, sizeof(tiledir), "device/tile%d/", i++);
+			snprintf(gtdir, sizeof(gtdir), "%s/gt%d", tiledir, gt_id);
+		}
+	}
+	igt_assert_f(false, "No gt%d dir found in sysfs\n", gt_id);
+}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 5d584b1c7..0792c644e 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -153,6 +153,7 @@ typedef struct igt_sysfs_rw_attr {
 } igt_sysfs_rw_attr_t;
 
 void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
+char *xe_gt_sysfs_path(int sysfs, int gt_id);
 
 void igt_sysfs_engines(int xe, int engines, const char **property,
 		       void (*test)(int, int, const char **));
-- 
2.25.1
