Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B817A10E5F8
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 15:00:37 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, petri.latvala@intel.com,
 ashutosh.dixit@intel.com, umesh.nerlige.ramappa@intel.com,
 arjun.melkaveri@intel.com, krishnaiah.bommu@intel.com,
 igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 20:22:08 +0530
Message-Id: <20220421145211.464313-4-priyanka.dandamudi@intel.com>
In-Reply-To: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
References: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/6] lib/sysfs: helper for number of gts
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

Added convenience function returning number of gts.
It is calculated as number of gt sysfs entries,
if no entries are found it returns 1 as number of gts.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/igt_sysfs.c | 21 +++++++++++++++++++++
 lib/igt_sysfs.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index b167c050..aebc6eb7 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -175,6 +175,27 @@ int igt_sysfs_gt_open(int device, int gt)
 	return open(path, O_RDONLY);
 }
 
+/**
+ * igt_sysfs_get_num_gts:
+ * @device: fd of the device
+ *
+ * Reads number of gt sysfs entries.
+ * If no gt sysfs entries are found returns 1
+ * (see igt_sysfs_gt_path).
+ *
+ * Returns: Number of gts (at least one).
+ */
+int igt_sysfs_get_num_gts(int device)
+{
+	int num_gts = 0;
+	char path[96];
+
+	while (igt_sysfs_gt_path(device, num_gts, path, sizeof(path)))
+		++num_gts;
+
+	return num_gts;
+}
+
 /**
  * igt_sysfs_write:
  * @dir: directory for the device from igt_sysfs_open()
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 33317a96..6c8b92a7 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -42,6 +42,7 @@ char *igt_sysfs_path(int device, char *path, int pathlen);
 int igt_sysfs_open(int device);
 char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen);
 int igt_sysfs_gt_open(int device, int gt);
+int igt_sysfs_get_num_gts(int device);
 bool igt_sysfs_has_attr(int dir, const char *attr);
 
 int igt_sysfs_read(int dir, const char *attr, void *data, int len);
-- 
2.25.1
