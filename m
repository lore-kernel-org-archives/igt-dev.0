Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15ABD6EAAA
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2020 13:21:44 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 12 Feb 2020 15:21:15 +0200
Message-ID: <20200212132123.108506-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
References: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/9] lib/tests: Extract fork helpers
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Because of excessive 'copy and paste' we ended up with multiple copies
of almost the same fork helper. This patch extracts the do_fork helper
out and switches all the tests over to it.

Additionally, preemptively I have extracted the more fancy fork helper
that captures stderr/out + related functions out of igt_describe tests.

Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/tests/igt_assert.c               |  35 +++----
 lib/tests/igt_conflicting_args.c     |  25 ++---
 lib/tests/igt_describe.c             | 135 ++++++---------------------
 lib/tests/igt_dynamic_subtests.c     |  18 ----
 lib/tests/igt_fork.c                 |  71 ++++++--------
 lib/tests/igt_invalid_subtest_name.c |  18 ----
 lib/tests/igt_no_exit.c              |  18 ----
 lib/tests/igt_segfault.c             |  59 +++++-------
 lib/tests/igt_simulation.c           | 101 +++++++++-----------
 lib/tests/igt_tests_common.h         |  91 ++++++++++++++++++
 10 files changed, 232 insertions(+), 339 deletions(-)

diff --git a/lib/tests/igt_assert.c b/lib/tests/igt_assert.c
index 1caf5d88..c94ac698 100644
--- a/lib/tests/igt_assert.c
+++ b/lib/tests/igt_assert.c
@@ -38,8 +38,6 @@
 
 #include "igt_tests_common.h"
 
-char test[] = "test";
-char *argv_run[] = { test };
 void (*test_to_run)(void) = NULL;
 
 /*
@@ -55,26 +53,17 @@ void (*test_to_run)(void) = NULL;
 	exec_total++; \
 }
 
-static int do_fork(void)
+static void fake_test(void)
 {
-	int pid, status;
-	int argc;
-
-	switch (pid = fork()) {
-	case -1:
-		internal_assert(0);
-	case 0:
-		argc = ARRAY_SIZE(argv_run);
-		igt_simple_init(argc, argv_run);
-		test_to_run();
-		igt_exit();
-	default:
-		while (waitpid(pid, &status, 0) == -1 &&
-		       errno == EINTR)
-			;
-
-		return status;
-	}
+	char test[] = "test";
+	char *argv_run[] = { test };
+	int argc = ARRAY_SIZE(argv_run);
+
+	igt_simple_init(argc, argv_run);
+
+	test_to_run();
+
+	igt_exit();
 }
 
 static void test_cmpint_negative(void)
@@ -150,7 +139,7 @@ igt_main
 	 * we inherit the state from the parent, so ...
 	 */
 	test_to_run = test_cmpint_negative;
-	ret = do_fork();
+	ret = do_fork(fake_test);
 	igt_subtest("igt_cmpint_negative")
 		internal_assert_wexited(ret, IGT_EXIT_FAILURE);
 
@@ -158,7 +147,7 @@ igt_main
 		test_fd();
 
 	test_to_run = test_fd_negative;
-	ret = do_fork();
+	ret = do_fork(fake_test);
 	igt_subtest("igt_assert_fd_negative")
 		internal_assert_wexited(ret, IGT_EXIT_FAILURE);
 }
diff --git a/lib/tests/igt_conflicting_args.c b/lib/tests/igt_conflicting_args.c
index f600abd4..b644fd4b 100644
--- a/lib/tests/igt_conflicting_args.c
+++ b/lib/tests/igt_conflicting_args.c
@@ -43,25 +43,12 @@ static int opt_handler(int option, int option_index, void *input)
 	return 0;
 }
 
