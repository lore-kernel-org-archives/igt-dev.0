Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D07606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m0yoJH2l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D42F1120F6;
	Thu, 29 Oct 2026 09:08:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1C01120F9
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793264439; x=1824800439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mKgDiZPVOxg+kWMrmmR6IA0NnOR5RGg0iumBMVALk8s=;
 b=m0yoJH2lzCTtGveRQsj+wNX9bCA0yRgI8xWqG+SRZp++/sHvg6wDFD6O
 6b+eCSTsy/alfn+lNnnQLwR9ZCkUmk9ji8SGugj1dMAxyiDkov5qo1pvi
 IS44QJ817CZxhQAIUa1+OJ4CYD2ZmcKyuGu2zcopV72Pci46rlMhtsJiZ
 T1YAhjzHerUYuvE075WO6XQlXGilquXz7uivBcqP1gX2hAA56p4e56cPQ
 pJgln0WDw4s44orVgXeuNTaSl8ZwrTr8kqOtYxkbLodL28owoX6JGlCiA
 L3+tra1jiVnVq9lIIqf2x+Rce/tlp3iuhmx47q5yLvdnnwZacCpOTdwoY w==;
X-CSE-ConnectionGUID: l3N8zuunT+q900Tpw9aMOQ==
X-CSE-MsgGUID: 1k8kbHMaTkiKViiM11xM8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1991712"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1991712"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:00:39 -0700
X-CSE-ConnectionGUID: noWx1t7CSvqgu0Q1LK7q+Q==
X-CSE-MsgGUID: Fs/4LgbkRqKl3IOiX3ggpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5092969"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:00:36 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v6 07/10] tests/intel/xe_err_injection: Add Core Compute
 Uncorr Error injection
