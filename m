Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD52710E057
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Dec 2023 22:49:49 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Dec 2023 14:49:26 -0800
Message-Id: <20231205224926.2188996-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

https://patchwork.freedesktop.org/series/126786/ groups all the live
tests into a single kernel module. Use that module to run any of the
tests triggered by igt.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_live_ktest.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index fe7b2e69f..c8bd68928 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -19,15 +19,10 @@
  * Functionality: migrate
  */
 
-struct kunit_tests {
-	const char *kunit;
-	const char *name;
-};
-
-static const struct kunit_tests live_tests[] = {
-	{ "xe_bo_test",		"bo" },
-	{ "xe_dma_buf_test",	"dmabuf" },
-	{ "xe_migrate_test",	"migrate" },
+static const char *live_tests[] = {
+	"bo",
+	"dmabuf",
+	"migrate",
 };
 
 igt_main
@@ -35,5 +30,5 @@ igt_main
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
-		igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
+		igt_kunit("xe_live_test", live_tests[i], NULL);
 }
-- 
2.40.1
