Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC1610E3A6
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 08:59:22 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_live_ktest: Add mocs kunit test
Date: Tue,  9 Jan 2024 14:34:22 +0530
Message-Id: <20240109090422.2188202-1-janga.rahul.kumar@intel.com>
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Enable mocs kunit execution from IGT.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_live_ktest.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index 7170a017c..5f5f1dff7 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -24,6 +24,11 @@
  *	Kernel dynamic selftests to check if page table migrations
  *	are working properly.
  * Functionality: migrate
+ *
+ * SUBTEST: mocs
+ * Description:
+ *	Kernel dynamic selftests to check mocs configuration.
+ * Functionality: mocs
  */
 
 struct kunit_tests {
@@ -35,6 +40,7 @@ static const struct kunit_tests live_tests[] = {
 	{ "xe_bo_test",		"bo" },
 	{ "xe_dma_buf_test",	"dmabuf" },
 	{ "xe_migrate_test",	"migrate" },
+	{ "xe_mocs_test",	"mocs" },
 };
 
 igt_main
-- 
2.25.1
