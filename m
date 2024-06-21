Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBABC2BD05
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 19:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30DB10E1A7;
	Fri, 21 Jun 2024 19:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4UD2ik/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5747910E0D6
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718999591; x=1750535591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZsKDsATUTg+8mKdIq8db7/U/1SMZhf3ONA6SpolGn4=;
 b=P4UD2ik/OlWd6MaWQnNiJ5UQqJ35lC4KtYw/39zVo3JgFf7bNB5GdW9A
 Ew1YQPT2Pzj7TRxlRGsd76+ZIa/bxR/Kw3XxVMI88PKWG6Gi1OJvItSsV
 mSao0lZEzKpBm1oFryTg1rrc6MeKWUBhQ2JxYQq24/ZS5/hMasz/629EC
 O1xg8Q24YwXHFXUh9DOrnjqThh9+zDNWhITQ5PcT7jaDZdnJ7K/GY78My
 +x3tm609fVMkEiDrA47J36U2LbuE7+GmUKZmbnUMZwczDSwQ+R7U2NG67
 79pbNvCsB4V14AtzJqdhTmvOBJlZK7NGCDOUXV0sCkaAc4JSWCq64ziED g==;
X-CSE-ConnectionGUID: j0g2l5NUQmme+BR5WoAgJQ==
X-CSE-MsgGUID: 5U/8D88zQOKmdsdScSJ4HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15925568"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="15925568"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:53:11 -0700
X-CSE-ConnectionGUID: ZZ9QOFAJT7uRmjE0nBn1xA==
X-CSE-MsgGUID: 8t20DhNTQiaTfWDnk2aAGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="73432171"
Received: from dgramcko-desk.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.221.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:53:10 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v2 7/7] runner: Allow multiple --hook options
Date: Fri, 21 Jun 2024 16:51:52 -0300
Message-ID: <20240621195150.390462-10-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621195150.390462-1-gustavo.sousa@intel.com>
References: <20240621195150.390462-1-gustavo.sousa@intel.com>
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

Test binaries now allow passing multiple --hook options, it just makes
sense that igt_runner follows suit, so let's do it.

Note that this requires having another file in the results directory for
storing the hook strings, as metadata.txt does not support multivalued
items.

Since we are using a different file to store hook strings, take this
opportunity to also allow multiline hook strings (which was not possible
with metadata.txt).

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 runner/executor.c     |   4 +-
 runner/runner_tests.c |  19 ++++-
 runner/settings.c     | 164 +++++++++++++++++++++++++++++++++++++++---
 runner/settings.h     |   3 +-
 4 files changed, 173 insertions(+), 17 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index a23cd58c0781..ac73e1ddec07 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1564,10 +1564,10 @@ execute_test_process(int outfd, int errfd, int socketfd,
 		}
 	}
 
-	if (settings->hook_str) {
+	for (size_t i = 0; i < igt_vec_length(&settings->hook_strs); i++) {
 		arg = strdup("--hook");
 		igt_vec_push(&arg_vec, &arg);
-		arg = strdup(settings->hook_str);
+		arg = strdup(*((char **)igt_vec_elem(&settings->hook_strs, i)));
 		igt_vec_push(&arg_vec, &arg);
 	}
 
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 7470cc24052f..b806d45adbd6 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -202,7 +202,14 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	igt_assert_eq(one->piglit_style_dmesg, two->piglit_style_dmesg);
 	igt_assert_eq(one->dmesg_warn_level, two->dmesg_warn_level);
 	igt_assert_eq(one->prune_mode, two->prune_mode);
-	igt_assert_eqstr(one->hook_str, two->hook_str);
+
+	igt_assert_eq(igt_vec_length(&one->hook_strs), igt_vec_length(&two->hook_strs));
+	for (size_t i = 0; i < igt_vec_length(&one->hook_strs); i++) {
+		char **hook_str_one = igt_vec_elem(&one->hook_strs, i);
+		char **hook_str_two = igt_vec_elem(&two->hook_strs, i);
+
+		igt_assert_eqstr(*hook_str_one, *hook_str_two);
+	}
 }
 
 static void assert_job_list_equal(struct job_list *one, struct job_list *two)