Date: Thu, 29 Oct 2026 14:29:52 +0530
Message-Id: <20261029085955.1232163-8-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add MMIO based Core Compute Uncorrectable Error injection to verify
the Xe driver error handling and recovery flows with the help of
DRM Netlink API suite

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v6:
  - Updated aquire steering semaphore logic (Soham & Riana)
  - Removed enum to string mappings for test names (Riana)
  - Updated metadata in the file (Riana)
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
 tests/intel/xe_err_injection.c | 382 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 2 files changed, 383 insertions(+)
 create mode 100644 tests/intel/xe_err_injection.c

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
new file mode 100644
index 000000000..2f5f85b07
--- /dev/null
+++ b/tests/intel/xe_err_injection.c
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: Test Xe RAS (Reliability, Availability, Serviceability) MMIO based Error Injection
+ * Category: Core
+ * Mega feature: RAS
+ * Sub-category: RAS tests
+ * Functionality: Error Injection
+ * Test category: Functional tests
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
+/* Core Compute Uncorrectable error injection */
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
+	SUCCESS = 1,
+	FAILED,
+	TIMEOUT,
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
+static bool acquire_steering_semaphore(struct xe_mmio *mmio)
+{
+	uint32_t regval;
+	time_t start_time = time(NULL);
+	time_t timeout = 10; /* 10 secs */
+
+	while (time(NULL) - start_time < timeout) {
+		regval = xe_mmio_read32(mmio, XE_STEER_SEMAPHORE_MGSR_3D);
+		if (regval == XE_STEER_SEMAPHORE_MGSR_3D_VALUE)
+			return true;
+	}
+
+	return false;
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
+		return ret;
+	}
+
+	ctx.node_id = node_id;
+	ctx.error_id = error_id;
+
+	ret = igt_drm_ras_nl_get_error_counter(&ctx);
+	if (ret < 0) {
+		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
+		igt_drm_ras_nl_cleanup(&ctx);
+		return ret;
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
+	static const char * const dmesg_status[] = {
+		[SUCCESS] = "AER: device recovery successful",
+		[FAILED] = "AER: device recovery failed",
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
+		for (i = SUCCESS; i < ARRAY_SIZE(dmesg_status); i++) {
+			if (!dmesg_status[i] || !strstr(buff, dmesg_status[i]))
+				continue;
+
+			igt_debug("Found \"%s\" in dmesg after %d secs\n",
+				  dmesg_status[i], elapsed_secs);
+			free(buff);
+			pclose(fp);
+			return i;
+		}
+	}
+
+	free(buff);
+	pclose(fp);
+	return TIMEOUT;
+}
+
+/*
+ * TODO: AER device recovery logic is pending to be implemented using
+ * "uevents emitted by the aer driver" instead of relying on the dmesg
+ * logs.
+ */
+
+static int check_err_recovery(void)
+{
+	time_t start_time = time(NULL);
+	time_t timeout = 10 * 60; /* 10 mins */
+	int time_interval = 30; /* 30 secs */
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
+			return FAILED;
+		}
+		if (status == SUCCESS || status == FAILED)
+			return status;
+
+		if (elapsed_time >= timeout) {
+			igt_warn("Timed out while waiting for error recovery\n");
+			return TIMEOUT;
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
+	igt_assert_f(recovery_ret != TIMEOUT,
+		     "AER error recovery timed out\n");
+	igt_assert_f(recovery_ret != FAILED,
+		     "AER device recovery failed\n");
+	if (recovery_ret == SUCCESS)
+		igt_info("AER device recovery successful\n");
+}
+
+static bool uncorr_error_recovered;
+
+/**
+ * SUBTEST: inject_core_compute_uncorr_error
+ * Description: Inject a Core Compute Uncorrectable error and verify
+ *		AER-based device recovery.
+ *		The dynamic subtests are:
+ *		inject            - Injects Core Compute Uncorrectable error
+ *				    and verifies device recovery.
+ *		post-recovery-wl  - Runs a compute workload on all compute
+ *				    engines after recovery to confirm the GPU
+ *				    remains functional.
+ * Functionality: error injection
+ */
+static void test_inject_core_compute_uncorr_error(struct xe_mmio *mmio, int fd)
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
+	if (!acquire_steering_semaphore(mmio)) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Timed out acquiring steering semaphore\n");
+	}
+
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
+	igt_debug("Injected Core Compute Uncorrectable error\n");
+
+	/* Run traffic to trigger the injected error */
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
+	igt_assert_f(counter_before != UINT32_MAX && counter_after != UINT32_MAX,
+		     "Failed to fetch valid error counters: before=%u after=%u\n",
+		     counter_before, counter_after);
+
+	igt_info("error counter: before injection=%u after injection=%u\n",
+		 counter_before, counter_after);
+
+	igt_assert_f(counter_after > counter_before,
+		     "Core Compute Uncorrectable error injection failed: "
+		     "before=%u after=%u\n", counter_before, counter_after);
+	uncorr_error_recovered = true;
+}
+
+enum xe_err_injection_type {
+	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
+	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
+};
+
+static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *mmio, int fd)
+{
+	switch (injection) {
+	case XE_CORE_COMPUTE_UNCORR_ERR_INJ:
+		test_inject_core_compute_uncorr_error(mmio, fd);
+		break;
+	case XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL:
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
+	igt_describe("Inject core compute uncorrectable error and run post-recovery workload.");
+	igt_subtest_with_dynamic("inject_core_compute_uncorr_error") {
+		igt_dynamic("inject")
+			inject_error(XE_CORE_COMPUTE_UNCORR_ERR_INJ, &mmio, fd);
+
+		igt_dynamic("post-recovery-wl") {
+			igt_require_f(uncorr_error_recovered,
+				      "Run the \"inject\" dynamic subtest first\n");
+			inject_error(XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL, &mmio, fd);
+		}
+	}
+
+	igt_fixture() {
+		xe_mmio_access_fini(&mmio);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 519a9e727..c8a4c9a6a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -294,6 +294,7 @@ intel_xe_progs = [
 	'xe_debugfs',
 	'xe_dma_buf_sync',
 	'xe_drm_fdinfo',
+	'xe_err_injection',
 	'xe_eu_stall',
 	'xe_evict',
 	'xe_evict_ccs',
-- 
2.34.1

