Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E48CF0438
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 09:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D38910E6B7;
	Wed,  9 Oct 2024 09:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1zcsm8d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D82310E6B7
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 09:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728467467; x=1760003467;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tKuHqvA9Kv6bBPUJTpA8Zj6YmLeDWyIaArCzbwcqxzE=;
 b=d1zcsm8dVK22BrNFGpzly1Vs8TWgT0rYmlMXTnNdBTEFgyKrK7OExXm0
 vGK1Tp8h/CkBCNaRMRQZRgsSO58JTHA3a8xy++qNvcL+K7B9emwFZw6nO
 VwDkNT8nyL35xMNinbwPkvb5lOCJXGuOI/lU0BQ4mE7TNPT1WDCsK0Aqp
 mpZMg+mxYnfj+dx1Xd/f+lWnaZrKKF1ShEtm32Uw8KUnJEGiv6NDxxvP9
 x+VjBy161welSk+ShbHBX0AAS11duWCsB8dRX7yjFyOOPEe1k4eXwW97G
 UxgaUCQNN3t01LE0E3jqvYEKHO7m6i5qZNZgF7WSVo/Pl9NAaQntiKWea A==;
X-CSE-ConnectionGUID: SNb305Z8QrytkBpqp2TVzw==
X-CSE-MsgGUID: k5BINbw2RIG8CyeHJgpQzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27648442"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27648442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 02:51:07 -0700
X-CSE-ConnectionGUID: gVMOhw3bQYyDkNQVRIHuMw==
X-CSE-MsgGUID: qzZT0N54StC8bPyymMWTuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="75789029"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2024 02:51:06 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Add DC5 retention flops test
Date: Mon, 27 Mar 2023 23:42:02 +0530
Message-Id: <20230327181202.6797-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

This test validates the display engine entry to DC5 state while
eDP PSR is active on Pipe B from display version 30 onwards.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 55 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 541e94cb5..820a9dec3 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -80,6 +80,10 @@
  * SUBTEST: deep-pkgc
  * Description: This test validates display engine entry to PKGC10 state for extended vblank
  * Functionality: pm_dc
+ *
+ * SUBTEST: dc5-retention-flops
+ * Description: This test validates display engine entry to DC5 state while PSR is active on Pipe B
+ * Functionality: pm_dc
  */
 
 /* DC State Flags */
@@ -122,6 +126,31 @@ typedef struct {
 static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_count);
 static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
+static void set_output_on_pipe_b(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		drmModeConnectorPtr c = output->config.connector;
+
+		/* DC5 with PIPE_B transaction */
+		if (pipe != PIPE_B)
+			continue;
+
+		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		igt_output_set_pipe(output, pipe);
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
+
+		data->output = output;
+		data->mode = igt_output_get_mode(output);
+	}
+}
+
 static void setup_output(data_t *data)
 {
 	igt_display_t *display = &data->display;
@@ -396,6 +425,19 @@ static void psr_dpms(data_t *data, int mode)
 	}
 }
 
+static void test_dc5_retention_flops(data_t *data, int dc_flag)
+{
+	uint32_t dc_counter_before_psr;
+
+	require_dc_counter(data->debugfs_fd, dc_flag);
+	dc_counter_before_psr = read_dc_counter(data->debugfs_fd, dc_flag);
+	set_output_on_pipe_b(data);
+	setup_primary(data);
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
+	check_dc_counter(data, dc_flag, dc_counter_before_psr);
+	cleanup_dc_psr(data);
+}
+
 static void test_dc_state_psr(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -784,6 +826,19 @@ igt_main
 		test_dc_state_dpms(&data, CHECK_DC5);
 	}
 
+	igt_describe("This test validates display engine entry to DC5 state "
+		     "while PSR is active on Pipe B");
+	igt_subtest("dc5-retention-flops") {
+		igt_require_f(intel_display_ver(data.devid) >= 30,
+			      "Test not supported on this platform.\n");
+		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     PSR_MODE_1, NULL));
+		data.op_psr_mode = PSR_MODE_1;
+		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
+		igt_require(!psr_disabled_check(data.debugfs_fd));
+		test_dc5_retention_flops(&data, CHECK_DC5);
+	}
+
 	igt_describe("This test validates negative scenario of DC5 display "
 		     "engine entry to DC5 state while all connectors's DPMS "
 		     "property set to ON");
-- 
2.25.1

