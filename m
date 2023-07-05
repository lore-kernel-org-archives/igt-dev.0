Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135D610E362
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 13:14:24 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Jul 2023 18:48:52 +0530
Message-Id: <20230705131853.545449-4-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230705131853.545449-1-himal.prasad.ghimiray@intel.com>
References: <20230705131853.545449-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 3/4] tests/xe/xe_guc_pc: Change the sysfs
 paths
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Upadhyay <tejas.upadhyay@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Changes to access sysfs entries under tile directory.
Access freq sysfs from /sys/class/drm/cardX/device/tileN/gtN
path.

v2:
- Use snprintf instead of sprintf and check error.
- Describe what changes are done. (Kamil)

v3:
- change order of gt and tile and drop passing tilecount.(Ashutosh)

v4:
- Rebase

v5:
- Drop usage of xe_for_each_gt_under_each_tile and use
  a function to return gt path. (Ashutosh)

Reviewed-by: Upadhyay <tejas.upadhyay@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/xe/xe_guc_pc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 827693eb4..046791d51 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -137,8 +137,13 @@ static int set_freq(int sysfs, int gt_id, const char *freq_name, uint32_t freq)
 {
 	int ret = -EAGAIN;
 	char path[32];
+	char *gt_path;
+
+	gt_path = xe_gt_sysfs_path(sysfs, gt_id);
+	igt_assert(snprintf(path, sizeof(path), "%s/freq_%s",
+			    xe_gt_sysfs_path(sysfs, gt_id), freq_name) < sizeof(path));
+	free(gt_path);
 
-	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
 	while (ret == -EAGAIN)
 		ret = igt_sysfs_printf(sysfs, path, "%u", freq);
 	return ret;
@@ -149,7 +154,12 @@ static uint32_t get_freq(int sysfs, int gt_id, const char *freq_name)
 	uint32_t freq;
 	int err = -EAGAIN;
 	char path[32];
-	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
+	char *gt_path;
+
+	gt_path = xe_gt_sysfs_path(sysfs, gt_id);
+	igt_assert(snprintf(path, sizeof(path), "%s/freq_%s",
+			    gt_path, freq_name) < sizeof(path));
+	free(gt_path);
 	while (err == -EAGAIN)
 		err = igt_sysfs_scanf(sysfs, path, "%u", &freq);
 	return freq;
-- 
2.25.1
