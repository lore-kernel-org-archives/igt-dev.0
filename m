Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0F310EED2
 for <igt-dev@lists.freedesktop.org>; Fri, 27 May 2022 08:17:17 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 27 May 2022 13:43:51 +0530
Message-Id: <20220527081353.3800969-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20220527081353.3800969-1-bhanuprakash.modem@intel.com>
References: <20220527081353.3800969-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t 2/4] runner: Unit tests for the --resolution
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

Unit tests for the --resolution option

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 runner/runner_tests.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 8fe86978..080780c3 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -201,6 +201,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	igt_assert_eq(one->piglit_style_dmesg, two->piglit_style_dmesg);
 	igt_assert_eq(one->dmesg_warn_level, two->dmesg_warn_level);
 	igt_assert_eq(one->prune_mode, two->prune_mode);
+	igt_assert_eq(one->resolution, two->resolution);
 }
 
 static void assert_job_list_equal(struct job_list *one, struct job_list *two)
@@ -290,6 +291,8 @@ igt_main
 		igt_assert_eq(settings->overall_timeout, 0);
 		igt_assert(!settings->use_watchdog);
 		igt_assert_eq(settings->prune_mode, 0);
+		igt_assert_eq(settings->resolution, 0);
+		igt_assert(!getenv("IGT_KMS_RESOLUTION"));
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
 		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
 
@@ -449,6 +452,7 @@ igt_main
 				       "--coverage-per-test",
 				       "--collect-script", "/usr/bin/true",
 				       "--prune-mode=keep-subtests",
+				       "--resolution=default",
 				       "test-root-dir",
 				       "path-to-results",
 		};
@@ -481,6 +485,9 @@ igt_main
 		igt_assert_eq(settings->overall_timeout, 360);
 		igt_assert(settings->use_watchdog);
 		igt_assert_eq(settings->prune_mode, PRUNE_KEEP_SUBTESTS);
+		igt_assert_eq(settings->resolution, RESOLUTION_DEFAULT);
+		igt_assert_eq(atoi(getenv("IGT_KMS_RESOLUTION")), RESOLUTION_DEFAULT);
+		unsetenv("IGT_KMS_RESOLUTION");
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
 		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
 
@@ -664,6 +671,34 @@ igt_main
 		igt_assert_eq(settings->prune_mode, PRUNE_KEEP_REQUESTED);
 	}
 
+	igt_subtest("resolution") {
+		const char *argv[] = { "runner",
+				       "--resolution=default",
+				       "test-root-dir",
+				       "results-path",
+		};
+
+		igt_assert(parse_options(ARRAY_SIZE(argv), (char **)argv, settings));
+		igt_assert_eq(settings->resolution, RESOLUTION_DEFAULT);
+		igt_assert_eq(atoi(getenv("IGT_KMS_RESOLUTION")), RESOLUTION_DEFAULT);
+		unsetenv("IGT_KMS_RESOLUTION");
+
+		argv[1] = "--resolution=highest";
+		igt_assert(parse_options(ARRAY_SIZE(argv), (char **)argv, settings));
+		igt_assert_eq(settings->resolution, RESOLUTION_HIGHEST);
+		igt_assert_eq(atoi(getenv("IGT_KMS_RESOLUTION")), RESOLUTION_HIGHEST);
+		unsetenv("IGT_KMS_RESOLUTION");
+
+		argv[1] = "--resolution=lowest";
+		igt_assert(parse_options(ARRAY_SIZE(argv), (char **)argv, settings));
+		igt_assert_eq(settings->resolution, RESOLUTION_LOWEST);
+		igt_assert_eq(atoi(getenv("IGT_KMS_RESOLUTION")), RESOLUTION_LOWEST);
+		unsetenv("IGT_KMS_RESOLUTION");
+
+		argv[1] = "--resolution=unknown";
+		igt_assert(!parse_options(ARRAY_SIZE(argv), (char **)argv, settings));
+	}
+
 	igt_subtest("parse-clears-old-data") {
 		const char *argv[] = { "runner",
 				       "-n", "foo",
@@ -930,6 +965,7 @@ igt_main
 					       "--use-watchdog",
 					       "--piglit-style-dmesg",
 					       "--prune-mode=keep-all",
+					       "--resolution=default",
 					       testdatadir,
 					       dirname,
 			};
-- 
2.35.1
