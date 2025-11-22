Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D696CFD2E3
	for <igt-dev@archiver.kernel.org>; Sat, 22 Nov 2025 18:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EF410E0AB;
	Sat, 22 Nov 2025 18:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8m4Cp8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2923210E0AB
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Nov 2025 18:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763837898; x=1795373898;
 h=message-id:date:mime-version:to:from:subject:
 content-transfer-encoding;
 bh=il1BiEo732wZkHgb8xUVue59srtNPV5FbXFmwh/h0SM=;
 b=P8m4Cp8r11RLg/oyjJ933kKY8EUMlun4q8xcz57cHjpvfqn4Hnpt3A/a
 MBLoigjZXTx7i10awwZy72YjLCYWgZjdLqDetJvXXjq6W3qir4++Boxna
 p5u0FJFuSQzd7BrSQU8asKeve0t88qob+qsiVfun8dF246D0AnczyCQKl
 nbUN0X74EUzHORqaK9Udtz1gbXQ5K2fHDnxLn4GcxHuo1ycIc8U3xP1tp
 PHnwBf2bB0NRLedrgM84E4y+S86ZuJHAbd4Y32qfae47RPAHpPIJUopOB
 G9QxGXhDLy8Vh13vjB/xnZ32ewhCg1a+1nUPE+YUhqOUQRWWv8RGtoklF g==;
X-CSE-ConnectionGUID: VVXREJGdQLiztMoWEk9pCQ==
X-CSE-MsgGUID: xtnRho+tRBK/V5MMEYd8hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69756814"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="69756814"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:58:18 -0800
X-CSE-ConnectionGUID: HluH00rFR9uSQQWFVNzwJw==
X-CSE-MsgGUID: PETb1xLAR7G6WaRu6tGSxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="196437491"
Received: from rubishem-mobl.ger.corp.intel.com (HELO [10.245.32.232])
 ([10.245.32.232])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:58:17 -0800
Message-ID: <425497dd-1cad-4887-8ec8-4088197b95fc@linux.intel.com>
Date: Sat, 22 Nov 2025 19:58:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 daniele.ceraolospurio@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Issues with Multi-GPU Device Isolation for Fault Injection Tests
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hello,

I've been working on the multi-GPU device isolation feature for fault
injection tests that was requested, but I've run into some blockers...

As discussed, fault injection tests operate at the driver level and
affect all GPUs bound to the xe driver. The goal was to automatically
unbind non-selected devices when running tests with --device on
multi-GPU systems, then rebind them after the tests complete.

The approach:
 - Scans /sys/bus/pci/drivers/xe/ to detect all bound devices
 - Detects when --device flag is used via igt_device_filter_count()
 - Unbinds non-selected devices before running tests
 - Attempts to restore the system state after tests complete

The problem is that rebinding devices does not work reliably. I've
encountered two major issues:
1. Device Rebinding Issues:
 - Rebinding either works but returns an error code from sysfs, or
 - It completely locks the machine, usually on the second rebind attempt
 - This makes the cleanup unreliable and potentially dangerous

2. Module Reload Alternative:
 - I tried replacing rebind with a full module reload (using
igt_xe_driver_unload() and load_and_check_xe(NULL))
 - This approach also failed and did not provide a reliable solution as
the driver fails to unload.

I am under the impression that unbinding a GPU from the driver leaves
the driver in an unclean state that is preventing successful module
reload and successful GPU bind. As I used the standard igt library
functions that are used elsewhere in the code, I am uncertain if there
is a way out here.

Given these issues, I don't believe the current approach of runtime
device management is viable for production use. Please see the attached
code for details on what I've tried.

Ideas?

Thank you,

Peter




From 8f90be5f622cebc294dab14111eea4ac9e4ee3d7 Mon Sep 17 00:00:00 2001
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Date: Wed, 19 Nov 2025 22:24:48 +0100
Subject: [PATCH i-g-t] devc

---
 tests/intel/xe_fault_injection.c | 276 +++++++++++++++++++++++++++++++
 1 file changed, 276 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c
b/tests/intel/xe_fault_injection.c
index 4b4881634..38676bbbb 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -12,9 +12,12 @@
  */

 #include <limits.h>
+#include <dirent.h>
+#include <ctype.h>

 #include "igt.h"
 #include "igt_device.h"
+#include "igt_device_scan.h"
 #include "igt_kmod.h"
 #include "igt_sriov_device.h"
 #include "igt_sysfs.h"
@@ -45,6 +48,269 @@ struct fault_injection_params {
 	uint32_t space;
 };

