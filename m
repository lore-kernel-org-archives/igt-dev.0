Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBFB6E334
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 13:04:09 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  3 Feb 2020 13:03:51 +0000
Message-Id: <20200203130351.175879-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200202185649.4105689-1-chris@chris-wilson.co.uk>
References: <20200202185649.4105689-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] lib: Kill residual children at the end
 of a subtest
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

Ensure that we tidy up all the excess children left behind by a failing
subtest, we do not want them loitering into the next!

v2: Behead the undead plague, and throw in a bonus lib/tests

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_core.c       |  7 +++++++
 lib/tests/igt_fork.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index a0bf29408..510417934 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1362,6 +1362,13 @@ static void exit_subtest(const char *result)
 
 	igt_terminate_spins();
 
+	/* If the subtest aborted, it may have left children behind */
+	for (int c = 0; c < num_test_children; c++) {
+		kill(test_children[c], SIGKILL);
+		waitpid(test_children[c], NULL, 0); /* don't leave zombies! */
+	}
+	num_test_children = 0;
+
 	if (!in_dynamic_subtest)
 		_igt_dynamic_tests_executed = -1;
 
diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c
index 7e8b4f9b5..36597553d 100644
--- a/lib/tests/igt_fork.c
+++ b/lib/tests/igt_fork.c
@@ -107,6 +107,48 @@ static int do_fork(void (*test_to_run)(void))
 	}
 }
 
+static int do_subtest(void (*test_to_run)(void))
+{
+	int pid, status;
+	int argc;
+
+	switch (pid = fork()) {
+	case -1:
+		internal_assert(0);
+	case 0:
+		argc = ARRAY_SIZE(argv_run);
+		igt_subtest_init(argc, argv_run);
+		test_to_run();
+		igt_exit();
+	default:
+		while (waitpid(pid, &status, 0) == -1 &&
+		       errno == EINTR)
+			;
+
+		return status;
+	}
+}
+
+static void subtest_leak(void)
+{
+	pid_t *children =
+		mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	const int num_children = 4096 / sizeof(*children);
+
+	igt_subtest("fork-leak") {
+		igt_fork(child, num_children)
+			children[child] = getpid();
+
+		/* leak the children */
+		igt_assert(0);
+	}
+
+	/* We expect the exit_subtest to cleanup after the igt_fork */
+	for (int i = 0; i < num_children; i++)
+		assert(kill(children[i], 0) == -1 && errno == ESRCH);
+
+	munmap(children, 4096);
+}
 
 int main(int argc, char **argv)
 {
@@ -131,4 +173,6 @@ int main(int argc, char **argv)
 	/* check that any other process leaks are caught*/
 	ret = do_fork(plain_fork_leak);
 	internal_assert_wsignaled(ret, SIGABRT);
+
+	do_subtest(subtest_leak);
 }
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
