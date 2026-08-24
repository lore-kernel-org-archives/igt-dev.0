Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DC7C5DF9C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 16:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A57C10E15F;
	Mon, 24 Aug 2026 16:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6kIin03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75B210E15F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 16:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787589746; x=1819125746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WtfWVVjSux5n/Z8gK6cbykIeL8glw58ou+6kAJFUw/s=;
 b=X6kIin03TzuyyyYl6iUgo2FwxwsB3B+QOAoKybK4ETBkrZkDH0qM/0jB
 cCnXzf5/t14FT3uiiZOTM2E8wcNuKwia9lgZotkRGIoD4f8CzHGraCIM7
 +tAq594+PVhLnBWyoYHSiJh7c4Xib6kK9VCBDxCEyrqPa45F4ataZVuS8
 qYtO6lM7Q6oe1CGvUapaQ/d2fTxByokHVqcNiyefiNKDlp/JyIkaRhXLZ
 pUujxg5E/aLl+ATfZpZUqRDPoMaHw0E3jCEI7ide7Jd6Eaqsgb0+dtRd2
 tjAZfAH71F+yZ5XLqPQL/Eo1lc8643HLPDaXLHTGkrHMMtby1eWct68FM A==;
X-CSE-ConnectionGUID: xhZt7m+xTAqI0NLSS4AaPA==
X-CSE-MsgGUID: iFyBkZcPR0+ZFbKKaBdNLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88105699"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="88105699"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:42:25 -0700
X-CSE-ConnectionGUID: RKuNQv+hRFOOG+5J0jvPUg==
X-CSE-MsgGUID: BlOK/7+ZTxCIqOingvuHvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="268993420"
Received: from unknown (HELO rkoppura-Z790I-AORUS-ULTRA.iind.intel.com)
 ([10.190.239.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:42:24 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3 09/10] tests/intel/xe_err_injection: Add tests for L2 bank
 Corr err threshold scenarios
Date: Mon, 24 Aug 2026 22:11:32 +0530
Message-Id: <20260824164133.129138-10-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
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

Introduced L2 bank correctable error threshold subtests:
   - single correctable error
   - Correctable error with threshold set to 1
   - 16 Correctable error injections with threshold set to 0xF

Add DRM RAS netlink error-notify event subscription to verify
correctable error detection across all the above subtests.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v2:Disabled multicast before arming the injection to perform an unicast
   injection.
   Updated the condition to verify response from wait_for_error_notify_event
   condition from an event error value of exactly 1 to the configured error
   threshold.
---
---
 tests/intel/xe_err_injection.c | 288 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  10 ++
 2 files changed, 298 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index ded5f558f..05bef3e52 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -35,6 +35,14 @@ enum {
 	RECOVERY_TIMEOUT,
 };
 
+time_t event_timeout = 10 * 1000; /* 10 seconds */
+
+/* Cleanup helper for injection test functions */
+#define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
+	igt_cleanup_nl_socket(&ctx); \
+	release_forcewake(fw_handle); \
+} while (0)
+
 static void run_xe_compute_on_all_engines(int fd, bool state)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -274,6 +282,268 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
 	gt_uc_wkr_parity_recovered = true;
 }
 
