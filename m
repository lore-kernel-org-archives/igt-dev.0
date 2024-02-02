Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606D9C48286
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 00:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C913B10EDA7;
	Fri,  2 Feb 2024 00:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOnwSjv/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35F210EDAD
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 00:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706834741; x=1738370741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EpcJ+H1NYT47fPwoXzGGGeO3KAt9X583sDdB84TVuxY=;
 b=lOnwSjv//D9yCnVJ5iGf6zdpEwMvTNqjoRV9HEhLo3ZE/Debok2FaArR
 qQwz7aSQiG0iuGfrlIfr1gVhMfiMcYPaNHzraKJY3gBYzM3gDnZQRhPRN
 L/9+TPp64xdcDGCCChhx7mZlQDzbzEZCra8BwumvM+RddlUGa7VObCExB
 dg8A9HBLLk2wIkuriWQK0AS5ifnAnQdzh8CwUMTjKA3hDcIwiG9TdU1Ax
 U+u5JKcMaTUCCkj0Jgf/QNgTtQ/wYC2A5kFeDv6qMRZmaNJBSIBuTzDTI
 UrGWz9gp759uuzm9hIo3Alrucpmg0UU9d734qivCtGkLTnWOg50glLQ25 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="227724"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="227724"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 16:45:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="4519398"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 16:45:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/2] squashed
 20240201190237.150754-8-janusz.krzysztofik@linux.intel.com
Date: Thu,  1 Feb 2024 16:45:28 -0800
Message-ID: <20240202004529.552806-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202004529.552806-1-lucas.demarchi@intel.com>
References: <20240202004529.552806-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

DO NOT MERGE

Not-Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 115 +++++++++++++++++++++++++++++++++----------------
 1 file changed, 79 insertions(+), 36 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 250ab2107..3163434aa 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -803,6 +803,57 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
 	kmod_module_info_free_list(pre);
 }
 
