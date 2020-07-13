Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628A66E136
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2020 04:09:37 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon, 13 Jul 2020 09:38:23 +0530
Message-Id: <20200713040823.27495-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t] i915/gem_eio: Added description to
 subtests
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
To: Arjun.Melkaveri@intel.com, igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description to subtests.

Cc: Arjun Melkaveri  <Arjun.Melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_eio.c | 46 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index cfc3f668..70e6a0e5 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -929,31 +929,47 @@ igt_main
 		igt_force_gpu_reset(fd);
 		igt_install_exit_handler(exit_handler);
 	}
-
+	
+	igt_describe("Tests whether throttle ioctl raises EIO when it encounters wedged GPU.");
 	igt_subtest("throttle")
 		test_throttle(fd);
-
+	
+	igt_describe("Tests whether context create ioctl raises EIO when it encounters wedged GPU.");
 	igt_subtest("context-create")
 		test_context_create(fd);
 
+	igt_describe("Tests whether gem execbuf ioctl raises EIO when it encounters wedged GPU.");
 	igt_subtest("execbuf")
 		test_execbuf(fd);
 
+	igt_describe("Test checks if a local context gets banned after triggering too many resets,"
+		     "also checks whether a second context works after the first is banned."
+	             "It applies to platforms with contexts.");	
 	igt_subtest("banned")
 		test_banned(fd);
 
+	igt_describe("Tests if it can suspend to S3 state after wedging the GPU.");
 	igt_subtest("suspend")
 		test_suspend(fd, SUSPEND_STATE_MEM);
 
+	igt_describe("Tests if it can suspend to S4 state(hibernate) after wedging the GPU.");
 	igt_subtest("hibernate")
 		test_suspend(fd, SUSPEND_STATE_DISK);
-
+	
+	igt_describe("It is same as test_inflight but fence is created externally by user. So, that it "
+		     "can be signalled externally via igt_cork_unplug.");
 	igt_subtest("in-flight-external")
 		test_inflight_external(fd);
 
+	igt_describe("For each engine, test tries to create a hang by submitting non-preemptable"
+                     " spinner batch along with a maximum of 63 queued batches.It suspends to "
+		     "s3 state with auto resume delay of 30s and then tries to wedge "
+		     "the GPU after certain time and then checks if -EIO is propagated "
+		     " to those in-flight requests.");
 	igt_subtest("in-flight-suspend")
 		test_inflight_suspend(fd);
-
+	
+	igt_describe("Tests whether work can be submitted and executed after unwedging the GPU.");
 	igt_subtest_group {
 		igt_fixture {
 			igt_require(gem_has_contexts(fd));
@@ -978,23 +994,43 @@ igt_main
 		unsigned int i;
 
 		for (i = 0; i < sizeof(waits) / sizeof(waits[0]); i++) {
+			igt_describe_f("Test tries to submit a non-preemptable spinner batch, "
+				       "hangs the batch after certain wait-%s allowing gpu to reset"
+				       " and then tries to free the submitted spinner.", waits[i].name);
 			igt_subtest_f("wait-%s", waits[i].name)
 				test_wait(fd, 0, waits[i].wait);
 
+			igt_describe_f("Test tries to submit a non-preemptable spinner batch, "
+                                       "hangs the batch after certain wait-%s without allowing gpu "
+				       "to reset and then tries to free the submitted spinner.", waits[i].name);
 			igt_subtest_f("wait-wedge-%s", waits[i].name)
 				test_wait(fd, TEST_WEDGE, waits[i].wait);
-
+			
+			igt_describe_f("For each engine, test tries to create a hang by submitting non-preemptable"
+				       " spinner batch along with a maximum of 63 queued batches. It tries "
+				       "to wedge the GPU after certain wait-%s and then checks if -EIO is "
+				       "propagated to those in-flight requests.", waits[i].name);
 			igt_subtest_f("in-flight-%s", waits[i].name)
 				test_inflight(fd, waits[i].wait);
 
+			igt_describe_f("For each engine, test tries to allocate 64 contexts, creates"
+				       " non-preemptable spinner batch, then executes spinner batch each "
+				       "associated with an context to the size of the shared "
+				       "ring. It tries to wedge the gpu after certain wait-%s and then "
+				       "checks if -EIO is propagated to those in-flight requests.", waits[i].name);
 			igt_subtest_f("in-flight-contexts-%s", waits[i].name)
 				test_inflight_contexts(fd, waits[i].wait);
 
+			igt_describe_f("Tests if we wedged one engine with unready requests "
+				       "to a second engine after certain wait-%s and checks that whether -EIO is "
+				       "propagated to those in-flight requests.", waits[i].name);
 			igt_subtest_f("in-flight-internal-%s", waits[i].name)
 				test_inflight_internal(fd, waits[i].wait);
 		}
 	}
 
+	igt_describe("Test checks whether modesetting can be performed with wedged gpu."
+		     "Modesetting and wedging is done parallely by parent and child.");
 	igt_subtest_group {
 		igt_display_t display = {
 			.drm_fd = -1, .n_pipes = IGT_MAX_PIPES
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
