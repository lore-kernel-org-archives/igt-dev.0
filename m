Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7177DD591A6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D11A10E5B1;
	Tue, 19 Nov 2024 05:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcxAyNLD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EADD10E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994220; x=1763530220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/hG0udu4+HbrVjllnN6EmIwDpfZ2o9cnqoBBfI4N4w=;
 b=OcxAyNLDHEJFy1XG5VeuXsB1BF4Oc3Gh2vEhaxYSqZR7ScJg/0OCalt0
 tam07gLFRYczCVRUKsY8E4UAaIMDoaXlW1Rti7cZIJjjIZUf63GHUj8nT
 dEJOAT4ynZi+IPmyvruuGfKY8+RaXm/7quE6na6YGGWCk+5OeLbtjk8cK
 8zQP20FltTvzfYJS6t7u2ew64yhNWX+2ihJaR+RXNkeKAB848gWV4w7lD
 bZcGcQZ+AMs4d2P5VsqzrZeRqLnWMmGsWcLGH1VFzMeXyXzbJmC4V1LAG
 rBW6lOLpPfMqzT0avzCPkKecIZWdE+1HpPcP65AGdNJc+bfYRRXddQZJo Q==;
X-CSE-ConnectionGUID: VaZQ/kGhTOiC+ioCooen8w==
X-CSE-MsgGUID: DuRdBbT/SuaKZ6XFN8YtsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35884738"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="35884738"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:30:20 -0800
X-CSE-ConnectionGUID: ccM0rajoQ5Gp9hNmiRGyyA==
X-CSE-MsgGUID: 7VRfBkpARa2S9MnnMtt4qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89865102"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:30:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v4 2/6] lib/igt_kmod: Fix leaking subtest name
Date: Mon, 18 Nov 2024 21:29:50 -0800
Message-ID: <20241119052954.1993905-3-lucas.demarchi@intel.com>
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

