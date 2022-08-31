Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF0F10E31A
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Aug 2022 11:07:49 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed, 31 Aug 2022 13:07:25 +0200
Message-Id: <20220831110729.730006-4-ryszard.knop@intel.com>
In-Reply-To: <20220831110729.730006-1-ryszard.knop@intel.com>
References: <20220831110729.730006-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/7] runner: Add the --environment flag
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

Allows specifying additional environment variables to be set for the
launched test processes. This commit introduces the argument parsing.

v2:
- Moved warning fixes from later commits here
- igt_list_empty_or_null -> igt_list_empty (Mauro)
- Optimized the parser, more error handling (Mauro)

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 runner/settings.c | 123 +++++++++++++++++++++++++++++++++++++++++++++-
 runner/settings.h |   9 ++++
 2 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/runner/settings.c b/runner/settings.c
index ba288043..d0f642a4 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -35,6 +35,7 @@ enum {
 	OPT_DRY_RUN = 'd',
 	OPT_INCLUDE = 't',
 	OPT_EXCLUDE = 'x',
+	OPT_ENVIRONMENT = 'e',
 	OPT_SYNC = 's',
 	OPT_LOG_LEVEL = 'l',
 	OPT_OVERWRITE = 'o',
@@ -390,6 +391,119 @@ static void free_regexes(struct regex_list *regexes)
 	free(regexes->regexes);
 }
 
+/**
+ * string_trim_and_duplicate() - returns a duplicated, trimmed string
+ * @string: string to trim and duplicate
+ * 
+ * If the provided string is NULL, a NULL is returned. In any other case, a
+ * newly-allocated string of length up to strlen(string) is returned. The
+ * returned string has its whitespace removed (as detected by isspace), while
+ * the original string is left unmodified.
+ */
+static char *string_trim_and_duplicate(const char *string) {
+	size_t length;
+
+	if (string == NULL)
+		return NULL;
+
+	length = strlen(string);
+
+	while (length > 0 && isspace(string[0])) {
+		string++;
+		length--;
+	}
+
+	while (length > 0 && isspace(string[length - 1])) {
+		length--;
+	}
+
+	return strndup(string, length);
+}
+
+/**
+ * add_env_var() - Adds a new environment variable to the runner settings.
+ * @env_vars: Pointer to the env var list head from the settings.
+ * @key_value: Environment variable key-value pair string to add.
+ *
+ * key_value must be a string like "KEY=VALUE" or just "KEY" if the value is to
+ * be loaded from the runner's environment variables. In the latter case, if
+ * the requested variable is not set, the operation will fail.
+ * 
+ * An empty variable may be set by providing an key_value of "KEY=" or setting
+ * an empty variable for the runner process, then providing just the "KEY".
+ */
+static bool add_env_var(struct igt_list_head *env_vars, const char *key_value) {
+	char *env_kv, *value_str;
+	struct environment_variable *var = NULL;
+
+	if (env_vars == NULL || key_value == NULL || strlen(key_value) == 0)
+		goto error;
+
+	env_kv = strdup(key_value);
+	value_str = strpbrk(env_kv, "\n=");
+
+	if (value_str == env_kv) {
+		fprintf(stderr, "Missing key for --environment \"%s\"\n", key_value);
+		goto error;
+	}
+
+	if (value_str != NULL && value_str[0] != '=') {
+		fprintf(stderr, "Invalid characters in key for --environment \"%s\"\n", key_value);
+		goto error;
+	}
+
+	if (value_str != NULL) {
+		/* value provided - copy string contents after '=' */
+		value_str[0] = '\0';
+		value_str++;
+	} else {
+		/* env_kv is the key - use the runner's environment, if set */
+		value_str = getenv(env_kv);
+		if (value_str == NULL) {
+			fprintf(stderr, "No value provided for --environment \"%s\" and "
+			                "variable is not set for igt_runner\n", env_kv);
+			goto error;
+		}
+	}
+
+	var = malloc(sizeof(struct environment_variable));
+
+	var->key = string_trim_and_duplicate(env_kv);
+	if (strlen(var->key) == 0) {
+		fprintf(stderr, "Environment variable key is empty for \"%s\"\n", key_value);
+		goto error;
+	}
+
+	var->value = strdup(value_str); /* Can be empty, that's okay */
+
+	igt_list_add_tail(&var->link, env_vars);
+	free(env_kv);
+	return true;
+
+error:
+	if (var != NULL)
+		free(var);
+
+	if (env_kv != NULL)
+		free(env_kv);
+
+	return false;
+}
+
+static void free_env_vars(struct igt_list_head *env_vars) {
+	struct environment_variable *iter;
+
+	while (!igt_list_empty(env_vars)) {
+		iter = igt_list_first_entry(env_vars, iter, link);
+
+		free(iter->key);
+		free(iter->value);
+
+		igt_list_del(&iter->link);
+		free(iter);
+	}
+}
+
 static bool readable_file(const char *filename)
 {
 	return !access(filename, R_OK);
@@ -486,6 +600,7 @@ static void print_version(void)
 void init_settings(struct settings *settings)
 {
 	memset(settings, 0, sizeof(*settings));
+	IGT_INIT_LIST_HEAD(&settings->env_vars);
 }
 
 void clear_settings(struct settings *settings)
@@ -497,6 +612,7 @@ void clear_settings(struct settings *settings)
 
 	free_regexes(&settings->include_regexes);
 	free_regexes(&settings->exclude_regexes);
+	free_env_vars(&settings->env_vars);
 
 	init_settings(settings);
 }
