Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1656C10E124
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 07:01:31 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Jun 2023 12:34:37 +0530
Message-Id: <20230630070439.621177-3-riana.tauro@intel.com>
In-Reply-To: <20230630070439.621177-1-riana.tauro@intel.com>
References: <20230630070439.621177-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/4] tests/xe: validate gt is in c6 on
 idle
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

Add a test that validates if gt is in c6 on idle.

v2:
   - fix cosmetic review comments (Kamil)
   - replace assert with igt_assert_f
   - fix cosmetic review comments (Anshuman)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/xe/xe_pm_residency.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
index 32333dfb0..4990e8431 100644
--- a/tests/xe/xe_pm_residency.c
+++ b/tests/xe/xe_pm_residency.c
@@ -47,6 +47,11 @@ static unsigned int measured_usleep(unsigned int usec)
 	return igt_nsec_elapsed(&ts) / 1000;
 }
 
+/**
+ * SUBTEST: gt-c6-on-idle
+ * Description: validate gt c6 state on idle
+ * Run type: BAT
+ */
 static bool in_gt_c6(int sysfs, int gt)
 {
 	char path[PATH_MAX];
@@ -107,6 +112,11 @@ igt_main
 		igt_assert(sysfs != -1);
 	}
 
+	igt_describe("validate gt c6 on idle");
+	igt_subtest("gt-c6-on-idle")
+		xe_for_each_gt(fd, gt)
+			igt_assert_f(igt_wait(in_gt_c6(sysfs, gt), 1000, 1), "GT not in C6\n");
+
 	igt_describe("validate idle residency within a time interval is within tolerance");
 	igt_subtest("idle-residency")
 		xe_for_each_gt(fd, gt)
-- 
2.40.0
