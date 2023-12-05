Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B8210E550
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Dec 2023 21:38:23 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 16:38:11 -0500
Message-ID: <20231205213814.179963-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/intel/xe: Align change in the
 name of frequency sysfs attributes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Aligns with kernel commit ("drm/xe: Change the name of frequency sysfs attributes")

Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/{xe_guc_pc.c => xe_gt_freq.c} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename tests/intel/{xe_guc_pc.c => xe_gt_freq.c} (98%)

diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_gt_freq.c
similarity index 98%
rename from tests/intel/xe_guc_pc.c
rename to tests/intel/xe_gt_freq.c
index 3376e838f..a92833acb 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_gt_freq.c
@@ -37,7 +37,7 @@ static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
 	char freq_attr[16];
 	int gt_fd;
 
-	snprintf(freq_attr, sizeof(freq_attr), "freq_%s", freq_name);
+	snprintf(freq_attr, sizeof(freq_attr), "%s_freq", freq_name);
 	gt_fd = xe_sysfs_gt_open(fd, gt_id);
 	igt_assert(gt_fd >= 0);
 
@@ -55,7 +55,7 @@ static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
 	char freq_attr[16];
 	int gt_fd;
 
-	snprintf(freq_attr, sizeof(freq_attr), "freq_%s", freq_name);
+	snprintf(freq_attr, sizeof(freq_attr), "%s_freq", freq_name);
 	gt_fd = xe_sysfs_gt_open(fd, gt_id);
 	igt_assert(gt_fd >= 0);
 
-- 
2.43.0
