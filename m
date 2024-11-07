Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594CED5AE62
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 05:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0630710E305;
	Thu,  7 Nov 2024 05:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eS+hCwzD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE07310E305
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 05:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730958798; x=1762494798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/hG0udu4+HbrVjllnN6EmIwDpfZ2o9cnqoBBfI4N4w=;
 b=eS+hCwzDOyC3qTTZYBYG3M/afd+6SpnZRkRy6AQsJZJvkjpxCtVGWzuv
 34qk4HogzfgkvYTXOGz5SFHrsvAE7fITcqp4egyS1Ey8Kc7N1L9Z5jpQ6
 OJ8/NUia2kcIZnKQnOBFPVC8Yz6N1WYVEpcgSHaLqGbuc3MHGQD4swAoA
 b1AmxHn9qFcTdYecg3SvdZ4mxBn/T6Bbv6tqCW/IJzXzffMGJ8Q7RskI4
 8XaqxGpMl6HKV0wrAq6xgRvgyk1nQ7MB1dFqR/7MJWNixiT86ILT40wG+
 yd/mZBlhtEh9xPfvV1mks+wtLki49PpkpsBhXBpqXBFdOOXFYRHpf9ojW Q==;
X-CSE-ConnectionGUID: evILfVsOTSqrC9rbpgEY9w==
X-CSE-MsgGUID: d1yX+HYhTuqmGAe1+G5qAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41381728"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="41381728"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 21:53:12 -0800
X-CSE-ConnectionGUID: HGhineJKRaq2VzvYu1Akkg==
X-CSE-MsgGUID: Ek1gWpBES3WMooJRWRzY7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="84879390"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 21:53:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 2/6] lib/igt_kmod: Fix leaking subtest name
Date: Wed,  6 Nov 2024 21:52:50 -0800
Message-ID: <20241107055254.3129207-3-lucas.demarchi@intel.com>
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

Keep it simple, checking by !suite and then assigning subtest
accordingly. Since this is done only once, always call strdup()
and free().

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 5224d36a4..3729a053c 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1197,8 +1197,8 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 	char debugfs_path[PATH_MAX] = { '\0', };
 	struct igt_ktest tst = { .kmsg = -1, };
 	struct igt_ktap_results *ktap = NULL;
-	const char *subtest = suite;
 	DIR *debugfs_dir = NULL;
+	char *subtest;
 	IGT_LIST_HEAD(tests);
 
 	/*
@@ -1206,7 +1206,9 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 	 * we take the module name, drop the trailing "_test" or "_kunit"
 	 * suffix, if any, and use the result as our IGT subtest name.
 	 */
-	if (!subtest) {
+	if (suite) {
+		subtest = strdup(suite);
+	} else {
 		subtest = strdup(module_name);
 		if (!igt_debug_on(!subtest)) {
 			char *suffix = strstr(subtest, "_test");
@@ -1259,6 +1261,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 		igt_ktest_end(&tst);
 	}
 
+	free(subtest);
 	igt_ktest_fini(&tst);
 }
 
-- 
2.47.0