+#define PCI_NAME_MAX 256
+#define MAX_XE_DEVICES 16
+
+/**
+ * struct xe_device_info - Information about a single Xe device
+ * @pci_slot: PCI slot name (e.g., "0000:03:00.0")
+ * @is_selected: Whether this device was selected via --device filter
+ * @was_bound: Whether this device was originally bound to xe driver
+ * @needs_rebind: Whether this device needs to be rebound on cleanup
+ */
+struct xe_device_info {
+	char pci_slot[PCI_NAME_MAX];
+	bool is_selected;
+	bool was_bound;
+	bool needs_rebind;
+};
+
+/**
+ * struct xe_device_context - Context for managing multiple Xe devices
+ * @devices: Array of detected Xe devices
+ * @device_count: Number of devices detected
+ * @selected_device: Pointer to the selected device (NULL if none)
+ * @multi_gpu_system: Whether multiple GPUs are bound to xe driver
+ */
+struct xe_device_context {
+	struct xe_device_info devices[MAX_XE_DEVICES];
+	int device_count;
+	struct xe_device_info *selected_device;
+	bool multi_gpu_system;
+};
+
+/**
+ * scan_xe_devices - Scan for Xe devices bound to the driver
+ * @ctx: Device context to populate
+ *
+ * Scans /sys/bus/pci/drivers/xe/ to find all PCI devices currently bound
+ * to the xe driver. Records each device's PCI slot name.
+ *
+ * Returns: 0 on success, -1 on error
+ */
+static int scan_xe_devices(struct xe_device_context *ctx)
+{
+	DIR *dir;
+	struct dirent *entry;
+	const char *xe_driver_path = "/sys/bus/pci/drivers/xe";
+
+	memset(ctx, 0, sizeof(*ctx));
+
+	dir = opendir(xe_driver_path);
+	if (!dir) {
+		igt_debug("Could not open %s: %s\n", xe_driver_path, strerror(errno));
+		return 0; /* Not an error - driver might not be loaded */
+	}
+
+	while ((entry = readdir(dir)) != NULL) {
+		/* PCI device entries are symlinks that start with a digit */
+		if (entry->d_type != DT_LNK || !isdigit(entry->d_name[0]))
+			continue;
+
+		if (ctx->device_count >= MAX_XE_DEVICES) {
+			igt_warn("Found more than %d Xe devices, ignoring extras\n",
+				 MAX_XE_DEVICES);
+			break;
+		}
+
+		snprintf(ctx->devices[ctx->device_count].pci_slot,
+			 PCI_NAME_MAX, "%s", entry->d_name);
+		ctx->devices[ctx->device_count].was_bound = true;
+		ctx->device_count++;
+
+		igt_debug("Found Xe device: %s\n", entry->d_name);
+	}
+
+	closedir(dir);
+
+	ctx->multi_gpu_system = (ctx->device_count > 1);
+
+	igt_debug("Detected %d Xe device%s\n", ctx->device_count,
+		  ctx->device_count == 1 ? "" : "s");
+
+	return 0;
+}
+
+/**
+ * get_selected_device - Determine which device was selected via --device
+ * @ctx: Device context
+ * @fd: Open file descriptor to the selected device
+ *
+ * Compares the PCI slot of the open device fd with the scanned devices
+ * to determine which device the user selected with the --device filter.
+ * If found, marks that device as selected.
+ *
+ * Returns: Pointer to selected device info, or NULL if not found
+ */
+static struct xe_device_info *get_selected_device(struct
xe_device_context *ctx, int fd)
+{
+	char selected_pci_slot[NAME_MAX];
+	int i;
+
+	igt_device_get_pci_slot_name(fd, selected_pci_slot);
+	igt_debug("Device selected via --device filter: %s\n", selected_pci_slot);
+
+	for (i = 0; i < ctx->device_count; i++) {
+		if (strcmp(ctx->devices[i].pci_slot, selected_pci_slot) == 0) {
+			ctx->devices[i].is_selected = true;
+			ctx->selected_device = &ctx->devices[i];
+			return &ctx->devices[i];
+		}
+	}
+
+	igt_warn("Selected device %s not found in scanned devices\n",
+		 selected_pci_slot);
+	return NULL;
+}
+
+/**
+ * unbind_other_devices - Unbind all non-selected Xe devices
+ * @ctx: Device context
+ *
+ * Unbinds all Xe devices except the selected one from the xe driver.
+ * Marks devices as needing rebind for cleanup.
+ *
+ * Returns: 0 on success, -1 on error
+ */
+static int unbind_other_devices(struct xe_device_context *ctx)
+{
+	int i;
+	int ret = 0;
+
+	if (!ctx->multi_gpu_system)
+		return 0;
+
+	if (!ctx->selected_device) {
+		igt_warn("No selected device, cannot unbind others\n");
+		return -1;
+	}
+
+	igt_info("Unbinding non-selected Xe devices...\n");
+
+	for (i = 0; i < ctx->device_count; i++) {
+		if (ctx->devices[i].is_selected)
+			continue;
+
+		igt_info("Unbinding device: %s\n", ctx->devices[i].pci_slot);
+
+		if (igt_kmod_unbind("xe", ctx->devices[i].pci_slot) != 0) {
+			igt_warn("Failed to unbind device %s\n",
+				 ctx->devices[i].pci_slot);
+			ret = -1;
+			continue;
+		}
+
+		ctx->devices[i].needs_rebind = true;
+	}
+
+	return ret;
+}
+
+/**
+ * cleanup_device_context - Cleanup device context after tests
+ * @ctx: Device context
+ *
+ * Reloads the xe module if any devices were unbound during test setup.
+ * This is safer than rebinding individual devices as it avoids issues
+ * with module dependencies (e.g., audio modules).
+ */
+static void cleanup_device_context(struct xe_device_context *ctx)
+{
+	bool any_unbound = false;
+	int i;
+
+	if (!ctx->multi_gpu_system)
+		return;
+
+	/* Check if any devices were unbound */
+	for (i = 0; i < ctx->device_count; i++) {
+		if (ctx->devices[i].needs_rebind) {
+			if (igt_kmod_bind("xe", ctx->devices[i].pci_slot) != 0) {
+				igt_warn("Failed to rebind device %s\n",
+					 ctx->devices[i].pci_slot);
+			}
+			any_unbound = true;
+		}
+	}
+
+	if (!any_unbound)
+		return;
+
+	igt_info("Reloading xe module to restore all devices...\n");
+
+	/* Unload and reload the xe module */
+	if (igt_xe_driver_unload() != 0) {
+		igt_warn("Failed to unload xe driver\n");
+		return;
+	}
+
+	if (igt_xe_driver_load(NULL) != 0) {
+		igt_warn("Failed to reload xe driver\n");
+		return;
+	}
+
+	igt_info("Xe module reloaded successfully\n");
+}
+
+/**
+ * validate_device_context - Validate device setup and apply policy
+ * @ctx: Device context
+ * @fd: Open file descriptor to device
+ *
+ * Validates the device setup according to the test's requirements:
+ * - Single GPU: Tests run normally
+ * - Multiple GPUs with --device: Unbind non-selected devices
+ * - Multiple GPUs without --device: Skip all tests with warning
+ *
+ * Returns: 0 if tests should proceed, -1 if tests should be skipped
+ */
+static int validate_device_context(struct xe_device_context *ctx, int fd)
+{
+	bool device_filter_used;
+
+	if (scan_xe_devices(ctx) != 0) {
+		igt_warn("Failed to scan Xe devices\n");
+		return -1;
+	}
+
+	/* Check if --device filter was explicitly used */
+	device_filter_used = (igt_device_filter_count() > 0);
+
+	igt_debug("Xe devices found: %d, --device filter used: %s\n",
+		  ctx->device_count, device_filter_used ? "yes" : "no");
+
+	if (!ctx->multi_gpu_system) {
+		igt_info("Single Xe device detected, proceeding normally\n");
+		return 0;
+	}
+
+	/* Multiple GPUs detected */
+	igt_info("Multiple Xe devices detected (%d devices)\n",
ctx->device_count);
+
+	if (!device_filter_used) {
+		igt_warn("Multiple Xe devices bound to driver, but no device selected
with --device\n");
+		igt_warn("Fault injection affects all devices bound to the driver.\n");
+		igt_warn("Please use --device to select exactly one GPU.\n");
+		return -1;
+	}
+
+	/* Device filter was used, find which device was selected */
+	if (!get_selected_device(ctx, fd)) {
+		igt_warn("Could not determine selected device from --device filter\n");
+		return -1;
+	}
+
+	igt_info("Device %s selected, unbinding other devices\n",
+		 ctx->selected_device->pci_slot);
+
+	if (unbind_other_devices(ctx) != 0) {
+		igt_warn("Failed to unbind other devices\n");
+		return -1;
+	}
+
+	return 0;
+}
+
 static int fail_function_open(void)
 {
 	int debugfs_fail_function_dir_fd;
@@ -561,6 +827,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 	static uint32_t devid;
 	char pci_slot[NAME_MAX];
 	bool is_vf_device;
+	struct xe_device_context device_ctx;
 	const struct section {
 		const char *name;
 		unsigned int flags;
@@ -635,6 +902,12 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		setup_injection_fault(&default_fault_params);
 		igt_install_exit_handler(cleanup_injection_fault);
 		is_vf_device = intel_is_vf_device(fd);
+
+		/* Validate device setup for multi-GPU systems */
+		if (!validate_device_context(&device_ctx, fd) == 0) {
+			igt_skip("Multiple Xe devices bound to driver, but no device
selected with --device\n"
+				 "Please use --device to select exactly one GPU.\n");
+		}
 	}

 	for (const struct section *s = vm_create_fail_functions; s->name; s++)
@@ -686,6 +959,9 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		}

 	igt_fixture {
+		/* Cleanup: reload xe module if any devices were unbound */
+		cleanup_device_context(&device_ctx);
+
 		close(sysfs);
 		drm_close_driver(fd);
 		injection_list_clear();
-- 
2.43.0


