Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6408DC3DA64
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 14:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2374210E839;
	Thu, 25 Jul 2024 14:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFjeoMhc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB7B10E834
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 14:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721917252; x=1753453252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZriZcJEgGo3YfcHbO0q6SOUSRFzX8SNLLzq3kzTbnBk=;
 b=hFjeoMhcVY9OtZrMV4lVBHs0rLouAEg8SuDFK4qmX3tEQ/GAKgUeidRR
 wI6o5DEUcpkKgyT7ij9IDwwUmT3fZn+2jQFOJiO97rIxoG0B+lsh+OFLY
 Agy6d2n7pkSxiz15xNB2TVQREaIOj9mtV+6SypGoAtz8z7b7s7wJ17wOA
 YkJUU6L0zQMPwTa0TxRdC2THbSZQrCCYzdNMRzubAKh9heVFKYdm6Jy1k
 y0P2Al9PJm9c3kQGIfbq77DoQ20QPWHkUJjbCgY626dctUV3ogXiGtXKC
 2iKYmlxDEFPCtK4wlcVDYIFS4Fu4gNxTV4+8A+J8kfxjVEHSrnhb17fLb A==;
X-CSE-ConnectionGUID: PYmJ7s/XQ66jCPcxpEO9XA==
X-CSE-MsgGUID: kT7Reno2SRS3AK4QlMvAow==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23463859"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="23463859"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:20:52 -0700
X-CSE-ConnectionGUID: 1b7tN2KsQ5e/iRGYeQvz4Q==
X-CSE-MsgGUID: FyENfawFReG2R/0GMH2kYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="83938442"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.111.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:20:51 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 3/6] runner: Add option --hook
Date: Thu, 25 Jul 2024 11:19:36 -0300
Message-ID: <20240725142028.51735-4-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725142028.51735-1-gustavo.sousa@intel.com>
References: <20240725142028.51735-1-gustavo.sousa@intel.com>
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

Now that we have support for setting a hook script for test cases, let's
also add the option --hook to igt_runner, which forwards it to test
executables.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 runner/executor.c     |  7 +++++++
 runner/runner_tests.c |  5 +++++
 runner/settings.c     | 25 ++++++++++++++++++++++++-
 runner/settings.h     |  1 +
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index a135cd46b849..a23cd58c0781 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1564,6 +1564,13 @@ execute_test_process(int outfd, int errfd, int socketfd,
 		}
 	}
 
+	if (settings->hook_str) {
+		arg = strdup("--hook");
+		igt_vec_push(&arg_vec, &arg);
+		arg = strdup(settings->hook_str);
+		igt_vec_push(&arg_vec, &arg);
+	}
+
 	arg = NULL;
 	igt_vec_push(&arg_vec, &arg);
 
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 0aa7dd6626b7..7470cc24052f 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -202,6 +202,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	igt_assert_eq(one->piglit_style_dmesg, two->piglit_style_dmesg);
 	igt_assert_eq(one->dmesg_warn_level, two->dmesg_warn_level);
 	igt_assert_eq(one->prune_mode, two->prune_mode);
+	igt_assert_eqstr(one->hook_str, two->hook_str);
 }
 
 static void assert_job_list_equal(struct job_list *one, struct job_list *two)
@@ -302,6 +303,7 @@ igt_main
 		igt_assert_eq(settings->overall_timeout, 0);
 		igt_assert(!settings->use_watchdog);
 		igt_assert_eq(settings->prune_mode, 0);
+		igt_assert(!settings->hook_str);
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
 		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
 
@@ -464,6 +466,7 @@ igt_main
 				       "--collect-code-cov",
 				       "--coverage-per-test",
 				       "--collect-script", "/usr/bin/true",
+				       "--hook", "echo hello",
 				       "--prune-mode=keep-subtests",
 				       "test-root-dir",
 				       "path-to-results",
@@ -511,6 +514,7 @@ igt_main
 		igt_assert_eq(settings->per_test_timeout, 72);
 		igt_assert_eq(settings->overall_timeout, 360);
 		igt_assert(settings->use_watchdog);
+		igt_assert_eqstr(settings->hook_str, "echo hello");
 		igt_assert_eq(settings->prune_mode, PRUNE_KEEP_SUBTESTS);
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
 		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
