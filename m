Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DA910E4AE
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 09:47:27 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.22.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CF5C5580D20
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 02:47:25 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q9jZb-00FlDN-1T
 for igt-dev@lists.freedesktop.org; Thu, 15 Jun 2023 11:47:23 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Jun 2023 11:47:21 +0200
Message-Id: <20230615094722.3756326-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230615094722.3756326-1-mauro.chehab@linux.intel.com>
References: <20230615094722.3756326-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kmod: fill skip message for
 KUnit skips
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

IGT build is currently complaining with the lack of a message for
igt_skip:

  [188/1383] Compiling C object lib/libigt-igt_kmod_c.a.p/igt_kmod.c.o
  ../lib/igt_kmod.c: In function ‘__igt_kunit’:
  ../lib/igt_kmod.c:847:26: warning: zero-length gnu_printf format string [-Wformat-zero-length]
    847 |                 igt_skip("");
        |                          ^~

Add one.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_kmod.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 66c3028b3551..6205871791c3 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -763,7 +763,7 @@ static void __igt_kunit(const char *module_name, const char *opts)
 	int ret;
 	struct ktap_test_results *results;
 	struct ktap_test_results_element *temp;
-	bool skip = false;
+	int skip = 0;
 	bool fail = false;
 
 	/* get normalized module name */
@@ -800,10 +800,15 @@ static void __igt_kunit(const char *module_name, const char *opts)
 	}
 
 	/* The KUnit module is required for running any KUnit tests */
-	if (igt_kmod_load("kunit", NULL) != 0 ||
-	    kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod) != 0) {
+	ret = igt_kmod_load("kunit", NULL);
+	if (ret) {
+		skip = ret;
+		goto unload;
+	}
+	ret = kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod);
+	if (ret) {
 		igt_warn("Unable to load KUnit\n");
-		skip = true;
+		skip = ret;
 		goto unload;
 	}
 
@@ -811,10 +816,11 @@ static void __igt_kunit(const char *module_name, const char *opts)
 
 	results = ktap_parser_start(f, is_builtin);
 
-	if (igt_kmod_load(module_name, opts) != 0) {
+	ret = igt_kmod_load(module_name, opts);
+	if (ret) {
+		skip = ret;
 		igt_warn("Unable to load %s module\n", module_name);
 		ret = ktap_parser_stop();
-		skip = true;
 		goto unload;
 	}
 
@@ -844,7 +850,7 @@ unload:
 	igt_ktest_fini(&tst);
 
 	if (skip)
-		igt_skip("");
+		igt_skip("Skipping test, as probing KUnit module returned %d", skip);
 
 	if (fail)
 		igt_fail(IGT_EXIT_ABORT);
-- 
2.40.1
