Return-path: <SRS0=UqwI=TG=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6F410E892
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Feb 2022 11:17:27 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.94.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1nMpe7-001xZj-Kp
 for igt-dev@lists.freedesktop.org; Wed, 23 Feb 2022 12:17:23 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Feb 2022 12:16:34 +0100
Message-Id: <20220223111641.467123-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20220223111641.467123-1-mauro.chehab@linux.intel.com>
References: <20220223111641.467123-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/9] runner: Add support for code coverage
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The gcc compiler has a feature that enables checking the code coverage
in runtime[1].

[1] See https://www.kernel.org/doc/html/latest/dev-tools/gcov.html

The Linux Kernel comes with an option to enable such feature:

	./scripts/config -e DEBUG_FS -e GCOV_KERNEL

The driver's Makefile also needs change to enable it. For instance, in
order to enable GCOV for all DRM drivers, one would need to run:

	for i in $(find drivers/gpu/drm/ -name Makefile); do
                sed '1 a GCOV_PROFILE := y' -i $i
        done

This patch adds support for it by:

a) Implementing a logic to cleanup the code coverage counters via sysfs;
b) Calling a script responsible for collecging code coverage data.

The implementation works with two modes:

1) It zeroes the counters, run all IGT tests and collects the code
   coverage results at the end.

   This implies that no tests would crash the driver, as otherwise the
   results won't be collected;

   This is faster, as collecting code coverage data can take several
   seconds.

2) For each test, it will clean the code coverage counters, run the and
   collect the results.

   This is more reliable, as a Kernel crash/OOPS won't affect the
   results of the previously ran tests.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 runner/executor.c     | 186 ++++++++++++++++++++++++++++++++++++++++--
 runner/runner_tests.c |   3 +
 runner/settings.c     |  79 +++++++++++++++++-
 runner/settings.h     |   7 ++
 4 files changed, 265 insertions(+), 10 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 15bd53dd150c..ab00900c6d44 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1,3 +1,4 @@
+#include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <glib.h>
@@ -1693,6 +1694,140 @@ static bool should_die_because_signal(int sigfd)
 	return false;
 }
 
