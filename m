Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535A9CC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 19:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CD010E949;
	Tue, 13 Oct 2026 19:14:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602BA10E5E5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 19:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918494; x=1823454494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1LddMEVcU8hz15r1KGVVsbc2H8TZ1FUufu4WhYK22/s=;
 b=I6ze6Fq/Ao279jRK/nkOMv/0+cY92F5jMjiCvJJ6n9Ts6CGaPWc9Yw2b
 cVTEluhO/M01glkYQzSdxzLxXCmj4muuN4erixFSnrtLWP00mDb6XNXR0
 v5w7dQNucQIi65iolB4rlF2ypsaIfgbv97pg/SsS+G3aixwF8PrqhkR8j
 SPMBHZcp+sRB779oC2DDT2+NhOznfrjFqV8PErL3oKveI+mWzx0wUbWM7
 vD4WiKAui4AAS72Eq6gs7D6hntmCpG9o4BUxF2A24ob4g3ImPXu0bfnMm
 abje0EzFsRmmi6AWyWMwzs+J9QHgWaKT1CU3b7GX1RTucARb6XA7CzVB7 g==;
X-CSE-ConnectionGUID: +B2tD4DyRCqT+/dPsMEarQ==
X-CSE-MsgGUID: j6QxBPHcTTCswJIe8qPU1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="687308"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="687308"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:08:13 -0700
X-CSE-ConnectionGUID: cWXTy2SqRpKRBBx3Q5eiXg==
X-CSE-MsgGUID: XIxvIARcQ/WI4WjS4wklEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3004507"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:08:10 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 09/10] tests/intel/xe_err_injection: Add tests for L2 bank
 Corr err threshold scenarios
Date: Wed, 14 Oct 2026 00:36:50 +0530
Message-Id: <20261013190651.897241-10-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
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

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v5:Removed xe_err_injection.h and moved its contents into the .c file (Riana)
   Prefixed all register address and bit value names with "XE_" (Riana)
   Added error handling logic for function calls
   Changed test name comparisons from strings to enums (Riana)
v4:Add support for steer semaphore while disabling and enabling
   multicast (Soham)
   Used updated library names with igt_drm_netlink_* prefix (Nikula
   Jani & Kamil)
   Updated error event name from error-notify to error-report to align
   with the latest changes in drm-uapi/drm_ras.h
v2:Disabled multicast before arming the injection to perform an unicast
   injection.
   Updated the condition to verify response from wait_for_error_notify_event
   condition from an event error value of exactly 1 to the configured error
   threshold.
---
 tests/intel/xe_err_injection.c | 312 +++++++++++++++++++++++++++++++++
 1 file changed, 312 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 332b2cae0..796b4d696 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -44,17 +44,36 @@
 #define XE_STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
 
 /* Node types for error counters*/
+#define NODE_ID_CORRECTABLE_ERROR 0
 #define NODE_ID_UNCORRECTABLE_ERROR 1
 
 /* Error types for error counter */
 #define ERROR_ID_CORE_COMPUTE 1
 
+/* L2 Bank (LBCFLOCKMSGREG) error injection */
+#define XE_L2_BANK_ERR_INJ 0xB1B4
+#define DATA_1BIT_ERR_INJ_REQ (1 << 3)
+#define FUSA_TEST_MODE_ERR_INJ_REQ (1 << 2)
+#define MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ (1 << 19)
+#define MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ (1 << 18)
+#define XE_L2_BANK_DATA_1BIT_ERR_INJ_CONFIG \
+	(DATA_1BIT_ERR_INJ_REQ | FUSA_TEST_MODE_ERR_INJ_REQ | \
+	 MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ | MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ)
+
 enum {
 	RECOVERY_SUCCESS = 1,
 	RECOVERY_FAILED,
 	RECOVERY_TIMEOUT,
 };
 
+time_t event_timeout = 10 * 1000; /* 10 seconds */
+
+/* Cleanup helper for injection test functions */
+#define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
+	igt_drm_ras_nl_cleanup(&ctx); \
+	release_forcewake(fw_handle); \
+} while (0)
+
 static bool run_xe_compute_on_all_engines(int fd, bool state)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -312,15 +331,287 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
 	gt_uc_wkr_parity_recovered = true;
 }
 