@@ -961,6 +965,7 @@ igt_main
 					       "--use-watchdog",
 					       "--piglit-style-dmesg",
 					       "--prune-mode=keep-all",
+					       "--hook", "echo hello",
 					       testdatadir,
 					       dirname,
 			};
diff --git a/runner/settings.c b/runner/settings.c
index 42d8137f18e9..e554a5c70776 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1,3 +1,4 @@
+#include "igt_hook.h"
 #include "settings.h"
 #include "version.h"
 
@@ -28,6 +29,8 @@ enum {
 	OPT_CODE_COV_SCRIPT,
 	OPT_ENABLE_CODE_COVERAGE,
 	OPT_COV_RESULTS_PER_TEST,
+	OPT_HOOK,
+	OPT_HELP_HOOK,
 	OPT_VERSION,
 	OPT_PRUNE_MODE,
 	OPT_HELP = 'h',
@@ -297,6 +300,10 @@ static const char *usage_str =
 	"                        Requires --collect-script FILENAME\n"
 	"  --collect-script FILENAME\n"
 	"                        Use FILENAME as script to collect code coverage data.\n"
+	"  --hook HOOK_STR\n"
+	"                        Forward HOOK_STR to the --hook option of each test.\n"
+	"  --help-hook\n"
+	"                        Show detailed usage information for --hook.\n"
 	"\n"
 	"  [test_root]           Directory that contains the IGT tests. The environment\n"
 	"                        variable IGT_TEST_ROOT will be used if set, overriding\n"
@@ -654,6 +661,8 @@ bool parse_options(int argc, char **argv,
 		{"collect-code-cov", no_argument, NULL, OPT_ENABLE_CODE_COVERAGE},
 		{"coverage-per-test", no_argument, NULL, OPT_COV_RESULTS_PER_TEST},
 		{"collect-script", required_argument, NULL, OPT_CODE_COV_SCRIPT},
+		{"hook", required_argument, NULL, OPT_HOOK},
+		{"help-hook", no_argument, NULL, OPT_HELP_HOOK},
 		{"multiple-mode", no_argument, NULL, OPT_MULTIPLE},
 		{"inactivity-timeout", required_argument, NULL, OPT_TIMEOUT},
 		{"per-test-timeout", required_argument, NULL, OPT_PER_TEST_TIMEOUT},
@@ -741,7 +750,19 @@ bool parse_options(int argc, char **argv,
 		case OPT_CODE_COV_SCRIPT:
 			settings->code_coverage_script = bin_path(optarg);
 			break;
-
+		case OPT_HOOK:
+			/* FIXME: In order to allow line breaks, we should
+			 * change the format of settings serialization. Maybe
+			 * use JSON instead of our own format? */
+			if (strchr(optarg, '\n')) {
+				fprintf(stderr, "Newlines in --hook are currently unsupported.\n");
+				goto error;
+			}
+			settings->hook_str = optarg;
+			break;
+		case OPT_HELP_HOOK:
+			igt_hook_print_help(stdout, "--hook");
+			goto error;
 		case OPT_MULTIPLE:
 			settings->multiple_mode = true;
 			break;
@@ -1040,6 +1061,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_LINE(f, settings, enable_code_coverage, "%d");
 	SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
 	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
+	SERIALIZE_LINE(f, settings, hook_str, "%s");
 
 	if (settings->sync) {
 		fflush(f);
@@ -1103,6 +1125,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_LINE(settings, name, val, enable_code_coverage, numval);
 		PARSE_LINE(settings, name, val, cov_results_per_test, numval);
 		PARSE_LINE(settings, name, val, code_coverage_script, val ? strdup(val) : NULL);
+		PARSE_LINE(settings, name, val, hook_str, val ? strdup(val) : NULL);
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
 		       name, val);
diff --git a/runner/settings.h b/runner/settings.h
index 819c346027ed..d3afb56de039 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -72,6 +72,7 @@ struct settings {
 	char *code_coverage_script;
 	bool enable_code_coverage;
 	bool cov_results_per_test;
+	char *hook_str;
 };
 
 /**
-- 
2.45.2

