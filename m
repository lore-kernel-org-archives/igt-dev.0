Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EB6606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PIZaXdty
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D147C1120F6;
	Thu, 29 Oct 2026 09:09:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A5F10E7B0
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793264444; x=1824800444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TU7WRWxULB+aZXIq74j2wh/BK8E74XjhgMhUeiJHsVE=;
 b=PIZaXdtyQ7I0GRIbeJXY3cgxLPfD7CG7zOq4tnAZsf3k7ZiDNpI6A/NS
 uANRCN9D1l6RiAhxhOrLMCbgj/wOWxv/m3EBaHPWwy5ev5rsPhVdbRM2I
 WL6+Y5ZeA0fifIdbZ+epukI40THatBHVejJzqrvPadAwxg1AM+MSgJInD
 EBpC2OrEPrihn2qJ+g3Q6e7VJy0qBmT+i/56qq4Jh4eSit2ggx7PE0Uh9
 t4dKhafW6MzVRCOnJBYe3bCtP2akEXgIGHzDJNrafVE/m65cgzPokz1e0
 N9bLyusxdL8lUb2309/Kq0XYG/M49S3w4t02fqPjTMZqCRqLFzl6hnpci g==;
X-CSE-ConnectionGUID: 9DaroLoTR+iaywtzOHsZNg==
X-CSE-MsgGUID: xo4Mra/PQh2yLGSRDMV5hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1991716"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1991716"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:00:44 -0700
X-CSE-ConnectionGUID: 83K+H7jzQDGC/soMf031CQ==
X-CSE-MsgGUID: YJECgekST8e7VnN9ruiL7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5092985"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:00:41 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v6 09/10] tests/intel/xe_err_injection: Add Core Compute Corr
 Error injection
Date: Thu, 29 Oct 2026 14:29:54 +0530
Message-Id: <20261029085955.1232163-10-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add Core Compute Correctable error injection tests:
   - Inject a single correctable error
   - Inject a single correctable error with the threshold set to 1
   - Inject correctable errors up to the configured threshold

Add DRM RAS netlink error event subscription and get error counter to
verify exceed threshold and correctable error scenarios respectively.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v6:Merged 3 Correctable error test functions into a single function to remove redundant code (Riana)
   Updated test names to maintain consistent names (Riana)
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
 tests/intel/xe_err_injection.c | 203 +++++++++++++++++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 2f5f85b07..33fa19821 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -45,17 +45,35 @@
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
 	SUCCESS = 1,
 	FAILED,
 	TIMEOUT,
 };
 
+#define INJ_ONCE 1
+#define INJ_MANY 16
+#define THRESHOLD_NONE 0
+#define THRESHOLD_ONE 1
+
+time_t event_timeout = 10 * 1000; /* 10 seconds */
+
 static bool run_xe_compute_on_all_engines(int fd, bool state)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -123,6 +141,12 @@ static void release_forcewake(int fw_handle)
 		close(fw_handle);
 }
 
+static void cleanup_on_error(struct igt_drm_ras_nl_context *ctx, int fw_handle)
+{
+	igt_drm_ras_nl_cleanup(ctx);
+	release_forcewake(fw_handle);
+}
+
 static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
 {
 	struct igt_drm_ras_nl_context ctx;
@@ -330,9 +354,164 @@ static void test_inject_core_compute_uncorr_error(struct xe_mmio *mmio, int fd)
 	uncorr_error_recovered = true;
 }
 
