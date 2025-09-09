Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F21FCAC583
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 12:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C545B10E6F5;
	Tue,  9 Sep 2025 12:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYKgJxYf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DC010E6F5
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757422024; x=1788958024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TnWXZzLyZdKJP5oggnRg4C/YnK3+eGXPZm0YG+B1V3w=;
 b=bYKgJxYf6ScTWZ5hpnqpSrVVen0D74TBq/MKR4QESrSGiHQr1YLHRlYH
 Jp1Uu1vgCmHvyguLdJsAknfmySHx0sllT/H6uVU9n0nVOATt8n8k7KEXM
 S8FgdfG2HeVMGd9vO9B75imz49pgNeRtMjd+wRNJcw7kgRTB1PcQSbxv+
 ib4GoJHReDgLmWgg2DXlPqIdxJQTPoOR9dDqiWEn7xJry+iQd/w5RRWqr
 /GVe02lfBs5N3u1uub3gGKfTdhPIGtaETflVJb03tD+l2kYaJvjfuHiMF
 SObMVrLH3DMNjxKCoL5mx1vD50mT/7pivYsoO00AtJ7P5wz12L6LzeizU Q==;
X-CSE-ConnectionGUID: KhZxg/ffRqCnsnk+z4HYXQ==
X-CSE-MsgGUID: eXfzX/twRGud2gGLMduAPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="62330848"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="62330848"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:47:04 -0700
X-CSE-ConnectionGUID: j/YwDkTgTdOy3mqmhrAcbQ==
X-CSE-MsgGUID: tNrvhhzpT4SwttRtEaa66A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="203850770"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:47:02 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>, Ryszard Knop <rk@dragonic.eu>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v2 1/2] runner: Add alias option disk-limit-per-test
Date: Tue,  9 Sep 2025 14:46:50 +0200
Message-ID: <20250909124651.173431-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909124651.173431-1-kamil.konieczny@linux.intel.com>
References: <20250909124651.173431-1-kamil.konieczny@linux.intel.com>
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

Old option name disk-usage-limit is a little too vague, introduce
an alias disk-limit-per-subtest which should be more explanatory.

Also while at this, explain that for dynamic subtest this option
applies to each of sub-subtest separately.

v2: fix compilation, make alias option shorter, add explantaion
  for dynamic sub-subtests. (Kamil)

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Ryszard Knop <rk@dragonic.eu>
Suggested-by: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/runner_tests.c | 52 ++++++++++++++++++++++++++-----------------
 runner/settings.c     |  4 ++++
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index e62e7b34d..af1650101 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -261,6 +261,36 @@ static void write_packet_with_canary(int fd, struct runnerpacket *packet)
 	free(packet);
 }
 
+static void test_disk_usage_limit_suffixes(const char *param, struct settings *settings)
+{
+	const char *argv[] = { "runner",
+			       "--disk-usage-limit=0",
+			       "test-root-dir",
+			       "results-path",
+	};
+	char disk[128];
+
+	snprintf(disk, sizeof(disk), "%s=4096", param);
+	argv[1] = disk;
+	igt_assert(parse_options(ARRAY_SIZE(argv), (char **)argv, settings));
+	igt_assert_eq_u64(settings->disk_usage_limit, 4096UL);
+
+	snprintf(disk, sizeof(disk), "%s=4k", param);
+	argv[1] = disk;
+	igt_assert(parse_options(ARRAY_SIZE(argv), (char **)argv, settings));
+	igt_assert_eq_u64(settings->disk_usage_limit, 4096UL);
+
+	snprintf(disk, sizeof(disk), "%s=1M", param);
+	argv[1] = disk;
+	igt_assert(parse_options(ARRAY_SIZE(argv), (char **)argv, settings));
+	igt_assert_eq_u64(settings->disk_usage_limit, 1024UL * 1024UL);
+
+	snprintf(disk, sizeof(disk), "%s=1G", param);
+	argv[1] = disk;
+	igt_assert(parse_options(ARRAY_SIZE(argv), (char **)argv, settings));
+	igt_assert_eq_u64(settings->disk_usage_limit, 1024UL * 1024UL * 1024UL);
+}
+
 igt_main
 {
 	struct settings *settings = malloc(sizeof(*settings));
@@ -672,26 +702,8 @@ igt_main
 	}
 
 	igt_subtest("disk-usage-limit-suffixes") {
-		const char *argv[] = { "runner",
-				       "--disk-usage-limit=4096",
-				       "test-root-dir",
-				       "results-path",
-		};
-
-		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
-		igt_assert_eq_u64(settings->disk_usage_limit, 4096UL);
-
-		argv[1] = "--disk-usage-limit=4k";
-		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
-		igt_assert_eq_u64(settings->disk_usage_limit, 4096UL);
-
-		argv[1] = "--disk-usage-limit=1M";
-		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
-		igt_assert_eq_u64(settings->disk_usage_limit, 1024UL * 1024UL);
-
-		argv[1] = "--disk-usage-limit=1G";
-		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
-		igt_assert_eq_u64(settings->disk_usage_limit, 1024UL * 1024UL * 1024UL);
+		test_disk_usage_limit_suffixes("--disk-usage-limit", settings);
+		test_disk_usage_limit_suffixes("--disk-limit-per-subtest", settings);
 	}
 
 	igt_subtest("prune-modes") {
diff --git a/runner/settings.c b/runner/settings.c
index 85980dc96..47f244a0d 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -276,6 +276,9 @@ static const char *usage_str =
 	"                        kernel logs, exceed the given limit in bytes. The limit\n"
 	"                        parameter can use suffixes k, M and G for kilo/mega/gigabytes,\n"
 	"                        respectively. Limit of 0 (default) disables the limit.\n"
+	"                        For dynamic tests, it applies to sub-subtests separately.\n"
+	"  --disk-limit-per-subtest <limit>\n"
+	"                        Alias for --disk-usage-limit\n"
 	"  --use-watchdog        Use hardware watchdog for lethal enforcement of the\n"
 	"                        above timeout. Killing the test process is still\n"
 	"                        attempted at timeout trigger.\n"
@@ -728,6 +731,7 @@ bool parse_options(int argc, char **argv,
 		{"environment", required_argument, NULL, OPT_ENVIRONMENT},
 		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
 		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
+		{"disk-limit-per-subtest", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
 		{"facts", no_argument, NULL, OPT_FACTS},
 		{"kmemleak", optional_argument, NULL, OPT_KMEMLEAK},
 		{"sync", no_argument, NULL, OPT_SYNC},
-- 
2.51.0

