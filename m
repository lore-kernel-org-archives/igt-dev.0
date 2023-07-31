Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9453710E199
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 14:11:56 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com
Date: Mon, 31 Jul 2023 19:39:50 +0530
Message-Id: <20230731140953.1167462-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20230731140953.1167462-1-priyanka.dandamudi@intel.com>
References: <20230731140953.1167462-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] xe/xe_sysfs: Updated tests to use
 xe_sysfs_gt_open
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Tests have been updated to use xe_sysfs_gt_open function.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/xe/xe_sysfs_defaults.c  | 10 ++++++----
 tests/xe/xe_sysfs_scheduler.c | 10 ++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/xe/xe_sysfs_defaults.c b/tests/xe/xe_sysfs_defaults.c
index 5c9de43e9..ff958161b 100644
--- a/tests/xe/xe_sysfs_defaults.c
+++ b/tests/xe/xe_sysfs_defaults.c
@@ -65,25 +65,27 @@ igt_main
 
 		sys_fd = igt_sysfs_open(xe);
 		igt_require(sys_fd != -1);
+		close(sys_fd);
 	}
 
 	igt_subtest_with_dynamic("engine-defaults") {
 		xe_for_each_gt(xe, gt) {
 			int engines_fd = -1;
-			char buf[100];
+			int gt_fd = -1;
 
-			sprintf(buf, "device/gt%d/engines", gt);
-			engines_fd = openat(sys_fd, buf, O_RDONLY);
+			gt_fd = xe_sysfs_gt_open(xe, gt);
+			igt_require(gt_fd != -1);
+			engines_fd = openat(gt_fd, "engines", O_RDONLY);
 			igt_require(engines_fd != -1);
 
 			igt_sysfs_engines(xe, engines_fd, NULL, test_defaults);
 
 			close(engines_fd);
+			 close(gt_fd);
 		}
 	}
 
 	igt_fixture {
-		close(sys_fd);
 		xe_device_put(xe);
 		close(xe);
 	}
diff --git a/tests/xe/xe_sysfs_scheduler.c b/tests/xe/xe_sysfs_scheduler.c
index 1da0f541a..2a113ea0f 100644
--- a/tests/xe/xe_sysfs_scheduler.c
+++ b/tests/xe/xe_sysfs_scheduler.c
@@ -184,6 +184,7 @@ igt_main
 
 		sys_fd = igt_sysfs_open(xe);
 		igt_require(sys_fd != -1);
+		close(sys_fd);
 	}
 
 	for (int i = 0; i < count; i++) {
@@ -191,20 +192,21 @@ igt_main
 			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
 				xe_for_each_gt(xe, gt) {
 					int engines_fd = -1;
-					char buf[100];
+					int gt_fd = -1;
 
-					sprintf(buf, "device/gt%d/engines", gt);
-					engines_fd = openat(sys_fd, buf, O_RDONLY);
+					gt_fd = xe_sysfs_gt_open(xe, gt);
+					igt_require(gt_fd != -1);
+					engines_fd = openat(gt_fd, "engines", O_RDONLY);
 					igt_require(engines_fd != -1);
 
 					igt_sysfs_engines(xe, engines_fd, property[i], t->fn);
 					close(engines_fd);
+					close(gt_fd);
 				}
 			}
 		}
 	}
 	igt_fixture {
-		close(sys_fd);
 		xe_device_put(xe);
 		close(xe);
 	}
-- 
2.25.1
