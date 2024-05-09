Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D1DC25B10
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 15:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD41B10EB2A;
	Thu,  9 May 2024 15:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0alMxw3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57C110EA43
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715268325; x=1746804325;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LAkGiflP4J+Dulv8+IyJM6qS/AfxbIpjgg4+SB5MjUk=;
 b=C0alMxw3VKELny1ypMBCCUuxuDj4mD/Q+ert/KdUEdR8zJFRoW9kW19/
 2Bs0Qo4bPxhXJEbxVrJKRS+vIGLJzzpX4FxDJqOp+2UZsF0RPxLi2ZBf4
 zjt32MBuCPiOU4nSnEVGl9kywMroIcmA9BP+TGsnqXfgJNo8QjbI8xIpK
 Z6mE4AE3RbEm+nw8cLjeBNsC77GvDmuJRpXq2eRCOtumxIcLPoceY2BgO
 4XpGcIeDBSY8pv9IS08esLOxE0oU5K6KfnpArvytJkFGfSvKDsTTD4TAM
 Op5jNkh17Kq0aQhLqHvPGDKgN70XURW3jWrutfxey2jHz018vTwyVe52g A==;
X-CSE-ConnectionGUID: lL5F8ilKTASTNLl3dcHQsQ==
X-CSE-MsgGUID: UvWuNtjkTbKR576rpdN9HQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11038988"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="11038988"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 08:25:24 -0700
X-CSE-ConnectionGUID: wuppObA9SSueZA+fCk0Fxw==
X-CSE-MsgGUID: RvTDOJfJTZi80o+WxDg5Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="66719272"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.124.223.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 08:25:24 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] runner: Add option --hook
Date: Thu,  9 May 2024 12:24:31 -0300
Message-ID: <20240509152442.189166-4-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509152442.189166-1-gustavo.sousa@intel.com>
References: <20240509152442.189166-1-gustavo.sousa@intel.com>
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
 runner/executor.c     |  8 ++++++++
 runner/runner_tests.c |  5 +++++
 runner/settings.c     | 25 ++++++++++++++++++++++++-
 runner/settings.h     |  1 +
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index e9b037ebcaf9..92dee6e32f6f 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1509,12 +1509,15 @@ execute_test_process(int outfd, int errfd, int socketfd,
 	char *arg0;
 	char *arg_run_subtest[2] = {};
 	char *arg_dyn_subtest[2] = {};
+	char *arg_hook[2] = {};
 	char **argv_refs[] = {
 		&arg0,
 		&arg_run_subtest[0],
 		&arg_run_subtest[1],
 		&arg_dyn_subtest[0],
 		&arg_dyn_subtest[1],
+		&arg_hook[0],
+		&arg_hook[1],
 		NULL,
 	};
 	char *argv[sizeof(argv_refs) / sizeof(argv_refs[0])] = {};
@@ -1565,6 +1568,11 @@ execute_test_process(int outfd, int errfd, int socketfd,
 		}
 	}
 
+	if (settings->hook_str) {
+		arg_hook[0] = strdup("--hook");
+		arg_hook[1] = strdup(settings->hook_str);
+	}
+
 	/* Build argv with only stuff that is set. */
 	for (size_t i = 0, j = 0; argv_refs[i]; i++)
 		if (*argv_refs[i])
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
2.45.0

