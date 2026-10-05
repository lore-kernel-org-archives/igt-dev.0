Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3734DCA5FF0
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 11:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68BE10E264;
	Mon,  5 Oct 2026 11:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkF3VduW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE9410E249
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 11:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791198893; x=1822734893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ifTJIk5VwAx5iZ0yCAW2pWJvftjjYMPbUR4P8w7z6V8=;
 b=IkF3VduWb0emXSaqDOZPGAoLudimBi3lYe8KW3N3EeTKo4GOlafrWpLb
 +i4S+WR87DMT48Bsgvv8mu6t9isPHo8EG7R4OOB/qjNhohRx1k6gf+pRA
 pU3mQeEgZm14eKZHjsRzjHJU/0ii344f0PVLVguGsMjlyOo0ITJZR9HsM
 NFidX42zxjZVpovdfupc0KzOtrupUmup9d85guqGRz34ED8d/lux5Zs4e
 +Nvo3wRB1Pzop/r6FSm2AKm2PajkQkqN/ICiEkBctNxQPKBL4tx0j8Uk9
 ESIvyn8wNXP3yGDCX6Xeoa10FQyppoVIXrArfj8xmoPKmWsi4Rxmz/OBz A==;
X-CSE-ConnectionGUID: oVRjtKJ+QLKEySy/W4CcuQ==
X-CSE-MsgGUID: iOzzBLmBTAKbmJLeL0ge0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91074686"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="91074686"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:14:53 -0700
X-CSE-ConnectionGUID: MEM8JJUITbKOHwwO8CDpsw==
X-CSE-MsgGUID: iAP+uPJ1SJytzNuwro+5XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="9478"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:14:52 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 1/2] igt/runner: Refactor dmesg record buffering
Date: Mon,  5 Oct 2026 11:14:41 +0000
Message-ID: <20261005111442.2755785-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005111442.2755785-1-sobin.thomas@intel.com>
References: <20261005111442.2755785-1-sobin.thomas@intel.com>
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

Modify the runner result gen module to centralize dmesg record emission for
parent and dynamic-subtest buffers. Adding this prepares the parser
for duplicate rate limitting for the dmesg logs.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 runner/resultgen.c    | 205 ++++++++++++++++++++++++++++++++----------
 runner/runner_tests.c |   3 +
 runner/settings.c     |  30 +++++++
 runner/settings.h     |   1 +
 4 files changed, 191 insertions(+), 48 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index f5a91f542..5945bee29 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1004,6 +1004,103 @@ static void add_empty_dmesgs_where_missing(struct json_t *tests,
 
 }
 
