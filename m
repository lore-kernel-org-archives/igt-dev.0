Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8E7C7EE2A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 19:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B9310E445;
	Mon, 23 Jun 2025 19:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXtdqH/K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5651210E445
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 19:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750705994; x=1782241994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FrE5Pd9P9cvzsVUAFtGzXNaPV1t3MK5d2S35zoMAUjU=;
 b=FXtdqH/KF8ylwsoFDUQWJQA/x41Toq3FwjY46hQqOoS/Wo+IqmRqnpag
 WKT6m0jTUtB3vcu99b0F3Kaqzi0TRlR04nnZhC8z+BQ7JYhzZX5yl5vbr
 NxTklrBpN34Lbfafkhexvb07d8qHLuOZtRbEqC94kR02gzGZsY0Z0YU+j
 IpH8fKzVAGQBZgo8iTibZdr4vqA597o4n89VGLtGbqAJcAnWjb4dQxWSK
 q8uBO6oUxE1C72g2L97d88eT0hc9+GzQE3Svi4CUNZjJdICw72mmbvTIC
 yJKw4BgSxaJs0dpjryYFdaAXsapkNFDpF9eXFYbi1dhLnxJVksqMFdPl5 g==;
X-CSE-ConnectionGUID: KAJIGlVDRAaEnG3ggpEVqQ==
X-CSE-MsgGUID: n6PgfYqKSAGdT49FqS+9Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52043595"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="52043595"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 12:13:14 -0700
X-CSE-ConnectionGUID: tIC0PegmQhuTz+0TND+E6w==
X-CSE-MsgGUID: MyRI1pobSvyG1//RmRE5jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151168940"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.223.55.70])
 by orviesa006.jf.intel.com with ESMTP; 23 Jun 2025 12:13:12 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [RFC] [PATCH v1 2/2] tests/intel/kms_pm_vrsr: Add test to validate
 VRAM Self Refresh
Date: Tue, 24 Jun 2025 00:42:30 +0530
Message-Id: <20250623191230.66611-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250623191230.66611-1-mohammed.thasleem@intel.com>
References: <20250623191230.66611-1-mohammed.thasleem@intel.com>
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

This patch adds a test for VRAM Self Refresh (VRSR), focusing on
display flips and power management efficiency. It handles transitions
between power states like D3Hot and D3Cold. The patch includes validation
of VRAM residency and power state transitions, ensuring accurate testing
of VRSR functionality.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_vrsr.c | 552 +++++++++++++++++++++++++++++++++++---
 1 file changed, 522 insertions(+), 30 deletions(-)

