Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64D210E31D
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Aug 2022 11:07:52 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed, 31 Aug 2022 13:07:29 +0200
Message-Id: <20220831110729.730006-8-ryszard.knop@intel.com>
In-Reply-To: <20220831110729.730006-1-ryszard.knop@intel.com>
References: <20220831110729.730006-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 7/7] runner: Add tests for environment
 flags
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

Per Mauro's review, add some --environment tests:
- Check if -e/--environment works,
- Check both KEY=VALUE and KEY,
- Check if resumes load the variables correctly.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 runner/runner_tests.c | 30 ++++++++++++++++++++++++++++++
 runner/settings.c     |  2 +-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index aca031fc..db0ce2ac 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -281,6 +281,7 @@ igt_main
 		igt_assert(!settings->dry_run);
 		igt_assert_eq(settings->include_regexes.size, 0);
 		igt_assert_eq(settings->exclude_regexes.size, 0);
+		igt_assert(igt_list_empty(&settings->env_vars));
 		igt_assert(!settings->sync);
 		igt_assert_eq(settings->log_level, LOG_LEVEL_NORMAL);
 		igt_assert(!settings->overwrite);
@@ -421,6 +422,8 @@ igt_main
 
 	igt_subtest("parse-all-settings") {
 		char blacklist_name[PATH_MAX], blacklist2_name[PATH_MAX];
+		struct environment_variable *env_var;
+
 		const char *argv[] = { "runner",
 				       "--allow-non-root",
 				       "-n", "foo",
@@ -433,6 +436,8 @@ igt_main
 				       "-t", "pattern2",
 				       "-x", "xpattern1",
 				       "-x", "xpattern2",
+				       "-e", "HAVE_A_NICE=TESTING",
+				       "--environment", "ENVS_WITH_JUST_KEYS",
 				       "-b", blacklist_name,
 				       "--blacklist", blacklist2_name,
 				       "-s",
@@ -453,6 +458,8 @@ igt_main
 				       "path-to-results",
 		};
 
+		setenv("ENVS_WITH_JUST_KEYS", "SHOULD_WORK", 1);
+
 		sprintf(blacklist_name, "%s/test-blacklist.txt", testdatadir);
 		sprintf(blacklist2_name, "%s/test-blacklist2.txt", testdatadir);
 
@@ -464,14 +471,27 @@ igt_main
 		igt_assert_eqstr(settings->name, "foo");
 		igt_assert(settings->dry_run);
 		igt_assert(settings->allow_non_root);
+
 		igt_assert_eq(settings->include_regexes.size, 2);
 		igt_assert_eqstr(settings->include_regexes.regex_strings[0], "pattern1");
 		igt_assert_eqstr(settings->include_regexes.regex_strings[1], "pattern2");
+
 		igt_assert_eq(settings->exclude_regexes.size, 4);
 		igt_assert_eqstr(settings->exclude_regexes.regex_strings[0], "xpattern1");
 		igt_assert_eqstr(settings->exclude_regexes.regex_strings[1], "xpattern2");
 		igt_assert_eqstr(settings->exclude_regexes.regex_strings[2], "xpattern3"); /* From blacklist */
 		igt_assert_eqstr(settings->exclude_regexes.regex_strings[3], "xpattern4"); /* From blacklist2 */
+
+		igt_assert(!igt_list_empty(&settings->env_vars));
+
+		env_var = igt_list_first_entry(&settings->env_vars, env_var, link);
+		igt_assert_eqstr(env_var->key, "HAVE_A_NICE");
+		igt_assert_eqstr(env_var->value, "TESTING");
+
+		env_var = igt_list_last_entry(&settings->env_vars, env_var, link);
+		igt_assert_eqstr(env_var->key, "ENVS_WITH_JUST_KEYS");
+		igt_assert_eqstr(env_var->value, "SHOULD_WORK");
+
 		igt_assert(settings->sync);
 		igt_assert_eq(settings->log_level, LOG_LEVEL_VERBOSE);
 		igt_assert(settings->overwrite);
@@ -1029,9 +1049,12 @@ igt_main
 
 		igt_subtest("dry-run-option") {
 			struct execute_state state;
+			struct environment_variable *env_var;
+
 			const char *argv[] = { "runner",
 					       "--dry-run",
 					       "--allow-non-root",
+					       "-e", "JUST_TESTING=ENV_VARS",
 					       "-x", "^abort",
 					       testdatadir,
 					       dirname,
@@ -1058,6 +1081,9 @@ igt_main
 			igt_assert_f((fd = openat(dirfd, "joblist.txt", O_RDONLY)) >= 0,
 				     "Dry run initialization didn't serialize the job list.\n");
 			close(fd);
+			igt_assert_f((fd = openat(dirfd, "environment.txt", O_RDONLY)) >= 0,
+			             "Dry run initialization didn't serialize the environment file.\n");
+			close(fd);
 			igt_assert_f((fd = openat(dirfd, "uname.txt", O_RDONLY)) < 0,
 				     "Dry run initialization created uname.txt.\n");
 
@@ -1078,6 +1104,10 @@ igt_main
 				     "Dry run resume didn't create result directory.\n");
 			igt_assert_f((fd = openat(subdirfd, "journal.txt", O_RDONLY)) >= 0,
 				     "Dry run resume didn't create a journal.\n");
+
+			env_var = igt_list_first_entry(&settings->env_vars, env_var, link);
+			igt_assert_eqstr(env_var->key, "JUST_TESTING");
+			igt_assert_eqstr(env_var->value, "ENV_VARS");
 		}
 
 		igt_fixture {
diff --git a/runner/settings.c b/runner/settings.c
index cd40208b..23aa8296 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1146,7 +1146,7 @@ static bool read_env_vars_from_file(struct igt_list_head *env_vars, FILE *f)
 	while ((line_length = getline(&line, &line_buffer_length, f)) != -1) {
 		char *line_ptr = line;
 
-		while (isspace(line_ptr)) {
+		while (isspace(*line_ptr)) {
 			line_length--;
 			line_ptr++;
 		}
-- 
2.37.2