+static char *code_coverage_name(struct settings *settings)
+{
+	const char *start, *end, *fname;
+	char *name;
+	int size;
+
+	if (settings->name && *settings->name)
+		return settings->name;
+	else if (!settings->test_list)
+		return NULL;
+
+	/* Use only the base of the test_list, without path and extension */
+	fname = settings->test_list;
+
+	start = strrchr(fname,'/');
+	if (!start)
+		start = fname;
+
+	end = strrchr(start, '.');
+	if (end)
+		size = end - start;
+	else
+		size = strlen(start);
+
+	name = malloc(size + 1);
+	strncpy(name, fname, size);
+	name[size]  = '\0';
+
+	return name;
+}
+
+static void run_as_root(char * const argv[], int sigfd, char **abortreason)
+{
+	struct signalfd_siginfo siginfo;
+	int status = 0, ret;
+	pid_t child;
+
+	child = fork();
+	if (child < 0) {
+		*abortreason = strdup("Failed to fork");
+		return;
+	}
+
+	if (child == 0) {
+		execv(argv[0], argv);
+		perror (argv[0]);
+		exit(IGT_EXIT_INVALID);
+	}
+
+	if (sigfd >= 0) {
+		while (1) {
+			ret = read(sigfd, &siginfo, sizeof(siginfo));
+			if (ret < 0) {
+				errf("Error reading from signalfd: %m\n");
+				continue;
+			} else if (siginfo.ssi_signo == SIGCHLD) {
+				if (child != waitpid(child, &status, WNOHANG)) {
+					errf("Failed to reap child\n");
+					status = 9999;
+					continue;
+				}
+				break;
+			}
+		}
+	} else {
+		waitpid(child, &status, 0);
+	}
+
+	if (WIFSIGNALED(status))
+		asprintf(abortreason, "%s received signal %d while running\n",argv[0], WTERMSIG(status));
+	else if (!WIFEXITED(status))
+		asprintf(abortreason, "%s aborted with unknown status\n", argv[0]);
+	else if (WEXITSTATUS(status))
+		asprintf(abortreason, "%s returned error %d\n", argv[0], WEXITSTATUS(status));
+}
+
+static void code_coverage_start(struct settings *settings, int sigfd, char **abortreason)
+{
+	int fd;
+
+	fd = open(GCOV_RESET, O_WRONLY);
+	if (fd < 0) {
+		asprintf(abortreason, "Failed to open %s", GCOV_RESET);
+		return;
+	}
+	if (write(fd, "0\n", 2) < 0)
+		*abortreason = strdup("Failed to reset gcov counters");
+
+	close(fd);
+}
+
+static void code_coverage_stop(struct settings *settings, const char *job_name,
+			       int sigfd, char **abortreason)
+{
+	int i, j = 0, last_was_escaped = 1;
+	char fname[PATH_MAX];
+	char name[PATH_MAX];
+	char *argv[3] = {};
+
+	/* If name is empty, use a default */
+	if (!job_name || !*job_name)
+		job_name = "code_coverage";
+
+	/*
+	 * Use only letters, numbers and '_'
+	 *
+	 * This way, the tarball name can be used as testname when lcov runs
+	 */
+	for (i = 0; i < strlen(job_name); i++) {
+		if (!isalpha(job_name[i]) && !isalnum(job_name[i])) {
+			if (last_was_escaped)
+				continue;
+			name[j++] = '_';
+			last_was_escaped = 1;
+		} else {
+			name[j++] = job_name[i];
+			last_was_escaped = 0;
+		}
+	}
+	if (j && last_was_escaped)
+		j--;
+	name[j] = '\0';
+
+	strcpy(fname, settings->results_path);
+	strcat(fname, CODE_COV_RESULTS_PATH "/");
+	strcat(fname, name);
+
+	argv[0] = settings->code_coverage_script;
+	argv[1] = fname;
+
+	outf("Storing code coverage results...\n");
+	run_as_root(argv, sigfd, abortreason);
+}
+
 bool execute(struct execute_state *state,
 	     struct settings *settings,
 	     struct job_list *job_list)
@@ -1709,6 +1844,17 @@ bool execute(struct execute_state *state,
 		return true;
 	}
 