diff --git a/tests/intel/kms_pm_vrsr.c b/tests/intel/kms_pm_vrsr.c
index 671621a66..954f31857 100644
--- a/tests/intel/kms_pm_vrsr.c
+++ b/tests/intel/kms_pm_vrsr.c
@@ -15,6 +15,27 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "igt_device.h"
+#include "igt_device_scan.h"
+#include "igt_pm.h"
+#include "intel_common.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
+#define KMS_POLL_DISABLE 0
+
+#define MAX_N_EXEC_QUEUES 16
+#define NO_SUSPEND -1
+#define NO_RPM -1
+
+#define USERPTR (0x1 << 0)
+#define PREFETCH (0x1 << 1)
+#define UNBIND_ALL (0x1 << 2)
 
 /**
  * SUBTEST: vram-self-refresh
@@ -29,41 +50,60 @@ bool kms_poll_saved_state;
 typedef struct {
 	int fd_xe;
 	int debugfs_fd;
-	uint32_t devid;
-	char *debugfs_dump;
-	igt_display_t display;
 	struct igt_fb fb_white;
 	drmModeModeInfo *mode;
+	igt_display_t display;
 	igt_output_t *output;
+	struct pci_device *pci_xe;
+	struct pci_device *pci_root;
+	char pci_slot_name[NAME_MAX];
+	drmModeResPtr res;
 } device_t;
 
-static void vram_self_refresh(device_t *device);
+typedef struct {
+	device_t device;
+	struct drm_xe_engine_class_instance *eci;
+	int n_exec_queues;
+	int n_execs;
+	enum igt_suspend_state s_state;
+	enum igt_acpi_d_state d_state;
+	unsigned int flags;
+} child_exec_args;
+
+uint64_t orig_threshold;
+int fw_handle = -1;
+
+static pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
+static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
+static pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
+static pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
+static bool child_ready;
 
 static void display_fini(device_t *device)
 {
 	igt_display_fini(&device->display);
 }
 
-static void setup_primary(device_t *device)
+static void setup_primary(device_t device)
 {
 	igt_plane_t *primary;
 
-	primary = igt_output_get_plane_type(device->output,
+	primary = igt_output_get_plane_type(device.output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
-	igt_create_color_fb(device->fd_xe,
-			    device->mode->hdisplay, device->mode->vdisplay,
+	igt_create_color_fb(device.fd_xe,
+			    device.mode->hdisplay, device.mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
 			    DRM_FORMAT_MOD_LINEAR,
 			    1.0, 1.0, 1.0,
-			    &device->fb_white);
-	igt_plane_set_fb(primary, &device->fb_white);
-	igt_display_commit(&device->display);
+			    &device.fb_white);
+	igt_plane_set_fb(primary, &device.fb_white);
+	igt_display_commit(&device.display);
 }
 
-static void detect_primary_output(device_t *device)
+static void detect_primary_output(device_t device)
 {
-	igt_display_t *display = &device->display;
+	igt_display_t *display = &device.display;
 	igt_output_t *output;
 	enum pipe pipe;
 
@@ -79,47 +119,499 @@ static void detect_primary_output(device_t *device)
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
-		device->output = output;
-		device->mode = igt_output_get_mode(output);
+		device.output = output;
+		device.mode = igt_output_get_mode(output);
 
 		break;
 	}
 }
-static void cleanup(device_t *device)
+
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
+/* runtime_usage is only available if kernel build CONFIG_PM_ADVANCED_DEBUG */
+static bool runtime_usage_available(struct pci_device *pci)
+{
+	char name[PATH_MAX];
+
+	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/runtime_usage",
+		 pci->domain, pci->bus, pci->dev, pci->func);
+	return access(name, F_OK) == 0;
+}
+
+static uint64_t get_vram_d3cold_threshold(int sysfs)
+{
+	uint64_t threshold;
+	char path[64];
+	int ret;
+
+	sprintf(path, "device/vram_d3cold_threshold");
+	igt_require_f(!faccessat(sysfs, path, R_OK, 0), "vram_d3cold_threshold is not present\n");
+
+	ret = igt_sysfs_scanf(sysfs, path, "%"PRIu64"", &threshold);
+	igt_assert_lt(0, ret);
+
+	return threshold;
+}
+
+static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
+{
+	char path[64];
+	int ret;
+
+	sprintf(path, "device/vram_d3cold_threshold");
+
+	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
+		ret = igt_sysfs_printf(sysfs, path, "%"PRIu64"", threshold);
+	else
+		igt_warn("vram_d3cold_threshold is not present\n");
+
+	igt_assert_lt(0, ret);
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
+	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
+
+	switch (state) {
+	case IGT_ACPI_D3Cold:
+		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
+		igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
+		igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
+		return true;
+	case IGT_ACPI_D3Hot:
+		igt_pm_set_d3cold_allowed(device.pci_slot_name, 0);
+		return true;
+	default:
+		igt_debug("Invalid D3 Selection\n");
+	}
+
+	return false;
+}
+
+static void cleanup_d3(device_t device)
+{
+	dpms_on_off(device, DRM_MODE_DPMS_ON);
+}
+
+static bool in_d3(device_t device, enum igt_acpi_d_state state)
+{
+	uint16_t val;
+
+	/* We need to wait for the autosuspend to kick in before we can check */
+	if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED))
+		return false;
+
+	if (runtime_usage_available(device.pci_xe) &&
+	    igt_pm_get_runtime_usage(device.pci_xe) != 0)
+		return false;
+
+	switch (state) {
+	case IGT_ACPI_D3Hot:
+		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
+						      &val, 0xd4), 0);
+		return (val & 0x3) == 0x3;
+	case IGT_ACPI_D3Cold:
+		return igt_wait(igt_pm_get_acpi_real_d_state(device.pci_root) ==
+				IGT_ACPI_D3Cold, 10000, 100);
+	default:
+		igt_info("Invalid D3 State\n");
+		igt_assert(0);
+	}
+
+	return true;
+}
+
+#define MAX_VMAS 2
+
+static void*
+child_exec(void *arguments)
+{
+	child_exec_args *args = (child_exec_args *)arguments;
+
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	int n_vmas = args->flags & UNBIND_ALL ? MAX_VMAS : 1;
+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
+	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
+	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+	uint64_t active_time;
+	bool check_rpm = (args->d_state == IGT_ACPI_D3Hot ||
+			  args->d_state == IGT_ACPI_D3Cold);
+
+	igt_assert_lte(args->n_exec_queues, MAX_N_EXEC_QUEUES);
+	igt_assert_lt(0, args->n_execs);
+
+	if (check_rpm) {
+		igt_assert(in_d3(args->device, args->d_state));
+		active_time = igt_pm_get_runtime_active_time(args->device.pci_xe);
+	}
+
+	vm = xe_vm_create(args->device.fd_xe, 0, 0);
+
+	if (check_rpm)
+		igt_assert(igt_pm_get_runtime_active_time(args->device.pci_xe) >
+			   active_time);
+
+	bo_size = sizeof(*data) * args->n_execs;
+	bo_size = xe_bb_size(args->device.fd_xe, bo_size);
+
+	if (args->flags & USERPTR) {
+		data = aligned_alloc(xe_get_default_alignment(args->device.fd_xe),
+				     bo_size);
+		memset(data, 0, bo_size);
+	} else {
+		if (args->flags & PREFETCH)
+			bo = xe_bo_create(args->device.fd_xe, 0, bo_size,
+					  all_memory_regions(args->device.fd_xe) |
+					  vram_if_possible(args->device.fd_xe, 0),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		else
+			bo = xe_bo_create(args->device.fd_xe, vm, bo_size,
+					  vram_if_possible(args->device.fd_xe, args->eci->gt_id),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		data = xe_bo_map(args->device.fd_xe, bo, bo_size);
+	}
+
+	for (i = 0; i < args->n_exec_queues; i++) {
+		exec_queues[i] = xe_exec_queue_create(args->device.fd_xe, vm,
+						      args->eci, 0);
+		bind_exec_queues[i] = 0;
+		syncobjs[i] = syncobj_create(args->device.fd_xe, 0);
+	};
+
+	sync[0].handle = syncobj_create(args->device.fd_xe, 0);
+
+	if (bo) {
+		for (i = 0; i < n_vmas; i++)
+			xe_vm_bind_async(args->device.fd_xe, vm, bind_exec_queues[0], bo,
+					 0, addr + i * bo_size, bo_size, sync, 1);
+	} else {
+		xe_vm_bind_userptr_async(args->device.fd_xe, vm, bind_exec_queues[0],
+					 to_user_pointer(data), addr, bo_size, sync, 1);
+	}
+
+	if (args->flags & PREFETCH)
+		xe_vm_prefetch_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
+				     addr, bo_size, sync, 1, 0);
+
+	if (check_rpm) {
+		igt_assert(in_d3(args->device, args->d_state));
+		active_time = igt_pm_get_runtime_active_time(args->device.pci_xe);
+	}
+
+	for (i = 0; i < args->n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % args->n_exec_queues;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.exec_queue_id = exec_queues[e];
+		exec.address = batch_addr;
+
+		if (e != i)
+			syncobj_reset(args->device.fd_xe, &syncobjs[e], 1);
+
+		xe_exec(args->device.fd_xe, &exec);
+
+		igt_assert(syncobj_wait(args->device.fd_xe, &syncobjs[e], 1,
+					INT64_MAX, 0, NULL));
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+		if (i == args->n_execs / 2 && args->s_state != NO_SUSPEND) {
+			/* Until this point, only one thread runs at a given time. Signal
+			 * the parent that this thread will sleep, for the parent to
+			 * create another thread.
+			 */
+			pthread_mutex_lock(&child_ready_lock);
+			child_ready = true;
+			pthread_cond_signal(&child_ready_cond);
+			pthread_mutex_unlock(&child_ready_lock);
+
+			/* Wait for the suspend and resume to finish */
+			pthread_mutex_lock(&suspend_lock);
+			pthread_cond_wait(&suspend_cond, &suspend_lock);
+			pthread_mutex_unlock(&suspend_lock);
+
+			/* From this point, all threads will run concurrently */
+		}
+	}
+
+	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
+				INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	if (n_vmas > 1)
+		xe_vm_unbind_all_async(args->device.fd_xe, vm, 0, bo, sync, 1);
+	else
+		xe_vm_unbind_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
+				   addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
+				INT64_MAX, 0, NULL));
+
+	for (i = 0; i < args->n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	syncobj_destroy(args->device.fd_xe, sync[0].handle);
+	for (i = 0; i < args->n_exec_queues; i++) {
+		syncobj_destroy(args->device.fd_xe, syncobjs[i]);
+		xe_exec_queue_destroy(args->device.fd_xe, exec_queues[i]);
+		if (bind_exec_queues[i])
+			xe_exec_queue_destroy(args->device.fd_xe, bind_exec_queues[i]);
+	}
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(args->device.fd_xe, bo);
+	} else {
+		free(data);
+	}
+
+	xe_vm_destroy(args->device.fd_xe, vm);
+
+	if (check_rpm) {
+		igt_assert(igt_pm_get_runtime_active_time(args->device.pci_xe) >
+			   active_time);
+		igt_assert(in_d3(args->device, args->d_state));
+	}
+
+	/* Tell the parent that we are ready. This should run only when the code
+	 * is not supposed to suspend.
+	 */
+	if (args->n_execs <= 1 || args->s_state == NO_SUSPEND)  {
+		pthread_mutex_lock(&child_ready_lock);
+		child_ready = true;
+		pthread_cond_signal(&child_ready_cond);
+		pthread_mutex_unlock(&child_ready_lock);
+	}
+	return NULL;
+}
+
+/*  Do one suspend and resume cycle for all xe engines.
+ *  - Create a child_exec() thread for each xe engine. Run only one thread
+ *    at a time. The parent will wait for the child to signal it is ready
+ *    to sleep before creating a new thread.
+ *  - Put child_exec() to sleep where it expects to suspend and resume
+ *  - Wait for all child_exec() threads to sleep
+ *  - Run one suspend and resume cycle
+ *  - Wake up all child_exec() threads at once. They will run concurrently.
+ *  - Wait for all child_exec() threads to complete
+ */
+static void
+test_exec(device_t device, int n_exec_queues, int n_execs,
+		  enum igt_suspend_state s_state, enum igt_acpi_d_state d_state,
+		  unsigned int flags)
+{
+	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
+				     SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+	struct drm_xe_engine_class_instance *eci;
+	int active_threads = 0;
+	pthread_t threads[65]; /* MAX_ENGINES + 1 */
+	child_exec_args args;
+
+	xe_for_each_engine(device.fd_xe, eci) {
+		args.device = device;
+		args.eci = eci;
+		args.n_exec_queues = n_exec_queues;
+		args.n_execs = n_execs;
+		args.s_state = s_state;
+		args.d_state = d_state;
+		args.flags = flags;
+
+		pthread_create(&threads[active_threads], NULL, child_exec, &args);
+		active_threads++;
+
+		pthread_mutex_lock(&child_ready_lock);
+		while (!child_ready)
+			pthread_cond_wait(&child_ready_cond, &child_ready_lock);
+		child_ready = false;
+		pthread_mutex_unlock(&child_ready_lock);
+	}
+
+	if (n_execs > 1 && s_state != NO_SUSPEND) {
+		igt_system_suspend_autoresume(s_state, test);
+
+		pthread_mutex_lock(&suspend_lock);
+		pthread_cond_broadcast(&suspend_cond);
+		pthread_mutex_unlock(&suspend_lock);
+	}
+
+	for (int i = 0; i < active_threads; i++)
+		pthread_join(threads[i], NULL);
+
+	active_threads = 0;
+}
+
+static uint64_t read_mods(device_t device)
+{
+	uint64_t mods_value;
+	char buf[256];
+	int ret;
+	char *mods_ptr;
+
+	ret = igt_debugfs_simple_read(device.debugfs_fd, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not present.\n");
+
+	mods_ptr = strstr(buf, "Package ModS: ");
+	if (mods_ptr)
+		sscanf(mods_ptr, "Package ModS: %"PRIu64"\n", &mods_value);
+
+	return mods_value;
+}
+
+static void cleanup(device_t device)
 {
 	igt_plane_t *primary;
 
-	primary = igt_output_get_plane_type(device->output,
+	primary = igt_output_get_plane_type(device.output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
-	igt_display_commit(&device->display);
-	igt_remove_fb(device->fd_xe, &device->fb_white);
+	igt_display_commit(&device.display);
+	igt_remove_fb(device.fd_xe, &device.fb_white);
 }
-
-
-static void vram_self_refresh(device_t *device)
+static void kms_poll_state_restore(int sig)
 {
-	detect_primary_output(device);
-	setup_primary(device);
-	cleanup(device);
+	int sysfs_fd;
+
+	sysfs_fd = open(KMS_HELPER, O_RDONLY);
+	if (sysfs_fd >= 0) {
+		__igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
+		close(sysfs_fd);
+	}
 }
 
 igt_main
 {
-	device_t device = {};
+	device_t device;
+	char buf[256];
+	int sysfs_fd, ret;
+	uint32_t d3cold_allowed;
+	uint64_t mods_prev_value = 0, mods_curr_value = 0;
+
+	const struct s_state {
+		const char *name;
+		enum igt_suspend_state state;
+	} s_states[] = {
+		{ "s2idle", SUSPEND_STATE_FREEZE },
+		{ NULL },
+	};
+	const struct d_state {
+		const char *name;
+		enum igt_acpi_d_state state;
+	} d_states[] = {
+		{ "d3hot", IGT_ACPI_D3Hot },
+		{ "d3cold", IGT_ACPI_D3Cold },
+		{ NULL },
+	};
 
 	igt_fixture {
-		device.fd_xe = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		memset(&device, 0, sizeof(device));
+		device.fd_xe = drm_open_driver_master(DRIVER_XE | DRIVER_INTEL);
+
+		kmstest_set_vt_graphics_mode();
 		device.debugfs_fd = igt_debugfs_dir(device.fd_xe);
 		igt_require(device.debugfs_fd != -1);
-		kmstest_set_vt_graphics_mode();
-		device.devid = intel_get_drm_devid(device.fd_xe);
+		igt_pm_enable_sata_link_power_management();
 		igt_display_require(&device.display, device.fd_xe);
+
+		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
+		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
+		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
+
+		/* Always perform initial once-basic exec checking for health */
+		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
+
+		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
+		igt_assert(igt_setup_runtime_pm(device.fd_xe));
+		igt_install_exit_handler(kms_poll_state_restore);
 	}
 
 	igt_describe("This test validates display flips with vram self refresh");
 	igt_subtest("vram-self-refresh") {
-		vram_self_refresh(&device);
+		detect_primary_output(device);
+		setup_primary(device);
+
+		ret = igt_debugfs_simple_read(device.debugfs_fd, "vrsr_capable", buf, sizeof(buf));
+		igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not present.\n");
+
+		igt_skip_on_f(!strstr(buf, "true"), "vrsr is not enabled.\n");
+
+		for (const struct s_state *s = s_states; s->name; s++) {
+			for (const struct d_state *d = d_states; d->name; d++) {
+				orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
+				mods_prev_value = read_mods(device);
+				set_vram_d3cold_threshold(sysfs_fd, 0);
+				igt_assert(setup_d3(device, d->state));
+				test_exec(device, 1, 2, s->state, NO_RPM, 0);
+				mods_curr_value = read_mods(device);
+				set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
+				igt_assert_f(mods_curr_value > mods_prev_value,
+					     "Mods residency is inaccurate: %"PRIu64"\n", mods_curr_value);
+				cleanup_d3(device);
+			}
+		}
+		cleanup(device);
 	}
 
 	igt_fixture {
-- 
2.25.1

