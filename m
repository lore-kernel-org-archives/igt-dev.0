Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE57D6EE1D
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Dec 2020 14:07:45 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 11 Dec 2020 16:07:35 +0200
Message-Id: <20201211140735.23262-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Introduce a way to stop testing
 without marking tests incomplete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Killing igt_runner with SIGHUP will now still kill the currently
running test, but it will mark that test as being "notrun" instead of
"incomplete". This allows for external tools to interrupt the testing
without messing the results.

Incidentally, Intel CI's testing procedures occasionally falsely
determine that the machine being tested is unreachable and as its next
step, will ssh in and issue a reboot in preparation for the next round
of testing, causing igt_runner to be killed with a SIGHUP...

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 runner/executor.c  | 17 +++++++++++++++++
 runner/resultgen.c |  9 ++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index faf272d8..d0eca938 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1054,6 +1054,23 @@ static int monitor_output(pid_t child,
 					     get_cmdline(siginfo.ssi_pid, comm, sizeof(comm)),
 					     siginfo.ssi_pid,
 					     strsignal(siginfo.ssi_signo));
+
+					if (siginfo.ssi_signo == SIGHUP) {
+						/*
+						 * If taken down with
+						 * SIGUP, arrange the
+						 * current test to be
+						 * marked as notrun
+						 * instead of
+						 * incomplete
+						 */
+
+						dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n",
+							EXECUTOR_EXIT,
+							-SIGHUP, 0.0);
+						if (settings->sync)
+							fdatasync(outputs[_F_JOURNAL]);
+					}
 				}
 
 				aborting = true;
diff --git a/runner/resultgen.c b/runner/resultgen.c
index 3fe83b43..d291cc37 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -17,11 +17,12 @@
 #include "executor.h"
 #include "output_strings.h"
 
-#define INCOMPLETE_EXITCODE -1
+#define INCOMPLETE_EXITCODE -1234
 
 _Static_assert(INCOMPLETE_EXITCODE != IGT_EXIT_SKIP, "exit code clash");
 _Static_assert(INCOMPLETE_EXITCODE != IGT_EXIT_SUCCESS, "exit code clash");
 _Static_assert(INCOMPLETE_EXITCODE != IGT_EXIT_INVALID, "exit code clash");
+_Static_assert(INCOMPLETE_EXITCODE != -SIGHUP, "exit code clash");
 
 struct subtest
 {
@@ -1099,6 +1100,8 @@ static const char *result_from_exitcode(int exitcode)
 		return "abort";
 	case INCOMPLETE_EXITCODE:
 		return "incomplete";
+	case -SIGHUP:
+		return "notrun";
 	default:
 		return "fail";
 	}
@@ -1173,7 +1176,7 @@ static void fill_from_journal(int fd,
 		}
 	}
 
-	if (subtests->size && exitcode == IGT_EXIT_ABORT) {
+	if (subtests->size && (exitcode == IGT_EXIT_ABORT || exitcode == -SIGHUP)) {
 		char *last_subtest = subtests->subs[subtests->size - 1].name;
 		char subtest_piglit_name[256];
 		struct json_object *subtest_obj;
@@ -1181,7 +1184,7 @@ static void fill_from_journal(int fd,
 		generate_piglit_name(entry->binary, last_subtest, subtest_piglit_name, sizeof(subtest_piglit_name));
 		subtest_obj = get_or_create_json_object(tests, subtest_piglit_name);
 
-		set_result(subtest_obj, "abort");
+		set_result(subtest_obj, exitcode == IGT_EXIT_ABORT ? "abort" : "notrun");
 	}
 
 	if (subtests->size == 0) {
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