-static int do_fork(void)
+static void fake_test(void)
 {
 	char test_name[] = "test";
-
 	char *argv[] = { test_name };
 	int argc = ARRAY_SIZE(argv);
 
-	pid_t pid = fork();
-	internal_assert(pid != -1);
-
-	if (pid) {
-		int status;
-		while (waitpid(pid, &status, 0) == -1 && errno == EINTR)
-			;
-
-		return status;
-	}
-
-
 	igt_subtest_init_parse_opts(&argc, argv, short_options, long_options,
 				    "", opt_handler, NULL);
 	igt_subtest("dummy") {}
@@ -73,27 +60,27 @@ int main(int argc, char **argv)
 	/* no conflict */
 	long_options[0] = (struct option) { "iterations", required_argument, NULL, 'i'};
 	short_options = "";
-	internal_assert_wexited(do_fork(), 0);
+	internal_assert_wexited(do_fork(fake_test), 0);
 
 	/* conflict on short option */
 	long_options[0] = (struct option) { "iterations", required_argument, NULL, 'i'};
 	short_options = "h";
-	internal_assert_wsignaled(do_fork(), SIGABRT);
+	internal_assert_wsignaled(do_fork(fake_test), SIGABRT);
 
 	/* conflict on long option name */
 	long_options[0] = (struct option) { "help", required_argument, NULL, 'i'};
 	short_options = "";
-	internal_assert_wsignaled(do_fork(), SIGABRT);
+	internal_assert_wsignaled(do_fork(fake_test), SIGABRT);
 
 	/* conflict on long option 'val' representation vs short option */
 	long_options[0] = (struct option) { "iterations", required_argument, NULL, 'h'};
 	short_options = "";
-	internal_assert_wsignaled(do_fork(), SIGABRT);
+	internal_assert_wsignaled(do_fork(fake_test), SIGABRT);
 
 	/* conflict on long option 'val' representations */
 	long_options[0] = (struct option) { "iterations", required_argument, NULL, 500};
 	short_options = "";
-	internal_assert_wsignaled(do_fork(), SIGABRT);
+	internal_assert_wsignaled(do_fork(fake_test), SIGABRT);
 
 	return 0;
 }
diff --git a/lib/tests/igt_describe.c b/lib/tests/igt_describe.c
index 6f3a4319..7b4fa9af 100644
--- a/lib/tests/igt_describe.c
+++ b/lib/tests/igt_describe.c
@@ -28,9 +28,15 @@
 #include "drmtest.h"
 #include "igt_tests_common.h"
 
+char prog[] = "igt_describe";
+char fake_arg[100];
+char *fake_argv[] = {prog, fake_arg};
+int fake_argc = ARRAY_SIZE(fake_argv);
+
 IGT_TEST_DESCRIPTION("the top level description");
