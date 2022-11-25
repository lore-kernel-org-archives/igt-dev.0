Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D8B10E745
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 12:02:19 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Nov 2022 13:01:45 +0100
Message-Id: <20221125120148.28490-6-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221125120148.28490-1-kamil.konieczny@linux.intel.com>
References: <20221125120148.28490-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH v3 5/8] lib/tests/igt_fork: change comments
 into prints
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

Print some info about what is tested to simplify debugging.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/tests/igt_fork.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c
index b3a97fd1..54a8b8b9 100644
--- a/lib/tests/igt_fork.c
+++ b/lib/tests/igt_fork.c
@@ -170,26 +170,27 @@ int main(int argc, char **argv)
 	for (fork_type_dyn = 0;	fork_type_dyn <= 1; ++fork_type_dyn) {
 		printf("Checking fork%s ...\n", fork_type_dyn ? "_dyn" : "");
 
-		/* check that igt_assert is forwarded */
+		printf("\ncheck that igt_assert is forwarded\n");
 		ret = do_fork(igt_fork_vs_assert);
 		internal_assert_wexited(ret, IGT_EXIT_FAILURE);
 
-		/* check that igt_skip within a fork blows up */
+		printf("\ncheck that igt_skip within a fork blows up\n");
 		ret = do_fork(igt_fork_vs_skip);
 		internal_assert_wexited(ret, SIGABRT + 128);
 
-		/* check that failure to clean up fails */
+		printf("\ncheck that failure to clean up fails\n");
 		ret = do_fork(igt_fork_leak);
 		internal_assert_wsignaled(ret, SIGABRT);
 
-		/* check that igt_waitchildren_timeout cleans up*/
+		printf("\ncheck that igt_waitchildren_timeout cleans up\n");
 		ret = do_fork(igt_fork_timeout_leak);
 		internal_assert_wexited(ret, SIGKILL + 128);
 
-		/* check that any other process leaks are caught*/
+		printf("\ncheck that any other process leaks are caught\n");
 		ret = do_fork(plain_fork_leak);
 		internal_assert_wsignaled(ret, SIGABRT);
 
+		printf("\ncheck subtest leak %d\n", fork_type_dyn);
 		ret = do_fork(subtest_leak);
 		internal_assert_wexited(ret, IGT_EXIT_FAILURE); /* not asserted! */
 	}
-- 
2.34.1