+/* Inject a GT correctable error */
+static void l2_bank_corr_err_injection(struct xe_mmio *mmio, int fd)
+{
+	/* Disable Multicast for unicast error injection */
+	acquire_steering_semaphore(mmio);
+	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
+
+	/* Arm the Injection */
+	xe_mmio_write32(mmio, XE_L2_BANK_ERR_INJ, XE_L2_BANK_DATA_1BIT_ERR_INJ_CONFIG);
+	igt_info("Armed L2 Bank Correctable Error Injection\n");
+
+	/* Rollback to Multicast */
+	modify_reg_bit(mmio,
+		       XE_MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		       XE_MC_PKT_CTRL_MGSR_3D_VALUE,
+		       true);
+	release_steering_semaphore(mmio);
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
+	struct igt_drm_ras_nl_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_ras_nl_init(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	/* Subscribe to error-report event */
+	ret = igt_drm_ras_nl_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to subscribe to error-report event (ret=%d)\n", ret);
+	}
+
+	/* get current GT Correctable error threshold */
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
+	ctx.error_id = ERROR_ID_CORE_COMPUTE;
+	ret = igt_drm_ras_nl_get_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to query GT correctable error threshold before injection\n");
+	}
+	current_threshold = ctx.error_threshold;
+	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
+
+	/* Set GT Correctable error threshold to 1 */
+	ctx.error_threshold = 1;
+	ret = igt_drm_ras_nl_set_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to set GT correctable error threshold before injection\n");
+	}
+
+	/* Inject a GT correctable error */
+	l2_bank_corr_err_injection(mmio, fd);
+
+	/* wait for 10 secs */
+	ret = igt_drm_ras_nl_wait_for_error_report_event(&ctx, event_timeout);
+	if (ret == 0 && ctx.event_error_value >= ctx.error_threshold) {
+		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error with threshold 1", "Success");
+		igt_info("Received error-report event Notification from %s:node_id=%u error_id=%u "
+			 "value=%u match=%d\n",
+			 DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id, ctx.event_error_id,
+			 ctx.event_error_value, ctx.event_received);
+	} else {
+		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error with threshold 1", "Failed");
+		/* restore threshold before failing */
+		ctx.error_threshold = current_threshold;
+		igt_drm_ras_nl_set_error_threshold(&ctx);
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Did not receive expected RAS event or error_value after injection\n");
+	}
+
+	/* restore GT Correctable error threshold to original value */
+	ctx.error_threshold = current_threshold;
+	ret = igt_drm_ras_nl_set_error_threshold(&ctx);
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
+	struct igt_drm_ras_nl_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_ras_nl_init(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	ret = igt_drm_ras_nl_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to subscribe to error-report event (ret=%d)\n", ret);
+	}
+
+	/* Query error counter before injection */
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
+	ctx.error_id = ERROR_ID_CORE_COMPUTE;
+	ret = igt_drm_ras_nl_get_error_counter(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query GT correctable error counter before injection\n");
+	}
+	gt_corr_counter_before = ctx.error_value;
+
+	/* get current GT Correctable error threshold */
+	ret = igt_drm_ras_nl_get_error_threshold(&ctx);
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
+		ret = igt_drm_ras_nl_get_error_counter(&ctx);
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
+		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error Injection 16 times", "Success");
+	} else {
+		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error Injection 16 times", "Failed");
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "GT Correctable error counter didn't increment "
+			     "by 16 after 16 injections\n");
+	}
+
+	ret = igt_drm_ras_nl_wait_for_error_report_event(&ctx, event_timeout);
+	if (ret == 0 && ctx.event_error_value == 1) {
+		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error Injection 16 times", "Success");
+	} else {
+		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error Injection 16 times", "Failed");
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Did not receive expected error-report event or "
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
+	struct igt_drm_ras_nl_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_ras_nl_init(&ctx);
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
+	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
+	ctx.error_id = ERROR_ID_CORE_COMPUTE;
+	ret = igt_drm_ras_nl_get_error_counter(&ctx);
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
+	ret = igt_drm_ras_nl_get_error_counter(&ctx);
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
+		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error", "Success");
+	} else {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "L2 Bank (GT) Correctable Error Injection count not incremented\n");
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
 enum xe_err_injection_type {
 	XE_ERR_INJ_GT_UC_WKR_CMD_PARITY,
 	XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL,
+	XE_ERR_INJ_L2_BANK_CORR_ERR_THRESHOLD_1,
+	XE_ERR_INJ_L2_BANK_CORR_ERR_16_TIMES,
+	XE_ERR_INJ_L2_BANK_SINGLE_CORR_ERR,
 };
 
 static const char * const xe_err_injection_names[] = {
 	[XE_ERR_INJ_GT_UC_WKR_CMD_PARITY] = "test_GT-UC-unicast-wkr-cmd-parity-err",
 	[XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL] =
 		"test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl",
+	[XE_ERR_INJ_L2_BANK_CORR_ERR_THRESHOLD_1] = "test_l2-bank-corr-err-threshold-1",
+	[XE_ERR_INJ_L2_BANK_CORR_ERR_16_TIMES] = "test_l2-bank-corr-err-16-times",
+	[XE_ERR_INJ_L2_BANK_SINGLE_CORR_ERR] = "test_l2-bank-single-corr-err",
 };
 
 static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *mmio, int fd)
@@ -333,6 +624,15 @@ static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *m
 	case XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL:
 		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
 		break;
+	case XE_ERR_INJ_L2_BANK_CORR_ERR_THRESHOLD_1:
+		test_l2_bank_corr_err_injection_with_threshold_1(mmio, fd);
+		break;
+	case XE_ERR_INJ_L2_BANK_CORR_ERR_16_TIMES:
+		test_l2_bank_corr_err_injection_16_times(mmio, fd);
+		break;
+	case XE_ERR_INJ_L2_BANK_SINGLE_CORR_ERR:
+		test_l2_bank_single_corr_err_injection(mmio, fd);
+		break;
 	default:
 		igt_info("Invalid Error Injection specified\n");
 	}
@@ -365,6 +665,18 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Inject GT correctable error and validate error-report event with threshold set to 1.");
+	igt_subtest("test_l2-bank-corr-err-threshold-1")
+		inject_error(XE_ERR_INJ_L2_BANK_CORR_ERR_THRESHOLD_1, &mmio, fd);
+
+	igt_describe("Inject GT correctable error 16 times and validate counter/event behavior.");
+	igt_subtest("test_l2-bank-corr-err-16-times")
+		inject_error(XE_ERR_INJ_L2_BANK_CORR_ERR_16_TIMES, &mmio, fd);
+
+	igt_describe("Inject a single GT correctable error and validate counter increment.");
+	igt_subtest("test_l2-bank-single-corr-err")
+		inject_error(XE_ERR_INJ_L2_BANK_SINGLE_CORR_ERR, &mmio, fd);
+
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
 		drm_close_driver(fd);
-- 
2.34.1