+/* Inject a GT correctable error */
+static void l2_bank_corr_err_injection(struct xe_mmio *mmio, int fd)
+{
+	/* Disable Multicast for unicast error injection */
+	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
+
+	/* Arm the Injection */
+	write_reg(mmio, L2_BANK_ERR_INJ, L2_BANK_DATA_1BIT_ERR_INJ_CONFIG);
+	igt_info("Armed L2 Bank Correctable Error Injection\n");
+
+	/* Rollback to Multicast */
+	modify_reg_bit(mmio,
+		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		       MC_PKT_CTRL_MGSR_3D_VALUE,
+		       true);
+}
+
+/**
+ * SUBTEST: test_l2-bank-corr-err-threshold-1
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void test_l2_bank_corr_err_injection_with_threshold_1(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	int ret;
+	uint32_t current_threshold = UINT32_MAX;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_init_nl_socket(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	/* Subscribe to error-notify */
+	ret = igt_subscribe_error_notify(&ctx, DRM_RAS_MCGRP_ERROR_NOTIFY);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to subscribe to error-notify (ret=%d)\n", ret);
+	}
+
+	/* get current GT Correctable error threshold */
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = 0;
+	ctx.error_id = 1;
+	ret = igt_get_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to query GT correctable error threshold before injection\n");
+	}
+	current_threshold = ctx.error_threshold;
+	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
+
+	/* Set GT Correctable error threshold to 1 */
+	ctx.error_threshold = 1;
+	ret = igt_set_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to set GT correctable error threshold before injection\n");
+	}
+
+	/* Inject a GT correctable error */
+	l2_bank_corr_err_injection(mmio, fd);
+
+	ret = igt_wait_for_error_notify_event(&ctx, event_timeout); /* wait for 10 secs */
+	if (ret == 0 && ctx.event_error_value >= ctx.error_threshold) {
+		log_status(true, "L2 Bank Correctable Error with threshold 1");
+		igt_info("Received Error event Notification from %s:node_id=%u error_id=%u value=%u match=%d\n",
+			 DRM_RAS_MCGRP_ERROR_NOTIFY, ctx.event_node_id, ctx.event_error_id,
+			 ctx.event_error_value, ctx.event_received);
+	} else {
+		log_status(false, "L2 Bank Correctable Error with threshold 1");
+		/* restore threshold before failing */
+		ctx.error_threshold = current_threshold;
+		igt_set_error_threshold(&ctx);
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Did not receive expected RAS event or error_value after injection\n");
+	}
+
+	/* restore GT Correctable error threshold to original value */
+	ctx.error_threshold = current_threshold;
+	ret = igt_set_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to restore GT correctable error threshold after injection\n");
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
+/**
+ * SUBTEST: test_l2-bank-corr-err-16-times
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void test_l2_bank_corr_err_injection_16_times(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	uint32_t current_threshold = UINT32_MAX;
+	uint32_t gt_corr_counter_before = 0, gt_corr_counter_current = 0;
+	int ret;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_init_nl_socket(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	ret = igt_subscribe_error_notify(&ctx, DRM_RAS_MCGRP_ERROR_NOTIFY);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to subscribe to error-notify (ret=%d)\n", ret);
+	}
+
+	/* Query error counter before injection */
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = 0;
+	ctx.error_id = 1;
+	ret = igt_get_error_counter(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query GT correctable error counter before injection\n");
+	}
+	gt_corr_counter_before = ctx.error_value;
+
+	/* get current GT Correctable error threshold */
+	ret = igt_get_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query GT correctable error threshold before injection\n");
+	}
+	current_threshold = ctx.error_threshold;
+	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
+
+	for (int i = 0; i < 16; i++) {
+		igt_info("****** Injection iteration: %d ***********\n", i + 1);
+		/* Inject a GT correctable error */
+		l2_bank_corr_err_injection(mmio, fd);
+
+		/* Query error counter after injection */
+		ret = igt_get_error_counter(&ctx);
+		if (ret < 0) {
+			CLEANUP_ON_ERROR(ctx, fw_handle);
+			igt_assert_f(false,
+				     "Failed to query GT correctable error counter:iteration %d\n",
+				     i + 1);
+		}
+		gt_corr_counter_current = ctx.error_value;
+		igt_info("GT Correctable error counter incremented by : %u "
+			 "since before initial injection\n",
+			 gt_corr_counter_current - gt_corr_counter_before);
+	}
+
+	/* Confirm whether error counter incremented by 16 after 16 injections */
+	if ((gt_corr_counter_current - gt_corr_counter_before) == 16) {
+		log_status(true, "L2 Bank Correctable Error Injection 16 times");
+	} else {
+		log_status(false, "L2 Bank Correctable Error Injection 16 times");
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "GT Correctable error counter didn't increment "
+			     "by 16 after 16 injections\n");
+	}
+
+	ret = igt_wait_for_error_notify_event(&ctx, event_timeout);
+	if (ret == 0 && ctx.event_error_value == 1) {
+		log_status(true, "L2 Bank Correctable Error Injection 16 times");
+	} else {
+		log_status(false, "L2 Bank Correctable Error Injection 16 times");
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Did not receive expected MSI event or "
+			     "error_value after injection\n");
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
+/**
+ * SUBTEST: test_l2-bank-single-corr-err
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	int ret;
+	uint32_t gt_corr_counter_before = 0, gt_corr_counter_after = 0;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_init_nl_socket(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	/* Query error counter before injection */
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = 0;
+	ctx.error_id = 1;
+	ret = igt_get_error_counter(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query GT correctable error counter before injection\n");
+	}
+	gt_corr_counter_before = ctx.error_value;
+	igt_info("GT Correctable error counter before injection: %u\n", gt_corr_counter_before);
+
+	/* Inject a GT correctable error */
+	l2_bank_corr_err_injection(mmio, fd);
+
+	/* Query error counter after injection */
+	ret = igt_get_error_counter(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query GT correctable error counter after injection\n");
+	}
+	gt_corr_counter_after = ctx.error_value;
+	igt_info("GT Correctable error counter after injection: %u\n", gt_corr_counter_after);
+
+	if (gt_corr_counter_after > gt_corr_counter_before) {
+		igt_info("GT Correctable error counter incremented by %u after injection\n",
+			 gt_corr_counter_after - gt_corr_counter_before);
+		log_status(true, "L2 Bank Correctable Error");
+	} else {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "L2 Bank (GT) Correctable Error Injection count not incremented\n");
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
 static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
 {
 	igt_info("Starting Error Injection test: %s\n", injection);
@@ -281,6 +551,12 @@ static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
 		wkr_cmd_parity_err_injection(mmio, fd);
 	else if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
 		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
+	else if (strcmp(injection, "test_l2-bank-corr-err-threshold-1") == 0)
+		test_l2_bank_corr_err_injection_with_threshold_1(mmio, fd);
+	else if (strcmp(injection, "test_l2-bank-corr-err-16-times") == 0)
+		test_l2_bank_corr_err_injection_16_times(mmio, fd);
+	else if (strcmp(injection, "test_l2-bank-single-corr-err") == 0)
+		test_l2_bank_single_corr_err_injection(mmio, fd);
 	else
 		igt_info("Invalid Error Injection specified\n");
 }
