Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A874ACD37BE
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 17:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D92710E819;
	Mon, 11 May 2026 17:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USLsbNL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB9D10E819
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778520019; x=1810056019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZgfWEeRCxsc7M9k2AydgA+7cZ+orEXbe70ZWGZlnECg=;
 b=USLsbNL1pUyuUBlZvlWPDIom5Ei3zMfMb1uAC5Vb6NYXoEoE/KhVAKwp
 anxMKyKHYAhT+N9HrLQmqof1HARwD9j30nydwXZzAXlMQwkSsFNWbVvma
 pA3UYUIBFu6NWTLj2rev4gMiSvMKClgeCMgsR808xWs5HVce4m7um9hm1
 SllwYrVo0S7N2jtweVtswGFpQC7/DM2F01mJ4xicAzuFMbOtW3rM8RXOB
 /xGtsHaxGRxaK3v5DCLwY/XuQr/K8J4SeF08axBAoz0I4qn5wt/kRwlhH
 jcwZYFbWhKDySjW63I1N8UsV4rt58JZ7VGdPFCAyO7CE1uFKQjMXhqtWq A==;
X-CSE-ConnectionGUID: +5EOaO9jRj+4tA4K7Zl+tg==
X-CSE-MsgGUID: qWbyJCSbTOqxeOArDithbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="81979857"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="81979857"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 10:20:19 -0700
X-CSE-ConnectionGUID: fONjVrRcRJ+n3CBc6xdnjA==
X-CSE-MsgGUID: vgPWzoV8RSeSVqYh5OnDgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="233192577"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:20:17 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v4 5/7] tests/intel/kms_pm_dc: Add new test for dc3co
 framedrop validation
Date: Mon, 11 May 2026 22:48:18 +0530
Message-ID: <20260511171820.461666-6-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511171820.461666-1-jeevan.b@intel.com>
References: <20260511171820.461666-1-jeevan.b@intel.com>
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

Add a new subtest to validate that no frame drops occur during
DC3CO entry, ensuring that no frame drops are detected and DC3CO
is successfully triggered during the test.

v2: update check_dc3co_framedrop for detecting frame drops via
    drmWaitVBlank vblank sequence numbers, checks DC3CO counter
    to confirm entry and cast variable 'delay'.
v3: Rename function name from check_dc3co* to detect_dc3co*.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 105 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 83652e9f8..22ae51b51 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -51,6 +51,10 @@
  * Description: Make sure that system enters DC3CO when PSR2 is active and system
  *              is in SLEEP state
  *
+ * SUBTEST: dc3co-framedrop-check
+ * Description: Verify that DC3CO entry does not cause frame drops and successfully
+ * 		enters the power state
+ *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
@@ -343,6 +347,87 @@ static void test_dc3co_vpb_simulation(data_t *data, enum psr_mode mode)
 	cleanup_dc3co_fbs(data);
 }
 
+static void detect_dc3co_framedrop(data_t *data)
+{
+	igt_plane_t *primary;
+	uint32_t dc3co_prev_cnt;
+	int delay;
+	int frame_count = 0, frame_drops = 0;
+	int max_count = 60;
+	bool dc3co_flag = false;
+	bool front = false;
+	struct drm_event_vblank ev;
+	uint64_t last_flip_ns = 0, cur_flip_ns;
+	uint64_t frame_time_ns;
+
+	igt_require_f(data->mode->vrefresh != 0, "Invalid vrefresh rate of 0\n");
+
+	frame_time_ns = UINT64_C(1000000000) / data->mode->vrefresh;
+
+	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit(&data->display);
+
+	dc3co_prev_cnt = igt_read_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+
+	delay = (int)(1.5 * (1000000 / data->mode->vrefresh));
+
+	igt_plane_set_fb(primary, &data->fb_rgb);
+	igt_assert_eq(igt_display_try_commit_atomic(&data->display,
+						    DRM_MODE_ATOMIC_NONBLOCK |
+						    DRM_MODE_PAGE_FLIP_EVENT,
+						    data), 0);
+	igt_assert_eq(read(data->drm_fd, &ev, sizeof(ev)), sizeof(ev));
+	last_flip_ns = (uint64_t)ev.tv_sec * UINT64_C(1000000000) +
+		       (uint64_t)ev.tv_usec * 1000;
+
+	while (frame_count < max_count) {
+		front = !front;
+		igt_plane_set_fb(primary, front ? &data->fb_rgr : &data->fb_rgb);
+		usleep(delay);
+
+		igt_assert_eq(igt_display_try_commit_atomic(&data->display,
+							    DRM_MODE_ATOMIC_NONBLOCK |
+							    DRM_MODE_PAGE_FLIP_EVENT,
+							    data), 0);
+
+		igt_set_timeout(2, "Waiting for flip event\n");
+		igt_assert_eq(read(data->drm_fd, &ev, sizeof(ev)), sizeof(ev));
+		igt_reset_timeout();
+
+		cur_flip_ns = (uint64_t)ev.tv_sec * UINT64_C(1000000000) +
+			      (uint64_t)ev.tv_usec * 1000;
+
+		if (last_flip_ns != 0 &&
+		    (cur_flip_ns - last_flip_ns) > 2 * frame_time_ns)
+			frame_drops++;
+
+		last_flip_ns = cur_flip_ns;
+
+		if (!dc3co_flag &&
+		    igt_read_dc_counter(data->debugfs_fd,
+					IGT_INTEL_CHECK_DC3CO) > dc3co_prev_cnt)
+			dc3co_flag = true;
+
+		frame_count++;
+	}
+
+	igt_assert_f(dc3co_flag, "DC3CO was not entered during the test\n");
+	igt_assert_f(frame_drops == 0,
+		     "Frame drops detected: %d drops out of %d frames\n",
+		     frame_drops, frame_count);
+}
+
+static void test_dc3co_framedrop(data_t *data, enum psr_mode mode)
+{
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	setup_output(data);
+	setup_dc3co(data, mode);
+	setup_videoplayback(data);
+	detect_dc3co_framedrop(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_dc5_retention_flops(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -694,6 +779,26 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Validate that no frame drops occur during DC3CO entry "
+		     "while alternating framebuffers with PSR2 or Panel Replay active");
+	igt_subtest_with_dynamic("dc3co-framedrop-check") {
+		igt_dynamic("psr2") {
+			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+						     PSR_MODE_2, NULL));
+			igt_require_f(IS_TIGERLAKE(data.devid) ||
+				      intel_display_ver(data.devid) >= 35,
+				      "Platform does not support DC3CO with PSR2\n");
+			test_dc3co_framedrop(&data, PSR_MODE_2);
+		}
+		igt_dynamic("pr") {
+			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+						     PR_MODE, NULL));
+			igt_require_f(intel_display_ver(data.devid) >= 35,
+				      "Platform does not support DC3CO with Panel Replay\n");
+			test_dc3co_framedrop(&data, PR_MODE);
+		}
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-- 
2.43.0

