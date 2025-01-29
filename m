Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269EBC0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 19:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60E110E88F;
	Wed, 29 Jan 2025 19:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXfX1KPJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667EF10E88D
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 19:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180582; x=1769716582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cLRKwCzhU8EtNczNmwUtwGAAc49v5SEArPcwgqE2jf8=;
 b=lXfX1KPJhqNUNyrDPmr+ipQWJqmSt14Kx/botbakrG6s5rSJvO5KYRqj
 b1159lB8YnhZLWkoufkxjBGbuL6wVvP3aL1+MyKpSAsQSDs0lUMC9IhbS
 2hIAdq575lY30CfTYjYJzJvLlwf6jk1BSr8LCp34knhngjhdN0plB2vEm
 f+juqaA58BOAoagWaQ93+nOCMWzWiJOJ8qKvXCVkdlNGxJ4UVSOYCFJX/
 MaDzEKsF69cDR8y/P4+m7M4rWDbRXZfKK/lKxl+ge+JTjriCKecaIfFbT
 vvF7H/CNfjJ4gT02zZs/4Cg8shmw5PQmfpuEQ+OxMeZKeBEH3AxiKVfvJ Q==;
X-CSE-ConnectionGUID: NA4+nPWKQlWMPOIZN3HUag==
X-CSE-MsgGUID: N8DKhQm2SRWGfsP1Svu4CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="49304379"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="49304379"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:56:21 -0800
X-CSE-ConnectionGUID: upTgEaE0QseqJQQsxPQcpg==
X-CSE-MsgGUID: PNuK1S33QuCHxt/926jkmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114265279"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 11:56:20 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/1] tests/kms_vrr: Add adaptive-dc subtest for VRR
Date: Thu, 30 Jan 2025 01:41:49 +0530
Message-Id: <20250129201149.3666688-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250129201149.3666688-1-ramanaidu.naladala@intel.com>
References: <20250129201149.3666688-1-ramanaidu.naladala@intel.com>
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

Add a new subtest 'adaptive-dc' to the VRR tests. This subtest
cover the Adaptive dc balance functionality.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 126 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index e7d2ff1db..4f4649fff 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -86,6 +86,11 @@
  * Description: Oscillates between highest and lowest refresh each frame for
  *              manual flicker profiling
  *
+ * SUBTEST: adaptive-dc
+ * Description: Oscillates between highest and lowest refresh each frame poll
+ * 		Adaptive dc balance.
+ * Functionality: Adaptive dc balance, Adaptive_sync
+ *
  * SUBTEST: negative-basic
  * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
  */
@@ -146,6 +151,12 @@ typedef struct data {
 	bool static_image;
 } data_t;
 
+typedef struct thread_data {
+	data_t *data;
+	int pipe;
+	bool poll_vb_flag;
+} thread_data_t;
+
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
 
 /* Converts a timespec structure to nanoseconds. */
@@ -172,6 +183,23 @@ static uint64_t get_kernel_event_ns(data_t *data, uint32_t event)
 	return ev.tv_sec * NSECS_PER_SEC + ev.tv_usec * 1000ull;
 }
 
