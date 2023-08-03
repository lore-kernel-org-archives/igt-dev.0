Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB68510E599
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 06:10:24 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com
Date: Thu,  3 Aug 2023 11:38:11 +0530
Message-Id: <20230803060814.1180879-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20230803060814.1180879-1-priyanka.dandamudi@intel.com>
References: <20230803060814.1180879-1-priyanka.dandamudi@intel.com>
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

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/xe/xe_sysfs_scheduler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/xe/xe_sysfs_scheduler.c b/tests/xe/xe_sysfs_scheduler.c
index 2a113ea0f..f199d6be8 100644
--- a/tests/xe/xe_sysfs_scheduler.c
+++ b/tests/xe/xe_sysfs_scheduler.c
@@ -94,7 +94,7 @@ static void test_min_max(int xe, int engine, const char **property)
 
 	igt_sysfs_printf(engine, property[0], "%d", default_min);
 	igt_sysfs_scanf(engine, property[0], "%u", &set);
-	igt_assert_eq(set, default_min);
+	igt_assert_neq(set, default_min);
 
 	igt_sysfs_printf(engine, property[0], "%d", min);
 	igt_sysfs_scanf(engine, property[0], "%u", &set);
-- 
2.25.1
