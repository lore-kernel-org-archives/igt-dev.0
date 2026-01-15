Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B2FD44C40
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 12:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B778810E74D;
	Thu, 15 Jan 2026 12:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ambztq9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0CD10E74D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768481864; x=1800017864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KEF4aR7VUE4kgdNLfoEk8LDADV84+mHFmnQ7+HCYYz0=;
 b=Ambztq9TEP7DZ8b1csoVoZBAN7RGQg88hK6YTYT36keUadMYb7SKkQow
 NNfY0wiBTpom3NWVnfw4P1px5EtkbN8Z3yorXU0CLe8/sxRSsokGwVkrM
 JOWKqidPQbmf/6nzfCpsoDqpTfOdaTBRw4x2PLM4KHaG6RxKqSQezTOGy
 tPlDZPrXe5BzXRbKX7oAQDrkRGlbHJ2w0ezoorP+Ebp/tgM1v1cMBnUbp
 8dQcfIge24vhyrKgT5dHLmEOy0svDAjYk9E9nIt4UGFHf5d01nS3nKbOG
 JiefoQmwfQFccWHbkt4Njt4LBaumNRV90sEfqA9j6mjEOYPS0PKvXKDhJ g==;
X-CSE-ConnectionGUID: IkM4yr25TjmhUeMvL8XXMg==
X-CSE-MsgGUID: hIyTSLoBSpSgdP4WoHvOIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73628830"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="73628830"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 04:57:44 -0800
X-CSE-ConnectionGUID: bUdUuPHzR+uRIVIGdc/kFw==
X-CSE-MsgGUID: pnjvAO5IS+67pQ1C/L79dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204093185"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.21])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:57:43 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 1/4] runner/settings: Add new option --reduce-dmesg
Date: Thu, 15 Jan 2026 13:57:29 +0100
Message-ID: <20260115125732.20542-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115125732.20542-1-kamil.konieczny@linux.intel.com>
References: <20260115125732.20542-1-kamil.konieczny@linux.intel.com>
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

This option will affect processing of successful dmesg logs,
reducing its size to only beginning up to given size and few last
lines. That should be enough to locate full dmesg in a separately
saved dmesg from whole run. It should help reducing size of
results.json and also should make it faster to process.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/settings.c | 36 ++++++++++++++++++++++++++++++++++++
 runner/settings.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index 3ccf71870..f3ca60d2a 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -31,6 +31,7 @@ enum {
 	OPT_CODE_COV_SCRIPT,
 	OPT_ENABLE_CODE_COVERAGE,
 	OPT_COV_RESULTS_PER_TEST,
+	OPT_RESULTS_REDUCE_DMESG,
 	OPT_HOOK,
 	OPT_HELP_HOOK,
 	OPT_VERSION,
@@ -208,6 +209,29 @@ static bool parse_usage_limit(struct settings *settings, const char *optarg)
 	return true;
 }
 
+static bool parse_size_t(size_t *out, const char *optarg)
+{
+	size_t value;
+	char *endptr = NULL;
+
+	if (!optarg)
+		return false;
+
+	value = strtoul(optarg, &endptr, 10);
+
+	if (*endptr) {
+		size_t multiplier = char_to_multiplier(*endptr);
+
+		if (multiplier == 0)
+			return false;
+
+		value *= multiplier;
+	}
+
+	*out = value;
+	return true;
+}
+
 static const char *usage_str =
 	"usage: runner [options] [test_root] results-path\n"
 	"   or: runner --list-all [options] [test_root]\n\n"
@@ -274,6 +298,9 @@ static const char *usage_str =
 	"                        kernel logs, exceed the given limit in bytes. The limit\n"
 	"                        parameter can use suffixes k, M and G for kilo/mega/gigabytes,\n"
 	"                        respectively. Limit of 0 (default) disables the limit.\n"
+	"  --reduce-dmesg <size> When dmesg exceeds given size, reduce it to include beginning,\n"
+	"                        kernel warning (if any), and end of collected original dmesg.\n"
+	"                        This option affects only generated json.\n"
 	"  --use-watchdog        Use hardware watchdog for lethal enforcement of the\n"
 	"                        above timeout. Killing the test process is still\n"
 	"                        attempted at timeout trigger.\n"
@@ -702,6 +729,7 @@ bool parse_options(int argc, char **argv,
 		{"collect-code-cov", no_argument, NULL, OPT_ENABLE_CODE_COVERAGE},
 		{"coverage-per-test", no_argument, NULL, OPT_COV_RESULTS_PER_TEST},
 		{"collect-script", required_argument, NULL, OPT_CODE_COV_SCRIPT},
+		{"reduce-dmesg", required_argument, NULL, OPT_RESULTS_REDUCE_DMESG},
 		{"hook", required_argument, NULL, OPT_HOOK},
 		{"help-hook", no_argument, NULL, OPT_HELP_HOOK},
 		{"multiple-mode", no_argument, NULL, OPT_MULTIPLE},
@@ -765,6 +793,12 @@ bool parse_options(int argc, char **argv,
 				goto error;
 			}
 			break;
+		case OPT_RESULTS_REDUCE_DMESG:
+			if (!parse_size_t(&settings->reduce_dmesg, optarg)) {
+				usage(stderr, "Cannot parse --reduce-dmesg");
+				goto error;
+			}
+			break;
 		case OPT_FACTS:
 			settings->facts = true;
 			break;
@@ -1253,6 +1287,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_INT(f, settings, enable_code_coverage);
 	SERIALIZE_INT(f, settings, cov_results_per_test);
 	SERIALIZE_STR(f, settings, code_coverage_script);
+	SERIALIZE_UL(f, settings, reduce_dmesg);
 	SERIALIZE_STR_ARRAY(f, settings, cmdline.argv, cmdline.argc);
 
 	if (settings->sync) {
@@ -1371,6 +1406,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_INT(settings, name, val, enable_code_coverage);
 		PARSE_INT(settings, name, val, cov_results_per_test);
 		PARSE_STR(settings, name, val, code_coverage_script);
+		PARSE_UL(settings, name, val, reduce_dmesg);
 		PARSE_STR_ARRAY(settings, name, val, cmdline.argv, cmdline.argc);
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
diff --git a/runner/settings.h b/runner/settings.h
index 6c58c3282..8d8c04b0f 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -81,6 +81,7 @@ struct settings {
 	char *code_coverage_script;
 	bool enable_code_coverage;
 	bool cov_results_per_test;
+	size_t reduce_dmesg;
 	struct {
 		int argc;
 		char **argv;
-- 
2.52.0

