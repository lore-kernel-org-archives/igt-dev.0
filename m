Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A89C5321D
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 16:14:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69AC10EC6A;
	Fri, 23 Aug 2024 16:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKaenr6R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2A210EC6A
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 16:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724429658; x=1755965658;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vyXPURXxZuCc7M28+uZZGeDKvfzqOZ6BpDC3v4jm1q8=;
 b=UKaenr6RNNfMAIyVnLiKvxAxGx0ab8CTukYzC2UJd/6sD/WYQMFa6eyR
 AC/7wyDXB7QtOCq86z8n8gS11xveQLfHaAyqvYN4eVF3B6Il5bniWuEZr
 pgnzvlq+CMFF/4aM1xUvGpt+HWGITFcZFeTSjTKHdaniesq1SmKh9WBgA
 er4fUGgy3174I8ieJLRldsTjrjbYjmiMYjGuGqrYxTlMpHi1hiDRFmYO5
 WIxx16/FAgsIZNvG+OCiVJ8ho9K6ocpYkkptIxNti9fr6lF+/tMnwm+zB
 jb3eQTPOrMH5sizz/0FZlt0dwGPeJctLt2Jhbj6ZfmnwBCh42k/MEaNzz A==;
X-CSE-ConnectionGUID: JGApYLAgQQaVQqsFbYtbTA==
X-CSE-MsgGUID: lcXZCzlURj6XHNjmJMmb7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="13171779"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="13171779"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 09:14:17 -0700
X-CSE-ConnectionGUID: YBpwWkuFSjKheTrrThuh9Q==
X-CSE-MsgGUID: OVi96TONQnWhXV2XQDQXOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66159571"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.243])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 09:14:16 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Helen Koike <helen.koike@collabora.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Rob Clark <robdclark@gmail.com>
Subject: [PATCH i-g-t v2] runner/settings: set PRUNE_KEEP_ALL as default
Date: Fri, 23 Aug 2024 18:14:09 +0200
Message-ID: <20240823161409.79198-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

In testing drm-tip it is helpful to have reported all tests
results, especially when one have many dynamic ones we want
to get a parent result.

v2: fix for runner_tests (Jari)

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Helen Koike <helen.koike@collabora.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Rob Clark <robdclark@gmail.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/runner_tests.c | 2 +-
 runner/settings.c     | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index b806d45ad..a661722ac 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -310,7 +310,7 @@ igt_main
 		igt_assert_eq(settings->per_test_timeout, 0);
 		igt_assert_eq(settings->overall_timeout, 0);
 		igt_assert(!settings->use_watchdog);
-		igt_assert_eq(settings->prune_mode, 0);
+		igt_assert_eq(settings->prune_mode, PRUNE_KEEP_ALL);
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
 		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
 
diff --git a/runner/settings.c b/runner/settings.c
index 94b3b9fe6..0d27e7af3 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -279,11 +279,11 @@ static const char *usage_str =
 	"                        results that are removed from the final results set.\n"
 	"                        Possible options:\n"
 	"                         keep-dynamic-subtests  - Remove subtests that have dynamic\n"
-	"                                                  subtests. (default)\n"
+	"                                                  subtests.\n"
 	"                         keep-dynamic           - Alias for the above\n"
 	"                         keep-subtests          - Remove dynamic subtests,\n"
 	"                                                  leaving just the parent subtest.\n"
-	"                         keep-all               - Don't remove anything\n"
+	"                         keep-all               - Don't remove anything (default)\n"
 	"                         keep-requested         - Remove reported results that are\n"
 	"                                                  not in the requested test set.\n"
 	"                                                  Useful when you have a hand-written\n"
@@ -693,6 +693,7 @@ bool parse_options(int argc, char **argv,
 	optind = 1;
 
 	settings->dmesg_warn_level = -1;
+	settings->prune_mode = -1;
 
 	while ((c = getopt_long(argc, argv, "hn:dt:x:e:sl:omb:L",
 				long_options, NULL)) != -1) {
@@ -818,6 +819,9 @@ bool parse_options(int argc, char **argv,
 	if (settings->dmesg_warn_level < 0)
 		settings->dmesg_warn_level = 4; /* KERN_WARN */
 
+	if (settings->prune_mode < 0)
+		settings->prune_mode = PRUNE_KEEP_ALL;
+
 	if (settings->list_all) { /* --list-all doesn't require results path */
 		switch (argc - optind) {
 		case 1:
-- 
2.43.0

