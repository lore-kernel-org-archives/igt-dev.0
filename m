Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FB010E599
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 06:10:25 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com
Date: Thu,  3 Aug 2023 11:38:12 +0530
Message-Id: <20230803060814.1180879-4-priyanka.dandamudi@intel.com>
In-Reply-To: <20230803060814.1180879-1-priyanka.dandamudi@intel.com>
References: <20230803060814.1180879-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] xe/xe_sysfs: Removing non privileged
 user test
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

Removing non privileged user test case as sysman property, min/max works only for privileged user.
Modified documentation.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/xe/xe_sysfs_defaults.c  |  6 ++--
 tests/xe/xe_sysfs_scheduler.c | 56 ++---------------------------------
 2 files changed, 6 insertions(+), 56 deletions(-)

diff --git a/tests/xe/xe_sysfs_defaults.c b/tests/xe/xe_sysfs_defaults.c
index ff958161b..0fc2918b6 100644
--- a/tests/xe/xe_sysfs_defaults.c
+++ b/tests/xe/xe_sysfs_defaults.c
@@ -6,10 +6,10 @@
 /**
  * TEST: xe sysfs defaults
  * Category: Infrastructure
- * Functionality: driver handler
+ * Functionality: sysman defaults
  * Run type: FULL
- * Sub-category: xe
- * Test category: SysMan
+ * Sub-category: sysman
+ * Test category: functionality test
  * SUBTEST: engine-defaults
  */
 
diff --git a/tests/xe/xe_sysfs_scheduler.c b/tests/xe/xe_sysfs_scheduler.c
index f199d6be8..0f6fe5b65 100644
--- a/tests/xe/xe_sysfs_scheduler.c
+++ b/tests/xe/xe_sysfs_scheduler.c
@@ -5,6 +5,9 @@
 
 /**
  * TEST: xe sysfs scheduler
+ * Sub-category: sysman
+ * Functionality: scheduler control interface
+ * Test category: functionality test
  * Run type: FULL
  *
  * SUBTEST: %s-invalid
@@ -105,58 +108,6 @@ static void test_min_max(int xe, int engine, const char **property)
 	igt_sysfs_printf(engine, property[2], "%d", default_max);
 }
 
-static void test_param_nonpriv(int xe, int engine, const char **property)
-{
-	unsigned int default_max, max;
-	unsigned int default_min, min;
-	unsigned int set;
-	struct stat st;
-	int defaults;
-
-	fstat(engine, &st);
-	fchmod(engine, (st.st_mode | S_IROTH | S_IWOTH));
-
-	defaults = openat(engine, ".defaults", O_DIRECTORY);
-	igt_require(defaults != -1);
-
-	igt_sysfs_scanf(defaults, property[2], "%u", &default_max);
-	igt_sysfs_scanf(defaults, property[1], "%u", &default_min);
-
-	igt_sysfs_printf(engine, property[2], "%d", default_max-10);
-	igt_sysfs_scanf(engine, property[2], "%u", &max);
-	igt_assert_eq(max, (default_max-10));
-
-	igt_sysfs_printf(engine, property[1], "%d", default_min+1);
-	igt_sysfs_scanf(engine, property[1], "%u", &min);
-	igt_assert_eq(min, (default_min+1));
-
-	igt_fork(child, 1) {
-		igt_drop_root();
-		igt_sysfs_printf(engine, property[0], "%d", default_min);
-		igt_sysfs_scanf(engine, property[0], "%u", &set);
-		igt_assert_neq(set, default_min);
-
-		igt_sysfs_printf(engine, property[0], "%d", min);
-		igt_sysfs_scanf(engine, property[0], "%u", &set);
-		igt_assert_eq(set, min);
-
-		igt_sysfs_printf(engine, property[0], "%d", default_max);
-		igt_sysfs_scanf(engine, property[0], "%u", &set);
-		igt_assert_neq(set, default_max);
-
-		igt_sysfs_printf(engine, property[0], "%d", max);
-		igt_sysfs_scanf(engine, property[0], "%u", &set);
-		igt_assert_eq(set, max);
-	}
-	igt_waitchildren();
-
-	fchmod(engine, st.st_mode);
-
-	/* Reset max, min to original values */
-	igt_sysfs_printf(engine, property[1], "%d", default_min);
-	igt_sysfs_printf(engine, property[2], "%d", default_max);
-}
-
 igt_main
 {
 	static const struct {
@@ -165,7 +116,6 @@ igt_main
 	} tests[] = {
 		{ "invalid", test_invalid },
 		{ "min-max", test_min_max },
-		{ "nonprivileged-user", test_param_nonpriv },
 		{ }
 	};
 
-- 
2.25.1
