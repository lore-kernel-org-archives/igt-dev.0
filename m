Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A9BCD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 08:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2BE10E167;
	Wed, 27 May 2026 08:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKFy2yAS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D332510E167
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779871860; x=1811407860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r0LFxAgx0/NHSAjze428vQzFSuy0KhrJlMDqygincIA=;
 b=nKFy2yASLWp7aL6jpgdJf23p5bWXwiPk1A6bZ87Oay2v+9SKunQirjSd
 rYlEUTkektN9puExkDRJQgQ6XwBdtPjVvl+a3WYm9wt/Qavii6aUNhz8Q
 +2TttxJmyYu+8z8zKaOZFWZEsqcb8LjQA/PXX/VrrIP5Zy/OUrGdytVTv
 Fb4TrjV3pFkU+y4ymnjnNYXei2GviRjdWnCXkuWiZKjErCVsSuyNCTRf0
 nB50rLxCScpYzMqOv2PNPrc2HWVHcCzTQFNTfNZ1jRKLfl8Kl9Oi4vdtT
 e1vnswAEVqHIPYMULkH7cfh+KLKzsofX2ICj2eqRh4/+IBG1pjo9Ba7tr g==;
X-CSE-ConnectionGUID: XluOtE4dSdGFFxgahtYSwg==
X-CSE-MsgGUID: WrycWOT6TcybFPhxVj5laA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91268726"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="91268726"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 01:51:00 -0700
X-CSE-ConnectionGUID: d6JKQumbTbyB9U7uYMtv1w==
X-CSE-MsgGUID: DpJ/iUr3Srifb1RyZ75ETg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="244003689"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 01:50:57 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v8 5/7] tests/intel/kms_pm_dc: Add dc3co framedrop
 validation test
Date: Wed, 27 May 2026 14:19:13 +0530
Message-ID: <20260527084915.1916365-6-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527084915.1916365-1-jeevan.b@intel.com>
References: <20260527084915.1916365-1-jeevan.b@intel.com>
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

Add a subtest to verify that DC3CO entry does not introduce frame
drops. The test alternates commits and waits for a kernel vblank
after each commit, ensuring the vblank sequence continues to
advance without stalls or dropped frames. Also verify that the
DC3CO counter increments, confirming that DC3CO is entered
successfully during the test.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 110 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 57dade47d..620ba9329 100644
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
@@ -342,6 +346,82 @@ static void test_dc3co_vpb_simulation(data_t *data)
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
+	int delay;
+	int dc3co_target_flips = 200;
+	int verify_commits = 300;
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
+	delay = (int)(1.5 * (1000000 / data->mode->vrefresh));
+
+	while (committed < verify_commits) {
+		front = !front;
+		igt_plane_set_fb(primary, front ? &data->fb_rgr : &data->fb_rgb);
+		igt_display_commit(&data->display);
+
+		vblank_seq = wait_for_next_vblank_seq(data);
+		if (prev_vblank_seq)
+			igt_assert_f(igt_vblank_after(vblank_seq, prev_vblank_seq),
+				     "Vblank sequence did not advance after commit %d\n",
+				     committed + 1);
+		prev_vblank_seq = vblank_seq;
+		committed++;
+		usleep(delay);
+
+		dc3co_cur_cnt = igt_read_dc_counter(data->debugfs_fd,
+						    IGT_INTEL_CHECK_DC3CO);
+		if (committed >= dc3co_target_flips && dc3co_cur_cnt > dc3co_prev_cnt)
+			dc3co_after_target = true;
+	}
+
+	igt_assert_eq(committed, verify_commits);
+	igt_assert_f(dc3co_after_target,
+		     "DC3CO did not increment after %d flips while validating %d commits\n",
+		     dc3co_target_flips, verify_commits);
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
@@ -693,6 +773,36 @@ int igt_main()
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

