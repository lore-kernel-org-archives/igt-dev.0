Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B07911323B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 15:41:13 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 May 2022 17:40:42 +0200
Message-Id: <20220517154044.226733-8-mauro.chehab@linux.intel.com>
In-Reply-To: <20220517154044.226733-1-mauro.chehab@linux.intel.com>
References: <20220517154044.226733-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 7/9] lib/igt_core: export kill_children()
 function
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

This function is needed outside igt_core. So, make it exportable,
and allow passing different signs to the children.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_core.c | 12 ++++++------
 lib/igt_core.h |  1 +
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 6dad3c84858f..b6bd67ab400f 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2028,11 +2028,11 @@ void __igt_fail_assert(const char *domain, const char *file, const int line,
 	igt_fail(IGT_EXIT_FAILURE);
 }
 
-static void kill_children(void)
+void igt_kill_children(int signal)
 {
 	for (int c = 0; c < num_test_children; c++) {
 		if (test_children[c] > 0)
-			kill(test_children[c], SIGKILL);
+			kill(test_children[c], signal);
 	}
 }
 
@@ -2060,7 +2060,7 @@ void __igt_abort(const char *domain, const char *file, const int line,
 	}
 
 	/* just try our best, we are aborting the execution anyway */
-	kill_children();
+	igt_kill_children(SIGKILL);
 
 	print_backtrace();
 
@@ -2124,7 +2124,7 @@ void igt_exit(void)
 			 command_str, igt_exitcode);
 	igt_debug("Exiting with status code %d\n", igt_exitcode);
 
-	kill_children();
+	igt_kill_children(SIGKILL);
 	assert(!num_test_children);
 
 	assert(waitpid(-1, &tmp, WNOHANG) == -1 && errno == ECHILD);
@@ -2390,7 +2390,7 @@ int __igt_waitchildren(void)
 				err = 256;
 			}
 
-			kill_children();
+			igt_kill_children(SIGKILL);
 		}
 
 		count++;
@@ -2424,7 +2424,7 @@ static void igt_alarm_killchildren(int signal)
 {
 	igt_info("Timed out waiting for children\n");
 
-	kill_children();
+	igt_kill_children(SIGKILL);
 }
 
 /**
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 78dc6202ced4..526282faff24 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1103,6 +1103,7 @@ bool __igt_fork(void);
 int __igt_waitchildren(void);
 void igt_waitchildren(void);
 void igt_waitchildren_timeout(int seconds, const char *reason);
+void igt_kill_children(int signal);
 
 /**
  * igt_helper_process:
-- 
2.36.1
