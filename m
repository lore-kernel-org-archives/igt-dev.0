Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8A010E8BB
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 15:40:01 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 14 Jul 2023 17:39:45 +0200
Message-Id: <20230714153946.36448-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230714153946.36448-1-kamil.konieczny@linux.intel.com>
References: <20230714153946.36448-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] runner/settings: add
 dump-gpu-on-timeout option
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add new option --dump-gpu-on-timeout for dumping error state
of GPU in case of inactivity or per-test timeout occurs. This
will help in faster problem diagnose from CI runs.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/settings.c | 12 +++++++++++-
 runner/settings.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/runner/settings.c b/runner/settings.c
index 23aa82963..880aefbd6 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -28,6 +28,7 @@ enum {
 	OPT_CODE_COV_SCRIPT,
 	OPT_ENABLE_CODE_COVERAGE,
 	OPT_COV_RESULTS_PER_TEST,
+	OPT_DUMP_GPU_ON_TIMEOUT,
 	OPT_VERSION,
 	OPT_PRUNE_MODE,
 	OPT_HELP = 'h',
@@ -297,6 +298,10 @@ static const char *usage_str =
 	"                        Requires --collect-script FILENAME\n"
 	"  --collect-script FILENAME\n"
 	"                        Use FILENAME as script to collect code coverage data.\n"
+	"  --dump-gpu-on-timeout FILENAME\n"
+	"                        Use /sys/class/drm/card*/error (default) or (if default is empty)\n"
+	"                        /sys/kernel/debug/dri/*/FILENAME for reading GPU error state\n"
+	"                        in case of inactivity/per-test timeout occurs.\n"
 	"\n"
 	"  [test_root]           Directory that contains the IGT tests. The environment\n"
 	"                        variable IGT_TEST_ROOT will be used if set, overriding\n"
@@ -654,6 +659,7 @@ bool parse_options(int argc, char **argv,
 		{"collect-code-cov", no_argument, NULL, OPT_ENABLE_CODE_COVERAGE},
 		{"coverage-per-test", no_argument, NULL, OPT_COV_RESULTS_PER_TEST},
 		{"collect-script", required_argument, NULL, OPT_CODE_COV_SCRIPT},
+		{"dump-gpu-on-timeout", required_argument, NULL, OPT_DUMP_GPU_ON_TIMEOUT},
 		{"multiple-mode", no_argument, NULL, OPT_MULTIPLE},
 		{"inactivity-timeout", required_argument, NULL, OPT_TIMEOUT},
 		{"per-test-timeout", required_argument, NULL, OPT_PER_TEST_TIMEOUT},
@@ -740,7 +746,9 @@ bool parse_options(int argc, char **argv,
 		case OPT_CODE_COV_SCRIPT:
 			settings->code_coverage_script = bin_path(optarg);
 			break;
-
+		case OPT_DUMP_GPU_ON_TIMEOUT:
+			settings->dump_gpu_on_timeout = bin_path(optarg);
+			break;
 		case OPT_MULTIPLE:
 			settings->multiple_mode = true;
 			break;
@@ -1039,6 +1047,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_LINE(f, settings, enable_code_coverage, "%d");
 	SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
 	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
+	SERIALIZE_LINE(f, settings, dump_gpu_on_timeout, "%s");
 
 	if (settings->sync) {
 		fflush(f);
@@ -1102,6 +1111,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_LINE(settings, name, val, enable_code_coverage, numval);
 		PARSE_LINE(settings, name, val, cov_results_per_test, numval);
 		PARSE_LINE(settings, name, val, code_coverage_script, val ? strdup(val) : NULL);
+		PARSE_LINE(settings, name, val, dump_gpu_on_timeout, val ? strdup(val) : NULL);
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
 		       name, val);
diff --git a/runner/settings.h b/runner/settings.h
index 819c34602..ab9e4c630 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -72,6 +72,7 @@ struct settings {
 	char *code_coverage_script;
 	bool enable_code_coverage;
 	bool cov_results_per_test;
+	char *dump_gpu_on_timeout;
 };
 
 /**
-- 
2.39.2
