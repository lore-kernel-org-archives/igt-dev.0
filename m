Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3E910E603
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Mar 2022 15:04:32 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.94.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1nUV8B-006e0w-7P
 for igt-dev@lists.freedesktop.org; Wed, 16 Mar 2022 16:00:07 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Mar 2022 15:59:56 +0100
Message-Id: <20220316150003.1583681-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20220316150003.1583681-1-mauro.chehab@linux.intel.com>
References: <20220316150003.1583681-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 03/10] runner: cleanup code_cov directory,
 if any
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

Ensure that "-o" parameter will also cleanup the contents of the
code coverage results directory.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 runner/executor.c | 59 ++++++++++++++++++++++++++++++++++++-----------
 runner/settings.h |  2 +-
 2 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index ab00900c6d44..b4efc4fdbf81 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -20,6 +20,7 @@
 #include <sys/types.h>
 #include <sys/utsname.h>
 #include <sys/wait.h>
+#include <dirent.h>
 #include <time.h>
 #include <unistd.h>
 
@@ -1446,8 +1447,11 @@ static bool clear_test_result_directory(int dirfd)
 
 static bool clear_old_results(char *path)
 {
+	struct dirent *entry;
+	char name[PATH_MAX];
 	int dirfd;
 	size_t i;
+	DIR *dir;
 
 	if ((dirfd = open(path, O_DIRECTORY | O_RDONLY)) < 0) {
 		if (errno == ENOENT) {
@@ -1469,7 +1473,6 @@ static bool clear_old_results(char *path)
 	}
 
 	for (i = 0; true; i++) {
-		char name[32];
 		int resdirfd;
 
 		snprintf(name, sizeof(name), "%zd", i);
@@ -1488,6 +1491,31 @@ static bool clear_old_results(char *path)
 		}
 	}
 
+	strcpy(name, path);
+	strcat(name, "/" CODE_COV_RESULTS_PATH);
+	if ((dir = opendir(name)) != NULL) {
+		char *p;
+
+		strcat(name, "/");
+		p = name + strlen(name);
+
+		while ((entry = readdir(dir)) != NULL) {
+			if (!strcmp(entry->d_name, ".") || !strcmp(entry->d_name, ".."))
+				continue;
+
+			strcpy(p, entry->d_name);
+			if (unlink(name))  {
+				errf("Error removing %s\n", name);
+			}
+		}
+
+		closedir(dir);
+		if (unlinkat(dirfd, CODE_COV_RESULTS_PATH, AT_REMOVEDIR)) {
+			errf("Warning: Result directory %s/%s contains extra files\n",
+			     path, CODE_COV_RESULTS_PATH);
+		}
+	}
+
 	close(dirfd);
 
 	return true;
@@ -1818,7 +1846,7 @@ static void code_coverage_stop(struct settings *settings, const char *job_name,
 	name[j] = '\0';
 
 	strcpy(fname, settings->results_path);
-	strcat(fname, CODE_COV_RESULTS_PATH "/");
+	strcat(fname, "/" CODE_COV_RESULTS_PATH "/");
 	strcat(fname, name);
 
 	argv[0] = settings->code_coverage_script;
@@ -1844,17 +1872,6 @@ bool execute(struct execute_state *state,
 		return true;
 	}
 
-	if (settings->enable_code_coverage && !settings->cov_results_per_test) {
-		char *reason = NULL;
-
-		code_coverage_start(settings, -1, &reason);
-		if (reason != NULL) {
-			errf("%s\n", reason);
-			free(reason);
-			status = false;
-		}
-	}
-
 	if ((resdirfd = open(settings->results_path, O_DIRECTORY | O_RDONLY)) < 0) {
 		/* Initialize state should have done this */
 		errf("Error: Failure opening results path %s\n",
@@ -1862,6 +1879,22 @@ bool execute(struct execute_state *state,
 		return false;
 	}
 
+	if (settings->enable_code_coverage) {
+		if (!settings->cov_results_per_test) {
+			char *reason = NULL;
+
+			code_coverage_start(settings, -1, &reason);
+			if (reason != NULL) {
+				errf("%s\n", reason);
+				free(reason);
+				close(resdirfd);
+				return false;
+			}
+		}
+
+		mkdirat(resdirfd, CODE_COV_RESULTS_PATH, 0755);
+	}
+
 	if ((testdirfd = open(settings->test_root, O_DIRECTORY | O_RDONLY)) < 0) {
 		errf("Error: Failure opening test root %s\n",
 		     settings->test_root);
diff --git a/runner/settings.h b/runner/settings.h
index 3c2a3ee9c336..bbd965d27882 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -22,7 +22,7 @@ _Static_assert(ABORT_ALL == (ABORT_TAINT | ABORT_LOCKDEP | ABORT_PING), "ABORT_A
 
 #define GCOV_DIR		"/sys/kernel/debug/gcov"
 #define GCOV_RESET GCOV_DIR	"/reset"
-#define CODE_COV_RESULTS_PATH	"/code_cov"
+#define CODE_COV_RESULTS_PATH	"code_cov"
 
 struct regex_list {
 	char **regex_strings;
-- 
2.35.1
