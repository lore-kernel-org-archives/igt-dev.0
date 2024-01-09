Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E7D10E01F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 04:43:14 +0000 (UTC)
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] DEBUG patch for test_freq_mutliple
Date: Tue,  9 Jan 2024 10:21:10 +0530
Message-Id: <20240109045110.1445512-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

DO_NOT_MERGE : Add a delay and debugs logs in xt_gt_freq test_freq_multiple test.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_gt_freq.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 4334a8a41..ab371f3e3 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -41,8 +41,10 @@ static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
 	gt_fd = xe_sysfs_gt_open(fd, gt_id);
 	igt_assert(gt_fd >= 0);
 
-	while (ret == -EAGAIN)
+	while (ret == -EAGAIN) {
 		ret = igt_sysfs_printf(gt_fd, freq_attr, "%u", freq);
+		igt_info("setting %s to %u, ret %d\n", freq_name, freq, ret);
+	}
 
 	close(gt_fd);
 	return ret;
@@ -59,10 +61,11 @@ static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
 	gt_fd = xe_sysfs_gt_open(fd, gt_id);
 	igt_assert(gt_fd >= 0);
 
-	while (err == -EAGAIN)
+	while (err == -EAGAIN) {
 		err = igt_sysfs_scanf(gt_fd, freq_attr, "%u", &freq);
+		igt_info("get freq gt%d: %s freq %u, ret %d\n", gt_id, freq_name, freq, err);
+	}
 
-	igt_debug("gt%d: %s freq %u\n", gt_id, freq_name, freq);
 
 	close(gt_fd);
 	return freq;
@@ -299,6 +302,8 @@ static void test_reset(int fd, int gt_id, int cycles)
 {
 	uint32_t rpn = get_freq(fd, gt_id, "rpn");
 
+	igt_info("rpn %u\n", rpn);
+
 	for (int i = 0; i < cycles; i++) {
 		igt_assert_f(set_freq(fd, gt_id, "min", rpn) > 0,
 			     "Failed after %d good cycles\n", i);
@@ -308,8 +313,11 @@ static void test_reset(int fd, int gt_id, int cycles)
 		igt_assert_f(get_freq(fd, gt_id, "cur") == rpn,
 			     "Failed after %d good cycles\n", i);
 
+		igt_info("FR start\n");
 		xe_force_gt_reset(fd, gt_id);
+		igt_info("FR done\n");
 
+		usleep(ACT_FREQ_LATENCY_US);
 		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
 			     "Failed after %d good cycles\n", i);
 		igt_assert_f(get_freq(fd, gt_id, "max") == rpn,
-- 
2.25.1