@@ -314,6 +590,18 @@ int igt_main()
 		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
 	}
 
+	igt_describe("Inject GT correctable error and validate error-notify event with threshold set to 1.");
+	igt_subtest("test_l2-bank-corr-err-threshold-1")
+		inject_error("test_l2-bank-corr-err-threshold-1", &mmio, fd);
+
+	igt_describe("Inject GT correctable error 16 times and validate counter/event behavior.");
+	igt_subtest("test_l2-bank-corr-err-16-times")
+		inject_error("test_l2-bank-corr-err-16-times", &mmio, fd);
+
+	igt_describe("Inject a single GT correctable error and validate counter increment.");
+	igt_subtest("test_l2-bank-single-corr-err")
+		inject_error("test_l2-bank-single-corr-err", &mmio, fd);
+
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
 		drm_close_driver(fd);
diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
index d7efc2fd2..1a9ea2f2e 100644
--- a/tests/intel/xe_err_injection.h
+++ b/tests/intel/xe_err_injection.h
@@ -15,4 +15,14 @@
 #define POST_RECOVERY_WL 1
 #define POST_ARMING_INJECTION_WL 0
 
+/* L2 Bank (LBCFLOCKMSGREG) error injection */
+#define L2_BANK_ERR_INJ 0xB1B4
+#define DATA_1BIT_ERR_INJ_REQ (1 << 3)
+#define FUSA_TEST_MODE_ERR_INJ_REQ (1 << 2)
+#define MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ (1 << 19)
+#define MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ (1 << 18)
+#define L2_BANK_DATA_1BIT_ERR_INJ_CONFIG \
+	(DATA_1BIT_ERR_INJ_REQ | FUSA_TEST_MODE_ERR_INJ_REQ | \
+	 MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ | MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ)
+
 #endif /* XE_ERR_INJECTION_H */
-- 
2.34.1

