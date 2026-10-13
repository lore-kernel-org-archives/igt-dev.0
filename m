Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680C1CC6B1A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 19:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A4010E5E5;
	Tue, 13 Oct 2026 19:12:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9706110E950
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 19:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918479; x=1823454479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MucadUfn11BCbQx72PB3D5spbLPP1ziDy1HxlCEHk7A=;
 b=l/TVXcL1gSEp5LgH1IEQbKV0dodweJca+hVkvj5tEVsFvDJL70zSKqeN
 v5e/1V/4B+6XxVRDQ1M3rTdhaBxpTrdrV6AjftkNsqzh0RKtht4RNjp38
 fRaufP5abvWX63VCIyn5H6PKcTl6IxZmKkLPE4+m56obTbzs2IQx2bbQf
 eUBw1igzPeOhBxkvoRwM5j2RPb/V0pjr13pHNzr3sQGFrwwaFP+ehGUfX
 SjHZwJFs18/evq8kNFBWkBS5qqSWgu+y0LuWlOfBdRiry9ErvhJZgp6z0
 5w0iitJJnLh7Bn/vK3cGO5N91QPgNZgS9h9aouO2OycNDfSXCAXY7srhP w==;
X-CSE-ConnectionGUID: S/yygvInQWyZzCrz518lfA==
X-CSE-MsgGUID: JMLaGj77SKychaSczDDxIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="687277"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="687277"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:58 -0700
X-CSE-ConnectionGUID: LDtIYMcdTs6DY1XfetI6BA==
X-CSE-MsgGUID: TMnHi+kPRYaP/gr1hnFPGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3004484"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:55 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 07/10] tests/intel/xe_err_injection: Add GT UC Unicast GAM
 Walker Command Parity Error Injection
Date: Wed, 14 Oct 2026 00:36:48 +0530
Message-Id: <20261013190651.897241-8-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
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

MMIO based GT Uncorrectable Unicast GAM Walker command parity error
injection to verify the Xe driver error handling and recovery flows with
the help of DRM Netlink API suite

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v5:
  - Removed xe_err_injection.h and moved its contents into the .c file (Riana)
  - Prefixed all register address and bit value names with "XE_" (Riana)
  - Updated AER recovery dmesg strings to use enum-indexed arrays (Soham)
  - Added error handling logic for function calls
  - Changed test name comparisons from strings to enums (Riana)
  - Added UC test and post-recovery workload tests as dynamic subtests (Riana)
v4:
  - Added Steer Semaphore for disabling and enabling multicast
    operation(soham)
  - Increased device recovery check timeout from 5secs to 10secs
  - Used updated library names with igt_drm_netlink_* prefix (Nikula
    Jani & Kamil)
