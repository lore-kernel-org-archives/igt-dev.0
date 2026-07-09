Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD8AC44501
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 05:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087E710E002;
	Thu,  9 Jul 2026 05:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLg/9Jqf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405DE10E002
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 05:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783573755; x=1815109755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RLS6HobtWfMjUQdhGA4tpRwr+8ETXKWH6oGOu6S4oLM=;
 b=HLg/9Jqfm8saQRYvmBE6wnQSr5z0pB3+dpeQ6rJ/JuKT4pCC7cjdDjOG
 am4VYmPeY4yDTCwJNiIYIwnJnYiHnPK/ncjqsalwsJab1tkF+G9p4kTPL
 kCmmPS5AP49z0M+dhkhGc5+sT2YHkLAZ1yU+PexRczqw9foMvCLfhNIRs
 8IzKyJXzC+cvVQE/q+Lby9Y9Jhm70CSZdUuGgdModmQvgoQcnLHsnTzfu
 cyUusm4gjBY+j5PrChIE+FSSWlnEIYohvU00UmrratOAPSvaMTW925MVX
 fyhGfjT5MdGqebGrK/cJyWInbBxmV1eR7tTFKW3W/lPTjDoln08dJKi2p w==;
X-CSE-ConnectionGUID: qnTjdDzYTBCM4d9/ztoG/A==
X-CSE-MsgGUID: cNVHegMoRzWDRAPx0nkLlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107041449"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="107041449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 22:09:14 -0700
X-CSE-ConnectionGUID: aAmPsMoGSgyzAUB7veCDcw==
X-CSE-MsgGUID: tg8NVPlPQ6GFBEv+bB6BKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="256396504"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 22:09:12 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Detect frame drops via page-flip
 events
Date: Thu,  9 Jul 2026 10:39:05 +0530
Message-ID: <20260709050905.4077066-1-jeevan.b@intel.com>
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

The DC3CO frame-drop test currently waits for a vblank after committing
a new framebuffer, which does not guarantee that the frame was actually
presented.

Switch to page flips and wait for the corresponding completion event,
which confirms that the frame reached scanout. The test now alternates
between two framebuffers using page flips, preserving the playback-like
cadence needed to exercise DC3CO entry/exit transitions.

Keep the existing vblank-gap validation, but derive the sequence number
from the completed page flip instead of an independently waited vblank.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 69 +++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 17 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index ef53c5f96..da077a2dc 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -362,30 +362,60 @@ static void test_dc3co_vpb_simulation(data_t *data)
 	cleanup_dc3co_fbs(data);
 }
 
-static uint32_t wait_for_next_vblank_seq(data_t *data)
+struct dc3co_flip {
+	bool done;
+	unsigned int seq;
+};
+
+static void dc3co_flip_handler(int fd, unsigned int seq, unsigned int tv_sec,
+			       unsigned int tv_usec, void *user_data)
 {
-	drmVBlank wait = {};
-	igt_crtc_t *crtc = data->output->pending_crtc;
+	struct dc3co_flip *flip = user_data;
 
-	igt_assert_f(crtc, "No CRTC bound to output for vblank wait\n");
+	flip->seq = seq;
+	flip->done = true;
+}
 
-	wait.request.type = kmstest_get_vbl_flag(crtc->crtc_index) |
-						 DRM_VBLANK_RELATIVE |
-						 DRM_VBLANK_NEXTONMISS;
-	wait.request.sequence = 1;
-	igt_assert_eq(drmWaitVBlank(data->drm_fd, &wait), 0);
+static unsigned int dc3co_flip_and_wait(data_t *data, uint32_t crtc_id,
+					uint32_t fb_id, int frame_time_us)
+{
+	drmEventContext evctx = {
+		.version = 2,
+		.page_flip_handler = dc3co_flip_handler,
+	};
+	struct dc3co_flip flip = {};
+	struct pollfd pfd = {
+		.fd = data->drm_fd,
+		.events = POLLIN,
+	};
+	int timeout_ms = (DC3CO_MAX_VBLANK_GAP + 2) * frame_time_us / 1000;
+
+	if (timeout_ms < 50)
+		timeout_ms = 50;
 
-	return wait.reply.sequence;
+	igt_assert_eq(drmModePageFlip(data->drm_fd, crtc_id, fb_id,
+				      DRM_MODE_PAGE_FLIP_EVENT, &flip), 0);
+
+	while (!flip.done) {
+		igt_assert_f(poll(&pfd, 1, timeout_ms) > 0,
+			     "Frame dropped: no page flip completion within %d ms "
+			     "during DC3CO entry/exit\n", timeout_ms);
+		igt_assert_eq(drmHandleEvent(data->drm_fd, &evctx), 0);
+	}
+
+	return flip.seq;
 }
 
 static void detect_dc3co_framedrop(data_t *data)
 {
 	igt_plane_t *primary;
+	igt_crtc_t *crtc;
 	uint32_t dc3co_prev_cnt;
 	uint32_t dc3co_cur_cnt;
 	uint32_t prev_vblank_seq = 0;
 	uint32_t vblank_seq;
 	uint32_t vblank_gap;
+	int frame_time_us;
 	int delay;
 	int committed = 0;
 	bool dc3co_after_target = false;
@@ -393,25 +423,30 @@ static void detect_dc3co_framedrop(data_t *data)
 
 	igt_require_f(data->mode->vrefresh != 0, "Invalid vrefresh rate of 0\n");
 
+	crtc = data->output->pending_crtc;
+	igt_assert_f(crtc, "No CRTC bound to output\n");
+
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(primary, NULL);
+
+	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
 
 	dc3co_prev_cnt = igt_read_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
 
-	delay = (int)(DC3CO_FRAME_DELAY_FACTOR * (1000000 / data->mode->vrefresh));
+	frame_time_us = 1000000 / data->mode->vrefresh;
+	delay = (int)(DC3CO_FRAME_DELAY_FACTOR * frame_time_us);
 
 	while (committed < DC3CO_VERIFY_COMMITS) {
 		front = !front;
-		igt_plane_set_fb(primary, front ? &data->fb_rgr : &data->fb_rgb);
-		igt_display_commit(&data->display);
-
-		vblank_seq = wait_for_next_vblank_seq(data);
+		vblank_seq = dc3co_flip_and_wait(data, crtc->crtc_id,
+						 front ? data->fb_rgr.fb_id :
+							 data->fb_rgb.fb_id,
+						 frame_time_us);
 		if (prev_vblank_seq) {
 			vblank_gap = vblank_seq - prev_vblank_seq;
 			igt_assert_f(igt_vblank_after(vblank_seq, prev_vblank_seq) &&
 				     vblank_gap <= DC3CO_MAX_VBLANK_GAP,
-				     "Unexpected vblank gap %u after commit %d (prev=%u, cur=%u)\n",
+				     "Frame drop: unexpected vblank gap %u after commit %d (prev=%u, cur=%u)\n",
 				     vblank_gap, committed + 1, prev_vblank_seq, vblank_seq);
 		}
 		prev_vblank_seq = vblank_seq;
-- 
2.43.0

