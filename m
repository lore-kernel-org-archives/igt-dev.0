Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DCED591A5
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F8310E5B9;
	Tue, 19 Nov 2024 05:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKUo9nfQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6607710E0A5
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994220; x=1763530220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VnX4NYajpcDdhyiL9PCsTjIV+DeiRcD9dDbMaYMez/s=;
 b=NKUo9nfQBXxbHFbJjyrQ+cxRLl3BzVDOl0p4ucIDgUt+Lff7/0CPTpi1
 eodapyuwijbMs3DsZvC8UfW2WJcqtNLhRWGobeNZPJ5NxTqJmLveRtfs1
 6qFN/UkkePX0OPQk33wMiyL79QZn84BdUBHyxTKuV3+5stX/OnyV34ksk
 TZlhhbKcLLIeYvwz2pf+1r7BYCTV80u2VXHFVk4014838UV5ZfVCT4gFl
 NUP/GKGlh62SeRn0OAW9bL/vQ/sF0If8/aqBY8mmTt6XeTbKRpmXM7oM5
 +H+kzESgRYX1vev3duMIUyYlbd5xaD777fMfQnSW2ucdn0vAvCas7x04J g==;
X-CSE-ConnectionGUID: AiW7M6nIQI+3nEyTfBQlKQ==
X-CSE-MsgGUID: 7Zn0PnboQFuhTcpMLwUPtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35884739"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="35884739"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:30:20 -0800
X-CSE-ConnectionGUID: S9VKgKXFSFe1gkiS+EsozQ==
X-CSE-MsgGUID: h3GcNO/zQEqbAtBSvE3HQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89865105"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:30:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v4 3/6] lib/igt_kmod: Let the fixture open/close debugfs
Date: Mon, 18 Nov 2024 21:29:51 -0800
Message-ID: <20241119052954.1993905-4-lucas.demarchi@intel.com>
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

Do not pass as argument and let the called function open/close since the
caller also has to deal with fallouts due to igt_require() and the like.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 3729a053c..51032502f 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1038,17 +1038,13 @@ static void kunit_get_tests(struct igt_list_head *tests,
 			    const char *suite,
 			    const char *opts,
 			    const char *debugfs_path,
-			    DIR **debugfs_dir,
+			    DIR *debugfs_dir,
 			    struct igt_ktap_results **ktap)
 {
 	struct igt_ktap_result *r, *rn;
 	struct dirent *subdir;
 	unsigned long taints;
 
-	*debugfs_dir = opendir(debugfs_path);
-	if (igt_debug_on(!*debugfs_dir))
-		return;
-
 	/*
 	 * To get a list of test cases provided by a kunit test module, ask the
 	 * generic kunit module to respond with SKIP result for each test found.
@@ -1061,17 +1057,17 @@ static void kunit_get_tests(struct igt_list_head *tests,
 		return;
 
 	if (!suite) {
-		seekdir(*debugfs_dir, 2);	/* directory itself and its parent */
+		seekdir(debugfs_dir, 2);	/* directory itself and its parent */
 		errno = 0;
-		igt_skip_on_f(readdir(*debugfs_dir) || errno,
+		igt_skip_on_f(readdir(debugfs_dir) || errno,
 			      "Require empty KUnit debugfs directory\n");
-		rewinddir(*debugfs_dir);
+		rewinddir(debugfs_dir);
 	}
 
 	igt_skip_on(modprobe(tst->kmod, opts));
 	igt_skip_on(igt_kernel_tainted(&taints));
 
-	while (subdir = readdir(*debugfs_dir), subdir) {
+	while (subdir = readdir(debugfs_dir), subdir) {
 		if (!(subdir->d_type & DT_DIR))
 			continue;
 
@@ -1089,9 +1085,6 @@ static void kunit_get_tests(struct igt_list_head *tests,
 			break;
 	}
 
-	closedir(*debugfs_dir);
-	*debugfs_dir = NULL;
-
 	igt_list_for_each_entry_safe(r, rn, tests, link)
 		igt_require_f(r->code == IGT_EXIT_SKIP,
 			      "Unexpected non-SKIP result while listing test cases\n");
@@ -1226,13 +1219,16 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 	kunit_debugfs_path(debugfs_path);
 
 	igt_fixture {
+		igt_assert(igt_list_empty(&tests));
+
 		igt_require(subtest);
 		igt_require(*debugfs_path);
 
 		igt_skip_on(igt_ktest_init(&tst, module_name));
 		igt_skip_on(igt_ktest_begin(&tst));
 
-		igt_assert(igt_list_empty(&tests));
+		debugfs_dir = opendir(debugfs_path);
+		igt_skip_on(!debugfs_dir);
 	}
 
 	/*
@@ -1244,7 +1240,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 	 */
 	igt_subtest_with_dynamic(subtest) {
 		kunit_get_tests(&tests, &tst, suite, opts,
-				debugfs_path, &debugfs_dir, &ktap);
+				debugfs_path, debugfs_dir, &ktap);
 		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
 	}
 
@@ -1255,8 +1251,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 
 		kunit_results_free(&tests, &suite_name, &case_name);
 
-		if (debugfs_dir)
-			closedir(debugfs_dir);
+		closedir(debugfs_dir);
 
 		igt_ktest_end(&tst);
 	}
-- 
2.47.0

