Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A5E10E60A
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 23:18:03 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 16:17:44 -0700
Message-ID: <20230720231756.3464641-9-ashutosh.dixit@intel.com>
In-Reply-To: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
References: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 08/20] tests/i915/perf: Fix sysfs functions
 for xe
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

Make sure that we can read freq_rp0 and rc6_residency from sysfs for
xe. The sysfs paths and files names are different for xe.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 03af968d9484..292afda9a434 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -643,7 +643,20 @@ sysfs_read(enum i915_attr_id id)
 {
 	unsigned long value;
 
-	igt_assert(igt_sysfs_rps_scanf(sysfs, id, "%lu", &value) == 1);
+	if (is_xe_device(drm_fd)) {
+		switch (id) {
+		case RPS_RP0_FREQ_MHZ:
+			igt_assert(igt_sysfs_scanf(sysfs, "device/tile0/gt0/freq_rp0", "%lu", &value) == 1);
+			break;
+		case RC6_RESIDENCY_MS:
+			igt_assert(igt_sysfs_scanf(sysfs, "device/tile0/gt0/rc6_residency", "%lu", &value) == 1);
+			break;
+		default:
+			igt_assert(0);
+		}
+	} else {
+		igt_assert(igt_sysfs_rps_scanf(sysfs, id, "%lu", &value) == 1);
+	}
 
 	return value;
 }
@@ -5436,6 +5449,9 @@ static int perf_sysfs_open(int i915)
 {
 	int dirfd, gt;
 
+	if (is_xe_device(drm_fd))
+		return igt_sysfs_open(drm_fd);
+
 	/* use the first available sysfs interface */
 	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
 		break;
-- 
2.41.0