+/* Parent and dynamic-subtest output are fed from the same record stream. */
+struct dmesg_buffers {
+	char *text, *warnings;
+	size_t textlen, warningslen;
+};
+
+static void add_dmesg_buffers(struct json_t *obj, const struct dmesg_buffers *buffers)
+{
+	add_dmesg(obj, buffers->text, buffers->textlen,
+		  buffers->warnings, buffers->warningslen);
+}
+
+struct dmesg_repeat_state {
+	char *message, *last_formatted;
+	unsigned int flags;
+	size_t count;
+	bool warning, dynamic_warning;
+};
+
+static void emit_dmesg_record(struct dmesg_buffers *parent,
+			      struct dmesg_buffers *dynamic,
+			      const char *text, bool warning, bool dynamic_warning)
+{
+	append_line(&parent->text, &parent->textlen, text);
+	append_line(&dynamic->text, &dynamic->textlen, text);
+	if (warning) {
+		append_line(&parent->warnings, &parent->warningslen, text);
+		if (dynamic_warning)
+			append_line(&dynamic->warnings, &dynamic->warningslen, text);
+	}
+}
+
+static bool flush_dmesg_repeats(struct dmesg_repeat_state *state, int limit,
+				struct dmesg_buffers *parent,
+				struct dmesg_buffers *dynamic)
+{
+	if (limit && state->count > (size_t)limit) {
+		char *summary;
+		size_t len = strlen(state->last_formatted);
+		const char *newline = "";
+
+		if (len && state->last_formatted[len - 1] == '\n') {
+			state->last_formatted[len - 1] = '\0';
+			newline = "\n";
+		}
+		if (asprintf(&summary, "...\n%s <occurs %zu>%s",
+			     state->last_formatted, state->count - limit, newline) < 0)
+			return false;
+		emit_dmesg_record(parent, dynamic, summary,
+				  state->warning, state->dynamic_warning);
+		free(summary);
+	}
+	free(state->message);
+	free(state->last_formatted);
+	memset(state, 0, sizeof(*state));
+	return true;
+}
+
+static bool append_dmesg_record(struct dmesg_repeat_state *state, int limit,
+				 struct dmesg_buffers *parent,
+				 struct dmesg_buffers *dynamic,
+				 const char *message, const char *formatted,
+				 unsigned int flags, bool warning,
+				 bool dynamic_warning, bool passthrough)
+{
+	char *last;
+
+	if (state->message &&
+	    (passthrough || state->flags != flags || state->warning != warning ||
+	     state->dynamic_warning != dynamic_warning ||
+	     strcmp(state->message, message))) {
+		if (!flush_dmesg_repeats(state, limit, parent, dynamic))
+			return false;
+	}
+	if (!limit || passthrough) {
+		emit_dmesg_record(parent, dynamic, formatted, warning, dynamic_warning);
+		return true;
+	}
+	if (!state->message) {
+		state->message = strdup(message);
+		if (!state->message)
+			return false;
+		state->flags = flags;
+		state->warning = warning;
+		state->dynamic_warning = dynamic_warning;
+	}
+	last = strdup(formatted);
+	if (!last)
+		return false;
+	free(state->last_formatted);
+	state->last_formatted = last;
+	state->count++;
+	if (state->count <= (size_t)limit)
+		emit_dmesg_record(parent, dynamic, formatted, warning, dynamic_warning);
+	return true;
+}
+
 static bool fill_from_dmesg(int fd,
 			    struct settings *settings,
 			    char *binary,
@@ -1011,11 +1108,10 @@ static bool fill_from_dmesg(int fd,
 			    struct json_t *tests)
 {
 	char *line = NULL;
-	char *warnings = NULL, *dynamic_warnings = NULL;
-	char *dmesg = NULL, *dynamic_dmesg = NULL;
+	struct dmesg_buffers parent = {0}, dynamic = {0};
+	struct dmesg_repeat_state repeat = {0};
+	bool success = false;
 	size_t linelen = 0;
-	size_t warningslen = 0, dynamic_warnings_len = 0;
-	size_t dmesglen = 0, dynamic_dmesg_len = 0;
 	struct json_t *current_test = NULL;
 	struct json_t *current_dynamic_test = NULL;
 	FILE *f = fdopen(fd, "r");
@@ -1037,33 +1133,47 @@ static bool fill_from_dmesg(int fd,
 	re_ignore = NULL;
 	while (getline(&line, &linelen, f) > 0) {
 		char *formatted;
+		bool warning, control;
 		unsigned flags;
 		unsigned long long ts_usec;
 		char continuation;
 		char *message, *subtest, *dynamic_subtest, *ignore;
 
-		if (!parse_dmesg_line(line, &flags, &ts_usec, &continuation, &message))
+		if (!parse_dmesg_line(line, &flags, &ts_usec, &continuation, &message)) {
+			if (line[0] != ' ' &&
+			    !flush_dmesg_repeats(&repeat, settings->dmesg_rate_limit,
+						 &parent, &dynamic))
+				goto out;
 			continue;
+		}
+
+		control = strstr(message, STARTING_SUBTEST_DMESG) ||
+			strstr(message, STARTING_DYNAMIC_SUBTEST_DMESG) ||
+			strstr(message, IGT_ADD_IGNORED_REGEX_DMESG);
+		/* Flush into the old destinations before changing test/regex state. */
+		if (control && !flush_dmesg_repeats(&repeat, settings->dmesg_rate_limit,
+						   &parent, &dynamic))
+			goto out;
 
 		generate_formatted_dmesg_line(message, flags, ts_usec, &formatted);
 
 		if ((subtest = strstr(message, STARTING_SUBTEST_DMESG)) != NULL) {
 			if (current_test != NULL) {
 				/* Done with the previous subtest, file up */
-				add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
+				add_dmesg_buffers(current_test, &parent);
 
-				free(dmesg);
-				free(warnings);
-				dmesg = warnings = NULL;
-				dmesglen = warningslen = 0;
+				free(parent.text);
+				free(parent.warnings);
+				parent.text = parent.warnings = NULL;
+				parent.textlen = parent.warningslen = 0;
 
 				if (current_dynamic_test != NULL)
-					add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
+					add_dmesg_buffers(current_dynamic_test, &dynamic);
 
-				free(dynamic_dmesg);
-				free(dynamic_warnings);
-				dynamic_dmesg = dynamic_warnings = NULL;
-				dynamic_dmesg_len = dynamic_warnings_len = 0;
+				free(dynamic.text);
+				free(dynamic.warnings);
+				dynamic.text = dynamic.warnings = NULL;
+				dynamic.textlen = dynamic.warningslen = 0;
 				current_dynamic_test = NULL;
 			}
 
@@ -1077,12 +1187,12 @@ static bool fill_from_dmesg(int fd,
 		    (dynamic_subtest = strstr(message, STARTING_DYNAMIC_SUBTEST_DMESG)) != NULL) {
 			if (current_dynamic_test != NULL) {
 				/* Done with the previous dynamic subtest, file up */
-				add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
+				add_dmesg_buffers(current_dynamic_test, &dynamic);
 
-				free(dynamic_dmesg);
-				free(dynamic_warnings);
-				dynamic_dmesg = dynamic_warnings = NULL;
-				dynamic_dmesg_len = dynamic_warnings_len = 0;
+				free(dynamic.text);
+				free(dynamic.warnings);
+				dynamic.text = dynamic.warnings = NULL;
+				dynamic.textlen = dynamic.warningslen = 0;
 			}
 
 			dynamic_subtest += strlen(STARTING_DYNAMIC_SUBTEST_DMESG);
@@ -1094,33 +1204,27 @@ static bool fill_from_dmesg(int fd,
 		if ((ignore = strstr(message, IGT_ADD_IGNORED_REGEX_DMESG)) != NULL)
 			add_ignored_regex(&re_ignore, ignore + strlen(IGT_ADD_IGNORED_REGEX_DMESG));
 
-		if (settings->piglit_style_dmesg) {
-			if ((flags & 0x07) <= settings->dmesg_warn_level && continuation != 'c' &&
-			    g_regex_match(re, message, 0, NULL) &&
-			    not_ignored(re_ignore, message)) {
-				append_line(&warnings, &warningslen, formatted);
-				if (current_test != NULL)
-					append_line(&dynamic_warnings, &dynamic_warnings_len, formatted);
-			}
-		} else {
-			if ((flags & 0x07) <= settings->dmesg_warn_level && continuation != 'c' &&
-			    !g_regex_match(re, message, 0, NULL) &&
-			    not_ignored(re_ignore, message)) {
-				append_line(&warnings, &warningslen, formatted);
-				if (current_test != NULL)
-					append_line(&dynamic_warnings, &dynamic_warnings_len, formatted);
-			}
+		warning = (flags & 0x07) <= settings->dmesg_warn_level &&
+			continuation != 'c' &&
+			(!!g_regex_match(re, message, 0, NULL) == settings->piglit_style_dmesg) &&
+			not_ignored(re_ignore, message);
+		if (!append_dmesg_record(&repeat, settings->dmesg_rate_limit,
+					 &parent, &dynamic, message, formatted, flags,
+					 warning, current_test != NULL,
+					 control || continuation == 'c')) {
+			free(formatted);
+			goto out;
 		}
-		append_line(&dmesg, &dmesglen, formatted);
-		append_line(&dynamic_dmesg, &dynamic_dmesg_len, formatted);
 		free(formatted);
 	}
-	free(line);
+	if (ferror(f) || !flush_dmesg_repeats(&repeat, settings->dmesg_rate_limit,
+					    &parent, &dynamic))
+		goto out;
 
 	if (current_test != NULL) {
-		add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
+		add_dmesg_buffers(current_test, &parent);
 		if (current_dynamic_test != NULL) {
-			add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
+			add_dmesg_buffers(current_dynamic_test, &dynamic);
 		}
 	} else {
 		/*
@@ -1136,26 +1240,31 @@ static bool fill_from_dmesg(int fd,
 			 * there are would have skip as their result
 			 * anyway.
 			 */
-			add_dmesg(current_test, dmesg, dmesglen, NULL, 0);
+			add_dmesg(current_test, parent.text, parent.textlen, NULL, 0);
 		}
 
 		if (subtests->size == 0) {
 			generate_piglit_name(binary, NULL, piglit_name, sizeof(piglit_name));
 			current_test = get_or_create_json_object(tests, piglit_name);
-			add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
+			add_dmesg_buffers(current_test, &parent);
 		}
 	}
 
 	add_empty_dmesgs_where_missing(tests, binary, subtests);
 
-	free(dmesg);
-	free(dynamic_dmesg);
-	free(warnings);
-	free(dynamic_warnings);
+	success = true;
+out:
+	free(line);
+	free(repeat.message);
+	free(repeat.last_formatted);
+	free(parent.text);
+	free(dynamic.text);
+	free(parent.warnings);
+	free(dynamic.warnings);
 	clean_regex(&re_ignore);
 	g_regex_unref(re);
 	fclose(f);
-	return true;
+	return success;
 }
 
 static struct json_t *tmp_tests;
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 798fee8ef..fb39faec6 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -205,6 +205,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	igt_assert_eqstr(one->code_coverage_script, two->code_coverage_script);
 	igt_assert_eq(one->piglit_style_dmesg, two->piglit_style_dmesg);
 	igt_assert_eq(one->dmesg_warn_level, two->dmesg_warn_level);
+	igt_assert_eq(one->dmesg_rate_limit, two->dmesg_rate_limit);
 	igt_assert_eq(one->prune_mode, two->prune_mode);
 
 	igt_assert_eq(igt_vec_length(&one->hook_strs), igt_vec_length(&two->hook_strs));
@@ -322,6 +323,7 @@ int igt_main()
 
 		igt_assert(!settings->piglit_style_dmesg);
 		igt_assert_eq(settings->dmesg_warn_level, 4);
+		igt_assert_eq(settings->dmesg_rate_limit, 0);
 	}
 
 	igt_subtest_group() {
@@ -997,6 +999,7 @@ int igt_main()
 					       "--overall-timeout", "360",
 					       "--use-watchdog",
 					       "--piglit-style-dmesg",
+					       "--rate-limit=3",
 					       "--prune-mode=keep-all",
 					       "--hook", "echo hello",
 					       "--hook", "echo hello\necho newline",
diff --git a/runner/settings.c b/runner/settings.c
index eb67f651a..e6f8af358 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -26,6 +26,7 @@ enum {
 	OPT_SAVE_RESULTS_AFTER_EACH_TEST,
 	OPT_PIGLIT_DMESG,
 	OPT_DMESG_WARN_LEVEL,
+	OPT_DMESG_RATE_LIMIT,
 	OPT_OVERALL_TIMEOUT,
 	OPT_PER_TEST_TIMEOUT,
 	OPT_ALLOW_NON_ROOT,
@@ -278,6 +279,8 @@ static const char *usage_str =
 	"  --use-watchdog        Use hardware watchdog for lethal enforcement of the\n"
 	"                        above timeout. Killing the test process is still\n"
 	"                        attempted at timeout trigger.\n"
+	"  --rate-limit N        Keep the first N consecutive identical dmesg records,\n"
+	"                        then summarize repeats. 0 disables limiting (default).\n"
 	"  --dmesg-warn-level <level>\n"
 	"                        Messages with log level equal or lower (more serious)\n"
 	"                        to the given one will override the test result to\n"
@@ -677,6 +680,23 @@ void clear_settings(struct settings *settings)
 	init_settings(settings);
 }
 
+static bool parse_dmesg_rate_limit(const char *value, int *limit)
+{
+	char *end;
+	long parsed;
+
+	if (!value[0] || strspn(value, "0123456789") != strlen(value))
+		return false;
+
+	errno = 0;
+	parsed = strtol(value, &end, 10);
+	if (errno == ERANGE || *end || parsed > INT_MAX)
+		return false;
+
+	*limit = parsed;
+	return true;
+}
+
 bool parse_options(int argc, char **argv,
 		   struct settings *settings)
 {
@@ -714,6 +734,7 @@ bool parse_options(int argc, char **argv,
 		{"overall-timeout", required_argument, NULL, OPT_OVERALL_TIMEOUT},
 		{"use-watchdog", no_argument, NULL, OPT_WATCHDOG},
 		{"piglit-style-dmesg", no_argument, NULL, OPT_PIGLIT_DMESG},
+		{"rate-limit", required_argument, NULL, OPT_DMESG_RATE_LIMIT},
 		{"dmesg-warn-level", required_argument, NULL, OPT_DMESG_WARN_LEVEL},
 		{"prune-mode", required_argument, NULL, OPT_PRUNE_MODE},
 		{"blacklist", required_argument, NULL, OPT_BLACKLIST},
@@ -842,6 +863,12 @@ bool parse_options(int argc, char **argv,
 			if (settings->dmesg_warn_level < 0)
 				settings->dmesg_warn_level = 5; /* KERN_NOTICE */
 			break;
+		case OPT_DMESG_RATE_LIMIT:
+			if (!parse_dmesg_rate_limit(optarg, &settings->dmesg_rate_limit)) {
+				usage(stderr, "Invalid --rate-limit: %s", optarg);
+				goto error;
+			}
+			break;
 		case OPT_DMESG_WARN_LEVEL:
 			settings->dmesg_warn_level = atoi(optarg);
 			break;
@@ -1255,6 +1282,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_INT(f, settings, use_watchdog);
 	SERIALIZE_INT(f, settings, piglit_style_dmesg);
 	SERIALIZE_INT(f, settings, dmesg_warn_level);
+	SERIALIZE_INT(f, settings, dmesg_rate_limit);
 	SERIALIZE_INT(f, settings, prune_mode);
 	SERIALIZE_STR(f, settings, test_root);
 	SERIALIZE_STR(f, settings, results_path);
@@ -1352,6 +1380,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 	char *name = NULL, *val = NULL;
 
 	settings->dmesg_warn_level = -1;
+	settings->dmesg_rate_limit = 0;
 
 	while (fscanf(f, "%ms : %m[^\n]", &name, &val) == 2) {
 		PARSE_INT(settings, name, val, abort_mask);
@@ -1374,6 +1403,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_INT(settings, name, val, use_watchdog);
 		PARSE_INT(settings, name, val, piglit_style_dmesg);
 		PARSE_INT(settings, name, val, dmesg_warn_level);
+		PARSE_INT(settings, name, val, dmesg_rate_limit);
 		PARSE_INT(settings, name, val, prune_mode);
 		PARSE_STR(settings, name, val, test_root);
 		PARSE_STR(settings, name, val, results_path);
diff --git a/runner/settings.h b/runner/settings.h
index 4d1c17ffb..5d2bbf3e4 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -77,6 +77,7 @@ struct settings {
 	char *results_path;
 	bool piglit_style_dmesg;
 	int dmesg_warn_level;
+	int dmesg_rate_limit; /* 0 disables duplicate suppression */
 	int prune_mode;
 	bool list_all;
 	char *code_coverage_script;
-- 
2.43.0