@@ -294,6 +301,7 @@ igt_main
 		igt_assert_eq(settings->include_regexes.size, 0);
 		igt_assert_eq(settings->exclude_regexes.size, 0);
 		igt_assert(igt_list_empty(&settings->env_vars));
+		igt_assert(!igt_vec_length(&settings->hook_strs));
 		igt_assert(!settings->sync);
 		igt_assert_eq(settings->log_level, LOG_LEVEL_NORMAL);
 		igt_assert(!settings->overwrite);
@@ -303,7 +311,6 @@ igt_main
 		igt_assert_eq(settings->overall_timeout, 0);
 		igt_assert(!settings->use_watchdog);
 		igt_assert_eq(settings->prune_mode, 0);
-		igt_assert(!settings->hook_str);
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
 		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
 
@@ -467,6 +474,7 @@ igt_main
 				       "--coverage-per-test",
 				       "--collect-script", "/usr/bin/true",
 				       "--hook", "echo hello",
+				       "--hook", "echo world",
 				       "--prune-mode=keep-subtests",
 				       "test-root-dir",
 				       "path-to-results",
@@ -506,6 +514,10 @@ igt_main
 		igt_assert_eqstr(env_var->key, "ENVS_WITH_JUST_KEYS");
 		igt_assert_eqstr(env_var->value, "SHOULD_WORK");
 
+		igt_assert_eq(igt_vec_length(&settings->hook_strs), 2);
+		igt_assert_eqstr(*((char **)igt_vec_elem(&settings->hook_strs, 0)), "echo hello");
+		igt_assert_eqstr(*((char **)igt_vec_elem(&settings->hook_strs, 1)), "echo world");
+
 		igt_assert(settings->sync);
 		igt_assert_eq(settings->log_level, LOG_LEVEL_VERBOSE);
 		igt_assert(settings->overwrite);
@@ -514,7 +526,6 @@ igt_main
 		igt_assert_eq(settings->per_test_timeout, 72);
 		igt_assert_eq(settings->overall_timeout, 360);
 		igt_assert(settings->use_watchdog);
-		igt_assert_eqstr(settings->hook_str, "echo hello");
 		igt_assert_eq(settings->prune_mode, PRUNE_KEEP_SUBTESTS);
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
 		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
@@ -966,6 +977,8 @@ igt_main
 					       "--piglit-style-dmesg",
 					       "--prune-mode=keep-all",
 					       "--hook", "echo hello",
+					       "--hook", "echo hello\necho newline",
+					       "--hook", "echo hello\necho newline\\still the second line",
 					       testdatadir,
 					       dirname,
 			};
diff --git a/runner/settings.c b/runner/settings.c
index 6fd742cc826d..94b3b9fe641f 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1,4 +1,5 @@
 #include "igt_hook.h"
+#include "igt_vec.h"
 #include "settings.h"
 #include "version.h"
 
