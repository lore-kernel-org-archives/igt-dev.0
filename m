Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11744D5AE60
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 05:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CEA10E231;
	Thu,  7 Nov 2024 05:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/xzNC/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B7110E072
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 05:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730958796; x=1762494796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2EcmHDbz2OpqpoNbmz/3Car3hGLIzIgtYloNTfkIUsU=;
 b=K/xzNC/Pj+XXvE2mEeyFgSw8TzmPd9P9PPnwgo3svO0rfaVC6n+IJjWd
 m+BELlrN8UDVq9YJPrcug2nHgz/pjNCyMR1i4cCz8FgJ+mxKdt/e1HNBU
 lhNC0w0ic77HK0RSXZO1QAVdU+2Q9lNRqMXYxjQxPoTlf3rvG0+VxOxHJ
 dBYbSDJBgMshRQq//X82U3Qq+/rtkNCP0GJ/HeFHhHkgzLTk1yK/oDreI
 jaAV2G6qwRXaMTngg3hDvjQc9qfgtiza6FaaI20sddxDbLrzozTlW73VT
 MYXf27zCCoUd7JubZnpuh7ukrauXDxHoQcupOw6yWGpvhNFherNBtPKQv g==;
X-CSE-ConnectionGUID: Nn9F026NTiWNGC3L06U5vw==
X-CSE-MsgGUID: 9NJbWVfiTIGDNu6+hbg6hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41381729"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="41381729"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 21:53:13 -0800
X-CSE-ConnectionGUID: ORJIxKSSTMa1fSJ9NFdMsw==
X-CSE-MsgGUID: C1yMOmSkRH+CxcrErJ3T3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="84879393"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 21:53:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 3/6] lib/igt_kmod: Stop passing debugfs_dir around
Date: Wed,  6 Nov 2024 21:52:51 -0800
Message-ID: <20241107055254.3129207-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241107055254.3129207-1-lucas.demarchi@intel.com>
References: <20241107055254.3129207-1-lucas.demarchi@intel.com>
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

Just open and closes it while getting the list of tests.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 3729a053c..36578aa68 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1038,15 +1038,15 @@ static void kunit_get_tests(struct igt_list_head *tests,
 			    const char *suite,
 			    const char *opts,
 			    const char *debugfs_path,
-			    DIR **debugfs_dir,
 			    struct igt_ktap_results **ktap)
 {
 	struct igt_ktap_result *r, *rn;
 	struct dirent *subdir;
 	unsigned long taints;
+	DIR *debugfs_dir;
 
-	*debugfs_dir = opendir(debugfs_path);
-	if (igt_debug_on(!*debugfs_dir))
+	debugfs_dir = opendir(debugfs_path);
+	if (igt_debug_on(!debugfs_dir))
 		return;
 
 	/*
@@ -1057,21 +1057,23 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	 * we already can do perfectly -- seems to be more safe than extracting
 	 * a free text list of unknown length from /dev/kmsg.
 	 */
-	if (igt_debug_on(!kunit_set_filtering(suite, "module=none", "skip")))
+	if (igt_debug_on(!kunit_set_filtering(suite, "module=none", "skip"))) {
+		closedir(debugfs_dir);
 		return;
+	}
 
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
 
@@ -1089,8 +1091,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
 			break;
 	}
 
-	closedir(*debugfs_dir);
-	*debugfs_dir = NULL;
+	closedir(debugfs_dir);
 
 	igt_list_for_each_entry_safe(r, rn, tests, link)
 		igt_require_f(r->code == IGT_EXIT_SKIP,
@@ -1197,7 +1198,6 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 	char debugfs_path[PATH_MAX] = { '\0', };
 	struct igt_ktest tst = { .kmsg = -1, };
 	struct igt_ktap_results *ktap = NULL;
-	DIR *debugfs_dir = NULL;
 	char *subtest;
 	IGT_LIST_HEAD(tests);
 
@@ -1244,7 +1244,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 	 */
 	igt_subtest_with_dynamic(subtest) {
 		kunit_get_tests(&tests, &tst, suite, opts,
-				debugfs_path, &debugfs_dir, &ktap);
+				debugfs_path, &ktap);
 		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
 	}
 
@@ -1255,9 +1255,6 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 
 		kunit_results_free(&tests, &suite_name, &case_name);
 
-		if (debugfs_dir)
-			closedir(debugfs_dir);
-
 		igt_ktest_end(&tst);
 	}
 
-- 
2.47.0

