Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCBCC624D4
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 07:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A4B10E51D;
	Thu,  3 Sep 2026 07:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zi8tI4jh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08F110F424
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 07:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788420873; x=1819956873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wChvKEyeKOJJy+wsGy69jVG7ODRomfTJonf8esoX65g=;
 b=Zi8tI4jhPuj0xfZco1j464PgeB3T/Q+Y/AWUUypGc7x2BbTJgDLcBwt4
 C1YWllVTwJswP7n2UmsmiGqi3clikNImc7osxSchxLn5kh9zuuCO9lYfX
 ceE8E6pjBZCIxABdDEYM53nlq08woXqB8jXr9VZ+WbjWi5gB1f0boeN1F
 g7sxtvJM+lTIdWV8AZFI/qMPz8iuABASFOynqBl0+TgBTLiEbMPs+zqnC
 MHZh4f6ksHkG+Fl+YeUM6wfSDuPPABR14AFRpHJ6jNMbcTbi4CUYQzaLB
 o1zapo1CiO/RbPCCTgBDsyNBF1I/0oolnKMVpuxPbGuaJ26kx+XcPfkaU g==;
X-CSE-ConnectionGUID: gSS+5TD7Ra+ygG4MLbqv2w==
X-CSE-MsgGUID: kHdEhP7rTBSLusva1aUcAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88655729"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88655729"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:33 -0700
X-CSE-ConnectionGUID: iWBDRlf9R0SoZHxuT8gNkg==
X-CSE-MsgGUID: uNw8YV2cTRO9GDuCz/AYVA==
X-ExtLoop1: 1
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:30 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Purkait Soham <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Jadav Raag <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 09/10] tests/intel/xe_err_injection: Add tests for L2 bank
 Corr err threshold scenarios
Date: Thu,  3 Sep 2026 13:03:34 +0530
Message-Id: <20260903073335.339540-10-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
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

Cc: Purkait Soham <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Cc: Jadav Raag <raag.jadav@intel.com>
Cc: Nilawar Badal <badal.nilawar@intel.com>
Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v2:Disabled multicast before arming the injection to perform an unicast
   injection.
   Updated the condition to verify response from wait_for_error_notify_event
   condition from an event error value of exactly 1 to the configured error
   threshold.
v4:Add support for steer semaphore while disabling and enabling
   multicast (Soham)
   Used updated library names with igt_drm_netlink_* prefix (Nikula
   Jani & Kamil)
   Updated error event name from error-notify to error-report to align
   with the latest changes in drm-uapi/drm_ras.h
---
 tests/intel/xe_err_injection.c | 292 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  11 ++
 2 files changed, 303 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 683994d1c..cdf15f70b 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -35,6 +35,14 @@ enum {
 	RECOVERY_TIMEOUT,
 };
 
+time_t event_timeout = 10 * 1000; /* 10 seconds */
+
+/* Cleanup helper for injection test functions */
+#define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
+	igt_drm_netlink_cleanup(&ctx); \
+	release_forcewake(fw_handle); \
+} while (0)
+
 static void run_xe_compute_on_all_engines(int fd, bool state)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -295,6 +303,272 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
 	gt_uc_wkr_parity_recovered = true;
 }
 
+/* Inject a GT correctable error */
+static void l2_bank_corr_err_injection(struct xe_mmio *mmio, int fd)
+{
+	/* Disable Multicast for unicast error injection */
+	acquire_steering_semaphore(mmio);
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
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_netlink_init(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	/* Subscribe to error-report event */
+	ret = igt_drm_netlink_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
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
+	ret = igt_drm_netlink_get_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to query GT correctable error threshold before injection\n");
+	}
+	current_threshold = ctx.error_threshold;
+	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
+
+	/* Set GT Correctable error threshold to 1 */
+	ctx.error_threshold = 1;
+	ret = igt_drm_netlink_set_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to set GT correctable error threshold before injection\n");
+	}
+
+	/* Inject a GT correctable error */
+	l2_bank_corr_err_injection(mmio, fd);
+
+	/* wait for 10 secs */
+	ret = igt_drm_netlink_wait_for_error_report_event(&ctx, event_timeout);
+	if (ret == 0 && ctx.event_error_value >= ctx.error_threshold) {
+		log_status(true, "L2 Bank Correctable Error with threshold 1");
+		igt_info("Received error-report event Notification from %s:node_id=%u error_id=%u "
+			 "value=%u match=%d\n",
+			 DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id, ctx.event_error_id,
+			 ctx.event_error_value, ctx.event_received);
+	} else {
+		log_status(false, "L2 Bank Correctable Error with threshold 1");
+		/* restore threshold before failing */
+		ctx.error_threshold = current_threshold;
+		igt_drm_netlink_set_error_threshold(&ctx);
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Did not receive expected RAS event or error_value after injection\n");
+	}
+
+	/* restore GT Correctable error threshold to original value */
+	ctx.error_threshold = current_threshold;
+	ret = igt_drm_netlink_set_error_threshold(&ctx);
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
+	ret = igt_drm_netlink_init(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	ret = igt_drm_netlink_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
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
+	ret = igt_drm_netlink_get_error_counter(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query GT correctable error counter before injection\n");
+	}
+	gt_corr_counter_before = ctx.error_value;
+
+	/* get current GT Correctable error threshold */
+	ret = igt_drm_netlink_get_error_threshold(&ctx);
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
+		ret = igt_drm_netlink_get_error_counter(&ctx);
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
+	ret = igt_drm_netlink_wait_for_error_report_event(&ctx, event_timeout);
+	if (ret == 0 && ctx.event_error_value == 1) {
+		log_status(true, "L2 Bank Correctable Error Injection 16 times");
+	} else {
+		log_status(false, "L2 Bank Correctable Error Injection 16 times");
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
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_netlink_init(&ctx);
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
+	ret = igt_drm_netlink_get_error_counter(&ctx);
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
+	ret = igt_drm_netlink_get_error_counter(&ctx);
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
@@ -302,6 +576,12 @@ static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
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
@@ -335,6 +615,18 @@ int igt_main()
 		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
 	}
 
+	igt_describe("Inject GT correctable error and validate error-report event with threshold set to 1.");
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
index a70e6af22..a4b99711e 100644
--- a/tests/intel/xe_err_injection.h
+++ b/tests/intel/xe_err_injection.h
@@ -22,10 +22,21 @@
 #define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
 
 /* Node types for error counters*/
+#define NODE_ID_CORRECTABLE_ERROR 0
 #define NODE_ID_UNCORRECTABLE_ERROR 1
 
 /* Error types for error counter */
 #define ERROR_ID_CORE_COMPUTE 1
 
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