@@ -84,6 +85,7 @@ static struct {
 
 static const char settings_filename[] = "metadata.txt";
 static const char env_filename[] = "environment.txt";
+static const char hooks_filename[] = "hooks.txt";
 
 static bool set_log_level(struct settings* settings, const char *level)
 {
@@ -518,6 +520,13 @@ static void free_env_vars(struct igt_list_head *env_vars) {
 	}
 }
 
+static void free_hook_strs(struct igt_vec *hook_strs)
+{
+	for (size_t i = 0; i < igt_vec_length(hook_strs); i++)
+		free(*((char **)igt_vec_elem(hook_strs, i)));
+	igt_vec_fini(hook_strs);
+}
+
 static bool file_exists_at(int dirfd, const char *filename)
 {
 	return faccessat(dirfd, filename, F_OK, 0) == 0;
@@ -620,6 +629,7 @@ void init_settings(struct settings *settings)
 {
 	memset(settings, 0, sizeof(*settings));
 	IGT_INIT_LIST_HEAD(&settings->env_vars);
+	igt_vec_init(&settings->hook_strs, sizeof(char *));
 }
 
 void clear_settings(struct settings *settings)
@@ -632,6 +642,7 @@ void clear_settings(struct settings *settings)
 	free_regexes(&settings->include_regexes);
 	free_regexes(&settings->exclude_regexes);
 	free_env_vars(&settings->env_vars);
+	free_hook_strs(&settings->hook_strs);
 
 	init_settings(settings);
 }
@@ -641,6 +652,7 @@ bool parse_options(int argc, char **argv,
 {
 	int c;
 	char *env_test_root;
+	char *hook_str;
 
 	static struct option long_options[] = {
 		{"version", no_argument, NULL, OPT_VERSION},
@@ -751,15 +763,8 @@ bool parse_options(int argc, char **argv,
 			settings->code_coverage_script = bin_path(optarg);
 			break;
 		case OPT_HOOK:
-			/* FIXME: In order to allow line breaks, we should
-			 * change the format of settings serialization. Maybe
-			 * use JSON instead of our own format? */
-			if (strchr(optarg, '\n')) {
-				fprintf(stderr, "Newlines in --hook are currently unsupported.\n");
-				goto error;
-			}
-			/* FIXME: Allow as many options as allowed by test binaries. */
-			settings->hook_str = optarg;
+			hook_str = strdup(optarg);
+			igt_vec_push(&settings->hook_strs, &hook_str);
 			break;
 		case OPT_HELP_HOOK:
 			igt_hook_print_help(stdout, "--hook");
@@ -993,6 +998,49 @@ static bool serialize_environment(struct settings *settings, int dirfd)
 	return true;
 }
 
+static bool serialize_hook_strs(struct settings *settings, int dirfd)
+{
+	FILE *f;
+
+	if (file_exists_at(dirfd, hooks_filename) && !settings->overwrite) {
+		usage(stderr, "%s already exists, not overwriting", hooks_filename);
+		return false;
+	}
+
+	if ((f = fopenat_create(dirfd, hooks_filename, settings->overwrite)) == NULL)
+		return false;
+
+	for (size_t i = 0; i < igt_vec_length(&settings->hook_strs); i++) {
+		const char *s = *((char **)igt_vec_elem(&settings->hook_strs, i));
+		size_t len;
+
+		while (*s) {
+			len = strcspn(s, "\\\n");
+
+			if (len > 0)
+				fwrite(s, len, 1, f);
+
+			s += len;
+			if (!*s)
+				break;
+
+			fputc('\\', f);
+			fputc(*s, f);
+			s++;
+		}
+		fputc('\n', f);
+		fputc('\n', f);
+	}
+
+	if (settings->sync) {
+		fflush(f);
+		fsync(fileno(f));
+	}
+
+	fclose(f);
+	return true;
+}
+
 bool serialize_settings(struct settings *settings)
 {
 #define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n", #name, s->name)
@@ -1062,7 +1110,6 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_LINE(f, settings, enable_code_coverage, "%d");
 	SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
 	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
-	SERIALIZE_LINE(f, settings, hook_str, "%s");
 
 	if (settings->sync) {
 		fflush(f);
@@ -1078,6 +1125,13 @@ bool serialize_settings(struct settings *settings)
 		}
 	}
 
+	if (igt_vec_length(&settings->hook_strs)) {
+		if (!serialize_hook_strs(settings, dirfd)) {
+			close(dirfd);
+			return false;
+		}
+	}
+
 	if (settings->sync)
 		fsync(dirfd);
 
@@ -1126,7 +1180,6 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_LINE(settings, name, val, enable_code_coverage, numval);
 		PARSE_LINE(settings, name, val, cov_results_per_test, numval);
 		PARSE_LINE(settings, name, val, code_coverage_script, val ? strdup(val) : NULL);
-		PARSE_LINE(settings, name, val, hook_str, val ? strdup(val) : NULL);
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
 		       name, val);
@@ -1196,6 +1249,82 @@ static bool read_env_vars_from_file(struct igt_list_head *env_vars, FILE *f)
 	return true;
 }
 
+static bool read_hook_strs_from_file(struct igt_vec *hook_strs, FILE *f)
+{
+	char *line = NULL;
+	ssize_t line_length;
+	size_t line_size = 0;
+	char *buf;
+	size_t buf_len = 0;
+	size_t buf_capacity = 128;
+
+	buf = malloc(buf_capacity);
+
+	while ((line_length = getline(&line, &line_size, f) != -1)) {
+		char *s = line;
+
+		if (buf_len == 0) {
+			while (isspace(*s)) {
+				line_length--;
+				s++;
+			}
+
+			if (*s == '\0' || *s == '#')
+				continue;
+		}
+
+		if (line_length + 1 > buf_capacity - buf_len) {
+			while (line_length + 1 > buf_capacity - buf_len)
+				buf_capacity *= 2;
+
+			buf = realloc(buf, buf_capacity);
+		}
+
+		while (true) {
+			if (*s == '\0' || *s == '\n') {
+				char *buf_copy;
+
+				if (!buf_len)
+					break;
+
+				/* Reached the end of a hook string. */
+				buf[buf_len] = '\0';
+				buf_copy = strdup(buf);
+				igt_vec_push(hook_strs, &buf_copy);
+				buf_len = 0;
+				break;
+			}
+
+			if (*s == '\\') {
+				s++;
+
+				if (*s == '\0')
+					/* Weird case of backslash being the
+					 * last character of the file. */
+					s--;
+			}
+
+			buf[buf_len++] = *s++;
+
+			if (*s == '\0' || *s == '\n')
+				break;
+		}
+	}
+
+	if (buf_len) {
+		char *buf_copy;
+
+		buf[buf_len] = '\0';
+		buf_copy = strdup(buf);
+		igt_vec_push(hook_strs, &buf_copy);
+	}
+
+	free(buf);
+	free(line);
+
+	return true;
+}
+
 bool read_settings_from_dir(struct settings *settings, int dirfd)
 {
 	FILE *f;
@@ -1226,5 +1355,18 @@ bool read_settings_from_dir(struct settings *settings, int dirfd)
 		fclose(f);
 	}
 
+	/* hooks file may not exist if no --hook was passed */
+	if (file_exists_at(dirfd, hooks_filename)) {
+		if ((f = fopenat_read(dirfd, hooks_filename)) == NULL)
+			return false;
+
+		if (!read_hook_strs_from_file(&settings->hook_strs, f)) {
+			fclose(f);
+			return false;
+		}
+
+		fclose(f);
+	}
+
 	return true;
 }
diff --git a/runner/settings.h b/runner/settings.h
index d3afb56de039..8335f0b8c813 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -8,6 +8,7 @@
 #include <glib.h>
 
 #include "igt_list.h"
+#include "igt_vec.h"
 
 enum {
 	LOG_LEVEL_NORMAL = 0,
@@ -55,6 +56,7 @@ struct settings {
 	struct regex_list include_regexes;
 	struct regex_list exclude_regexes;
 	struct igt_list_head env_vars;
+	struct igt_vec hook_strs;
 	bool sync;
 	int log_level;
 	bool overwrite;
@@ -72,7 +74,6 @@ struct settings {
 	char *code_coverage_script;
 	bool enable_code_coverage;
 	bool cov_results_per_test;
-	char *hook_str;
 };
 
 /**
-- 
2.45.2

