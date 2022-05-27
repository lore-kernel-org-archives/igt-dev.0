Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC2D10EECD
 for <igt-dev@lists.freedesktop.org>; Fri, 27 May 2022 08:17:16 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 27 May 2022 13:43:50 +0530
Message-Id: <20220527081353.3800969-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220527081353.3800969-1-bhanuprakash.modem@intel.com>
References: <20220527081353.3800969-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t 1/4] runner: Introduce --resolution to
 igt_runner
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

Allow finer control of taking default DRM display mode for subtests
instead of taking the preferred mode exposed by the Kernel.

Example:
Eventhough we have an 8K panel, Kernel may expose 4K or lesser mode
as a preferred mode. So all subtests will take this mode as a default
may cause losing the coverage.

This patch will set the environment variable based on the user request,
and IGT will parse this environment variable and take the decision to
choose the mode from the available list.

The default is still to take the preferred mode exposed by the Kernel.
Other options are:
* highest: Choose the mode with highest possible resolution.
* lowest:  Choose the mode with lowest possible resolution.

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 runner/executor.c |  3 +++
 runner/settings.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 runner/settings.h |  7 +++++++
 3 files changed, 57 insertions(+)

diff --git a/runner/executor.c b/runner/executor.c
index 6e6ca9cc..fc805c30 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -2056,6 +2056,9 @@ bool execute(struct execute_state *state,
 	}
 
  end:
+	if (getenv("IGT_KMS_RESOLUTION"))
+		unsetenv("IGT_KMS_RESOLUTION");
+
 	if (settings->enable_code_coverage && !settings->cov_results_per_test) {
 		char *reason = NULL;
 
diff --git a/runner/settings.c b/runner/settings.c
index bb63a9f4..a20bcd01 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -30,6 +30,7 @@ enum {
 	OPT_COV_RESULTS_PER_TEST,
 	OPT_VERSION,
 	OPT_PRUNE_MODE,
+	OPT_RESOLUTION,
 	OPT_HELP = 'h',
 	OPT_NAME = 'n',
 	OPT_DRY_RUN = 'd',
@@ -78,6 +79,16 @@ static struct {
 	{ 0, 0 },
 };
 
+static struct {
+	int value;
+	const char *name;
+} resolution_modes[] = {
+	{ RESOLUTION_DEFAULT, "default" },
+	{ RESOLUTION_HIGHEST, "highest" },
+	{ RESOLUTION_LOWEST, "lowest" },
+	{ 0, 0 },
+};
+
 static bool set_log_level(struct settings* settings, const char *level)
 {
 	typeof(*log_levels) *it;
@@ -130,6 +141,26 @@ static bool set_prune_mode(struct settings* settings, const char *mode)
 	return false;
 }
 
+static bool set_resolution_mode(struct settings *settings, const char *mode)
+{
+	typeof(*resolution_modes) *it;
+	char res[2];
+
+	for (it = resolution_modes; it->name; it++) {
+		if (!strcmp(mode, it->name)) {
+			settings->resolution = it->value;
+
+			sprintf(res, "%d", it->value);
+			setenv("IGT_KMS_RESOLUTION", res, 1);
+
+			return true;
+		}
+	}
+	setenv("IGT_KMS_RESOLUTION", "0", 1);
+
+	return false;
+}
+
 static bool parse_abort_conditions(struct settings *settings, const char *optarg)
 {
 	char *dup, *origdup, *p;
@@ -279,6 +310,12 @@ static const char *usage_str =
 	"                                                  not in the requested test set.\n"
 	"                                                  Useful when you have a hand-written\n"
 	"                                                  testlist.\n"
+	"  --resolution <mode>   Control of taking default DRM display mode for subtests\n"
+	"                        instead of taking the preferred mode exposed by the Kernel.\n"
+	"                        Possible options:\n"
+	"                         default  - Use preferred mode. (default)\n"
+	"                         highest  - Use the mode with highest possible resolution.\n"
+	"                         lowest   - Use the mode with lowest possible resolution.\n"
 	"  -b, --blacklist FILENAME\n"
 	"                        Exclude all test matching to regexes from FILENAME\n"
 	"                        (can be used more than once)\n"
@@ -532,6 +569,7 @@ bool parse_options(int argc, char **argv,
 		{"dmesg-warn-level", required_argument, NULL, OPT_DMESG_WARN_LEVEL},
 		{"prune-mode", required_argument, NULL, OPT_PRUNE_MODE},
 		{"blacklist", required_argument, NULL, OPT_BLACKLIST},
+		{"resolution", optional_argument, NULL, OPT_RESOLUTION},
 		{"list-all", no_argument, NULL, OPT_LIST_ALL},
 		{ 0, 0, 0, 0},
 	};
@@ -640,6 +678,12 @@ bool parse_options(int argc, char **argv,
 					     absolute_path(optarg)))
 				goto error;
 			break;
+		case OPT_RESOLUTION:
+			if (!set_resolution_mode(settings, optarg)) {
+				usage("Cannot parse resolution mode", stderr);
+				goto error;
+			}
+			break;
 		case OPT_LIST_ALL:
 			settings->list_all = true;
 			break;
@@ -854,6 +898,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_LINE(f, settings, piglit_style_dmesg, "%d");
 	SERIALIZE_LINE(f, settings, dmesg_warn_level, "%d");
 	SERIALIZE_LINE(f, settings, prune_mode, "%d");
+	SERIALIZE_LINE(f, settings, resolution, "%d");
 	SERIALIZE_LINE(f, settings, test_root, "%s");
 	SERIALIZE_LINE(f, settings, results_path, "%s");
 	SERIALIZE_LINE(f, settings, enable_code_coverage, "%d");
@@ -886,6 +931,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 	char *name = NULL, *val = NULL;
 
 	settings->dmesg_warn_level = -1;
+	settings->resolution = 0;
 
 	while (fscanf(f, "%ms : %m[^\n]", &name, &val) == 2) {
 		int numval = atoi(val);
@@ -906,6 +952,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_LINE(settings, name, val, piglit_style_dmesg, numval);
 		PARSE_LINE(settings, name, val, dmesg_warn_level, numval);
 		PARSE_LINE(settings, name, val, prune_mode, numval);
+		PARSE_LINE(settings, name, val, resolution, val ? numval : 0);
 		PARSE_LINE(settings, name, val, test_root, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, results_path, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, enable_code_coverage, numval);
diff --git a/runner/settings.h b/runner/settings.h
index 6ae64695..4d2c9951 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -31,6 +31,12 @@ enum {
 	PRUNE_KEEP_REQUESTED,
 };
 
+enum {
+	RESOLUTION_DEFAULT = 0,
+	RESOLUTION_HIGHEST,
+	RESOLUTION_LOWEST,
+};
+
 struct regex_list {
 	char **regex_strings;
 	GRegex **regexes;
@@ -59,6 +65,7 @@ struct settings {
 	bool piglit_style_dmesg;
 	int dmesg_warn_level;
 	int prune_mode;
+	int resolution;
 	bool list_all;
 	char *code_coverage_script;
 	bool enable_code_coverage;
-- 
2.35.1
