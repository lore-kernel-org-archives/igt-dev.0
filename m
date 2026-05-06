Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63345CD3436
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 09:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D053510E194;
	Wed,  6 May 2026 09:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6y3nYr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CB910E194
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 09:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778059111; x=1809595111;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rSGroz+SeBTjlLu+Nu40K/IdDVl3FUkUYzpEnwlPT1U=;
 b=m6y3nYr7aKdyyJuRGOXzdqvyZDKrdd/Mp8y3IE602Nir9GoqMoHgxJqt
 688B/6yNTOprVVQ+N/o4mpVrgosli+9qzS+hMfs05XzemVSFQ7pc82jD8
 d0dW6NbOzzndAQrfYRh1MzqI/aMlSstiS9KfIAPzT8tZ7tKkDVThVgBfs
 Ucv6Ok2Fd1BU+VG666KNADAyedaQRWoDWpjbcF1siUHrZiSUKrZf7yAQ5
 8thcuczjvRO6Ze5+222UvUSLhCOBJTHf9cX4RqkN5F2G1+/PgwcrAQ0mM
 3LlBTnxNxbLlx0DeJyhfbXQf5JvRFPfLh+tHFaPHgtLJ7Hd5jYSgXvmvt A==;
X-CSE-ConnectionGUID: rYtsLGoZSeimjzJnIqTwgg==
X-CSE-MsgGUID: CLDWeMZDR26nsvppEqsCcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78992299"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="78992299"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 02:18:31 -0700
X-CSE-ConnectionGUID: DHiDNlmTQx6O+IilFwUU0w==
X-CSE-MsgGUID: 5g3c2gyVRXKzri7wD6ixEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="259782750"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 02:18:29 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, Karthik B S <karthik.b.s@intel.com>,
 S Sebinraj <s.sebinraj@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_explicit_fence: Rescue pending IN_FENCE
 waits on test failures
Date: Wed,  6 May 2026 14:44:42 +0530
Message-ID: <20260506091442.2241511-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Track per-plane timeline/fence state across the in-flight NONBLOCK atomic
commit and install an exit handler to signal any still-unsignaled fences.
This prevents cleanup hangs when an assertion fires after commit
submission but before the test signals the blocking fence.

V2:
 - Drop the redundant 'active' variable
 - Reset timelines[i] to -1 in signal_pending_fences()

Cc: S Sebinraj <s.sebinraj@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: S Sebinraj <s.sebinraj@intel.com>
---
 tests/kms_explicit_fence.c | 44 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
index 2ec9bf39d..930f5a970 100644
--- a/tests/kms_explicit_fence.c
+++ b/tests/kms_explicit_fence.c
@@ -68,6 +68,38 @@ typedef struct {
 	igt_pipe_crc_t *pipe_crc;
 } data_t;
 
+/*
+ * State tracked across the lifetime of an in-flight atomic commit that has
+ * IN_FENCEs attached. The exit handler uses this to unblock any pending
+ * commit if an assert hits between the commit and the point where
+ * the test would otherwise signal the unsignaled fence(s).
+ */
+static struct {
+	int timelines[NUM_PLANES];
+	bool needs_signal[NUM_PLANES];
+} pending_fence_state = {
+	.timelines = { -1, -1, -1 },
+};
+
+static void signal_pending_fences(int sig)
+{
+	for (int i = 0; i < NUM_PLANES; i++) {
+		if (pending_fence_state.timelines[i] < 0)
+			continue;
+
+		if (pending_fence_state.needs_signal[i]) {
+			/*
+			 * Best-effort: advance the timeline so the kernel
+			 * stops waiting on this IN_FENCE.
+			 */
+			sw_sync_timeline_inc(pending_fence_state.timelines[i], 1);
+			pending_fence_state.needs_signal[i] = false;
+		}
+
+		pending_fence_state.timelines[i] = -1;
+	}
+}
+
 static void setup_output(data_t *data)
 {
 	igt_display_t *display = &data->display;
@@ -242,6 +274,9 @@ static void multiplane_atomic_fence_wait(data_t *data)
 
 		/* Attach IN_FENCE_FD to plane */
 		igt_plane_set_fence_fd(planes[i], fences[i]);
+
+		pending_fence_state.timelines[i] = timelines[i];
+		pending_fence_state.needs_signal[i] = !should_signal[i];
 	}
 
 	/* Swap overlay colors to detect scanout changes via CRC */
@@ -299,6 +334,7 @@ static void multiplane_atomic_fence_wait(data_t *data)
 	igt_assert_crc_equal(&crc_before, &crc_after);
 
 	/* Now signal the blocking fence (overlay2) */
+	pending_fence_state.needs_signal[PLANE_OVERLAY2_IDX] = false;
 	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
 
 	/* Wait for overlay2 fence to be signaled */
@@ -353,6 +389,13 @@ int igt_main()
 
 		data.pipe_crc = igt_pipe_crc_new(data.drm_fd, data.crtc->crtc_index,
 						 IGT_PIPE_CRC_SOURCE_AUTO);
+
+		/*
+		 * Make sure that on a failure mid-test, any unsignalled
+		 * IN_FENCE that the kernel is still waiting on gets
+		 * signaled so cleanup can complete instead of hanging.
+		 */
+		igt_install_exit_handler(signal_pending_fences);
 	}
 
 	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay) "
@@ -363,6 +406,7 @@ int igt_main()
 		multiplane_atomic_fence_wait(&data);
 
 	igt_fixture() {
+		signal_pending_fences(0);
 		reset_display_state(&data);
 		igt_pipe_crc_free(data.pipe_crc);
 		cleanup_crtc(&data);
-- 
2.43.0