---
 tests/intel/xe_err_injection.c | 372 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 2 files changed, 373 insertions(+)
 create mode 100644 tests/intel/xe_err_injection.c

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
new file mode 100644
index 000000000..332b2cae0
--- /dev/null
+++ b/tests/intel/xe_err_injection.c
@@ -0,0 +1,372 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: MMIO based Error Injection
+ * Category: RAS
+ * Mega feature: Telemetry
+ * Sub-category: Driver
+ * Test category: Error Injection
+ */
+
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "lib/igt_drm_ras_nl.h"
+#include "lib/intel_reg.h"
+#include "lib/intel_compute.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_mmio.h"
+#include "xe/xe_query.h"
+
+/* Steering Control Register (MC_PKT_CTRL) */
+#define XE_MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
+#define XE_MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
+
+/* GT Uncorrectable worker command parity error injection */
+#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
+#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
+
+#define POST_RECOVERY_WL 1
+#define POST_ARMING_INJECTION_WL 0
+
+/* STEER_SEMAPHORE_MGSR_3D */
+#define XE_STEER_SEMAPHORE_MGSR_3D 0x00FD0
+#define XE_STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
+
+/* Node types for error counters*/
+#define NODE_ID_UNCORRECTABLE_ERROR 1
+
+/* Error types for error counter */
+#define ERROR_ID_CORE_COMPUTE 1
+
+enum {
+	RECOVERY_SUCCESS = 1,
+	RECOVERY_FAILED,
+	RECOVERY_TIMEOUT,
+};
+
+static bool run_xe_compute_on_all_engines(int fd, bool state)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	bool ret = false;
+
+	igt_info("Running compute-square on all engines post %s\n",
+		 state == POST_ARMING_INJECTION_WL ? "injection" : "recovery");
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+			continue;
+
+		ret = xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL, EXECENV_PREF_SYSTEM);
+	}
+	return ret;
+}
+
+static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
+			   uint32_t bit_mask, bool set)
+{
+	uint32_t regval;
+
+	regval = xe_mmio_read32(mmio, reg_addr);
+	if (set)
+		regval |= bit_mask;
+	else
+		regval &= ~bit_mask;
+
+	xe_mmio_write32(mmio, reg_addr, regval);
+}
+
+static void acquire_steering_semaphore(struct xe_mmio *mmio)
+{
+	uint32_t regval;
+
+	while (true) {
+		regval = xe_mmio_read32(mmio, XE_STEER_SEMAPHORE_MGSR_3D);
+		if (regval == XE_STEER_SEMAPHORE_MGSR_3D_VALUE) {
+			xe_mmio_write32(mmio, XE_STEER_SEMAPHORE_MGSR_3D, 0x0);
+			return;
+		}
+	}
+}
+
+static void release_steering_semaphore(struct xe_mmio *mmio)
+{
+	xe_mmio_write32(mmio, XE_STEER_SEMAPHORE_MGSR_3D,
+			XE_STEER_SEMAPHORE_MGSR_3D_VALUE);
+}
+
+static int acquire_forcewake(int fd)
+{
+	int fw_handle;
+
+	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+	igt_assert_lte(0, fw_handle);
+	return fw_handle;
+}
+
+static void release_forcewake(int fw_handle)
+{
+	if (fw_handle >= 0)
+		close(fw_handle);
+}
+
+static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
+{
+	struct igt_drm_ras_nl_context ctx;
+	int ret;
+	uint32_t error_value = UINT32_MAX;
+
+	ret = igt_drm_ras_nl_init(&ctx);
+	if (ret < 0) {
+		igt_warn("Failed to initialize socket for get_error command (ret=%d)\n", ret);
+		return error_value;
+	}
+
+	ctx.node_id = node_id;
+	ctx.error_id = error_id;
+
+	ret = igt_drm_ras_nl_get_error_counter(&ctx);
+	if (ret < 0) {
+		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
+		igt_drm_ras_nl_cleanup(&ctx);
+		return -1;
+	} else {
+		error_value = ctx.error_value;
+		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
+			 ctx.node_id, ctx.error_id, ctx.error_value);
+	}
+
+	igt_drm_ras_nl_cleanup(&ctx);
+
+	return error_value;
+}
+
+static int check_dmesg(const char *marker, int elapsed_secs)
+{
+	static const char * const recovery_messages[] = {
+		[RECOVERY_SUCCESS] = "AER: device recovery successful",
+		[RECOVERY_FAILED] = "AER: device recovery failed",
+	};
+	char *buff = NULL;
+	size_t buff_size = 0;
+	size_t i;
+	ssize_t line_len;
+	FILE *fp;
+	bool marker_seen = false;
+
+	fp = popen("dmesg", "r");
+	if (!fp) {
+		igt_warn("Unable to open dmesg to check recovery status\n");
+		return -1;
+	}
+
+	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
+		if (!marker_seen) {
+			if (strstr(buff, marker))
+				marker_seen = true;
+			continue;
+		}
+
+		for (i = RECOVERY_SUCCESS; i < ARRAY_SIZE(recovery_messages); i++) {
+			if (!recovery_messages[i] || !strstr(buff, recovery_messages[i]))
+				continue;
+
+			igt_debug("Found \"%s\" in dmesg after %d secs\n",
+				  recovery_messages[i], elapsed_secs);
+			free(buff);
+			pclose(fp);
+			return i;
+		}
+	}
+
+	free(buff);
+	pclose(fp);
+	return RECOVERY_TIMEOUT;
+}
+
+static int check_err_recovery(void)
+{
+	time_t start_time = time(NULL);
+	time_t timeout = 10 * 60; /* 10 secs */
+	int time_interval = 30;
+	time_t elapsed_time;
+	int status;
+	char marker[128];
+
+	snprintf(marker, sizeof(marker),
+		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
+		 getpid(), (long long)start_time);
+	igt_kmsg(KMSG_INFO "%s\n", marker);
+
+	while (1) {
+		elapsed_time = time(NULL) - start_time;
+		status = check_dmesg(marker, elapsed_time);
+		if (status < 0) {
+			igt_warn("Failed to query dmesg for recovery status\n");
+			return RECOVERY_FAILED;
+		}
+		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
+			return status;
+
+		if (elapsed_time >= timeout) {
+			igt_warn("Timed out while waiting for error recovery\n");
+			return RECOVERY_TIMEOUT;
+		}
+
+		sleep(time_interval);
+	}
+}
+
+static void print_aer_recovery_status(void)
+{
+	int recovery_ret;
+
+	recovery_ret = check_err_recovery();
+	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
+		     "AER error recovery timed out\n");
+	igt_assert_f(recovery_ret != RECOVERY_FAILED,
+		     "AER device recovery failed\n");
+	if (recovery_ret == RECOVERY_SUCCESS)
+		igt_info("AER device recovery successful\n");
+}
+
+static bool gt_uc_wkr_parity_recovered;
+
+/**
+ * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
+ * Description: GT Uncorrectable Unicast Walker Command parity error injection
+ * Functionality: error injection
+ */
+static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	bool ret;
+	uint32_t counter_before;
+	uint32_t counter_after;
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=1 (uncorrectable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
+	uint32_t error_id = ERROR_ID_CORE_COMPUTE;
+
+	fw_handle = acquire_forcewake(fd);
+
+	counter_before = get_counter(node_id, error_id);
+	if (counter_before < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to read error counter before injection\n");
+	}
+
+	acquire_steering_semaphore(mmio);
+	/* Arm the injection sequence. */
+	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
+	modify_reg_bit(mmio,
+		       XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
+		       XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
+		       true);
+	modify_reg_bit(mmio,
+		       XE_MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		       XE_MC_PKT_CTRL_MGSR_3D_VALUE,
+		       true);
+	release_steering_semaphore(mmio);
+	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
+
+	ret = run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
+	if (!ret) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to run Xe compute on all engines post injection\n");
+	}
+
+	release_forcewake(fw_handle);
+	print_aer_recovery_status();
+
+	counter_after = get_counter(node_id, error_id);
+	igt_assert_f(counter_after < 0, "Failed to read error counter after injection\n");
+
+	igt_assert_f(counter_before != UINT32_MAX &&
+		     counter_after != UINT32_MAX,
+		     "Failed to fetch valid error counters: before=%u after=%u\n",
+		     counter_before, counter_after);
+
+	igt_info("error counter: before injection=%u after injection=%u\n",
+		 counter_before, counter_after);
+
+	igt_assert_f(counter_after > counter_before,
+		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
+		     "failed: before injection=%u after injection=%u\n",
+		     counter_before, counter_after);
+	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
+	gt_uc_wkr_parity_recovered = true;
+}
+
+enum xe_err_injection_type {
+	XE_ERR_INJ_GT_UC_WKR_CMD_PARITY,
+	XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL,
+};
+
+static const char * const xe_err_injection_names[] = {
+	[XE_ERR_INJ_GT_UC_WKR_CMD_PARITY] = "test_GT-UC-unicast-wkr-cmd-parity-err",
+	[XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL] =
+		"test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl",
+};
+
+static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *mmio, int fd)
+{
+	igt_info("Starting Error Injection test: %s\n", xe_err_injection_names[injection]);
+	switch (injection) {
+	case XE_ERR_INJ_GT_UC_WKR_CMD_PARITY:
+		wkr_cmd_parity_err_injection(mmio, fd);
+		break;
+	case XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL:
+		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
+		break;
+	default:
+		igt_info("Invalid Error Injection specified\n");
+	}
+}
+
+int igt_main()
+{
+	int fd;
+	struct xe_mmio mmio;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require_f(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY),
+			      "forcewake_all is not available in debugfs\n");
+		xe_mmio_access_init(fd, &mmio);
+		igt_require_f(xe_mmio_is_initialized(&mmio),
+			      "Failed to initialize Xe MMIO access\n");
+	}
+
+	igt_describe("Inject GT uncorrectable unicast worker command parity error,"
+		     " and run post-recovery workload after injection.");
+	igt_subtest_with_dynamic("test_GT-UC-unicast-wkr-cmd-parity-err") {
+		igt_dynamic("inject")
+			inject_error(XE_ERR_INJ_GT_UC_WKR_CMD_PARITY, &mmio, fd);
+
+		igt_dynamic("post-recovery-wl") {
+			igt_require_f(gt_uc_wkr_parity_recovered,
+				      "Run the \"inject\" dynamic subtest first\n");
+			inject_error(XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL, &mmio, fd);
+		}
+	}
+
+	igt_fixture() {
+		xe_mmio_access_fini(&mmio);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index a62f447df..0f090dcee 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -292,6 +292,7 @@ intel_xe_progs = [
 	'xe_debugfs',
 	'xe_dma_buf_sync',
 	'xe_drm_fdinfo',
+	'xe_err_injection',
 	'xe_eu_stall',
 	'xe_evict',
 	'xe_evict_ccs',
-- 
2.34.1

