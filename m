Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ABECD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 06:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D6A10EC72;
	Thu, 18 Jun 2026 06:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvjIWVXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BA710EC72
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 06:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781764165; x=1813300165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UvqbDrrcW3f/MadM+9P/hMA0CsjCSu0tERRREu8hyzQ=;
 b=HvjIWVXkOK8dVQMmW9YvPPEL0foiFV9yh6JEz+RHuyIRS6AXHHcGqlpD
 x7bYDRzdPaM+4yzgp/wOftlib+HoAKZ2sQf8LztKXS9uF6NZWZrt/QJps
 FWpPORrI7HsftBNMtSnodVdIOsaCKeq0N5Qae5+Mmmaq7nBZ8E7FTsbax
 Nh9SYTComxslwxzbdoLVB7lm/aOyd8pcMSTUY4UPKqxWepCdzO9q/TPX9
 gUFgNSmF6KeqvKGWZSh8oXzehxH8MP0wd0NF6UgdcaeZrCc55P2Yktzsv
 BPMIXBTkQ88Nve97Ch8WvZALgnw7kTwVgfZS8/S9HjlvoL7rMrf6FNbAr w==;
X-CSE-ConnectionGUID: FJm7p3JHTJ6ltwDm+Bl6fA==
X-CSE-MsgGUID: K4JgHbh7QNuvJFOAC09BNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82485884"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82485884"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:29:24 -0700
X-CSE-ConnectionGUID: 83tx77XsRdGLh4ATwZC83Q==
X-CSE-MsgGUID: oKxRitZlS1iR8FV/hbeKbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="245343021"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:29:23 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v10 5/7] tests/intel/kms_pm_dc: Add dc3co framedrop
 validation test
Date: Thu, 18 Jun 2026 11:59:02 +0530
Message-ID: <20260618062904.2789476-6-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618062904.2789476-1-jeevan.b@intel.com>
References: <20260618062904.2789476-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a subtest to verify that DC3CO entry does not introduce frame
drops. The test alternates commits and waits for a kernel vblank
after each commit, ensuring the vblank sequence continues to
advance without stalls or dropped frames. Also verify that the
DC3CO counter increments, confirming that DC3CO is entered
successfully during the test.

v2: Replaced hardcoded DC3CO framedrop values with named global constants.
    Relaxed vblank validation to allow a 1–2 frame gap, and made DC3CO
    counter reads conditional after the target flip threshold.
v3: Remove TGL check for PSR2.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 114 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 13f884e19..3602ef92f 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -51,6 +51,10 @@
  * Description: Make sure that system enters DC3CO when PSR2 or PR is active and
  *              system is in SLEEP state
  *
+ * SUBTEST: dc3co-framedrop-check
+ * Description: Verify that DC3CO entry does not cause frame drops and successfully
+ *              enters the power state
+ *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
@@ -89,6 +93,10 @@
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || intel_display_ver(devid) >= 14))
 #define SEC 1
 #define MSEC (SEC * 1000)
+#define DC3CO_FRAME_DELAY_FACTOR 1.5
+#define DC3CO_TARGET_FLIPS 200
+#define DC3CO_VERIFY_COMMITS 300
+#define DC3CO_MAX_VBLANK_GAP 2
 
 IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
 
@@ -345,6 +353,86 @@ static void test_dc3co_vpb_simulation(data_t *data)
 	cleanup_dc3co_fbs(data);
 }
 
+static uint32_t wait_for_next_vblank_seq(data_t *data)
+{
+	drmVBlank wait = {};
+	igt_crtc_t *crtc = data->output->pending_crtc;
+
+	igt_assert_f(crtc, "No CRTC bound to output for vblank wait\n");
+
+	wait.request.type = kmstest_get_vbl_flag(crtc->crtc_index) |
+						 DRM_VBLANK_RELATIVE |
+						 DRM_VBLANK_NEXTONMISS;
+	wait.request.sequence = 1;
+	igt_assert_eq(drmWaitVBlank(data->drm_fd, &wait), 0);
+
+	return wait.reply.sequence;
+}
+
+static void detect_dc3co_framedrop(data_t *data)
+{
+	igt_plane_t *primary;
+	uint32_t dc3co_prev_cnt;
+	uint32_t dc3co_cur_cnt;
+	uint32_t prev_vblank_seq = 0;
+	uint32_t vblank_seq;
+	uint32_t vblank_gap;
+	int delay;
+	int committed = 0;
+	bool dc3co_after_target = false;
+	bool front = false;
+
+	igt_require_f(data->mode->vrefresh != 0, "Invalid vrefresh rate of 0\n");
+
+	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit(&data->display);
+
+	dc3co_prev_cnt = igt_read_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+
+	delay = (int)(DC3CO_FRAME_DELAY_FACTOR * (1000000 / data->mode->vrefresh));
+
+	while (committed < DC3CO_VERIFY_COMMITS) {
+		front = !front;
+		igt_plane_set_fb(primary, front ? &data->fb_rgr : &data->fb_rgb);
+		igt_display_commit(&data->display);
+
+		vblank_seq = wait_for_next_vblank_seq(data);
+		if (prev_vblank_seq) {
+			vblank_gap = vblank_seq - prev_vblank_seq;
+			igt_assert_f(igt_vblank_after(vblank_seq, prev_vblank_seq) &&
+				     vblank_gap <= DC3CO_MAX_VBLANK_GAP,
+				     "Unexpected vblank gap %u after commit %d (prev=%u, cur=%u)\n",
+				     vblank_gap, committed + 1, prev_vblank_seq, vblank_seq);
+		}
+		prev_vblank_seq = vblank_seq;
+		committed++;
+		usleep(delay);
+
+		if (committed >= DC3CO_TARGET_FLIPS) {
+			dc3co_cur_cnt = igt_read_dc_counter(data->debugfs_fd,
+						    IGT_INTEL_CHECK_DC3CO);
+			if (dc3co_cur_cnt > dc3co_prev_cnt)
+				dc3co_after_target = true;
+		}
+	}
+
+	igt_assert_eq(committed, DC3CO_VERIFY_COMMITS);
+	igt_assert_f(dc3co_after_target,
+		     "DC3CO did not increment after %d flips while validating %d commits\n",
+		     DC3CO_TARGET_FLIPS, DC3CO_VERIFY_COMMITS);
+}
+
+static void test_dc3co_framedrop(data_t *data)
+{
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	setup_output(data);
+	setup_dc3co(data);
+	setup_videoplayback(data);
+	detect_dc3co_framedrop(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_dc5_retention_flops(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -735,6 +823,32 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Validate that no frame drops occur during DC3CO entry "
+			     "while alternating framebuffers with PSR2 or Panel Replay active");
+	igt_subtest_with_dynamic("dc3co-framedrop-check") {
+		static const struct dc3co_test_mode dc3co_modes[] = {
+			{ PSR_MODE_2, "psr2" },
+			{ PR_MODE,    "pr"   },
+		};
+
+		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
+			const char *name = dc3co_modes[i].name;
+			data.op_psr_mode = dc3co_modes[i].mode;
+
+			igt_dynamic_f("%s", name) {
+				igt_require(psr_sink_support(data.drm_fd,
+						     data.debugfs_fd,
+						     data.op_psr_mode, NULL));
+
+				igt_require_f(intel_display_ver(data.devid) >= 35,
+					      "Platform does not support DC3CO with %s\n",
+					      data.op_psr_mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
+
+				test_dc3co_framedrop(&data);
+			}
+		}
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-- 
2.43.0

