Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31607C624A4
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 07:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B707F10F44C;
	Thu,  3 Sep 2026 07:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Simibubp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4813210F424
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 07:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788420867; x=1819956867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H44HxiarX448+Lddgi9RstbceNB6qu/jzcq6PzyW+pc=;
 b=Simibubpe9WTK3ubu3XozBReLw//zoxfW3GajbV3LOzOBNmctRRIdEI/
 vZQ9dFxoUfvdCzAW6fqlKY8CdHjAziAKU7JtFX4xJ/DK1Ibdf7WHl517A
 A021Cxnk9G/MHnu9vkBgstSwMVsS4UnV7n5990spfwdpejwplsG0fVlPD
 pf+MKPPj/Az4YilYGREb5z+SpH3G8S6hVQa5z6RV+a1KkUtqidaaR0m7Q
 eVSZSk/NNXWXCwhcgbMkTeK4CsUrxbsHRg9qIbv0amtA1PwqxO3mFwyXf
 wcpScRP4MvZznkK6Rb6z/xqoy4UzXaAU8xAVdd6cO5Osa0EgqvUGxdz2t g==;
X-CSE-ConnectionGUID: Qu+myyczTNirHHX9jKNjxA==
X-CSE-MsgGUID: 4eSqWNa9S/a2aum/KXyLeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88655723"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88655723"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:27 -0700
X-CSE-ConnectionGUID: 0uKdQ2CtS5iTiPKEggeoDg==
X-CSE-MsgGUID: dYOXmWEfRCeFRiM/TlcpKg==
X-ExtLoop1: 1
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:24 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Purkait Soham <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Jadav Raag <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 07/10] tests/intel/xe_err_injection: Add GT UC Unicast GAM
 Walker Command Parity Error Injection
Date: Thu,  3 Sep 2026 13:03:32 +0530
Message-Id: <20260903073335.339540-8-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
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

Cc: Purkait Soham <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Cc: Jadav Raag <raag.jadav@intel.com>
Cc: Nilawar Badal <badal.nilawar@intel.com>
Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v4:
  - Added Steer Semaphore for disabling and enabling multicast
    operation(soham)
  - Increased device recovery check timeout from 5secs to 10secs
  - Used updated library names with igt_drm_netlink_* prefix (Nikula
    Jani & Kamil)
