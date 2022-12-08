Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50F910E4DC
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Dec 2022 23:38:05 +0100
Message-Id: <20221208223808.66267-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221208223808.66267-1-kamil.konieczny@linux.intel.com>
References: <20221208223808.66267-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/6] lib/tests/igt_fork: add tests for
 igt_multi_fork
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

Create tests for new library macro igt_multi_fork. Also while at
this, change comment into prints which helps testing.

Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/tests/igt_fork.c | 93 +++++++++++++++++++++++++++++++-------------
 1 file changed, 65 insertions(+), 28 deletions(-)

diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c
index d883aba4..163e16a7 100644
--- a/lib/tests/igt_fork.c
+++ b/lib/tests/igt_fork.c
@@ -37,13 +37,20 @@
 char test[] = "test";
 char *fake_argv[] = { test };
 int fake_argc = ARRAY_SIZE(fake_argv);
+int fork_type_dyn;
 
 __noreturn static void igt_fork_vs_skip(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
-	igt_fork(i, 1) {
-		igt_skip("skipping");
+	if (fork_type_dyn) {
+		igt_multi_fork(i, 1) {
+			igt_skip("skipping multi-fork");
+		}
+	} else {
+		igt_fork(i, 1) {
+			igt_skip("skipping fork");
+		}
 	}
 
 	igt_waitchildren();
@@ -55,8 +62,14 @@ __noreturn static void igt_fork_vs_assert(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
-	igt_fork(i, 1) {
-		igt_assert(0);
+	if (fork_type_dyn) {
+		igt_multi_fork(i, 1) {
+			igt_assert(0);
+		}
+	} else {
+		igt_fork(i, 1) {
+			igt_assert(0);
+		}
 	}
 
 	igt_waitchildren();
@@ -68,8 +81,14 @@ __noreturn static void igt_fork_leak(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
-	igt_fork(i, 1) {
-		sleep(10);
+	if (fork_type_dyn) {
+		igt_multi_fork(i, 1) {
+			sleep(10);
+		}
+	} else {
+		igt_fork(i, 1) {
+			sleep(10);
+		}
 	}
 
 	igt_exit();
@@ -97,8 +116,14 @@ __noreturn static void igt_fork_timeout_leak(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
-	igt_fork(i, 1) {
-		sleep(10);
+	if (fork_type_dyn) {
+		igt_multi_fork(i, 1) {
+			sleep(10);
+		}
+	} else {
+		igt_fork(i, 1) {
+			sleep(10);
+		}
 	}
 
 	igt_waitchildren_timeout(1, "library test");
@@ -115,14 +140,19 @@ __noreturn static void subtest_leak(void)
 	igt_subtest_init(fake_argc, fake_argv);
 
 	igt_subtest("fork-leak") {
-		igt_fork(child, num_children)
-			children[child] = getpid();
+		if (fork_type_dyn) {
+			igt_multi_fork(child, num_children)
+				children[child] = getpid();
+		} else {
+			igt_fork(child, num_children)
+				children[child] = getpid();
+		}
 
 		/* leak the children */
 		igt_assert(0);
 	}
 
-	/* We expect the exit_subtest to cleanup after the igt_fork */
+	/* We expect the exit_subtest to cleanup after the igt_fork and igt_multi_fork */
 	for (int i = 0; i < num_children; i++) {
 		if (children[i] > 0)
 			assert(kill(children[i], 0) == -1 && errno == ESRCH);
@@ -137,26 +167,33 @@ int main(int argc, char **argv)
 {
 	int ret;
 
-	/* check that igt_assert is forwarded */
-	ret = do_fork(igt_fork_vs_assert);
-	internal_assert_wexited(ret, IGT_EXIT_FAILURE);
+	for (fork_type_dyn = 0;	fork_type_dyn <= 1; ++fork_type_dyn) {
+		printf("Checking %sfork ...\n", fork_type_dyn ? "multi-" : "");
+
+		printf("\ncheck that igt_assert is forwarded\n");
+		ret = do_fork(igt_fork_vs_assert);
+		internal_assert_wexited(ret, IGT_EXIT_FAILURE);
 
-	/* check that igt_skip within a fork blows up */
-	ret = do_fork(igt_fork_vs_skip);
-	internal_assert_wexited(ret, SIGABRT + 128);
+		printf("\ncheck that igt_skip within a fork blows up\n");
+		ret = do_fork(igt_fork_vs_skip);
+		internal_assert_wexited(ret, SIGABRT + 128);
 
-	/* check that failure to clean up fails */
-	ret = do_fork(igt_fork_leak);
-	internal_assert_wsignaled(ret, SIGABRT);
+		printf("\ncheck that failure to clean up fails\n");
+		ret = do_fork(igt_fork_leak);
+		internal_assert_wsignaled(ret, SIGABRT);
 
-	/* check that igt_waitchildren_timeout cleans up*/
-	ret = do_fork(igt_fork_timeout_leak);
-	internal_assert_wexited(ret, SIGKILL + 128);
+		printf("\ncheck that igt_waitchildren_timeout cleans up\n");
+		ret = do_fork(igt_fork_timeout_leak);
+		internal_assert_wexited(ret, SIGKILL + 128);
 
-	/* check that any other process leaks are caught*/
-	ret = do_fork(plain_fork_leak);
-	internal_assert_wsignaled(ret, SIGABRT);
+		printf("\ncheck that any other process leaks are caught\n");
+		ret = do_fork(plain_fork_leak);
+		internal_assert_wsignaled(ret, SIGABRT);
+
+		printf("\ncheck subtest leak %d\n", fork_type_dyn);
+		ret = do_fork(subtest_leak);
+		internal_assert_wexited(ret, IGT_EXIT_FAILURE); /* not asserted! */
+	}
 
-	ret = do_fork(subtest_leak);
-	internal_assert_wexited(ret, IGT_EXIT_FAILURE); /* not asserted! */
+	printf("SUCCESS all tests passed\n");
 }
-- 
2.34.1
