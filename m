Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A60710E6EE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 15:20:49 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Mar 2022 17:20:14 +0200
Message-Id: <20220323152016.19033-2-petri.latvala@intel.com>
In-Reply-To: <20220323152016.19033-1-petri.latvala@intel.com>
References: <20220323152016.19033-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] runner: Unit tests for the --prune-mode
 option
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 runner/runner_tests.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 96ffbf1f..8fe86978 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -200,6 +200,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	igt_assert_eqstr(one->results_path, two->results_path);
 	igt_assert_eq(one->piglit_style_dmesg, two->piglit_style_dmesg);
 	igt_assert_eq(one->dmesg_warn_level, two->dmesg_warn_level);
+	igt_assert_eq(one->prune_mode, two->prune_mode);
 }
 
 static void assert_job_list_equal(struct job_list *one, struct job_list *two)
@@ -288,6 +289,7 @@ igt_main
 		igt_assert_eq(settings->per_test_timeout, 0);
 		igt_assert_eq(settings->overall_timeout, 0);
 		igt_assert(!settings->use_watchdog);
+		igt_assert_eq(settings->prune_mode, 0);
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
 		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
 
@@ -446,6 +448,7 @@ igt_main
 				       "--collect-code-cov",
 				       "--coverage-per-test",
 				       "--collect-script", "/usr/bin/true",
+				       "--prune-mode=keep-subtests",
 				       "test-root-dir",
 				       "path-to-results",
 		};
@@ -477,6 +480,7 @@ igt_main
 		igt_assert_eq(settings->per_test_timeout, 72);
 		igt_assert_eq(settings->overall_timeout, 360);
 		igt_assert(settings->use_watchdog);
+		igt_assert_eq(settings->prune_mode, PRUNE_KEEP_SUBTESTS);
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
 		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
 
@@ -633,6 +637,33 @@ igt_main
 		igt_assert_eq_u64(settings->disk_usage_limit, 1024UL * 1024UL * 1024UL);
 	}
 
+	igt_subtest("prune-modes") {
+		const char *argv[] = { "runner",
+			               "--prune-mode=keep-dynamic-subtests",
+				       "test-root-dir",
+				       "results-path",
+		};
+
+		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+		igt_assert_eq(settings->prune_mode, PRUNE_KEEP_DYNAMIC);
+
+		argv[1] = "--prune-mode=keep-dynamic";
+		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+		igt_assert_eq(settings->prune_mode, PRUNE_KEEP_DYNAMIC);
+
+		argv[1] = "--prune-mode=keep-subtests";
+		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+		igt_assert_eq(settings->prune_mode, PRUNE_KEEP_SUBTESTS);
+
+		argv[1] = "--prune-mode=keep-all";
+		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+		igt_assert_eq(settings->prune_mode, PRUNE_KEEP_ALL);
+
+		argv[1] = "--prune-mode=keep-requested";
+		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+		igt_assert_eq(settings->prune_mode, PRUNE_KEEP_REQUESTED);
+	}
+
 	igt_subtest("parse-clears-old-data") {
 		const char *argv[] = { "runner",
 				       "-n", "foo",
@@ -898,6 +929,7 @@ igt_main
 					       "--overall-timeout", "360",
 					       "--use-watchdog",
 					       "--piglit-style-dmesg",
+					       "--prune-mode=keep-all",
 					       testdatadir,
 					       dirname,
 			};
-- 
2.30.2
