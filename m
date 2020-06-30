Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ABA6E445
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2020 16:03:55 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue, 30 Jun 2020 19:03:44 +0300
Message-Id: <20200630160344.15886-2-imre.deak@intel.com>
In-Reply-To: <20200630160344.15886-1-imre.deak@intel.com>
References: <20200630160344.15886-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_flip: Check for link reset
 during expired seq vblank wait
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
List-ID: <igt-dev@lists.freedesktop.org>

The expired vblank seq subtests can fail when using certain monitors with a
behavior described in

commit 60e8be7ccc72086a88d2eff3bcd02495fad5fa46
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon May 11 22:08:53 2020 +0300

    tests/kms_flip: Retry test in case of a DP/HDMI link reset

As in the above commit, retry the test once if a hotplug was detected during
the test.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_flip.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 86c5e871..3d60eb58 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -658,8 +658,12 @@ static int set_mode(struct test_output *o, uint32_t fb, int x, int y)
 	return 0;
 }
 
-/* Return mask of completed events. */
-static unsigned int run_test_step(struct test_output *o)
+/*
+ * Return true if the test steps were run successfully, false in case of a
+ * failure that requires rerunning the test steps. On success events will
+ * contain the mask of completed events.
+ */
+static bool run_test_step(struct test_output *o, unsigned int *events)
 {
 	unsigned int new_fb_id;
 	/* for funny reasons page_flip returns -EBUSY on disabled crtcs ... */
@@ -709,7 +713,11 @@ static unsigned int run_test_step(struct test_output *o)
 		end = gettime_us();
 		igt_debug("Vblank took %luus\n", end - start);
 		igt_assert(end - start < 500);
-		igt_assert_eq(reply.sequence, exp_seq);
+		if (reply.sequence != exp_seq) {
+			igt_debug("unexpected vblank seq %u, should be %u\n",
+				  reply.sequence, exp_seq);
+			return false;
+		}
 		igt_assert(timercmp(&reply.ts, &o->flip_state.last_ts, ==));
 	}
 
@@ -839,7 +847,9 @@ static unsigned int run_test_step(struct test_output *o)
 
 	unhang_gpu(drm_fd, hang);
 
-	return completed_events;
+	*events = completed_events;
+
+	return true;
 }
 
 static void update_state(struct event_state *es)
@@ -1079,7 +1089,9 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 	while (1) {
 		unsigned int completed_events;
 
-		completed_events = run_test_step(o);
+		if (!run_test_step(o, &completed_events))
+			return false;
+
 		if (o->pending_events)
 			completed_events |= wait_for_events(o);
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
