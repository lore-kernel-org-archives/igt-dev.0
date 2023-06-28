Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869C010E36B
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 09:31:59 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 15:05:02 +0530
Message-Id: <20230628093504.517988-3-riana.tauro@intel.com>
In-Reply-To: <20230628093504.517988-1-riana.tauro@intel.com>
References: <20230628093504.517988-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/xe : Add a test to check if gt is
 in c6 on idle
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add a test that checks if gt is in c6 on idle

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/xe/xe_pm_residency.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
index 19fbe14e..4f6c23aa 100644
--- a/tests/xe/xe_pm_residency.c
+++ b/tests/xe/xe_pm_residency.c
@@ -47,6 +47,11 @@ static unsigned int measured_usleep(unsigned int usec)
 	return igt_nsec_elapsed(&ts) / 1000;
 }
 
+/**
+ * SUBTEST: gt-c6-on-idle
+ * Description: check if gt is in C6 on idle
+ * Run type: BAT
+ */
 static bool in_gt_c6(int sysfs, int gt)
 {
 	char path[PATH_MAX];
@@ -107,6 +112,11 @@ igt_main
 		igt_assert(sysfs != -1);
 	}
 
+	igt_describe("check if gt is in c6 on idle");
+	igt_subtest("gt-c6-on-idle")
+		xe_for_each_gt(fd, gt)
+			assert(igt_wait(in_gt_c6(sysfs, gt), 1000, 1));
+
 	igt_describe("check idle residency within a time interval is within tolerance");
 	igt_subtest("idle-residency")
 		xe_for_each_gt(fd, gt)
-- 
2.40.0
