Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8888110E242
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Aug 2023 05:12:13 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com
Date: Fri,  4 Aug 2023 10:40:12 +0530
Message-Id: <20230804051015.1193986-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20230804051015.1193986-1-priyanka.dandamudi@intel.com>
References: <20230804051015.1193986-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] xe/xe_sysfs_scheduler: Try to set sysfs
 scheduler with default min
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

Test tries to set sysfs scheduler with default min which is beyond local min
and assert is expected to be not equal to the set one.

v2: Added code to store and restore property in test min/max.(Tejas)

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/xe/xe_sysfs_scheduler.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/xe/xe_sysfs_scheduler.c b/tests/xe/xe_sysfs_scheduler.c
index 2a113ea0f..7a190f3d3 100644
--- a/tests/xe/xe_sysfs_scheduler.c
+++ b/tests/xe/xe_sysfs_scheduler.c
@@ -59,7 +59,7 @@ static void test_min_max(int xe, int engine, const char **property)
 {
 	unsigned int default_max, max;
 	unsigned int default_min, min;
-	unsigned int set;
+	unsigned int set, store;
 	int defaults;
 
 	defaults = openat(engine, ".defaults", O_DIRECTORY);
@@ -67,6 +67,7 @@ static void test_min_max(int xe, int engine, const char **property)
 
 	igt_sysfs_scanf(defaults, property[2], "%u", &default_max);
 	igt_sysfs_scanf(defaults, property[1], "%u", &default_min);
+	igt_sysfs_scanf(engine, property[0], "%u", &store);
 
 	igt_sysfs_printf(engine, property[2], "%d", default_max-10);
 	igt_sysfs_scanf(engine, property[2], "%u", &max);
@@ -94,13 +95,14 @@ static void test_min_max(int xe, int engine, const char **property)
 
 	igt_sysfs_printf(engine, property[0], "%d", default_min);
 	igt_sysfs_scanf(engine, property[0], "%u", &set);
-	igt_assert_eq(set, default_min);
+	igt_assert_neq(set, default_min);
 
 	igt_sysfs_printf(engine, property[0], "%d", min);
 	igt_sysfs_scanf(engine, property[0], "%u", &set);
 	igt_assert_eq(set, min);
 
-	/* Reset max, min to original values */
+	/* Reset property, max, min to original values */
+	igt_sysfs_printf(engine, property[0], "%d", store);
 	igt_sysfs_printf(engine, property[1], "%d", default_min);
 	igt_sysfs_printf(engine, property[2], "%d", default_max);
 }
-- 
2.25.1
