Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712D9CA1016
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 17:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3DC10E596;
	Mon,  8 Sep 2025 17:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORgEoVRI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FAE10E596
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 17:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757353412; x=1788889412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tzbQuoQ65WZcDnXamkh1VwiaZ6fuohWxfbLp5JYKiKM=;
 b=ORgEoVRIFHrE3SlR7RPyp4Zp0mJUC4HMqQGp1aL5F7DMQUKa0rHsB3kb
 ZkRG0zxs6TXyaOiP11uKCIor0knvyRuBgKEdBmObAZtNxuGaOlsivbj9u
 Pch5a5Vh58n9L2oo9zw7HizEsO5mdEFEPJfcW1iy5bywl3kBGTOd/y54K
 /WOJrasU3o/ajyD/CV5J9W76wdOcM01EMbKfHbpBrkOVDxztBQ1kIu82x
 DnQ2ha+LL0NTOgJNEQgvKIKmotfMhg3HnIUk51/DQOCnd53y+OZGqslKO
 CZ5TGuf7G2vmflfmXdtLBmEJmV0Cuu45Y7P/bBEz69g1lFWWlq260g36J Q==;
X-CSE-ConnectionGUID: wBfw54r2T36xPY1fHaTuYA==
X-CSE-MsgGUID: KbldrlyKRiKLIp27h0SDOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58832414"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="58832414"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 10:43:32 -0700
X-CSE-ConnectionGUID: ZomlyrDaTpmTTfKBFA9HQw==
X-CSE-MsgGUID: +g6RL1F5TRWKuQMw0674DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="172987752"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.244])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 10:43:30 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>, Ryszard Knop <rk@dragonic.eu>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v1 1/2] runner: Add alias option
 disk-usage-limit-per-test
Date: Mon,  8 Sep 2025 19:43:18 +0200
Message-ID: <20250908174319.93968-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908174319.93968-1-kamil.konieczny@linux.intel.com>
References: <20250908174319.93968-1-kamil.konieczny@linux.intel.com>
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
an alias disk-usage-limit-per-test which should be more self
explanatory.

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Ryszard Knop <rk@dragonic.eu>
Suggested-by: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/runner_tests.c | 52 ++++++++++++++++++++++++++-----------------
 runner/settings.c     |  3 +++
 2 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index e62e7b34d..1733f5e35 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -261,6 +261,36 @@ static void write_packet_with_canary(int fd, struct runnerpacket *packet)
 	free(packet);
 }
 
+static void test_disk_usage_limit_suffixes(const char *param, struct settings *settings)
+{
+	static const char * const argv[] = { "runner",
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
+		test_disk_usage_limit_suffixes("--disk-usage-limit-per-test", settings);
 	}
 
 	igt_subtest("prune-modes") {
diff --git a/runner/settings.c b/runner/settings.c
index 85980dc96..dcad8340a 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -276,6 +276,8 @@ static const char *usage_str =
 	"                        kernel logs, exceed the given limit in bytes. The limit\n"
 	"                        parameter can use suffixes k, M and G for kilo/mega/gigabytes,\n"
 	"                        respectively. Limit of 0 (default) disables the limit.\n"
+	"  --disk-usage-limit-per-test <limit>\n"
+	"                        Alias for --disk-usage-limit\n"
 	"  --use-watchdog        Use hardware watchdog for lethal enforcement of the\n"
 	"                        above timeout. Killing the test process is still\n"
 	"                        attempted at timeout trigger.\n"
@@ -728,6 +730,7 @@ bool parse_options(int argc, char **argv,
 		{"environment", required_argument, NULL, OPT_ENVIRONMENT},
 		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
 		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
+		{"disk-usage-limit-per-test", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
 		{"facts", no_argument, NULL, OPT_FACTS},
 		{"kmemleak", optional_argument, NULL, OPT_KMEMLEAK},
 		{"sync", no_argument, NULL, OPT_SYNC},
-- 
2.51.0

