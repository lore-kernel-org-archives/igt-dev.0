Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D161CD1297
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 18:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7FE10E636;
	Tue, 11 Nov 2025 18:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Je7oYkRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4857110E635
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 18:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762884212; x=1794420212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l3qO/5MDyKusAFr7aOUdESJk9LJqlxiRRTumrtuYScs=;
 b=Je7oYkRdeb+oYQarHODzydW7AxHYeKWN+YvPf99IKlrD/kXAgYiwCEcd
 4HieArEErCRYgb51MSvQTHTQPfWeBue22P8mkj2Njc9YLqUUo923IBXoy
 q0tu39nHlcdCK07cO9thopi/Hpex38kaJypV/8NAagzXoq0HrHEF/33gc
 ud2RVu8FRCgvGT7R835mHNPRY5hX1n5yjkQMX1KZMrU4XLBwf5N3Y6163
 iBH0rC39hgyoT4XlVYhxyWHWJULum0D0Dr66gyZZow6MHlGZHWUcNe4ka
 emg2a9AouVlvrFxDtSjPI4x0isLkVJfC5uuRx7gAazN/+ap+eIow2qprg w==;
X-CSE-ConnectionGUID: 2b64iVkpS0OHYA9jydOQ4g==
X-CSE-MsgGUID: a82PhSoAQearLp8d95fEew==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75634154"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="75634154"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 10:03:32 -0800
X-CSE-ConnectionGUID: rBGktEqeRaeZ+cGWcuAWbQ==
X-CSE-MsgGUID: z9WyPxE9SvqpkPBxzUFMAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="189450509"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.223.55.76])
 by fmviesa009.fm.intel.com with ESMTP; 11 Nov 2025 10:03:30 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.poosa@intel.com, karthik.b.s@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 2/2] tests/intel/kms_pm_vrsr: Add test to validate VRSR
 with runtime suspend
Date: Tue, 11 Nov 2025 23:30:04 +0530
Message-Id: <20251111180004.11865-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251111180004.11865-1-mohammed.thasleem@intel.com>
References: <20251111180004.11865-1-mohammed.thasleem@intel.com>
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

This test detect primary connected panel and also adds a test for
VRAM Self Refresh (VRSR), focusing on display flips and power management
efficiency. It handles transitions between power state like runtime
suspend. The patch includes validation of VRAM residency and power
state transitions, ensuring accurate testing of VRSR functionality.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_vrsr.c | 83 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tests/intel/kms_pm_vrsr.c b/tests/intel/kms_pm_vrsr.c
index 5a96eebfa..906563dd6 100644
--- a/tests/intel/kms_pm_vrsr.c
+++ b/tests/intel/kms_pm_vrsr.c
@@ -46,6 +46,9 @@
  * SUBTEST: vrsr-system-suspend
  * Description: Validated VRSR during system suspend alongside active display flip
  *
+ * SUBTEST: vrsr-runtime-suspend
+ * Description: Validated VRSR during runtime suspend alongside active display flip
+ *
  */
 
 IGT_TEST_DESCRIPTION("This test to validate VRAM Self Refresh");
@@ -84,6 +87,7 @@ typedef struct {
 
 typedef enum {
 	SUSPEND_SYSTEM,
+	SUSPEND_RUNTIME
 } suspend_type;
 
 static void setup_primary(device_t *device)
@@ -440,6 +444,63 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
 	active_threads = 0;
 }
 
+static void dpms_on_off(device_t device, int mode)
+{
+	int i;
+
+	if (!device.res)
+		return;
+
+	for (i = 0; i < device.res->count_connectors; i++) {
+		drmModeConnector *connector = drmModeGetConnectorCurrent(device.fd_xe,
+									 device.res->connectors[i]);
+
+		if (!connector)
+			continue;
+
+		if (connector->connection == DRM_MODE_CONNECTED)
+			kmstest_set_connector_dpms(device.fd_xe, connector, mode);
+
+		drmModeFreeConnector(connector);
+	}
+}
+
+static void cleanup_d3(device_t device)
+{
+	dpms_on_off(device, DRM_MODE_DPMS_ON);
+}
+
+static bool setup_d3(device_t device, enum igt_acpi_d_state state)
+{
+	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
+		      "PCI power management capability not found\n");
+
+	dpms_on_off(device, DRM_MODE_DPMS_OFF);
+
+	/*
+	 * The drm calls used for dpms status above will result in IOCTLs
+	 * that might wake up the device. Let's ensure the device is back
+	 * to a stable suspended state before we can proceed with the
+	 * configuration below, since some strange failures were seen
+	 * when d3cold_allowed is toggle while runtime is in a transition
+	 * state.
+	 */
+	if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED))
+		return false;
+
+	switch (state) {
+	case IGT_ACPI_D3Cold:
+		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
+		igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
+		igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
+		return true;
+	default:
+		igt_debug("Invalid D3 Selection\n");
+	}
+
+	return false;
+}
+
 static uint64_t get_mods_count(char *pkg_data)
 {
 	char *e;
@@ -493,6 +554,11 @@ static void vrsr_suspend_test(device_t *device, int sysfs_fd, suspend_type type)
 	case SUSPEND_SYSTEM:
 		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
 		break;
+	case SUSPEND_RUNTIME:
+		igt_assert(setup_d3(*device, IGT_ACPI_D3Cold));
+		sleep(1);
+		igt_assert(in_d3(*device, IGT_ACPI_D3Cold));
+		break;
 	}
 
 	mods_curr_value = read_mods(device->debugfs_fd);
@@ -502,6 +568,9 @@ static void vrsr_suspend_test(device_t *device, int sysfs_fd, suspend_type type)
 	igt_assert_f(mods_curr_value > mods_prev_value,
 		     "Mods residency is inaccurate: %" PRIu64 "\n", mods_curr_value);
 
+	if (type == SUSPEND_RUNTIME)
+		cleanup_d3(*device);
+
 	cleanup(*device);
 }
 
@@ -522,6 +591,8 @@ igt_main
 	char buf[256];
 	device_t device;
 	int sysfs_fd, ret;
+	bool has_runtime_pm;
+	uint32_t d3cold_allowed;
 
 	igt_fixture {
 		memset(&device, 0, sizeof(device));
@@ -542,6 +613,8 @@ igt_main
 		/* Always perform initial once-basic exec checking for health */
 		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
 
+		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
+		has_runtime_pm = igt_setup_runtime_pm(device.fd_xe);
 		sysfs_fd = igt_sysfs_open(device.fd_xe);
 		device.res = drmModeGetResources(device.fd_xe);
 		igt_install_exit_handler(kms_poll_state_restore);
@@ -551,9 +624,19 @@ igt_main
 	igt_subtest("vrsr-system-suspend")
 		vrsr_suspend_test(&device, sysfs_fd, SUSPEND_SYSTEM);
 
+	igt_describe("Validated VRSR during runtime suspend alongside active display flip");
+	igt_subtest("vrsr-runtime-suspend") {
+		igt_require_f(has_runtime_pm, "Runtime PM not available\n");
+		vrsr_suspend_test(&device, sysfs_fd, SUSPEND_RUNTIME);
+	}
+
 	igt_fixture {
 		close(device.debugfs_fd);
 		close(sysfs_fd);
+		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
+
+		if (has_runtime_pm)
+			igt_restore_runtime_pm();
 		drmModeFreeResources(device.res);
 		igt_display_fini(&device.display);
 		drm_close_driver(device.fd_xe);
-- 
2.25.1

