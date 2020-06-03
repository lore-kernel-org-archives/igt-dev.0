Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7F789944
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2020 15:43:57 +0000 (UTC)
From: "Hebenstreit, Michael" <michael.hebenstreit@intel.com>
Date: Wed, 3 Jun 2020 15:43:45 +0000
Message-ID: <BL0PR11MB3028FFDDE4A2DE97349AD804EF880@BL0PR11MB3028.namprd11.prod.outlook.com>
References: <20200603125414.1027845-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200603125414.1027845-1-arkadiusz.hiler@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_core: Don't kill the world
 after a failed fork
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
To: "Hiler, Arkadiusz" <arkadiusz.hiler@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>, "Yang,
 Fei" <fei.yang@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Confirmed the patch work - but leaves a question

Shouldn't this test case then report a fail as I do not allow all forks?

10/293 lib: igt_fork                           OK       3.37 s

-----Original Message-----
From: Hiler, Arkadiusz <arkadiusz.hiler@intel.com> 
Sent: Wednesday, June 03, 2020 06:54
To: igt-dev@lists.freedesktop.org
Cc: Yang, Fei <fei.yang@intel.com>; Hebenstreit, Michael <michael.hebenstreit@intel.com>; Latvala, Petri <petri.latvala@intel.com>
Subject: [PATCH i-g-t] lib/igt_core: Don't kill the world after a failed fork

If we fail to fork (e.g. due to restrictive limits) -1 gets written as PID of our child and we assert out.

The cleanup that happens afterwards tries to kill all our children, which ends up in kill(-1, SIGKILL) which is not good.

This patch makes sure of two things:
 * -1 doesn't get written down as our child
 * when we are killing children we make sure that pid > 0

Reported-by: Fei Yang <fei.yang@intel.com>
Cc: Michael Hebenstreit <michael.hebenstreit@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/igt_core.c       | 19 +++++++++++--------
 lib/tests/igt_fork.c |  6 ++++--
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c index f8ccc8d2..cbcc3f4d 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1399,8 +1399,10 @@ static void exit_subtest(const char *result)
 
 	/* If the subtest aborted, it may have left children behind */
 	for (int c = 0; c < num_test_children; c++) {
-		kill(test_children[c], SIGKILL);
-		waitpid(test_children[c], NULL, 0); /* don't leave zombies! */
+		if (test_children[c] > 0) {
+			kill(test_children[c], SIGKILL);
+			waitpid(test_children[c], NULL, 0); /* don't leave zombies! */
+		}
 	}
 	num_test_children = 0;
 
@@ -1986,8 +1988,10 @@ void __igt_fail_assert(const char *domain, const char *file, const int line,
 
 static void kill_children(void)
 {
-	for (int c = 0; c < num_test_children; c++)
-		kill(test_children[c], SIGKILL);
+	for (int c = 0; c < num_test_children; c++) {
+		if (test_children[c] > 0)
+			kill(test_children[c], SIGKILL);
+	}
 }
 
 void __igt_abort(const char *domain, const char *file, const int line, @@ -2276,6 +2280,7 @@ bool __igt_fork(void)
 
 	switch (test_children[num_test_children++] = fork()) {
 	case -1:
+		num_test_children--; /* so we won't kill(-1) during cleanup */
 		igt_assert(0);
 	case 0:
 		test_child = true;
@@ -2335,8 +2340,7 @@ int __igt_waitchildren(void)
 				err = 256;
 			}
 
-			for (c = 0; c < num_test_children; c++)
-				kill(test_children[c], SIGKILL);
+			kill_children();
 		}
 
 		count++;
@@ -2370,8 +2374,7 @@ static void igt_alarm_killchildren(int signal)  {
 	igt_info("Timed out waiting for children\n");
 
-	for (int c = 0; c < num_test_children; c++)
-		kill(test_children[c], SIGKILL);
+	kill_children();
 }
 
 /**
diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c index 4fd0e0c8..84492b2d 100644
--- a/lib/tests/igt_fork.c
+++ b/lib/tests/igt_fork.c
@@ -123,8 +123,10 @@ static void subtest_leak(void)
 	}
 
 	/* We expect the exit_subtest to cleanup after the igt_fork */
-	for (int i = 0; i < num_children; i++)
-		assert(kill(children[i], 0) == -1 && errno == ESRCH);
+	for (int i = 0; i < num_children; i++) {
+		if (children[i] > 0)
+			assert(kill(children[i], 0) == -1 && errno == ESRCH);
+	}
 
 	munmap(children, 4096);
 
--
2.25.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