-static void fake_main(int argc, char **argv) {
-	igt_subtest_init(argc, argv);
+static void fake_main(void)
+{
+	igt_subtest_init(fake_argc, fake_argv);
 
 	igt_describe("Basic A");
 	igt_subtest("A")
@@ -101,33 +107,33 @@ static void fake_main(int argc, char **argv) {
 static const char DESCRIBE_ALL_OUTPUT[] = \
 	"the top level description\n"
 	"\n"
-	"SUB A ../lib/tests/igt_describe.c:36:\n"
+	"SUB A ../lib/tests/igt_describe.c:42:\n"
 	"  Basic A\n"
 	"\n"
-	"SUB B ../lib/tests/igt_describe.c:45:\n"
+	"SUB B ../lib/tests/igt_describe.c:51:\n"
 	"  Group with B, C & D\n"
 	"\n"
 	"  Basic B\n"
 	"\n"
-	"SUB C ../lib/tests/igt_describe.c:54:\n"
+	"SUB C ../lib/tests/igt_describe.c:60:\n"
 	"  Group with B, C & D\n"
 	"\n"
 	"  Group with C & D\n"
 	"\n"
 	"  Basic C\n"
 	"\n"
-	"SUB D ../lib/tests/igt_describe.c:58:\n"
+	"SUB D ../lib/tests/igt_describe.c:64:\n"
 	"  Group with B, C & D\n"
 	"\n"
 	"  Group with C & D\n"
 	"\n"
-	"SUB E ../lib/tests/igt_describe.c:66:\n"
+	"SUB E ../lib/tests/igt_describe.c:72:\n"
 	"  NO DOCUMENTATION!\n"
 	"\n"
-	"SUB F ../lib/tests/igt_describe.c:71:\n"
+	"SUB F ../lib/tests/igt_describe.c:77:\n"
 	"  NO DOCUMENTATION!\n"
 	"\n"
-	"SUB G ../lib/tests/igt_describe.c:80:\n"
+	"SUB G ../lib/tests/igt_describe.c:86:\n"
 	"  this description should be so long that it wraps itself nicely in the terminal this\n"
 	"  description should be so long that it wraps itself nicely in the terminal this description\n"
 	"  should be so long that it wraps itself nicely in the terminal this description should be so\n"
@@ -135,17 +141,17 @@ static const char DESCRIBE_ALL_OUTPUT[] = \
 	"  wraps itself nicely in the terminal this description should be so long that it wraps itself\n"
 	"  nicely in the terminal\n"
 	"\n"
-	"SUB F ../lib/tests/igt_describe.c:87:\n"
+	"SUB F ../lib/tests/igt_describe.c:93:\n"
 	"  verylongwordthatshoudlbeprintedeventhoughitspastthewrppinglimitverylongwordthatshoudlbeprintedeventhoughitspastthewrappinglimit\n"
 	"  verylongwordthatshoudlbeprintedeventhoughitspastthewrappinglimitverylongwordthatshoudlbeprintedeventhoughitspastthewrappinglimit\n"
 	"\n"
-	"SUB G ../lib/tests/igt_describe.c:91:\n"
+	"SUB G ../lib/tests/igt_describe.c:97:\n"
 	"  Subtest with dynamic subsubtests\n\n";
 
 static const char JUST_C_OUTPUT[] = \
 	"the top level description\n"
 	"\n"
-	"SUB C ../lib/tests/igt_describe.c:54:\n"
+	"SUB C ../lib/tests/igt_describe.c:60:\n"
 	"  Group with B, C & D\n"
 	"\n"
 	"  Group with C & D\n"
@@ -153,95 +159,22 @@ static const char JUST_C_OUTPUT[] = \
 	"  Basic C\n"
 	"\n";
 
-static void assert_pipe_empty(int fd)
-{
-	char buf[5];
-	internal_assert(0 == read(fd, buf, sizeof(buf)));
-}
-
-static void read_whole_pipe(int fd, char *buf, size_t buflen)
-{
-	ssize_t readlen;
-	off_t offset;
-
-	offset = 0;
-	while ((readlen = read(fd, buf+offset, buflen-offset))) {
-		if (readlen == -1) {
-			if (errno == EINTR) {
-				continue;
-			} else {
-				printf("read failed with %s\n", strerror(errno));
-				exit(1);
-			}
-		}
-		internal_assert(readlen != -1);
-		offset += readlen;
-	}
-}
-
-static pid_t do_fork(int argc, char **argv, int *out, int *err)
-{
-	int outfd[2], errfd[2];
-	pid_t pid;
-
-	internal_assert(pipe(outfd) != -1);
-	internal_assert(pipe(errfd) != -1);
-
-	pid = fork();
-	internal_assert(pid != -1);
-
-	if (pid == 0) {
-		while (dup2(outfd[1], STDOUT_FILENO) == -1 && errno == EINTR) {}
-		while (dup2(errfd[1], STDERR_FILENO) == -1 && errno == EINTR) {}
-
-		close(outfd[0]);
-		close(outfd[1]);
-		close(errfd[0]);
-		close(errfd[1]);
-
-		fake_main(argc, argv);
-
-		exit(-1);
-	} else {
-		/* close the writing ends */
-		close(outfd[1]);
-		close(errfd[1]);
-
-		*out = outfd[0];
-		*err = errfd[0];
-
-		return pid;
-	}
-}
-
-static int _wait(pid_t pid, int *status) {
-	int ret;
-
-	do {
-		ret = waitpid(pid, status, 0);
-	} while (ret == -1 && errno == EINTR);
-
-	return ret;
-}
-
 int main(int argc, char **argv)
 {
-	char prog[] = "igt_describe";
 	int status;
 	int outfd, errfd;
+	pid_t pid;
 
 	/* describe all subtest */ {
 		static char out[4096];
-		char arg[] = "--describe";
-		char *fake_argv[] = {prog, arg};
-		int fake_argc = ARRAY_SIZE(fake_argv);
+		strncpy(fake_arg, "--describe", sizeof(fake_arg));
 
-		pid_t pid = do_fork(fake_argc, fake_argv, &outfd, &errfd);
+		pid = do_fork_bg_with_pipes(fake_main, &outfd, &errfd);
 
 		read_whole_pipe(outfd, out, sizeof(out));
 		assert_pipe_empty(errfd);
 
-		internal_assert(_wait(pid, &status) != -1);
+		internal_assert(safe_wait(pid, &status) != -1);
 		internal_assert(WIFEXITED(status));
 		internal_assert(WEXITSTATUS(status) == IGT_EXIT_SUCCESS);
 		internal_assert(0 == strcmp(DESCRIBE_ALL_OUTPUT, out));
@@ -252,16 +185,14 @@ int main(int argc, char **argv)
 
 	/* describe C using a pattern */ {
 		static char out[4096];
-		char arg[] = "--describe=C";
-		char *fake_argv[] = {prog, arg};
-		int fake_argc = ARRAY_SIZE(fake_argv);
+		strncpy(fake_arg, "--describe=C", sizeof(fake_arg));
 
-		pid_t pid = do_fork(fake_argc, fake_argv, &outfd, &errfd);
+		pid = do_fork_bg_with_pipes(fake_main, &outfd, &errfd);
 
 		read_whole_pipe(outfd, out, sizeof(out));
 		assert_pipe_empty(errfd);
 
-		internal_assert(_wait(pid, &status) != -1);
+		internal_assert(safe_wait(pid, &status) != -1);
 		internal_assert(WIFEXITED(status));
 		internal_assert(WEXITSTATUS(status) == IGT_EXIT_SUCCESS);
 		internal_assert(0 == strcmp(JUST_C_OUTPUT, out));
@@ -272,15 +203,13 @@ int main(int argc, char **argv)
 
 	/* fail describing with a bad pattern */ {
 		static char err[4096];
-		char arg[] = "--describe=Z";
-		char *fake_argv[] = {prog, arg};
-		int fake_argc = ARRAY_SIZE(fake_argv);
+		strncpy(fake_arg, "--describe=Z", sizeof(fake_arg));
 
-		pid_t pid = do_fork(fake_argc, fake_argv, &outfd, &errfd);
+		pid = do_fork_bg_with_pipes(fake_main, &outfd, &errfd);
 
 		read_whole_pipe(errfd, err, sizeof(err));
 
-		internal_assert(_wait(pid, &status) != -1);
+		internal_assert(safe_wait(pid, &status) != -1);
 		internal_assert(WIFEXITED(status));
 		internal_assert(WEXITSTATUS(status) == IGT_EXIT_INVALID);
 		internal_assert(strstr(err, "Unknown subtest: Z"));
@@ -291,15 +220,13 @@ int main(int argc, char **argv)
 
 	/* trying to igt_describe a dynamic subsubtest should assert */ {
 		static char err[4096];
-		char arg[] = "--run-subtest=G";
-		char *fake_argv[] = {prog, arg};
-		int fake_argc = ARRAY_SIZE(fake_argv);
+		strncpy(fake_arg, "--run-subtest=G", sizeof(fake_arg));
 
-		pid_t pid = do_fork(fake_argc, fake_argv, &outfd, &errfd);
+		pid = do_fork_bg_with_pipes(fake_main, &outfd, &errfd);
 
 		read_whole_pipe(errfd, err, sizeof(err));
 
-		internal_assert(_wait(pid, &status) != -1);
+		internal_assert(safe_wait(pid, &status) != -1);
 		internal_assert_wsignaled(status, SIGABRT);
 
 		close(outfd);
diff --git a/lib/tests/igt_dynamic_subtests.c b/lib/tests/igt_dynamic_subtests.c
index 606104c5..bd1e1675 100644
--- a/lib/tests/igt_dynamic_subtests.c
+++ b/lib/tests/igt_dynamic_subtests.c
@@ -29,24 +29,6 @@
 
 #include "igt_tests_common.h"
 
-static int do_fork(void (*test_to_run)(void))
-{
-	int pid, status;
-
-	switch (pid = fork()) {
-	case -1:
-		internal_assert(0);
-	case 0:
-		test_to_run();
-	default:
-		while (waitpid(pid, &status, 0) == -1 &&
-		       errno == EINTR)
-			;
-
-		return status;
-	}
-}
-
 static void dynamic_subtest_in_normal_subtest(void)
 {
 	char prog[] = "igt_no_exit";
diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c
index e30584fd..4fd0e0c8 100644
--- a/lib/tests/igt_fork.c
+++ b/lib/tests/igt_fork.c
@@ -35,37 +35,52 @@
 #include "igt_tests_common.h"
 
 char test[] = "test";
-char *argv_run[] = { test };
+char *fake_argv[] = { test };
+int fake_argc = ARRAY_SIZE(fake_argv);
 
 static void igt_fork_vs_skip(void)
 {
+	igt_simple_init(fake_argc, fake_argv);
+
 	igt_fork(i, 1) {
 		igt_skip("skipping");
 	}
 
 	igt_waitchildren();
+
+	igt_exit();
 }
 
 static void igt_fork_vs_assert(void)
 {
+	igt_simple_init(fake_argc, fake_argv);
+
 	igt_fork(i, 1) {
 		igt_assert(0);
 	}
 
 	igt_waitchildren();
+
+	igt_exit();
 }
 
 static void igt_fork_leak(void)
 {
+	igt_simple_init(fake_argc, fake_argv);
+
 	igt_fork(i, 1) {
 		sleep(10);
 	}
+
+	igt_exit();
 }
 
 static void plain_fork_leak(void)
 {
 	int pid;
 
+	igt_simple_init(fake_argc, fake_argv);
+
 	switch (pid = fork()) {
 	case -1:
 		internal_assert(0);
@@ -74,59 +89,21 @@ static void plain_fork_leak(void)
 	default:
 		exit(0);
 	}
+
+	igt_exit();
 }
 
 static void igt_fork_timeout_leak(void)
 {
+	igt_simple_init(fake_argc, fake_argv);
+
 	igt_fork(i, 1) {
 		sleep(10);
 	}
 
 	igt_waitchildren_timeout(1, "library test");
-}
-
-static int do_fork(void (*test_to_run)(void))
-{
-	int pid, status;
-	int argc;
-
-	switch (pid = fork()) {
-	case -1:
-		internal_assert(0);
-	case 0:
-		argc = ARRAY_SIZE(argv_run);
-		igt_simple_init(argc, argv_run);
-		test_to_run();
-		igt_exit();
-	default:
-		while (waitpid(pid, &status, 0) == -1 &&
-		       errno == EINTR)
-			;
-
-		return status;
-	}
-}
-
-static int do_subtest(void (*test_to_run)(void))
-{
-	int pid, status;
-	int argc;
-
-	switch (pid = fork()) {
-	case -1:
-		internal_assert(0);
-	case 0:
-		argc = ARRAY_SIZE(argv_run);
-		igt_subtest_init(argc, argv_run);
-		test_to_run();
-		igt_exit();
-	default:
-		while (waitpid(pid, &status, 0) == -1 &&
-		       errno == EINTR)
-			;
 
-		return status;
-	}
+	igt_exit();
 }
 
 static void subtest_leak(void)
@@ -135,6 +112,8 @@ static void subtest_leak(void)
 		mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	const int num_children = 4096 / sizeof(*children);
 
+	igt_subtest_init(fake_argc, fake_argv);
+
 	igt_subtest("fork-leak") {
 		igt_fork(child, num_children)
 			children[child] = getpid();
@@ -148,6 +127,8 @@ static void subtest_leak(void)
 		assert(kill(children[i], 0) == -1 && errno == ESRCH);
 
 	munmap(children, 4096);
+
+	igt_exit();
 }
 
 int main(int argc, char **argv)
@@ -174,6 +155,6 @@ int main(int argc, char **argv)
 	ret = do_fork(plain_fork_leak);
 	internal_assert_wsignaled(ret, SIGABRT);
 
-	ret = do_subtest(subtest_leak);
+	ret = do_fork(subtest_leak);
 	internal_assert_wexited(ret, IGT_EXIT_FAILURE); /* not asserted! */
 }
diff --git a/lib/tests/igt_invalid_subtest_name.c b/lib/tests/igt_invalid_subtest_name.c
index 92e767ab..32c4bcbc 100644
--- a/lib/tests/igt_invalid_subtest_name.c
+++ b/lib/tests/igt_invalid_subtest_name.c
@@ -60,24 +60,6 @@ static void nonexisting_subtest(void)
 	igt_exit();
 }
 
-static int do_fork(void (*test_to_run)(void))
-{
-	int pid, status;
-
-	switch (pid = fork()) {
-	case -1:
-		internal_assert(0);
-	case 0:
-		test_to_run();
-	default:
-		while (waitpid(pid, &status, 0) == -1 &&
-		       errno == EINTR)
-			;
-
-		return status;
-	}
-}
-
 int main(int argc, char **argv)
 {
 	int ret;
diff --git a/lib/tests/igt_no_exit.c b/lib/tests/igt_no_exit.c
index 82f00b52..d303eba7 100644
--- a/lib/tests/igt_no_exit.c
+++ b/lib/tests/igt_no_exit.c
@@ -56,24 +56,6 @@ static void no_exit(void)
 		;
 }
 
-static int do_fork(void (*test_to_run)(void))
-{
-	int pid, status;
-
-	switch (pid = fork()) {
-	case -1:
-		internal_assert(0);
-	case 0:
-		test_to_run();
-	default:
-		while (waitpid(pid, &status, 0) == -1 &&
-		       errno == EINTR)
-			;
-
-		return status;
-	}
-}
-
 int main(int argc, char **argv)
 {
 	int ret;
diff --git a/lib/tests/igt_segfault.c b/lib/tests/igt_segfault.c
index 0d872f67..38c040a6 100644
--- a/lib/tests/igt_segfault.c
+++ b/lib/tests/igt_segfault.c
@@ -48,51 +48,38 @@
 bool simple;
 bool runa;
 bool runc;
-char test[] = "test";
-char *argv_run[] = { test };
 
 static void crashme(void)
 {
 	raise(SIGSEGV);
 }
 
-static int do_fork(void)
+static void fake_test(void)
 {
-	int pid, status;
-	int argc;
-
-	switch (pid = fork()) {
-	case -1:
-		internal_assert(0);
-	case 0:
-		argc = ARRAY_SIZE(argv_run);
-		if (simple) {
-			igt_simple_init(argc, argv_run);
-			crashme();
+	char prog[] = "test";
+	char *fake_argv[] = { prog };
+	int fake_argc = ARRAY_SIZE(fake_argv);
 
-			igt_exit();
-		} else {
-			igt_subtest_init(argc, argv_run);
 
-			if(runa)
-				igt_subtest("A")
-					;
+	if (simple) {
+		igt_simple_init(fake_argc, fake_argv);
+		crashme();
 
-			igt_subtest("B")
-				crashme();
+		igt_exit();
+	} else {
+		igt_subtest_init(fake_argc, fake_argv);
+		if(runa)
+			igt_subtest("A")
+				;
 
-			if(runc)
-				igt_subtest("C")
-					;
+		igt_subtest("B")
+			crashme();
 
-			igt_exit();
-		}
-	default:
-		while (waitpid(pid, &status, 0) == -1 &&
-		       errno == EINTR)
-			;
+		if(runc)
+			igt_subtest("C")
+				;
 
-		return status;
+		igt_exit();
 	}
 }
 
@@ -104,20 +91,20 @@ int main(int argc, char **argv)
 	runc=false;
 	igt_info("Simple test.\n");
 	fflush(stdout);
-	internal_assert_wsignaled(do_fork(), SIGSEGV);
+	internal_assert_wsignaled(do_fork(fake_test), SIGSEGV);
 
 	/* Test crash in a single subtest is reported */
 	simple = false;
 	igt_info("Single subtest.\n");
 	fflush(stdout);
-	internal_assert_wexited(do_fork(), SIGSEGV + 128);
+	internal_assert_wexited(do_fork(fake_test), SIGSEGV + 128);
 
 	/* Test crash in a subtest following a pass is reported */
 	simple = false;
 	runa=true;
 	igt_info("Passing then crashing subtest.\n");
 	fflush(stdout);
-	internal_assert_wexited(do_fork(), SIGSEGV + 128);
+	internal_assert_wexited(do_fork(fake_test), SIGSEGV + 128);
 
 	/* Test crash in a subtest preceeding a pass is reported */
 	simple = false;
@@ -125,7 +112,7 @@ int main(int argc, char **argv)
 	runc=true;
 	igt_info("Crashing then passing subtest.\n");
 	fflush(stdout);
-	internal_assert_wexited(do_fork(), SIGSEGV + 128);
+	internal_assert_wexited(do_fork(fake_test), SIGSEGV + 128);
 
 	return 0;
 }
diff --git a/lib/tests/igt_simulation.c b/lib/tests/igt_simulation.c
index 3f3cd88f..a0ea7000 100644
--- a/lib/tests/igt_simulation.c
+++ b/lib/tests/igt_simulation.c
@@ -40,59 +40,44 @@ bool list_subtests;
 bool in_fixture;
 bool in_subtest;
 
-char test[] = "test";
-char list[] = "--list-subtests";
-char *argv_list[] = { test, list };
-char *argv_run[] = { test };
-
-static int do_fork(void)
+static void fake_test(void)
 {
-	int pid, status;
+	char test[] = "test";
+	char list[] = "--list-subtests";
+	char *argv_list[] = { test, list };
+	char *argv_run[] = { test };
 	int argc;
 
-	switch (pid = fork()) {
-	case -1:
-		internal_assert(0);
-	case 0:
-		if (simple) {
-			argc = 1;
-			igt_simple_init(argc, argv_run);
+	if (simple) {
+		argc = 1;
+		igt_simple_init(argc, argv_run);
 
-			igt_skip_on_simulation();
+		igt_skip_on_simulation();
 
-			igt_exit();
+		igt_exit();
+	} else {
+		if (list_subtests) {
+			argc = 2;
+			igt_subtest_init(argc, argv_list);
 		} else {
-			if (list_subtests) {
-				argc = 2;
-				igt_subtest_init(argc, argv_list);
-			} else {
-				argc = 1;
-				igt_subtest_init(argc, argv_run);
-			}
-
-			if (in_fixture) {
-				igt_fixture
-					igt_skip_on_simulation();
-			} if (in_subtest) {
-				igt_subtest("sim")
-					igt_skip_on_simulation();
-			} else
-				igt_skip_on_simulation();
-
-			if (!in_subtest)
-				igt_subtest("foo")
-					;
-
-			igt_exit();
+			argc = 1;
+			igt_subtest_init(argc, argv_run);
 		}
-	default:
-		while (waitpid(pid, &status, 0) == -1 &&
-		       errno == EINTR)
-			;
 
-		internal_assert(WIFEXITED(status));
+		if (in_fixture) {
+			igt_fixture
+				igt_skip_on_simulation();
+		} if (in_subtest) {
+			igt_subtest("sim")
+				igt_skip_on_simulation();
+		} else
+			igt_skip_on_simulation();
+
+		if (!in_subtest)
+			igt_subtest("foo")
+				;
 
-		return status;
+		igt_exit();
 	}
 }
 
@@ -101,10 +86,10 @@ int main(int argc, char **argv)
 	/* simple tests */
 	simple = true;
 	internal_assert(setenv("INTEL_SIMULATION", "1", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SKIP);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SKIP);
 
 	internal_assert(setenv("INTEL_SIMULATION", "0", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SUCCESS);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SUCCESS);
 
 	/* subtests, list mode */
 	simple = false;
@@ -112,28 +97,28 @@ int main(int argc, char **argv)
 
 	in_fixture = false;
 	internal_assert(setenv("INTEL_SIMULATION", "1", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SUCCESS);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SUCCESS);
 
 	internal_assert(setenv("INTEL_SIMULATION", "0", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SUCCESS);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SUCCESS);
 
 	in_fixture = true;
 	internal_assert(setenv("INTEL_SIMULATION", "1", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SUCCESS);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SUCCESS);
 
 
 	internal_assert(setenv("INTEL_SIMULATION", "0", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SUCCESS);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SUCCESS);
 
 
 	in_fixture = false;
 	in_subtest = true;
 	internal_assert(setenv("INTEL_SIMULATION", "1", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SUCCESS);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SUCCESS);
 
 
 	internal_assert(setenv("INTEL_SIMULATION", "0", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SUCCESS);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SUCCESS);
 
 
 	/* subtest, run mode */
@@ -142,29 +127,29 @@ int main(int argc, char **argv)
 
 	in_fixture = false;
 	internal_assert(setenv("INTEL_SIMULATION", "1", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SKIP);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SKIP);
 
 	internal_assert(setenv("INTEL_SIMULATION", "0", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SUCCESS);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SUCCESS);
 
 
 	in_fixture = true;
 	internal_assert(setenv("INTEL_SIMULATION", "1", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SKIP);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SKIP);
 
 
 	internal_assert(setenv("INTEL_SIMULATION", "0", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SUCCESS);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SUCCESS);
 
 
 	in_fixture = false;
 	in_subtest = true;
 	internal_assert(setenv("INTEL_SIMULATION", "1", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SKIP);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SKIP);
 
 
 	internal_assert(setenv("INTEL_SIMULATION", "0", 1) == 0);
-	internal_assert(WEXITSTATUS(do_fork()) == IGT_EXIT_SUCCESS);
+	internal_assert(WEXITSTATUS(do_fork(fake_test)) == IGT_EXIT_SUCCESS);
 
 
 	return 0;
diff --git a/lib/tests/igt_tests_common.h b/lib/tests/igt_tests_common.h
index e66ee37c..b3da3b34 100644
--- a/lib/tests/igt_tests_common.h
+++ b/lib/tests/igt_tests_common.h
@@ -26,6 +26,8 @@
 #define IGT_LIB_TESTS_COMMON_H
 
 #include <assert.h>
+#include <sys/wait.h>
+#include <errno.h>
 
 /*
  * We need to hide assert from the cocci igt test refactor spatch.
@@ -46,4 +48,93 @@ static inline void internal_assert_wsignaled(int wstatus, int signal)
 	internal_assert(WIFSIGNALED(wstatus) &&
 			WTERMSIG(wstatus) == signal);
 }
+
+static inline int do_fork(void (*test_to_run)(void))
+{
+	int pid, status;
+
+	switch (pid = fork()) {
+	case -1:
+		internal_assert(0);
+	case 0:
+		test_to_run();
+	default:
+		while (waitpid(pid, &status, 0) == -1 &&
+		       errno == EINTR)
+			;
+
+		return status;
+	}
+}
+
+static inline pid_t do_fork_bg_with_pipes(void (*test_to_run)(void), int *out, int *err)
+{
+	int outfd[2], errfd[2];
+	pid_t pid;
+
+	internal_assert(pipe(outfd) != -1);
+	internal_assert(pipe(errfd) != -1);
+
+	pid = fork();
+	internal_assert(pid != -1);
+
+	if (pid == 0) {
+		while (dup2(outfd[1], STDOUT_FILENO) == -1 && errno == EINTR) {}
+		while (dup2(errfd[1], STDERR_FILENO) == -1 && errno == EINTR) {}
+
+		close(outfd[0]);
+		close(outfd[1]);
+		close(errfd[0]);
+		close(errfd[1]);
+
+		test_to_run();
+
+		exit(-1);
+	} else {
+		/* close the writing ends */
+		close(outfd[1]);
+		close(errfd[1]);
+
+		*out = outfd[0];
+		*err = errfd[0];
+
+		return pid;
+	}
+}
+
+static inline int safe_wait(pid_t pid, int *status) {
+	int ret;
+
+	do {
+		ret = waitpid(pid, status, 0);
+	} while (ret == -1 && errno == EINTR);
+
+	return ret;
+}
+
+static inline void assert_pipe_empty(int fd)
+{
+	char buf[5];
+	internal_assert(0 == read(fd, buf, sizeof(buf)));
+}
+
+static inline void read_whole_pipe(int fd, char *buf, size_t buflen)
+{
+	ssize_t readlen;
+	off_t offset;
+
+	offset = 0;
+	while ((readlen = read(fd, buf+offset, buflen-offset))) {
+		if (readlen == -1) {
+			if (errno == EINTR) {
+				continue;
+			} else {
+				printf("read failed with %s\n", strerror(errno));
+				exit(1);
+			}
+		}
+		internal_assert(readlen != -1);
+		offset += readlen;
+	}
+}
 #endif
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
