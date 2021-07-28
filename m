Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3EA6E49A
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jul 2021 17:16:20 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id 129so2954014qkg.4
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jul 2021 10:16:20 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 28 Jul 2021 13:16:16 -0400
Message-Id: <20210728171616.2242447-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_flip: Discard any stale event at each
 retry
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
Cc: robdclark@chromium.org, petri.latvala@intel.com, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
On slower devices, non blocking do_page_flip followed by wait_for_events does not finish fast enough to send an event to be consumed by wait_for_events.
Instead, wait_for_events ends up finding an unconsumed event from a
previous do_page_flip (i.e. a skipped preceding subtest) and signals
that the userspace is ready to do another do_page_flip while the first
one hasn't finished yet, resulting in an EBUSY.

[How]
At the beginning of every test running on crtc set, check for any stale
events and consume them so the kernel has no pending events.

Fixes: flip-vs-suspend and flip-vs-suspend-interruptible.
Tested on ChromeOS Volteer(i915-TGL) and Trogdor(msm)

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
Change-Id: I254a84a202140c332312aba1d9edf15ea78b7a61
---
 tests/kms_flip.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index f2fce8d2..0a2041c5 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1261,6 +1261,26 @@ static bool needs_retry_after_link_reset(struct udev_monitor *mon)
 	return hotplug_detected;
 }
 
+static void discard_any_stale_events() {
+	fd_set fds;
+	FD_ZERO(&fds);
+	FD_SET(drm_fd, &fds);
+	struct timeval timeout = { .tv_sec = 3, .tv_usec = 0 };
+	int ret = select(drm_fd + 1, &fds, NULL, NULL, &timeout);
+
+	if (ret > 0) {
+		drmEventContext evctx;
+		memset(&evctx, 0, sizeof evctx);
+		evctx.version = 2;
+		igt_info("Stale Event found - Discarding now\n");
+		drmHandleEvent(drm_fd, &evctx);
+	}
+	else {
+		igt_debug("No stale Event found\n");
+	}
+}
+
+
 static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 				   int crtc_count, int duration_ms)
 {
@@ -1311,6 +1331,9 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 		kmstest_dump_mode(&o->kmode[i]);
 
 retry:
+	// Discard any pending event that hasn't been consumed from a previous retry or subtest.
+	discard_any_stale_events();
+
 	memset(&o->vblank_state, 0, sizeof(o->vblank_state));
 	memset(&o->flip_state, 0, sizeof(o->flip_state));
 	o->flip_state.name = "flip";
-- 
2.32.0.432.gabb21c7263-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
