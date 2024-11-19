Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452C2D4921C
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CDE10E143;
	Tue, 19 Nov 2024 05:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JynbT1Z6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8369C10E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994220; x=1763530220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6iSBYfH5k4Rdkh8xsG8L/jfi2l9lfsNnytydO+9qII0=;
 b=JynbT1Z6J6YPZXqzaQxPRBG4RRewJjlAHYKutH0Y/IktwVhhVJhnfL8h
 Q0CeQlCIdyemhSkwSJmJCUiw32UWDma7s8BL1R/vpiCZM8OiiL28QcpkS
 nCJ4+w3fUajAx3A42nMcJFN6cOAJ10w0VRx6WCIUq8hUpm8lG9q4DRTu3
 dE2nxBZ5OiZboa5mgc9gi/u3CWOGRIQPouzA/euJxVrLzkRq+xQknDM0c
 WqDE+BJekDr3j8zw8ckiAupSK9qbygWrVxqMKqorRosNos96gjbjlUi7N
 ybO8O/v22Jip+WsovxnEhsYiu9c0GX/5ohVAhNt3q0M9pz1lAZYVWzEhO w==;
X-CSE-ConnectionGUID: UzOxo1DJRpit4jj+Y+xKLA==
X-CSE-MsgGUID: uqCtZ1dZTMGfGqcH671lEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35884740"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="35884740"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:30:20 -0800
X-CSE-ConnectionGUID: m7SVWagsQw2WpxOzRtC7Lw==
X-CSE-MsgGUID: rl9Vqi9lRRiJ2pJEYl87Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89865108"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:30:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v4 4/6] lib/igt_kmod: Stop passing ktap around
Date: Mon, 18 Nov 2024 21:29:52 -0800
Message-ID: <20241119052954.1993905-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119052954.1993905-1-lucas.demarchi@intel.com>
References: <20241119052954.1993905-1-lucas.demarchi@intel.com>
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

Just allocate and free in the only function it's needed.

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 51032502f..626d67541 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -995,8 +995,9 @@ static void kunit_results_free(struct igt_list_head *results,
 }
 
 static int kunit_get_results(struct igt_list_head *results, const char *debugfs_path,
-			     const char *suite, struct igt_ktap_results **ktap)
+			     const char *suite)
 {
+	struct igt_ktap_results *ktap;
 	char results_path[PATH_MAX];
 	FILE *results_stream;
 	char *buf = NULL;
@@ -1012,21 +1013,21 @@ static int kunit_get_results(struct igt_list_head *results, const char *debugfs_
 	if (igt_debug_on(!results_stream))
 		return -errno;
 
-	*ktap = igt_ktap_alloc(results);
-	if (igt_debug_on(!*ktap)) {
+	ktap = igt_ktap_alloc(results);
+	if (igt_debug_on(!ktap)) {
 		err = -ENOMEM;
 		goto out_fclose;
 	}
 
 	while (len = getline(&buf, &size, results_stream), len > 0) {
-		err = igt_ktap_parse(buf, *ktap);
+		err = igt_ktap_parse(buf, ktap);
 		if (err != -EINPROGRESS)
 			break;
 	}
 
 	free(buf);
+	igt_ktap_free(&ktap);
 
-	igt_ktap_free(ktap);
 out_fclose:
 	fclose(results_stream);
 
@@ -1038,8 +1039,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
 			    const char *suite,
 			    const char *opts,
 			    const char *debugfs_path,
-			    DIR *debugfs_dir,
-			    struct igt_ktap_results **ktap)
+			    DIR *debugfs_dir)
 {
 	struct igt_ktap_result *r, *rn;
 	struct dirent *subdir;
@@ -1077,7 +1077,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
 		if (suite && strcmp(subdir->d_name, suite))
 			continue;
 
-		igt_warn_on_f(kunit_get_results(tests, debugfs_path, subdir->d_name, ktap),
+		igt_warn_on_f(kunit_get_results(tests, debugfs_path, subdir->d_name),
 			      "parsing KTAP report from test suite \"%s\" failed\n",
 			      subdir->d_name);
 
@@ -1094,8 +1094,7 @@ static void __igt_kunit(struct igt_ktest *tst,
 			const char *subtest,
 			const char *opts,
 			const char *debugfs_path,
-			struct igt_list_head *tests,
-			struct igt_ktap_results **ktap)
+			struct igt_list_head *tests)
 {
 	struct igt_ktap_result *t;
 
@@ -1125,7 +1124,7 @@ static void __igt_kunit(struct igt_ktest *tst,
 			igt_assert_eq(igt_kernel_tainted(&taints), 0);
 
 			igt_assert_eq(kunit_get_results(&results, debugfs_path,
-							t->suite_name, ktap), 0);
+							t->suite_name), 0);
 
 			for (i = 0; i < 2; i++) {
 				kunit_result_free(&r, &suite_name, &case_name);
@@ -1189,7 +1188,6 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 {
 	char debugfs_path[PATH_MAX] = { '\0', };
 	struct igt_ktest tst = { .kmsg = -1, };
-	struct igt_ktap_results *ktap = NULL;
 	DIR *debugfs_dir = NULL;
 	char *subtest;
 	IGT_LIST_HEAD(tests);
@@ -1240,15 +1238,13 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 	 */
 	igt_subtest_with_dynamic(subtest) {
 		kunit_get_tests(&tests, &tst, suite, opts,
-				debugfs_path, debugfs_dir, &ktap);
-		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
+				debugfs_path, debugfs_dir);
+		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests);
 	}
 
 	igt_fixture {
 		char *suite_name = NULL, *case_name = NULL;
 
-		igt_ktap_free(&ktap);
-
 		kunit_results_free(&tests, &suite_name, &case_name);
 
 		closedir(debugfs_dir);
-- 
2.47.0

