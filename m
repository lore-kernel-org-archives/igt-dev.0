Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274C310F5BF
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Apr 2022 15:26:19 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Date: Wed, 27 Apr 2022 20:29:23 +0530
Message-Id: <20220427145923.532981-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/sysfs: helper for number of GTs
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

From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Added convenience function returning number of GTs.
Reads number of GT sysfs entries and returns number
of GTs, if atleast one GT entry is found.

v2: Add an assert condition to check for atleast one GT entry. (Priyanka)

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/igt_sysfs.c | 22 ++++++++++++++++++++++
 lib/igt_sysfs.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index fe77afd7..ee71a566 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -264,6 +264,28 @@ int igt_sysfs_gt_open(int device, int gt)
 	return open(path, O_RDONLY);
 }
 
+/**
+ * igt_sysfs_get_num_gt:
+ * @device: fd of the device
+ *
+ * Reads number of GT sysfs entries.
+ * Asserts for atleast one GT entry.
+ * (see igt_sysfs_gt_path).
+ *
+ * Returns: Number of GTs.
+ */
+int igt_sysfs_get_num_gt(int device)
+{
+	int num_gts = 0;
+	char path[96];
+
+	while (igt_sysfs_gt_path(device, num_gts, path, sizeof(path)))
+		++num_gts;
+
+	igt_assert_f(num_gts > 0, "No GT sysfs entry is found.");
+
+	return num_gts;
+}
 /**
  * igt_sysfs_write:
  * @dir: directory for the device from igt_sysfs_open()
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 8e39b8fa..1c9791a1 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -94,6 +94,7 @@ char *igt_sysfs_path(int device, char *path, int pathlen);
 int igt_sysfs_open(int device);
 char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen);
 int igt_sysfs_gt_open(int device, int gt);
+int igt_sysfs_get_num_gt(int device);
 bool igt_sysfs_has_attr(int dir, const char *attr);
 const char *igt_sysfs_dir_id_to_name(int dir, enum i915_attr_id id);
 const char *igt_sysfs_path_id_to_name(const char *path, enum i915_attr_id id);
-- 
2.25.1
