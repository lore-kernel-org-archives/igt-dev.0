Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Isabella Basso <isabbasso@riseup.net>
To: igt-dev@lists.freedesktop.org
Date: Sun, 28 Aug 2022 21:09:17 -0300
Message-Id: <20220829000920.38185-2-isabbasso@riseup.net>
In-Reply-To: <20220829000920.38185-1-isabbasso@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/4] lib/igt_kmod: rename kselftest
 functions to ktest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kselftest@vger.kernel.org, daniel@ffwll.ch,
 kunit-dev@googlegroups.com, magalilemes00@gmail.com, maira.canal@usp.br,
 dlatypov@google.com, n@nfraprado.net, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 davidgow@google.com, tales.aparecida@gmail.com, skhan@linuxfoundation.org,
 andrealmeid@riseup.net, Isabella Basso <isabbasso@riseup.net>,
 brendanhiggins@google.com, twoerner@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This aims at making IGT's structure more general to different kernel
testing frameworks such as KUnit, as they use a lot of the same
functionality.

Signed-off-by: Isabella Basso <isabbasso@riseup.net>
---
 lib/igt_kmod.c | 22 +++++++++++-----------
 lib/igt_kmod.h | 12 ++++++------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index bcf7dfeb..bb6cb7bb 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -718,8 +718,8 @@ static int open_parameters(const char *module_name)
 	return open(path, O_RDONLY);
 }
 
-int igt_kselftest_init(struct igt_kselftest *tst,
-		       const char *module_name)
+int igt_ktest_init(struct igt_ktest *tst,
+		   const char *module_name)
 {
 	int err;
 
@@ -738,7 +738,7 @@ int igt_kselftest_init(struct igt_kselftest *tst,
 	return 0;
 }
 
-int igt_kselftest_begin(struct igt_kselftest *tst)
+int igt_ktest_begin(struct igt_ktest *tst)
 {
 	int err;
 
@@ -753,7 +753,7 @@ int igt_kselftest_begin(struct igt_kselftest *tst)
 	return 0;
 }
 
-int igt_kselftest_execute(struct igt_kselftest *tst,
+int igt_kselftest_execute(struct igt_ktest *tst,
 			  struct igt_kselftest_list *tl,
 			  const char *options,
 			  const char *result)
@@ -791,13 +791,13 @@ int igt_kselftest_execute(struct igt_kselftest *tst,
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
@@ -820,15 +820,15 @@ void igt_kselftests(const char *module_name,
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
 	igt_subtest_with_dynamic(filter ?: "all") {
@@ -847,9 +847,9 @@ void igt_kselftests(const char *module_name,
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
index f98dd29f..ceb10cd0 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -50,7 +50,7 @@ void igt_kselftests(const char *module_name,
 		    const char *result_option,
 		    const char *filter);
 
-struct igt_kselftest {
+struct igt_ktest {
 	struct kmod_module *kmod;
 	char *module_name;
 	int kmsg;
@@ -63,19 +63,19 @@ struct igt_kselftest_list {
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
2.37.2
