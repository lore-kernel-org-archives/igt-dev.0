Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23BF10E1F5
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jun 2023 08:27:37 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Jun 2023 10:27:16 +0200
Message-Id: <20230602082721.7818-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230602082721.7818-1-dominik.karol.piatkowski@intel.com>
References: <20230602082721.7818-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/6] lib/igt_kmod: rename kselftest
 functions to ktest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Isabella Basso <isabbasso@riseup.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Isabella Basso <isabbasso@riseup.net>

This aims at making IGT's structure more general to different kernel
testing frameworks such as KUnit, as they use a lot of the same
functionality.

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Isabella Basso <isabbasso@riseup.net>

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/igt_kmod.c | 22 +++++++++++-----------
 lib/igt_kmod.h | 12 ++++++------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index ccf0063c..93fa2006 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -749,8 +749,8 @@ static int open_parameters(const char *module_name)
 	return open(path, O_RDONLY);
 }
 
-int igt_kselftest_init(struct igt_kselftest *tst,
-		       const char *module_name)
+int igt_ktest_init(struct igt_ktest *tst,
+		   const char *module_name)
 {
 	int err;
 
@@ -769,7 +769,7 @@ int igt_kselftest_init(struct igt_kselftest *tst,
 	return 0;
 }
 
-int igt_kselftest_begin(struct igt_kselftest *tst)
+int igt_ktest_begin(struct igt_ktest *tst)
 {
 	int err;
 
@@ -784,7 +784,7 @@ int igt_kselftest_begin(struct igt_kselftest *tst)
 	return 0;
 }
 
-int igt_kselftest_execute(struct igt_kselftest *tst,
+int igt_kselftest_execute(struct igt_ktest *tst,
 			  struct igt_kselftest_list *tl,
 			  const char *options,
 			  const char *result)
@@ -822,13 +822,13 @@ int igt_kselftest_execute(struct igt_kselftest *tst,
 	return err;
 }
 
-void igt_kselftest_end(struct igt_kselftest *tst)
+void igt_ktest_end(struct igt_ktest *tst)
 {
 	kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE);
 	close(tst->kmsg);
 }
 
-void igt_kselftest_fini(struct igt_kselftest *tst)
+void igt_ktest_fini(struct igt_ktest *tst)
 {
 	free(tst->module_name);
 	kmod_module_unref(tst->kmod);
@@ -851,15 +851,15 @@ void igt_kselftests(const char *module_name,
 		    const char *result,
 		    const char *filter)
 {
-	struct igt_kselftest tst;
+	struct igt_ktest tst;
 	IGT_LIST_HEAD(tests);
 	struct igt_kselftest_list *tl, *tn;
 
-	if (igt_kselftest_init(&tst, module_name) != 0)
+	if (igt_ktest_init(&tst, module_name) != 0)
 		return;
 
 	igt_fixture
-		igt_require(igt_kselftest_begin(&tst) == 0);
+		igt_require(igt_ktest_begin(&tst) == 0);
 
 	igt_kselftest_get_tests(tst.kmod, filter, &tests);
 	igt_subtest_with_dynamic(filter ?: "all-tests") {
@@ -878,9 +878,9 @@ void igt_kselftests(const char *module_name,
 	}
 
 	igt_fixture {
-		igt_kselftest_end(&tst);
+		igt_ktest_end(&tst);
 		igt_require(!igt_list_empty(&tests));
 	}
 
-	igt_kselftest_fini(&tst);
+	igt_ktest_fini(&tst);
 }
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index d05af4a6..ff59f1ec 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -76,7 +76,7 @@ void igt_kselftests(const char *module_name,
 		    const char *result_option,
 		    const char *filter);
 
-struct igt_kselftest {
+struct igt_ktest {
 	struct kmod_module *kmod;
 	char *module_name;
 	int kmsg;
@@ -89,19 +89,19 @@ struct igt_kselftest_list {
 	char param[];
 };
 
-int igt_kselftest_init(struct igt_kselftest *tst,
+int igt_ktest_init(struct igt_ktest *tst,
 		       const char *module_name);
-int igt_kselftest_begin(struct igt_kselftest *tst);
+int igt_ktest_begin(struct igt_ktest *tst);
 
 void igt_kselftest_get_tests(struct kmod_module *kmod,
 			     const char *filter,
 			     struct igt_list_head *tests);
-int igt_kselftest_execute(struct igt_kselftest *tst,
+int igt_kselftest_execute(struct igt_ktest *tst,
 			  struct igt_kselftest_list *tl,
 			  const char *module_options,
 			  const char *result);
 
-void igt_kselftest_end(struct igt_kselftest *tst);
-void igt_kselftest_fini(struct igt_kselftest *tst);
+void igt_ktest_end(struct igt_ktest *tst);
+void igt_ktest_fini(struct igt_ktest *tst);
 
 #endif /* IGT_KMOD_H */
-- 
2.34.1
