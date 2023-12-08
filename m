Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEAC10E990
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 05:13:10 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 3/3] tests/intel/freq: Test throttle basic API infra
Date: Fri, 8 Dec 2023 00:12:29 -0500
Message-ID: <20231208051230.664226-3-rodrigo.vivi@intel.com>
In-Reply-To: <20231208051230.664226-1-rodrigo.vivi@intel.com>
References: <20231208051230.664226-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
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

For now we don't have a reliable way to force PCODE throttling,
but let's at least check for some sanity on our exposed API.

v2: Fix indentation issues (Sujaritha)

Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 tests/intel/xe_gt_freq.c | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 5bc26aa52..4334a8a41 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -68,6 +68,49 @@ static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
 	return freq;
 }
 
+static uint32_t get_throttle(int fd, int gt_id, const char *throttle_file)
+{
+	uint32_t val;
+	char throttle_attr[40];
+	int gt_fd;
+
+	snprintf(throttle_attr, sizeof(throttle_attr),
+		 "freq0/throttle/%s", throttle_file);
+	gt_fd = xe_sysfs_gt_open(fd, gt_id);
+	igt_assert(gt_fd >= 0);
+
+	igt_sysfs_scanf(gt_fd, throttle_attr, "%u", &val);
+
+	igt_debug("gt%d/freq0/throttle/%s: %u\n", gt_id, throttle_file, val);
+
+	close(gt_fd);
+	return val;
+}
+
+/**
+ * SUBTEST: throttle_basic_api
+ * Description: Test basic throttle API
+ */
+
+static void test_throttle_basic_api(int fd, int gt_id)
+{
+	uint32_t status, reasons;
+
+	status = get_throttle(fd, gt_id, "status");
+	reasons = get_throttle(fd, gt_id, "reason_pl1");
+	reasons |= get_throttle(fd, gt_id, "reason_pl2");
+	reasons |= get_throttle(fd, gt_id, "reason_pl4");
+	reasons |= get_throttle(fd, gt_id, "reason_prochot");
+	reasons |= get_throttle(fd, gt_id, "reason_ratl");
+	reasons |= get_throttle(fd, gt_id, "reason_thermal");
+	reasons |= get_throttle(fd, gt_id, "reason_vr_tdc");
+	reasons |= get_throttle(fd, gt_id, "reason_vr_thermalert");
+
+	if (status)
+		igt_assert(reasons);
+	else
+		igt_assert(!reasons);
+}
 
 /**
  * SUBTEST: freq_basic_api
@@ -289,6 +332,11 @@ igt_main
 		stash_max = get_freq(fd, 0, "max");
 	}
 
+	igt_subtest("throttle_basic_api") {
+		xe_for_each_gt(fd, gt)
+			test_throttle_basic_api(fd, gt);
+	}
+
 	igt_subtest("freq_basic_api") {
 		xe_for_each_gt(fd, gt)
 			test_freq_basic_api(fd, gt);
-- 
2.43.0
