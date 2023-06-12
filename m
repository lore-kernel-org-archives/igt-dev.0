Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEEB10E0C7
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 17:21:10 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 12 Jun 2023 19:19:08 +0200
Message-Id: <20230612171908.29906-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] igt_core: Avoid exit_subtest in subthread
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

From: Petri Latvala <petri.latvala@intel.com>

If a thread crashes, the signal handler for SIGSEGV and pals try to
make the subtest fail and eventually longjmps out of the
subtest. Naturally this can cause multiple threads to yield subtest
results and other weirdness.

We already check for non-main-thread in igt_fail_assert() but the path
from a signal handler to subtest exit doesn't have such protection.

Cc: Petri Latvala <adrinael@adrinael.net>
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index cd9c2002d..1d8e3a6ee 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1585,6 +1585,11 @@ __noreturn static void exit_subtest(const char *result)
 	struct timespec *thentime = in_dynamic_subtest ? &dynamic_subtest_time : &subtest_time;
 	jmp_buf *jmptarget = in_dynamic_subtest ? &igt_dynamic_jmpbuf : &igt_subtest_jmpbuf;
 
+	if (!igt_thread_is_main()) {
+		igt_thread_fail();
+		pthread_exit(NULL);
+	}
+
 	igt_gettime(&now);
 
 	if (test_multi_fork_child)
-- 
2.39.2