+	if (settings->enable_code_coverage && !settings->cov_results_per_test) {
+		char *reason = NULL;
+
+		code_coverage_start(settings, -1, &reason);
+		if (reason != NULL) {
+			errf("%s\n", reason);
+			free(reason);
+			status = false;
+		}
+	}
+
 	if ((resdirfd = open(settings->results_path, O_DIRECTORY | O_RDONLY)) < 0) {
 		/* Initialize state should have done this */
 		errf("Error: Failure opening results path %s\n",
@@ -1795,6 +1941,7 @@ bool execute(struct execute_state *state,
 	for (; state->next < job_list->size;
 	     state->next++) {
 		char *reason = NULL;
+		char *job_name;
 		int result;
 
 		if (should_die_because_signal(sigfd)) {
@@ -1802,14 +1949,26 @@ bool execute(struct execute_state *state,
 			goto end;
 		}
 
-		result = execute_next_entry(state,
-					    job_list->size,
-					    &time_spent,
-					    settings,
-					    &job_list->entries[state->next],
-					    testdirfd, resdirfd,
-					    sigfd, &sigmask,
-					    &reason);
+		if (settings->cov_results_per_test) {
+			code_coverage_start(settings, sigfd, &reason);
+			job_name = entry_display_name(&job_list->entries[state->next]);
+		}
+
+		if (reason == NULL) {
+			result = execute_next_entry(state,
+						job_list->size,
+						&time_spent,
+						settings,
+						&job_list->entries[state->next],
+						testdirfd, resdirfd,
+						sigfd, &sigmask,
+						&reason);
+
+			if (settings->cov_results_per_test) {
+				code_coverage_stop(settings, job_name, sigfd, &reason);
+				free(job_name);
+			}
+		}
 
 		if (reason != NULL || (reason = need_to_abort(settings)) != NULL) {
 			char *prev = entry_display_name(&job_list->entries[state->next]);
@@ -1864,6 +2023,17 @@ bool execute(struct execute_state *state,
 	}
 
  end:
+	if (settings->enable_code_coverage && !settings->cov_results_per_test) {
+		char *reason = NULL;
+
+		code_coverage_stop(settings, code_coverage_name(settings), -1, &reason);
+		if (reason != NULL) {
+			errf("%s\n", reason);
+			free(reason);
+			status = false;
+		}
+	}
+
 	close_watchdogs(settings);
 	sigprocmask(SIG_UNBLOCK, &sigmask, NULL);
 	/* make sure that we do not leave any signals unhandled */
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index e67e08a8c99f..96ffbf1ff398 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -443,6 +443,9 @@ igt_main
 				       "--use-watchdog",
 				       "--piglit-style-dmesg",
 				       "--dmesg-warn-level=3",
+				       "--collect-code-cov",
+				       "--coverage-per-test",
+				       "--collect-script", "/usr/bin/true",
 				       "test-root-dir",
 				       "path-to-results",
 		};
diff --git a/runner/settings.c b/runner/settings.c
index ac090b081e3b..a7a12f506a05 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -25,6 +25,9 @@ enum {
 	OPT_OVERALL_TIMEOUT,
 	OPT_PER_TEST_TIMEOUT,
 	OPT_ALLOW_NON_ROOT,
+	OPT_CODE_COV_SCRIPT,
+	OPT_ENABLE_CODE_COVERAGE,
+	OPT_COV_RESULTS_PER_TEST,
 	OPT_VERSION,
 	OPT_HELP = 'h',
 	OPT_NAME = 'n',
@@ -240,6 +243,13 @@ static const char *usage_str =
 	"                        Exclude all test matching to regexes from FILENAME\n"
 	"                        (can be used more than once)\n"
 	"  -L, --list-all        List all matching subtests instead of running\n"
+	"  --collect-code-cov    Enables gcov-based collect of code coverage for tests.\n"
+	"                        Requires --collect-script FILENAME\n"
+	"  --coverage-per-test   Stores code coverage results per each test.\n"
+	"                        Requires --collect-script FILENAME\n"
+	"  --collect-script FILENAME\n"
+	"                        Use FILENAME as script to collect code coverage data.\n"
+	"\n"
 	"  [test_root]           Directory that contains the IGT tests. The environment\n"
 	"                        variable IGT_TEST_ROOT will be used if set, overriding\n"
 	"                        this option if given.\n"
@@ -338,11 +348,21 @@ static void free_regexes(struct regex_list *regexes)
 	free(regexes->regexes);
 }
 
-static bool readable_file(char *filename)
+static bool readable_file(const char *filename)
 {
 	return !access(filename, R_OK);
 }
 
+static bool writeable_file(const char *filename)
+{
+	return !access(filename, W_OK);
+}
+
+static bool executable_file(const char *filename)
+{
+	return !access(filename, X_OK);
+}
+
 static void print_version(void)
 {
 	struct utsname uts;
@@ -393,6 +413,9 @@ bool parse_options(int argc, char **argv,
 		{"test-list", required_argument, NULL, OPT_TEST_LIST},
 		{"overwrite", no_argument, NULL, OPT_OVERWRITE},
 		{"ignore-missing", no_argument, NULL, OPT_IGNORE_MISSING},
+		{"collect-code-cov", no_argument, NULL, OPT_ENABLE_CODE_COVERAGE},
+		{"coverage-per-test", no_argument, NULL, OPT_COV_RESULTS_PER_TEST},
+		{"collect-script", required_argument, NULL, OPT_CODE_COV_SCRIPT},
 		{"multiple-mode", no_argument, NULL, OPT_MULTIPLE},
 		{"inactivity-timeout", required_argument, NULL, OPT_TIMEOUT},
 		{"per-test-timeout", required_argument, NULL, OPT_PER_TEST_TIMEOUT},
@@ -465,6 +488,16 @@ bool parse_options(int argc, char **argv,
 		case OPT_IGNORE_MISSING:
 			/* Ignored, piglit compatibility */
 			break;
+		case OPT_ENABLE_CODE_COVERAGE:
+			settings->enable_code_coverage = true;
+			break;
+		case OPT_COV_RESULTS_PER_TEST:
+			settings->cov_results_per_test = true;
+			break;
+		case OPT_CODE_COV_SCRIPT:
+			settings->code_coverage_script = absolute_path(optarg);
+			break;
+
 		case OPT_MULTIPLE:
 			settings->multiple_mode = true;
 			break;
@@ -597,6 +630,29 @@ bool validate_settings(struct settings *settings)
 	close(fd);
 	close(dirfd);
 
+	/* enables code coverage when --coverage-per-test is used */
+	if (settings->cov_results_per_test)
+		settings->enable_code_coverage = true;
+
+	if (!settings->allow_non_root && (getuid() != 0)) {
+		fprintf(stderr, "Runner needs to run with UID 0 (root).\n");
+		return false;
+	}
+
+	if (settings->enable_code_coverage) {
+		if (!executable_file(settings->code_coverage_script)) {
+			fprintf(stderr, "%s doesn't exist or is not executable\n", settings->code_coverage_script);
+			return false;
+		}
+		if (!writeable_file(GCOV_RESET)) {
+			if (getuid() != 0)
+				fprintf(stderr, "Code coverage requires root.\n");
+			else
+				fprintf(stderr, "Is GCOV enabled? Can't access %s stat.\n", GCOV_RESET);
+			return false;
+		}
+	}
+
 	return true;
 }
 
@@ -645,7 +701,8 @@ bool serialize_settings(struct settings *settings)
 {
 #define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n", #name, s->name)
 
-	int dirfd, fd;
+	int dirfd, covfd, fd;
+	char path[PATH_MAX];
 	FILE *f;
 
 	if (!settings->results_path) {
@@ -660,6 +717,18 @@ bool serialize_settings(struct settings *settings)
 			return false;
 		}
 	}
+	if (settings->enable_code_coverage) {
+		strcpy(path, settings->results_path);
+		strcat(path, CODE_COV_RESULTS_PATH);
+		if ((covfd = open(path, O_DIRECTORY | O_RDONLY)) < 0) {
+			if (mkdir(path, 0755)) {
+				usage("Creating code coverage path failed", stderr);
+				return false;
+			}
+		} else {
+			close(covfd);
+		}
+	}
 
 	if (!settings->overwrite &&
 	    faccessat(dirfd, settings_filename, F_OK, 0) == 0) {
@@ -712,6 +781,9 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_LINE(f, settings, dmesg_warn_level, "%d");
 	SERIALIZE_LINE(f, settings, test_root, "%s");
 	SERIALIZE_LINE(f, settings, results_path, "%s");
+	SERIALIZE_LINE(f, settings, enable_code_coverage, "%d");
+	SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
+	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
 
 	if (settings->sync) {
 		fsync(fd);
@@ -760,6 +832,9 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_LINE(settings, name, val, dmesg_warn_level, numval);
 		PARSE_LINE(settings, name, val, test_root, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, results_path, val ? strdup(val) : NULL);
+		PARSE_LINE(settings, name, val, enable_code_coverage, numval);
+		PARSE_LINE(settings, name, val, cov_results_per_test, numval);
+		PARSE_LINE(settings, name, val, code_coverage_script, val ? strdup(val) : NULL);
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
 		       name, val);
diff --git a/runner/settings.h b/runner/settings.h
index bc61faeb6c86..3c2a3ee9c336 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -20,6 +20,10 @@ enum {
 
 _Static_assert(ABORT_ALL == (ABORT_TAINT | ABORT_LOCKDEP | ABORT_PING), "ABORT_ALL must be all conditions bitwise or'd");
 
+#define GCOV_DIR		"/sys/kernel/debug/gcov"
+#define GCOV_RESET GCOV_DIR	"/reset"
+#define CODE_COV_RESULTS_PATH	"/code_cov"
+
 struct regex_list {
 	char **regex_strings;
 	GRegex **regexes;
@@ -48,6 +52,9 @@ struct settings {
 	bool piglit_style_dmesg;
 	int dmesg_warn_level;
 	bool list_all;
+	char *code_coverage_script;
+	bool enable_code_coverage;
+	bool cov_results_per_test;
 };
 
 /**
-- 
2.35.1
