Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF180D1CA31
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 05:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D8710E512;
	Tue,  5 Nov 2024 05:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZ5TisXs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7401E10E511
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 05:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730786005; x=1762322005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N72nOiEJBKD2jkBjmJj5wGx0t7Hf0sYUaxz4qwAkI/M=;
 b=eZ5TisXsXC6su1fhEfr1wv07Dl3mgU71S/HAQVtOCqYuXzCbyiMvCSbv
 4aIBXdlJ9y47c+KTN+xb1ZsJ7z1dQVTf19yrhUghrW/VhNw4kCo3ToTML
 s9E0W3aBnHtY+cQwOmE9eCg/r4n+cQJ5CbmTzjBi7bYykxjPegu/beNzh
 Uil/3we60Ms2MCblIA6zXUJV4y8LlLVp1X7ny4++DedNrdUM5DIYe+JwW
 DTRU17cckA9qOigMXRv/ki+Ldvf5R+0Wt+YtEiVPRjzg5sf7X7Et3/Bg8
 Y2NFoDbIsqKo1UwDR2Jux/KownkltXB5R0aIGiu4X85TR2WiJi06qT9v+ g==;
X-CSE-ConnectionGUID: 73yBakJMSLe6ecTgR4BClQ==
X-CSE-MsgGUID: RgA//SV5T26ICoXNZbJb+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33351545"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="33351545"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 21:53:25 -0800
X-CSE-ConnectionGUID: xOY2LRGmQjym6bxH+uV0rw==
X-CSE-MsgGUID: STSgge+xS4GDEJvU6XnZBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="87815942"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 21:53:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/3] lib/igt_kmod: Fix leaking subtest name
Date: Mon,  4 Nov 2024 21:52:55 -0800
Message-ID: <20241105055255.2466236-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105055255.2466236-1-lucas.demarchi@intel.com>
References: <20241105055255.2466236-1-lucas.demarchi@intel.com>
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

Keep it simple, checking by !suite and then assigning subtest
accordingly. Since this is done only once, always call strdup()
and free().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 58edac8fa..fb83f17c0 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1199,7 +1199,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 	char debugfs_path[PATH_MAX] = { '\0', };
 	struct igt_ktest tst = { .kmsg = -1, };
 	struct igt_ktap_results *ktap = NULL;
-	const char *subtest = suite;
+	char *subtest = NULL;
 	DIR *debugfs_dir = NULL;
 	IGT_LIST_HEAD(tests);
 
@@ -1208,7 +1208,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 	 * we take the module name, drop the trailing "_test" or "_kunit"
 	 * suffix, if any, and use the result as our IGT subtest name.
 	 */
-	if (!subtest) {
+	if (!suite) {
 		subtest = strdup(module_name);
 		if (!igt_debug_on(!subtest)) {
 			char *suffix = strstr(subtest, "_test");
@@ -1216,6 +1216,8 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 			if (suffix)
 				*suffix = '\0';
 		}
+	} else {
+		subtest = strdup(suite);
 	}
 
 	/* We need the base KUnit module loaded if not built-in */
@@ -1262,6 +1264,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 		igt_ktest_end(&tst);
 	}
 
+	free(subtest);
 	igt_ktest_fini(&tst);
 }
 
-- 
2.47.0