@@ -515,6 +631,7 @@ bool parse_options(int argc, char **argv,
 		{"allow-non-root", no_argument, NULL, OPT_ALLOW_NON_ROOT},
 		{"include-tests", required_argument, NULL, OPT_INCLUDE},
 		{"exclude-tests", required_argument, NULL, OPT_EXCLUDE},
+		{"environment", required_argument, NULL, OPT_ENVIRONMENT},
 		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
 		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
 		{"sync", no_argument, NULL, OPT_SYNC},
@@ -544,7 +661,7 @@ bool parse_options(int argc, char **argv,
 
 	settings->dmesg_warn_level = -1;
 
-	while ((c = getopt_long(argc, argv, "hn:dt:x:sl:omb:L",
+	while ((c = getopt_long(argc, argv, "hn:dt:x:e:sl:omb:L",
 				long_options, NULL)) != -1) {
 		switch (c) {
 		case OPT_VERSION:
@@ -570,6 +687,10 @@ bool parse_options(int argc, char **argv,
 			if (!add_regex(&settings->exclude_regexes, strdup(optarg)))
 				goto error;
 			break;
+		case OPT_ENVIRONMENT:
+			if (!add_env_var(&settings->env_vars, optarg))
+				goto error;
+			break;
 		case OPT_ABORT_ON_ERROR:
 			if (!parse_abort_conditions(settings, optarg))
 				goto error;
diff --git a/runner/settings.h b/runner/settings.h
index 6d444d01..819c3460 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -7,6 +7,8 @@
 #include <stdio.h>
 #include <glib.h>
 
+#include "igt_list.h"
+
 enum {
 	LOG_LEVEL_NORMAL = 0,
 	LOG_LEVEL_QUIET = -1,
@@ -37,6 +39,12 @@ struct regex_list {
 	size_t size;
 };
 
+struct environment_variable {
+	struct igt_list_head link;
+	char * key;
+	char * value;
+};
+
 struct settings {
 	int abort_mask;
 	size_t disk_usage_limit;
@@ -46,6 +54,7 @@ struct settings {
 	bool allow_non_root;
 	struct regex_list include_regexes;
 	struct regex_list exclude_regexes;
+	struct igt_list_head env_vars;
 	bool sync;
 	int log_level;
 	bool overwrite;
-- 
2.37.2
