Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CEDCD6E79
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 03:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E039110E075;
	Tue,  9 Jun 2026 03:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5jTAqFV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB8810E075
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 03:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780976830; x=1812512830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VIKuwKdTIfMgq97jVX276/E+hQ4J3M5XEmUGPaAPoRo=;
 b=S5jTAqFVYhTr5Xma/kLtIBfG+JYcqzQYhk87IVNaq64nQYcRWpehssEV
 yghrTzi+Wx3UKIYLleFNg1aKqnxJhOosClMd8G3iha0N2X6GXLAcdr1zS
 EeFk/MGhf+u2BXSGtqQP/J808jZdm0jcORmh0TC+3NUrguCJqNCzviVBQ
 iugwV2dBUS5ezn8rhLoDdkSorENysJBUM/7TH/5K4E17srL8RLYfMX+nh
 0XHAfka1q/Ji5KS6Bz3zqDgqKkdsheFySc/IhLs7GA9QjBx3L1aMv6rza
 L6yvp5fGvrdJ8AuJWVdHJ1uoFe41auS4Aw5sjOKHH0JPRzqYVtnFDTLW7 w==;
X-CSE-ConnectionGUID: fY1v4ym4T7Ks99ayl5oLhw==
X-CSE-MsgGUID: pHMzJ0wyQ5OOuzbYCGJutg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92050899"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="92050899"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 20:47:09 -0700
X-CSE-ConnectionGUID: pHN12/b8T2qmuKlBKhQmQw==
X-CSE-MsgGUID: IZYOmkh1RFWHYClag6wD2g==
X-ExtLoop1: 1
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 20:47:08 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v9 5/7] tests/intel/kms_pm_dc: Add dc3co framedrop
 validation test
Date: Tue,  9 Jun 2026 09:16:48 +0530
Message-ID: <20260609034650.2281712-6-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609034650.2281712-1-jeevan.b@intel.com>
References: <20260609034650.2281712-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 118 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 57dade47d..48b2e87a3 100644
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
@@ -86,6 +90,10 @@
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || intel_display_ver(devid) >= 14))
 #define SEC 1
 #define MSEC (SEC * 1000)
+#define DC3CO_FRAME_DELAY_FACTOR 1.5
+#define DC3CO_TARGET_FLIPS 200
+#define DC3CO_VERIFY_COMMITS 300
+#define DC3CO_MAX_VBLANK_GAP 2
 
 IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
 
@@ -342,6 +350,86 @@ static void test_dc3co_vpb_simulation(data_t *data)
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
@@ -693,6 +781,36 @@ int igt_main()
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
+				if (data.op_psr_mode == PSR_MODE_2)
+					igt_require_f(IS_TIGERLAKE(data.devid) ||
+						      intel_display_ver(data.devid) >= 35,
+						      "Platform does not support DC3CO with PSR2\n");
+				else
+					igt_require_f(intel_display_ver(data.devid) >= 35,
+						      "Platform does not support DC3CO with Panel Replay\n");
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

