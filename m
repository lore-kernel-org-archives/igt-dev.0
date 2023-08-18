Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DD810E559
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 19:22:15 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Aug 2023 21:22:02 +0200
Message-Id: <20230818192203.75155-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230818192203.75155-1-kamil.konieczny@linux.intel.com>
References: <20230818192203.75155-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] runner/settings: add compressor option
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

Add new option --compressor for selecting compressor like bzip2,
lzma, xz or other. This will allow to choose tool (with options)
for compressing too large kernel dmesg dumps after limiting its
inclusion into results.json file.

While at it check also if compressor is available on system
before using it.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/settings.c | 34 +++++++++++++++++++++++++++++++++-
 runner/settings.h |  1 +
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/runner/settings.c b/runner/settings.c
index 23aa82963..e3828ace6 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -28,6 +28,7 @@ enum {
 	OPT_CODE_COV_SCRIPT,
 	OPT_ENABLE_CODE_COVERAGE,
 	OPT_COV_RESULTS_PER_TEST,
+	OPT_COMPRESSOR,
 	OPT_VERSION,
 	OPT_PRUNE_MODE,
 	OPT_HELP = 'h',
@@ -297,6 +298,10 @@ static const char *usage_str =
 	"                        Requires --collect-script FILENAME\n"
 	"  --collect-script FILENAME\n"
 	"                        Use FILENAME as script to collect code coverage data.\n"
+	"  --compressor NAME\n"
+	"                        Use compressor (bzip2, gzip, lzma, xz or other) for\n"
+	"                        compressing dmesg dumps which exceed limit size\n"
+	"                        compressing dmesg dumps which exceed limit size\n"
 	"\n"
 	"  [test_root]           Directory that contains the IGT tests. The environment\n"
 	"                        variable IGT_TEST_ROOT will be used if set, overriding\n"
@@ -654,6 +659,7 @@ bool parse_options(int argc, char **argv,
 		{"collect-code-cov", no_argument, NULL, OPT_ENABLE_CODE_COVERAGE},
 		{"coverage-per-test", no_argument, NULL, OPT_COV_RESULTS_PER_TEST},
 		{"collect-script", required_argument, NULL, OPT_CODE_COV_SCRIPT},
+		{"compressor", required_argument, NULL, OPT_COMPRESSOR},
 		{"multiple-mode", no_argument, NULL, OPT_MULTIPLE},
 		{"inactivity-timeout", required_argument, NULL, OPT_TIMEOUT},
 		{"per-test-timeout", required_argument, NULL, OPT_PER_TEST_TIMEOUT},
@@ -740,7 +746,9 @@ bool parse_options(int argc, char **argv,
 		case OPT_CODE_COV_SCRIPT:
 			settings->code_coverage_script = bin_path(optarg);
 			break;
-
+		case OPT_COMPRESSOR:
+			settings->compressor = bin_path(optarg);
+			break;
 		case OPT_MULTIPLE:
 			settings->multiple_mode = true;
 			break;
@@ -902,6 +910,28 @@ bool validate_settings(struct settings *settings)
 		}
 	}
 
+	if (settings->compressor) {
+		char buf[2*PATH_MAX + 512];
+		char apath[PATH_MAX + 256];
+		int r;
+
+		snprintf(apath, sizeof(apath), "%s/%s", settings->results_path, "compressor-path.txt");
+		snprintf(buf, sizeof(buf), "which %s > %s", settings->compressor, apath);
+		system(buf);
+		fd = open(apath, O_RDONLY);
+		if (fd < 0) {
+			fprintf(stderr, "Check for compressor %s on system failed\n", settings->compressor);
+			return false;
+		}
+
+		r = read(fd, buf, 256);
+		close(fd);
+		if (r < 2) {
+			fprintf(stderr, "No compressor %s found on system\n", settings->compressor);
+			return false;
+		}
+	}
+
 	return true;
 }
 
@@ -1039,6 +1069,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_LINE(f, settings, enable_code_coverage, "%d");
 	SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
 	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
+	SERIALIZE_LINE(f, settings, compressor, "%s");
 
 	if (settings->sync) {
 		fflush(f);
@@ -1102,6 +1133,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_LINE(settings, name, val, enable_code_coverage, numval);
 		PARSE_LINE(settings, name, val, cov_results_per_test, numval);
 		PARSE_LINE(settings, name, val, code_coverage_script, val ? strdup(val) : NULL);
+		PARSE_LINE(settings, name, val, compressor, val ? strdup(val) : NULL);
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
 		       name, val);
diff --git a/runner/settings.h b/runner/settings.h
index 819c34602..abc348dc0 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -72,6 +72,7 @@ struct settings {
 	char *code_coverage_script;
 	bool enable_code_coverage;
 	bool cov_results_per_test;
+	char *compressor;
 };
 
 /**
-- 
2.39.2