+static uint64_t wait_for_vblank(data_t *data, int pipe)
+{
+	uint32_t pipe_id_flag;
+	drmVBlank vbl;
+
+	memset(&vbl, 0, sizeof(vbl));
+	pipe_id_flag = kmstest_get_vbl_flag(pipe);
+
+	vbl.request.type = DRM_VBLANK_RELATIVE | pipe_id_flag;
+	vbl.request.sequence = 1;
+
+	do_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &vbl);
+
+	return (vbl.reply.tval_sec * 1000000 + vbl.reply.tval_usec);
+}
+
+
 /*
  * Returns the current CLOCK_MONOTONIC time in nanoseconds.
  * The regular IGT helpers can't be used since they default to
@@ -570,6 +598,94 @@ flip_and_measure_cmrr(data_t *data, igt_output_t *output, enum pipe pipe,
 	return total_flip ? ((total_pass * 100) / total_flip) : 0;
 }
 
+static void *monitor_vblanks(void *arg)
+{
+	thread_data_t *t_data  = (thread_data_t *)arg;
+	uint64_t last_vb_event_us, vb_event_us;
+	uint64_t diff_us;
+	uint64_t frame = 0;
+	uint64_t dc_balance = 0;
+
+	last_vb_event_us = vb_event_us = wait_for_vblank(t_data->data, t_data->pipe);
+
+	while (t_data->poll_vb_flag) {
+		vb_event_us = wait_for_vblank(t_data->data, t_data->pipe);
+
+		diff_us = vb_event_us - last_vb_event_us;
+		frame = frame + 1;
+		last_vb_event_us = vb_event_us;
+
+		if ((frame % 2) == 0) {
+			dc_balance += diff_us;
+			igt_info("even frame%ld dc_balance = %ld frame time = %ld\n",
+				 frame, dc_balance, diff_us);
+		} else {
+			dc_balance -= diff_us;
+			igt_info("odd frame%ld dc_balance = %ld frame time = %ld\n",
+				 frame, dc_balance, diff_us);
+		}
+	}
+	igt_info("frames count = %ld, dc balance = %ld\n", frame, dc_balance);
+	pthread_exit((void *)dc_balance);
+}
+
+
+static void
+test_adaptive_dc_balance(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	uint64_t result;
+	vtest_ns_t vtest_ns;
+	range_t range;
+	uint64_t rate[] = {0};
+	pthread_t vblank_thread;
+	void *thread_result;
+	thread_data_t thread_data;
+	unsigned int range_min;
+	uint64_t maxmin_rates[2];
+
+	prepare_test(data, output, pipe);
+	range = data->range;
+	vtest_ns = data->vtest_ns;
+	rate[0] = vtest_ns.rate_ns;
+
+	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
+		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
+	igt_info("Override Mode: ");
+	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
+
+	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), true);
+	/*
+	 * Do a short run with VRR, but don't check the result.
+	 * This is to make sure we were actually in the middle of
+	 * active flipping before doing the DPMS/suspend steps.
+	 */
+	flip_and_measure(data, output, pipe, rate, 1, 250000000ull);
+
+	/* For Intel h/w tweak the min rate, as h/w will terminate the vblank at Vmax. */
+	range_min = is_intel_device(data->drm_fd) ? (range.min + 2) : range.min;
+
+	maxmin_rates[0] = vtest_ns.max;
+	maxmin_rates[1] = igt_kms_frame_time_from_vrefresh(range_min);
+
+	thread_data.data = data;
+	thread_data.pipe = pipe;
+
+	if (pthread_create(&vblank_thread, NULL, monitor_vblanks, &thread_data) != 0)
+		igt_assert_f(0, "Error: Failed to create vblank thread.\n");
+
+	thread_data.poll_vb_flag = true;
+	flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
+	thread_data.poll_vb_flag = false;
+
+	pthread_join(vblank_thread, &thread_result);
+
+	result = (uint64_t)thread_result;
+
+	igt_assert_f(result == 0, "Adaptive_dc_balance %ld not adjusted\n", result);
+
+}
+
+
 /* Basic VRR flip functionality test - enable, measure, disable, measure */
 static void
 test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
@@ -1022,6 +1138,8 @@ static data_t data;
 
 igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 {
+	int display_ver;
+
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
@@ -1060,6 +1178,14 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 	igt_subtest_with_dynamic("max-min")
 		run_vrr_test(&data, test_basic, TEST_MAXMIN);
 
+	igt_describe("Oscillates between highest and lowest refresh each frame poll "
+		      "Adaptive dc balance.");
+	igt_subtest_with_dynamic("adaptive-dc") {
+		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
+		igt_require_f(display_ver >= 30, "Adaptive dc balance is not supported\n");
+		run_vrr_test(&data, test_adaptive_dc_balance, TEST_MAXMIN);
+	}
+
 	igt_subtest_group {
 		igt_fixture
 			igt_require_intel(data.drm_fd);
-- 
2.25.1