+static int open_parameters(const char *module_name)
+{
+	char path[256];
+
+	snprintf(path, sizeof(path), "/sys/module/%s/parameters", module_name);
+	return open(path, O_RDONLY);
+}
+
+static bool kunit_set_filtering(const char *filter_glob, const char *filter,
+				const char *filter_action)
+{
+	int params;
+	bool ret;
+
+	params = open_parameters("kunit");
+	ret = !igt_debug_on(params < 0);
+
+	/*
+	 * Default values of the KUnit base module filtering parameters
+	 * are all NULLs.  Reapplying those NULLs over sysfs once
+	 * overwritten with non-NULL strings seems not possible.
+	 * As a workaround, we use human-readable strings that exhibit
+	 * the same behaviour as if default NULLs were in place.
+	 */
+	if (ret)
+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter_glob",
+						   filter_glob ?: "*"));
+	if (ret)
+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter",
+						   filter ?: "module!=none"));
+	/*
+	 * In case of filter_action parameter there is no obvious human-
+	 * readable string that behaves like default NULL.  However, if NULL
+	 * is requested for both filter and filter_action then that's not a
+	 * problem for us since even if filter_action was previously set to
+	 * "skip" we can leave it as is because our "module!=none" default
+	 * filter guarantees that no test cases are filtered out to be skipped.
+	 */
+	if (ret)
+		ret = !igt_warn_on_f(!filter_action && filter,
+				     "test error: filter_action=NULL requires filter=NULL\n");
+	if (ret && filter_action)
+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter_action",
+						   filter_action));
+
+	if (params >= 0)
+		close(params);
+
+	return ret;
+}
+
 struct modprobe_data {
 	struct kmod_module *kmod;
 	const char *opts;
@@ -1095,6 +1146,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	char *suite_name = NULL, *case_name = NULL;
 	struct igt_ktap_result *r, *rn;
 	struct igt_ktap_results *ktap;
+	unsigned long taints;
 	int flags, err;
 
 	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
@@ -1108,25 +1160,29 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	/*
 	 * To get a list of test cases provided by a kunit test module, ask the
 	 * generic kunit module to respond with SKIP result for each test found.
-	 * We could also use action=list kunit parameter to get the listing,
-	 * however, parsing a KTAP report -- something that we already can do
-	 * perfectly -- seems to be more safe than extracting a test case list
-	 * of unknown length from /dev/kmsg.
-	 *
-	 * TODO: drop the following workaround, which is required by LTS kernel
-	 *       v6.1 not capable of listing test cases when built as a module.
-	 * If loading the kunit module with required parameters fails then
-	 * assume that we are running on a kernel with missing test case listing
-	 * capabilities.  Dont's skip but just return with empty list of test
-	 * cases, that should tell the caller to use a legacy method of
-	 * iterating over KTAP results collected from blind execution of all
-	 * Kunit test cases provided by a Kunit test module.
+	 * We could also try to use action=list kunit parameter to get the
+	 * listing, however, parsing a structured KTAP report -- something that
+	 * we already can do perfectly -- seems to be more safe than extracting
+	 * a free text list of unknown length from /dev/kmsg.
 	 */
-	if (igt_debug_on(igt_kmod_load("kunit",
-				       "filter=module=none filter_action=skip")))
+	if (igt_debug_on(!kunit_set_filtering(NULL, "module=none", "skip"))) {
+		/*
+		 * TODO: drop the following workaround, required by LTS kernel
+		 *       v6.1 not capable of listing test cases when built as as
+		 *       module, when no longer needed.
+		 * If updating writable filter parameters of the kunit base
+		 * module with required values fails then assume we are running
+		 * on a kernel with missing test case listing capabilities.
+		 * Don't skip but just return with empty list of test cases,
+		 * which should tell the caller to use a legacy method of
+		 * iterating over KTAP results collected from blind execution
+		 * of all Kunit test cases provided by a Kunit test module.
+		 */
 		return;
+	}
 
 	igt_skip_on(modprobe(tst->kmod, opts));
+	igt_skip_on(igt_kernel_tainted(&taints));
 
 	ktap = igt_ktap_alloc(tests);
 	igt_require(ktap);
@@ -1158,11 +1214,11 @@ static void kunit_get_tests(struct igt_list_head *tests,
 		free(case_name);
 	}
 
-	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
-	igt_skip_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
-
 	igt_skip_on_f(err,
 		      "KTAP parser failed while getting a list of test cases\n");
+	igt_skip_on(igt_list_empty(tests));
+
+	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
 }
 
 static void __igt_kunit(struct igt_ktest *tst,
@@ -1191,6 +1247,8 @@ static void __igt_kunit(struct igt_ktest *tst,
 			      t->case_name) {
 
 			if (!modprobe.thread) {
+				igt_require(kunit_set_filtering(NULL, NULL, NULL));
+
 				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
 				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
 							  PTHREAD_MUTEX_ROBUST),
@@ -1355,18 +1413,12 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 		igt_skip_on(igt_ktest_init(&tst, module_name));
 		igt_skip_on(igt_ktest_begin(&tst));
 
-		/*
-		 * Since we need to load kunit base module with specific
-		 * options in order to get a list of test cases, make
-		 * sure that the module is not loaded.  However, since
-		 * unload may fail if kunit base module is not loaded,
-		 * ignore any failures, we'll fail later if still loaded.
-		 */
-		igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
-
 		igt_assert(igt_list_empty(&tests));
 	}
 
+	/* We need the base KUnit module loaded if not built-in */
+	igt_ignore_warn(igt_kmod_load("kunit", NULL));
+
 	/*
 	 * We need to use igt_subtest here, as otherwise it may crash with:
 	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
@@ -1395,20 +1447,11 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 		kunit_results_free(&tests, &suite_name, &case_name);
 
 		igt_ktest_end(&tst);
-		igt_debug_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
 	}
 
 	igt_ktest_fini(&tst);
 }
 
-static int open_parameters(const char *module_name)
-{
-	char path[256];
-
-	snprintf(path, sizeof(path), "/sys/module/%s/parameters", module_name);
-	return open(path, O_RDONLY);
-}
-
 int igt_ktest_init(struct igt_ktest *tst,
 		   const char *module_name)
 {
-- 
2.43.0

