Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F5EE65D00
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 22:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1620F10E1FF;
	Thu, 21 Nov 2024 22:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njkzuG4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A74E10E1FF
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 22:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732229734; x=1763765734;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=B/hG0udu4+HbrVjllnN6EmIwDpfZ2o9cnqoBBfI4N4w=;
 b=njkzuG4TJncLT/jyWCSm3MiyDjqyqLY2mrVcHkFZSm3r/SIYZnQ7UJ47
 YOVEjsOjUm9eetrspo0RMJxDPDTzLfKr20VNUwUaBJa27UryPk0KajjYb
 P+8SteXL0+mZuqpgSw1RKBidgg3d9dYSnTflE523OGfK5QzcecC4rtcU5
 lejSqLTOFB8M/GsX+ymL3S9Nt8rpsGRLBNKxOH6IP5+xLgERGMyLqLs8j
 6NrE8j0IehPAMkMqYLbwwCFg+y0vKvt1mZYAVntYzPi70Jrz6jb2ei7P4
 SDH/KRa5AJJn0VUZjoaeTBf/0j+BhVJje5oOswDIeoDrKqVaRo1+YOZ3c Q==;
X-CSE-ConnectionGUID: Dzi7xF3qTVO5TJ5+MkvHwA==
X-CSE-MsgGUID: DsVmHWneS5epPzNnnBTE+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36151338"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="36151338"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 14:55:33 -0800
X-CSE-ConnectionGUID: PAfd3CWsQY2chciKh+7H5w==
X-CSE-MsgGUID: NcUMRkKLQuWJAWNPvsudFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="95196918"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 14:55:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI 2/2] lib/igt_kmod: Fix leaking subtest name
Date: Thu, 21 Nov 2024 14:55:10 -0800
Message-ID: <20241121225510.3701650-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121225510.3701650-1-lucas.demarchi@intel.com>
References: <20241121225510.3701650-1-lucas.demarchi@intel.com>
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