---
 tests/intel/xe_err_injection.c | 342 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  31 +++
 tests/meson.build              |   1 +
 3 files changed, 374 insertions(+)
 create mode 100644 tests/intel/xe_err_injection.c
 create mode 100644 tests/intel/xe_err_injection.h

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
new file mode 100644
index 000000000..683994d1c
--- /dev/null
+++ b/tests/intel/xe_err_injection.c
@@ -0,0 +1,342 @@
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
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <fcntl.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "lib/igt_drm_netlink.h"
+#include "lib/intel_reg.h"
+#include "lib/intel_compute.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_mmio.h"
+#include "xe/xe_query.h"
+#include "xe_err_injection.h"
+
+enum {
+	RECOVERY_SUCCESS = 1,
+	RECOVERY_FAILED,
+	RECOVERY_TIMEOUT,
+};
+
+static void run_xe_compute_on_all_engines(int fd, bool state)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	if (state == POST_ARMING_INJECTION_WL)
+		igt_info("Running compute-square on all engines post injection\n");
+	else if (state == POST_RECOVERY_WL)
+		igt_info("Running compute-square on all engines post recovery\n");
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+			continue;
+
+		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
+								    EXECENV_PREF_SYSTEM),
+								    "GPU does not support "
+								    "compute on engine\n");
+	}
+}
+
+static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
+{
+	xe_mmio_write32(mmio, reg, value);
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
+		regval = xe_mmio_read32(mmio, STEER_SEMAPHORE_MGSR_3D);
+		if (regval == STEER_SEMAPHORE_MGSR_3D_VALUE) {
+			xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D, 0x0);
+			return;
+		}
+	}
+}
+
+static void release_steering_semaphore(struct xe_mmio *mmio)
+{
+	xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D,
+			STEER_SEMAPHORE_MGSR_3D_VALUE);
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
+	struct app_context ctx;
+	int ret;
+	uint32_t error_value = UINT32_MAX;
+
+	ret = igt_drm_netlink_init(&ctx);
+	if (ret < 0) {
+		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
+		return error_value;
+	}
+
+	ctx.node_id = node_id;
+	ctx.error_id = error_id;
+
+	ret = igt_drm_netlink_get_error_counter(&ctx);
+	if (ret < 0) {
+		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
+	} else {
+		error_value = ctx.error_value;
+		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
+			 ctx.node_id, ctx.error_id, ctx.error_value);
+	}
+
+	igt_drm_netlink_cleanup(&ctx);
+
+	return error_value;
+}
+
+static int check_dmesg(const char *marker, int elapsed_secs)
+{
+	static const char * const recovery_messages[] = {
+		"AER: device recovery successful",
+		"AER: device recovery failed",
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
+		for (i = 0; i < ARRAY_SIZE(recovery_messages); i++) {
+			if (!strstr(buff, recovery_messages[i]))
+				continue;
+
+			igt_debug("Found \"%s\" in dmesg after %d secs\n",
+				  recovery_messages[i], elapsed_secs);
+			free(buff);
+			pclose(fp);
+			return RECOVERY_SUCCESS + i;
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
+static void log_status(bool val, const char *err_name)
+{
+	if (val)
+		igt_info("Injection: %s Success\n", err_name);
+	else
+		igt_info("Injection: %s Failed\n", err_name);
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
+	uint32_t error_counter_before_inj;
+	uint32_t error_counter_after_inj;
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
+	error_counter_before_inj = get_counter(node_id, error_id);
+
+	acquire_steering_semaphore(mmio);
+	/* Arm the injection sequence. */
+	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
+	modify_reg_bit(mmio,
+		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
+		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
+		       true);
+	modify_reg_bit(mmio,
+		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		       MC_PKT_CTRL_MGSR_3D_VALUE,
+		       true);
+	release_steering_semaphore(mmio);
+	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
+
+	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
+
+	release_forcewake(fw_handle);
+	print_aer_recovery_status();
+	error_counter_after_inj = get_counter(node_id, error_id);
+
+	igt_assert_f(error_counter_before_inj != UINT32_MAX &&
+		     error_counter_after_inj != UINT32_MAX,
+		     "Failed to fetch valid error counters: before=%u after=%u\n",
+		     error_counter_before_inj, error_counter_after_inj);
+
+	igt_info("error counter: before injection=%u after injection=%u\n",
+		 error_counter_before_inj, error_counter_after_inj);
+
+	igt_assert_f(error_counter_after_inj > error_counter_before_inj,
+		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
+		     "failed: before injection=%u after injection=%u\n",
+		     error_counter_before_inj, error_counter_after_inj);
+	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
+	gt_uc_wkr_parity_recovered = true;
+}
+
+static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
+{
+	igt_info("Starting Error Injection test: %s\n", injection);
+	if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") == 0)
+		wkr_cmd_parity_err_injection(mmio, fd);
+	else if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
+		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
+	else
+		igt_info("Invalid Error Injection specified\n");
+}
+
+/**
+ * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
+ * Description: Run a post-recovery Xe workload after parity error injection.
+ * Functionality: workload validation
+ */
+
+int igt_main()
+{
+	int fd;
+	struct xe_mmio mmio;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
+		xe_mmio_access_init(fd, &mmio);
+		igt_require(xe_mmio_is_initialized(&mmio));
+	}
+
+	igt_describe("Inject GT uncorrectable unicast worker command parity error.");
+	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
+		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
+
+	igt_describe("Run post-recovery workload after GT parity error injection test.");
+	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
+		igt_require_f(gt_uc_wkr_parity_recovered,
+			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
+		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
+	}
+
+	igt_fixture() {
+		xe_mmio_access_fini(&mmio);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
new file mode 100644
index 000000000..a70e6af22
--- /dev/null
+++ b/tests/intel/xe_err_injection.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef XE_ERR_INJECTION_H
+#define XE_ERR_INJECTION_H
+
+/* Steering Control Register (MC_PKT_CTRL) */
+#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
+#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
+
+/* GT Uncorrectable worker command parity error injection */
+#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
+#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
+
+#define POST_RECOVERY_WL 1
+#define POST_ARMING_INJECTION_WL 0
+
+/* STEER_SEMAPHORE_MGSR_3D */
+#define STEER_SEMAPHORE_MGSR_3D 0x00FD0
+#define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
+
+/* Node types for error counters*/
+#define NODE_ID_UNCORRECTABLE_ERROR 1
+
+/* Error types for error counter */
+#define ERROR_ID_CORE_COMPUTE 1
+
+#endif /* XE_ERR_INJECTION_H */
+
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

