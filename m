Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1B1CD3423
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 05:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99BB10E36F;
	Mon,  4 May 2026 05:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXU2TJZy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387F610E36F
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 05:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777873744; x=1809409744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XytQaNfg5aJY9PJ+QPyisdy+me52vfBrlG0uG8BnI9Y=;
 b=MXU2TJZyTvduhuU+jPuM7SnhaorEDlslebKRbP59dOOLTvgmv++/4GH9
 WGYNmHxtpn4p/7/MOA/J6it1M+nnk/Uxu1LVKFgOrgTKI4RTBTJGyBl0p
 gF48t9+RJbtODBmgmZpv5ySMWCOWdkoHxxDxykZXTEu4lOY+Hh2OJtozR
 tmaoL4ZbGlTPMzZsnrSJptuthwVZxTEjip8jQ+L41jEXdxINghcFM5/If
 ZrZKEPy3s8x0Owv22231IGeudBYv7UXdmzbh1jGuim252SsdLKfXFPtxp
 NMFsHtx2VXZael0vvAym9wXM8+RZ8zKYBQ2REaiUpetupbMgUYRHqEe85 g==;
X-CSE-ConnectionGUID: OOLEXPAcR4q/zeEhMYhu9Q==
X-CSE-MsgGUID: DXnAJ2aTSBSVR37x9jQ47g==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78660686"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78660686"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 22:49:04 -0700
X-CSE-ConnectionGUID: bYLkYKgRTYWiA9matmUIGw==
X-CSE-MsgGUID: SuaMKdYNRKSfAistvIknLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="265769638"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 22:49:02 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, Karthik B S <karthik.b.s@intel.com>,
 S Sebinraj <s.sebinraj@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending IN_FENCE waits
 on test failures
Date: Mon,  4 May 2026 11:15:12 +0530
Message-ID: <20260504054512.2192437-1-karthik.b.s@intel.com>
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

Cc: S Sebinraj <s.sebinraj@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_explicit_fence.c | 58 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
index 2ec9bf39d..7ffdcb285 100644
--- a/tests/kms_explicit_fence.c
+++ b/tests/kms_explicit_fence.c
@@ -68,6 +68,42 @@ typedef struct {
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
+	bool active;
+} pending_fence_state = {
+	.timelines = { -1, -1, -1 },
+};
+
+static void signal_pending_fences(int sig)
+{
+	if (!pending_fence_state.active)
+		return;
+
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
+	}
+
+	pending_fence_state.active = false;
+}
+
 static void setup_output(data_t *data)
 {
 	igt_display_t *display = &data->display;
@@ -242,8 +278,14 @@ static void multiplane_atomic_fence_wait(data_t *data)
 
 		/* Attach IN_FENCE_FD to plane */
 		igt_plane_set_fence_fd(planes[i], fences[i]);
+
+		pending_fence_state.timelines[i] = timelines[i];
+		pending_fence_state.needs_signal[i] = !should_signal[i];
 	}
 
+	/* Arm the exit handler before the NONBLOCK commit goes out. */
+	pending_fence_state.active = true;
+
 	/* Swap overlay colors to detect scanout changes via CRC */
 	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
 	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
@@ -299,6 +341,7 @@ static void multiplane_atomic_fence_wait(data_t *data)
 	igt_assert_crc_equal(&crc_before, &crc_after);
 
 	/* Now signal the blocking fence (overlay2) */
+	pending_fence_state.needs_signal[PLANE_OVERLAY2_IDX] = false;
 	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
 
 	/* Wait for overlay2 fence to be signaled */
@@ -311,6 +354,12 @@ static void multiplane_atomic_fence_wait(data_t *data)
 	igt_assert_eq(ret, 0);
 	igt_assert_eq(sync_fence_status(out_fence), 1);
 
+	/*
+	 * The pending atomic commit has now completed, so the exit handler
+	 * no longer needs to rescue it.
+	 */
+	pending_fence_state.active = false;
+
 	/* Verify display has now updated (CRC should differ from baseline) */
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_final);
 
@@ -353,6 +402,13 @@ int igt_main()
 
 		data.pipe_crc = igt_pipe_crc_new(data.drm_fd, data.crtc->crtc_index,
 						 IGT_PIPE_CRC_SOURCE_AUTO);
+
+		/*
+		 * Make sure that on any failure mid-test, any unsignaled
+		 * IN_FENCE that the kernel is still waiting on gets
+		 * signaled so cleanup can complete instead of hanging.
+		 */
+		igt_install_exit_handler(signal_pending_fences);
 	}
 
 	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay) "
@@ -363,6 +419,8 @@ int igt_main()
 		multiplane_atomic_fence_wait(&data);
 
 	igt_fixture() {
+		signal_pending_fences(0);
+
 		reset_display_state(&data);
 		igt_pipe_crc_free(data.pipe_crc);
 		cleanup_crtc(&data);
-- 
2.43.0

