Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2CCC5DF87
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 12:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8027710E5ED;
	Thu, 20 Aug 2026 12:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+TLpqcq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BADB10E1D6
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 12:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787228205; x=1818764205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pCym+qbCW4PYtZ0vh8OVkUhOvW4+aKmRRzemlC+7/es=;
 b=P+TLpqcqElgEszRgPOo3larX3wwWZIAVS4XhBjHlPGfC5He2erP/unga
 WFSjZz3k2LhgvJgMZu713bE+vVx+m/68gOPaBaBg/3b4UDQh0sv+16Lra
 SxYKaPpLfiiiNLTdoY5A7xGfUNQd28YDLsNDXooAjYIms+vXmLwPzxKj9
 1/Hj7FBYaASzKbEApda00oVsvzisQOYnZwrgeNKR14aj25BMRl5tuZGng
 Kkq6MIdNowwrffUA5xAWb1i0YQfeplu3GdjpKvTbTML08XCHF+WJUCuVd
 TgwdWEVyZOulU8bffLusU/yNKJmA5BS0pAG3Qx5INv5abkfAwdhMG3/BB A==;
X-CSE-ConnectionGUID: ov4buhXiTc+X3Nxs5n1DaA==
X-CSE-MsgGUID: yh26lh1XQq60jnch6tN+LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98917305"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98917305"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 05:16:45 -0700
X-CSE-ConnectionGUID: s6NhlZqJRNy6rO7l9LCSgw==
X-CSE-MsgGUID: hlP3Mld7S3e3cFju7ftfyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="264675986"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 05:16:43 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v2 7/8] tests/intel/xe_err_injection: Add tests for L2 bank
 Corr err threshold scenarios
Date: Thu, 20 Aug 2026 17:45:59 +0530
Message-Id: <20260820121600.75052-8-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820121600.75052-1-ravi.kishore.koppuravuri@intel.com>
References: <20260820121600.75052-1-ravi.kishore.koppuravuri@intel.com>
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
 tests/intel/xe_err_injection.c | 282 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  10 ++
 2 files changed, 292 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 0efdc8f6b..13a316c74 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -35,6 +35,14 @@ enum {
 	RECOVERY_TIMEOUT = 3,
 };
 
+time_t event_timeout = 10 * 1000; /* 10 seconds */
+
+/* Cleanup helper for injection test functions */
+#define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
+	cleanup_nl_socket(&ctx); \
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
+ * SUBTEST: l2-bank-corr-err-threshold-1
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void l2_bank_corr_err_injection_with_threshold_1(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	int ret;
+	uint32_t current_threshold = UINT32_MAX;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = init_nl_socket(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	/* Subscribe to error-notify */
+	ret = subscribe_error_notify(&ctx, DRM_RAS_MCGRP_ERROR_NOTIFY);
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
+	ret = get_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to query GT correctable error threshold before injection\n");
+	}
+	current_threshold = ctx.error_threshold;
+	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
+
+	/* Set GT Correctable error threshold to 1 */
+	ctx.error_threshold = 1;
+	ret = set_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to set GT correctable error threshold before injection\n");
+	}
+
+	/* Inject a GT correctable error */
+	l2_bank_corr_err_injection(mmio, fd);
+
+	ret = wait_for_error_notify_event(&ctx, event_timeout); /* wait for 10 secs */
+	if (ret == 0 && ctx.event_error_value >= ctx.error_threshold) {
+		log_status(true, "L2 Bank Correctable Error with threshold 1");
+		igt_info("Received Error event Notification from %s:node_id=%u error_id=%u value=%u match=%d\n",
+			 DRM_RAS_MCGRP_ERROR_NOTIFY, ctx.event_node_id, ctx.event_error_id,
+			 ctx.event_error_value, ctx.event_received);
+	} else {
+		log_status(false, "L2 Bank Correctable Error with threshold 1");
+		/* restore threshold before failing */
+		ctx.error_threshold = current_threshold;
+		set_error_threshold(&ctx);
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Did not receive expected RAS event or error_value after injection\n");
+	}
+
+	/* restore GT Correctable error threshold to original value */
+	ctx.error_threshold = current_threshold;
+	ret = set_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to restore GT correctable error threshold after injection\n");
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
+/**
+ * SUBTEST: l2-bank-corr-err-16-times
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void l2_bank_corr_err_injection_16_times(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	uint32_t current_threshold = UINT32_MAX;
+	uint32_t gt_corr_counter_before = 0, gt_corr_counter_current = 0;
+	int ret;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = init_nl_socket(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	ret = subscribe_error_notify(&ctx, DRM_RAS_MCGRP_ERROR_NOTIFY);
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
+	ret = get_error_counter(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query GT correctable error counter before injection\n");
+	}
+	gt_corr_counter_before = ctx.error_value;
+
+	/* get current GT Correctable error threshold */
+	ret = get_error_threshold(&ctx);
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
+		ret = get_error_counter(&ctx);
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
+	ret = wait_for_error_notify_event(&ctx, event_timeout);
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
+ * SUBTEST: l2-bank-single-corr-err
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	int ret;
+	uint32_t gt_corr_counter_before = 0, gt_corr_counter_after = 0;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = init_nl_socket(&ctx);
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
+	ret = get_error_counter(&ctx);
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
+	ret = get_error_counter(&ctx);
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
@@ -312,6 +582,18 @@ int igt_main()
 		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
 	}
 
+	igt_describe("Inject GT correctable error and validate error-notify event with threshold set to 1.");
+	igt_subtest("l2-bank-corr-err-threshold-1")
+		l2_bank_corr_err_injection_with_threshold_1(&mmio, fd);
+
+	igt_describe("Inject GT correctable error 16 times and validate counter/event behavior.");
+	igt_subtest("l2-bank-corr-err-16-times")
+		l2_bank_corr_err_injection_16_times(&mmio, fd);
+
+	igt_describe("Inject a single GT correctable error and validate counter increment.");
+	igt_subtest("l2-bank-single-corr-err")
+		l2_bank_single_corr_err_injection(&mmio, fd);
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