+static void inject_core_compute_corr_error(struct xe_mmio *mmio, int fd)
+{
+	/* Disable Multicast for unicast error injection */
+	acquire_steering_semaphore(mmio);
+	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
+
+	/* Arm the Injection */
+	xe_mmio_write32(mmio, XE_L2_BANK_ERR_INJ, XE_L2_BANK_DATA_1BIT_ERR_INJ_CONFIG);
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
+ * SUBTEST: inject_core_compute_corr_error_threshold_one
+ * Description: Inject one Core Compute Correctable Error with the
+ *		threshold set to 1 and verify exceed-threshold reporting.
+ * Functionality: error injection
+ *
+ * SUBTEST: inject_core_compute_corr_error_threshold_default
+ * Description: Inject enough Core Compute Correctable Errors to cross
+ *		the current threshold and verify exceed-threshold reporting.
+ * Functionality: error injection
+ *
+ * SUBTEST: inject_core_compute_corr_error_once
+ * Description: Inject one Core Compute Correctable Error and verify the
+ *		error counter increments by 1.
+ * Functionality: error injection
+ */
+static void test_inject_core_compute_corr_error(struct xe_mmio *mmio, int fd,
+						uint32_t ntimes, uint32_t threshold,
+						bool check_event)
+{
+	uint32_t counter_before = 0, counter_after = 0;
+	uint32_t current_threshold = UINT32_MAX;
+	struct igt_drm_ras_nl_context ctx;
+	int fw_handle, ret;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_ras_nl_init(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
+	ctx.error_id = ERROR_ID_CORE_COMPUTE;
+
+	/* Query the error counter before injection */
+	counter_before = get_counter(ctx.node_id, ctx.error_id);
+	if (counter_before < 0) {
+		cleanup_on_error(&ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query Core Compute Correctable error counter before injection\n");
+	}
+
+	/* Query the current error threshold before injection */
+	ret = igt_drm_ras_nl_get_error_threshold(&ctx);
+	if (ret < 0) {
+		cleanup_on_error(&ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query Core Compute correctable error threshold before injection\n");
+	}
+	current_threshold = ctx.error_threshold;
+
+	if (threshold == THRESHOLD_NONE && ntimes != INJ_ONCE) {
+		/* set ntimes to current_threshold for injecting enough times to exceed threshold*/
+		ntimes = current_threshold;
+	}
+
+	if (threshold != THRESHOLD_NONE) {
+		/* Set the error threshold to the specified value */
+		ctx.error_threshold = threshold;
+		ret = igt_drm_ras_nl_set_error_threshold(&ctx);
+		if (ret < 0) {
+			cleanup_on_error(&ctx, fw_handle);
+			igt_assert_f(false, "Failed to set Core Compute correctable error threshold before injection\n");
+		}
+	}
+
+	if (check_event) {
+		/* Subscribe to error event */
+		ret = igt_drm_ras_nl_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
+		if (ret < 0) {
+			cleanup_on_error(&ctx, fw_handle);
+			igt_assert_f(false, "Failed to subscribe to error event (ret=%d)\n", ret);
+		}
+	}
+
+	for (uint32_t i = 0; i < ntimes; i++) {
+		igt_debug("****** Injection iteration: %u ***********\n", i + 1);
+		inject_core_compute_corr_error(mmio, fd);
+	}
+
+	if (check_event) {
+		/* wait 10 secs for error report event */
+		ret = igt_drm_ras_nl_wait_for_error_report_event(&ctx, event_timeout);
+		if (ret == 0 && ctx.event_error_value >= ctx.error_threshold) {
+			igt_info("Success: Received error event notification from: "
+				 "group=%s node_id=%u error_id=%u error_value=%u match=%d\n",
+				 DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id, ctx.event_error_id,
+				 ctx.event_error_value, ctx.event_received);
+		} else {
+			if (threshold != THRESHOLD_NONE) {
+				/* restore threshold to original value before exit */
+				ctx.error_threshold = current_threshold;
+				igt_drm_ras_nl_set_error_threshold(&ctx);
+			}
+			cleanup_on_error(&ctx, fw_handle);
+			igt_assert_f(false,
+				     "Failed: NOT received error event notification from: "
+				     "group=%s node_id=%u error_id=%u error_value=%u match=%d\n",
+				     DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id, ctx.event_error_id,
+				     ctx.event_error_value, ctx.event_received);
+		}
+	}
+
+	if (threshold != THRESHOLD_NONE) {
+		/* restore Core Compute Correctable error threshold to original value */
+		ctx.error_threshold = current_threshold;
+		ret = igt_drm_ras_nl_set_error_threshold(&ctx);
+		if (ret < 0)
+			igt_warn("Failed to restore Core Compute Correctable threshold to original value\n");
+	}
+
+	ret = igt_drm_ras_nl_get_error_counter(&ctx);
+	if (ret < 0) {
+		cleanup_on_error(&ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query Core Compute Correctable error counter after injection\n");
+	}
+	counter_after = ctx.error_value;
+
+	igt_info("error counter: before injection=%u after injection=%u\n",
+		 counter_before, counter_after);
+	igt_assert_f(counter_after - counter_before == ntimes,
+		     "Core Compute Correctable error injection Failed\n");
+
+	cleanup_on_error(&ctx, fw_handle);
+}
+
 enum xe_err_injection_type {
 	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
 	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
+	XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_ONE,
+	XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_DEFAULT,
+	XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE,
 };
 
 static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *mmio, int fd)
@@ -344,6 +523,15 @@ static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *m
 	case XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL:
 		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
 		break;
+	case XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_ONE:
+		test_inject_core_compute_corr_error(mmio, fd, INJ_ONCE, THRESHOLD_ONE, true);
+		break;
+	case XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_DEFAULT:
+		test_inject_core_compute_corr_error(mmio, fd, INJ_MANY, THRESHOLD_NONE, true);
+		break;
+	case XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE:
+		test_inject_core_compute_corr_error(mmio, fd, INJ_ONCE, THRESHOLD_NONE, false);
+		break;
 	default:
 		igt_info("Invalid Error Injection specified\n");
 	}
@@ -375,6 +563,21 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Inject one Core Compute Correctable Error with the "
+		     "threshold set to 1 and verify exceed-threshold reporting");
+	igt_subtest("inject_core_compute_corr_error_threshold_one")
+		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_ONE, &mmio, fd);
+
+	igt_describe("Inject enough Core Compute Correctable Errors to cross"
+		     " the current threshold and verify exceed-threshold reporting");
+	igt_subtest("inject_core_compute_corr_error_threshold_default")
+		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_DEFAULT, &mmio, fd);
+
+	igt_describe("Inject one Core Compute Correctable Error and verify the "
+		     "error counter increments by 1");
+	igt_subtest("inject_core_compute_corr_error_once")
+		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE, &mmio, fd);
+
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
 		drm_close_driver(fd);
-- 
2.34.1

