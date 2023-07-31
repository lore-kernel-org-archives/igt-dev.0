Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2903F10E14B
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 14:11:58 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com
Date: Mon, 31 Jul 2023 19:39:51 +0530
Message-Id: <20230731140953.1167462-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20230731140953.1167462-1-priyanka.dandamudi@intel.com>
References: <20230731140953.1167462-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] xe/xe_sysfs: Modified code to work for
 non priv user
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

Updated code to work non privileged user.
Modified documentation.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/xe/xe_sysfs_defaults.c  |  6 +++---
 tests/xe/xe_sysfs_scheduler.c | 19 +++++++++++++++----
 2 files changed, 18 insertions(+), 7 deletions(-)

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
index 2a113ea0f..0a3b12342 100644
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
@@ -107,14 +110,21 @@ static void test_min_max(int xe, int engine, const char **property)
 
 static void test_param_nonpriv(int xe, int engine, const char **property)
 {
+	struct stat st_engine, st_property;
 	unsigned int default_max, max;
 	unsigned int default_min, min;
 	unsigned int set;
-	struct stat st;
 	int defaults;
+	int property_fd;
 
-	fstat(engine, &st);
-	fchmod(engine, (st.st_mode | S_IROTH | S_IWOTH));
+	property_fd = openat(engine, property[0], O_RDWR);
+	igt_require(property_fd != -1);
+
+	fstat(engine, &st_engine);
+	fchmod(engine, (st_engine.st_mode | S_IRWXO | S_IRWXG | S_IRWXU));
+
+	fstat(property_fd, &st_property);
+	fchmod(property_fd, (st_property.st_mode | S_IRWXO | S_IRWXG | S_IRWXU));
 
 	defaults = openat(engine, ".defaults", O_DIRECTORY);
 	igt_require(defaults != -1);
@@ -150,7 +160,8 @@ static void test_param_nonpriv(int xe, int engine, const char **property)
 	}
 	igt_waitchildren();
 
-	fchmod(engine, st.st_mode);
+	fchmod(engine, st_engine.st_mode);
+	fchmod(property_fd, st_property.st_mode);
 
 	/* Reset max, min to original values */
 	igt_sysfs_printf(engine, property[1], "%d", default_min);
-- 
2.25.1
