Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DCE10E3E3
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 14:29:33 +0000 (UTC)
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Nov 2023 20:06:35 +0530
Message-Id: <20231120143635.105731-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel: Add changes to use new sysfs
 frequency entries by xe
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

Updated xe set_freq and get_freq definitions to use new sysfs entries.
The new entries will be under sub-directory freq.
Names of the entries have also changed. They will be suffixed with _freq
i.e /device/tile<n>/gt<n>/freq/*_freq instead of prefix.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_guc_pc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index fa2f20cca..bb6344449 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -141,7 +141,7 @@ static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
 	char freq_attr[16];
 	int gt_fd;
 
-	snprintf(freq_attr, sizeof(freq_attr), "freq_%s", freq_name);
+	snprintf(freq_attr, sizeof(freq_attr), "freq/%s_freq", freq_name);
 	gt_fd = xe_sysfs_gt_open(fd, gt_id);
 	igt_assert(gt_fd >= 0);
 
@@ -159,7 +159,7 @@ static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
 	char freq_attr[16];
 	int gt_fd;
 
-	snprintf(freq_attr, sizeof(freq_attr), "freq_%s", freq_name);
+	snprintf(freq_attr, sizeof(freq_attr), "freq/%s_freq", freq_name);
 	gt_fd = xe_sysfs_gt_open(fd, gt_id);
 	igt_assert(gt_fd >= 0);
 
-- 
2.25.1
