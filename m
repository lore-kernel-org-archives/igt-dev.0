Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97389C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 12:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4459B10E03A;
	Wed, 29 Jul 2026 12:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EzWXvVS0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A046B10E046
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785327671; x=1816863671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xydp1cG/ubQf8wGAMNdvn/A1ARl2jx815NWbqKTwG4A=;
 b=EzWXvVS0Bhr/HlhcqgUtCTaiSpw+idF0VIxzRH54ufvRwapJrD9v2Znb
 z9mrjrq+8XcZQvScJG0ElZ/2vmgbmVoFgbpra7DfoZX9ikK/vob19SYPC
 BKLsRhMFDgUq2uM7nMMpDGa508CDLQ+ZdJf0gApN006WNnZlOk6rk3HYd
 ARQ78yOTak9d9EvmI5X8Q1sj/aty6gtusgsnIi7SBmlNCTcvXUX0m2d/X
 YF6QDj62bDt0hZCluexfFq307PyYHrEvNIkrVzmlPToIlg1Xu3mXZkvNk
 HQSeImM+vGIbwcIMWhhgxAI4LHbteXCSDwTT5Gk+24aDqYMZoirwmL/KM g==;
X-CSE-ConnectionGUID: nqhFGyg0RQOSMenzWGl/aw==
X-CSE-MsgGUID: j18xjk4zRMe+b5pIMecvUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108725199"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108725199"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:21:11 -0700
X-CSE-ConnectionGUID: qVxvbPyGTJu0hlilG5GJZA==
X-CSE-MsgGUID: EsZ8cq6RQFmWVVz/sgvkXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="263802311"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:21:09 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH 5/8] tests/intel/xe_err_injection: Add GT UC Unicast GAM
 Walker Command Parity Error Injection
Date: Wed, 29 Jul 2026 17:49:56 +0530
Message-Id: <20260729121959.603890-6-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
References: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
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

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 tests/intel/xe_err_injection.c | 313 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  18 ++
 tests/meson.build              |   1 +
 3 files changed, 332 insertions(+)
 create mode 100644 tests/intel/xe_err_injection.c
 create mode 100644 tests/intel/xe_err_injection.h

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
new file mode 100644
index 000000000..afbaf0646
--- /dev/null
+++ b/tests/intel/xe_err_injection.c
@@ -0,0 +1,313 @@
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
+	RECOVERY_FAILED = 2,
+	RECOVERY_TIMEOUT = 3,
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
+	ret = init_nl_socket(&ctx);
+	if (ret < 0) {
+		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
+		return error_value;
+	}
+
+	ctx.node_id = node_id;
+	ctx.error_id = error_id;
+
+	ret = get_error_counter(&ctx);
+	if (ret < 0) {
+		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
+	} else {
+		error_value = ctx.error_value;
+		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
+			 ctx.node_id, ctx.error_id, ctx.error_value);
+	}
+
+	cleanup_nl_socket(&ctx);
+
+	return error_value;
+}
+
+static int check_dmesg_for_recovery(const char *marker, int elapsed_secs)
+{
+	char *buff = NULL;
+	size_t buff_size = 0;
+	ssize_t line_len;
+	FILE *fp;
+	const char *success = "AER: device recovery successful";
+	const char *failed = "AER: device recovery failed";
+	bool marker_seen = false;
+
+	fp = popen("dmesg", "r");
+	if (!fp) {
+		igt_warn("Unable to open dmesg to check recovery status\n");
+		return -1;
+	}
+
+	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
+		(void)line_len;
+		if (!marker_seen) {
+			if (strstr(buff, marker))
+				marker_seen = true;
+			continue;
+		}
+
+		if (strstr(buff, success)) {
+			igt_info("Found \"%s\" in dmesg after %d secs\n", success, elapsed_secs);
+			free(buff);
+			pclose(fp);
+			return RECOVERY_SUCCESS;
+		}
+		if (strstr(buff, failed)) {
+			igt_info("Found \"%s\" in dmesg after %d secs\n", failed, elapsed_secs);
+			free(buff);
+			pclose(fp);
+			return RECOVERY_FAILED;
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
+	time_t timeout = 5 * 60;
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
+		status = check_dmesg_for_recovery(marker, elapsed_time);
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
+		igt_info("Injection status SET: %s\n", err_name);
+	else
+		igt_info("Injection status NOT SET: %s\n", err_name);
+}
+
+static bool gt_uc_wkr_parity_recovered;
+
+/**
+ * SUBTEST: GT-UC-unicast-wkr-cmd-parity-err
+ * Description: GT Uncorrectable Unicast Walker Command parity error injection
+ * Functionality: error injection
+ */
+static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	uint32_t error_counter_before_inj;
+	uint32_t error_counter_after_inj;
+	uint32_t node_id = 1;
+	uint32_t error_id = 1;
+
+	fw_handle = acquire_forcewake(fd);
+
+	error_counter_before_inj = get_counter(node_id, error_id);
+
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
+	if (strcmp(injection, "GT-UC-unicast-wkr-cmd-parity-err") == 0)
+		wkr_cmd_parity_err_injection(mmio, fd);
+	else
+		igt_info("Invalid Error Injection specified\n");
+}
+
+/**
+ * SUBTEST: GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
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
+	igt_subtest("GT-UC-unicast-wkr-cmd-parity-err")
+		inject_error("GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
+
+	igt_describe("Run post-recovery workload after GT parity error injection test.");
+	igt_subtest("GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
+		igt_require_f(gt_uc_wkr_parity_recovered,
+			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
+		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
+	}
+
+	igt_fixture() {
+		xe_mmio_access_fini(&mmio);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
new file mode 100644
index 000000000..d7efc2fd2
--- /dev/null
+++ b/tests/intel/xe_err_injection.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef XE_ERR_INJECTION_H
+#define XE_ERR_INJECTION_H
+
+/* GT Uncorrectable unicast worker command parity error injection */
+#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
+#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
+#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
+#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
+
+#define POST_RECOVERY_WL 1
+#define POST_ARMING_INJECTION_WL 0
+
+#endif /* XE_ERR_INJECTION_H */
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

