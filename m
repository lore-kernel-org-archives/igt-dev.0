Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFD3CCFA1A
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 18:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E5B10E634;
	Tue, 11 Nov 2025 18:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtoDd0UP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D64710E634
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 18:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762884210; x=1794420210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=doseZmfimKmKqEhF+o029ioRf2jBEJmr7Jml7DuTGTw=;
 b=YtoDd0UPJVAJ5xvGTEvdRLRxMgE3Dqh1cWK9M4HbQ0ITCO+Dan8HNHB5
 IhXn49KLvjVW3oG52kehX4kXQNfr69gozC2D1d6gLzZDEP/QH6SykbKQR
 mR1/6j7U139tIB5djNMG2mhYDLOQEhltqgtzDon5kQci6c6k+kzuU9nJa
 GSd43h6bSDV4KnX4GWMp/rjNzRDdnAgdc8Ivg7JwAbVTYmqsBF9TJs0KJ
 KXHrEh+ysl1Nx+Lt8yW0/xY5GWUFTEYKY+NlhVF7NsRz5a+wlXOFJU8xG
 wLjBPRHiOJgpe7HOym3W7f0BMgOqscQSY9FHv505KBu7WTRVHYAePCxj1 g==;
X-CSE-ConnectionGUID: tcZ9MQzYTJG7a5byw1aIXA==
X-CSE-MsgGUID: xrA7RHIOTQekNDM0RDAL1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75634144"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="75634144"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 10:03:30 -0800
X-CSE-ConnectionGUID: 1oVHjf4+THeBgFI4FlH3hQ==
X-CSE-MsgGUID: 3KzHBU7UQRiDRGOwNY7seg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="189450489"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.223.55.76])
 by fmviesa009.fm.intel.com with ESMTP; 11 Nov 2025 10:03:28 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.poosa@intel.com, karthik.b.s@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v4 1/2] tests/intel/kms_pm_vrsr: Add test to validate VRSR
 with system suspend
Date: Tue, 11 Nov 2025 23:30:03 +0530
Message-Id: <20251111180004.11865-2-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251111180004.11865-1-mohammed.thasleem@intel.com>
References: <20251111180004.11865-1-mohammed.thasleem@intel.com>
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

This test detect primary connected panel and also adds a test for
VRAM Self Refresh (VRSR), focusing on display flip and power
management efficiency. It handles transitions between power states like
system suspend. The patch includes validation of VRAM residency and power
state transitions, ensuring accurate testing of VRSR functionality.

v2: Add skip check for output and primary plane in device struct. (Pranay)
    Remove primary plane structure declaration from cleanup. (Pranay)
    Use igt_sysfs_open at igt fixture. (Anirban)
v3: Add spaces between concatenated string and rename variable. (Pranay)
v3: Refactor VRSR test into common function supporting system suspend.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_vrsr.c | 563 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 564 insertions(+)
 create mode 100644 tests/intel/kms_pm_vrsr.c

diff --git a/tests/intel/kms_pm_vrsr.c b/tests/intel/kms_pm_vrsr.c
new file mode 100644
index 000000000..5a96eebfa
--- /dev/null
+++ b/tests/intel/kms_pm_vrsr.c
@@ -0,0 +1,563 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: kms pm vrsr
+ * Category: Display
+ * Description: This test to validate VRAM Self Refresh
+ * Driver requirement: xe
+ * Mega feature: Display Power Management
+ */
+
+#include "igt.h"
+#include "igt_sysfs.h"
+#include "igt_device.h"
+#include "igt_device_scan.h"
+#include "igt_pm.h"
+#include "intel_common.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "lib/igt_kmod.h"
+
+#include <dirent.h>
+#include <limits.h>
+#include <fcntl.h>
+#include <string.h>
+#include <sys/ioctl.h>
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
+
+/**
+ * SUBTEST: vrsr-system-suspend
+ * Description: Validated VRSR during system suspend alongside active display flip
+ *
+ */
+
+IGT_TEST_DESCRIPTION("This test to validate VRAM Self Refresh");
+
+bool kms_poll_saved_state;
+
+typedef struct {
+	int fd_xe;
+	int debugfs_fd;
+	struct igt_fb fb_white;
+	drmModeModeInfo *mode;
+	igt_display_t display;
+	igt_output_t *output;
+	igt_plane_t *primary;
+	struct pci_device *pci_xe;
+	struct pci_device *pci_root;
+	char pci_slot_name[NAME_MAX];
+	drmModeResPtr res;
+} device_t;
+
+static pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
+static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
+static pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
+static pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
+static bool child_ready;
+
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
+typedef enum {
+	SUSPEND_SYSTEM,
+} suspend_type;
+
+static void setup_primary(device_t *device)
+{
+	igt_plane_set_fb(device->primary, NULL);
+	igt_create_color_fb(device->fd_xe,
+			device->mode->hdisplay, device->mode->vdisplay,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_MOD_LINEAR,
+			1.0, 1.0, 1.0,
+			&device->fb_white);
+	igt_plane_set_fb(device->primary, &device->fb_white);
+	igt_display_commit(&device->display);
+}
+
+/* Assumption that detected panel is primary display gpu */
+static void detect_primary_output(device_t *device)
+{
+	igt_display_t *display = &device->display;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		drmModeConnectorPtr connector = output->config.connector;
+
+		if (connector->connection != DRM_MODE_CONNECTED)
+			continue;
+
+		igt_display_reset(display);
+		igt_output_set_pipe(output, pipe);
+
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
+
+		device->output = output;
+		device->mode = igt_output_get_mode(output);
+		device->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		break;
+	}
+
+	igt_require_f(device->output && device->mode, "No valid connected output found\n");
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
+	ret = igt_sysfs_scanf(sysfs, path, "%" PRIu64 "", &threshold);
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
+		ret = igt_sysfs_printf(sysfs, path, "%" PRIu64 "", threshold);
+	else
+		igt_warn("vram_d3cold_threshold is not present\n");
+
+	igt_assert_lt(0, ret);
+}
+
+static bool in_d3(device_t device, enum igt_acpi_d_state state)
+{
+	/* We need to wait for the autosuspend to kick in before we can check */
+	if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED))
+		return false;
+
+	if (runtime_usage_available(device.pci_xe) &&
+	    igt_pm_get_runtime_usage(device.pci_xe) != 0)
+		return false;
+
+	switch (state) {
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
+/* Do one suspend and resume cycle for all xe engines.
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
+static uint64_t get_mods_count(char *pkg_data)
+{
+	char *e;
+	long long ret;
+	char *s = strchr(pkg_data, ':');
+
+	igt_assert(s);
+	s++;
+	ret = strtol(s, &e, 10);
+	igt_assert(((ret != LLONG_MIN && ret != LLONG_MAX) || errno != ERANGE)
+		   && e > s && *e == '\n' && ret >= 0);
+
+	return ret;
+}
+
+static uint64_t read_mods(int debugfs_fd)
+{
+	int ret;
+	char buf[256];
+	char *mods_ptr;
+
+	ret = igt_debugfs_simple_read(debugfs_fd, "dgfx_pkg_residencies", buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not present.\n");
+
+	mods_ptr = strstr(buf, "Package ModS : ");
+	igt_skip_on_f(!mods_ptr, "Package ModS is not supported.\n");
+
+	return get_mods_count(mods_ptr);
+}
+
+static void cleanup(device_t device)
+{
+	igt_plane_set_fb(device.primary, NULL);
+	igt_display_commit(&device.display);
+	igt_remove_fb(device.fd_xe, &device.fb_white);
+}
+
+static void vrsr_suspend_test(device_t *device, int sysfs_fd, suspend_type type)
+{
+	uint64_t orig_threshold, mods_prev_value, mods_curr_value;
+
+	detect_primary_output(device);
+	setup_primary(device);
+	orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
+	mods_prev_value = read_mods(device->debugfs_fd);
+
+	/* TO DO: Created fb >300MB instead making 0 threshold. */
+	set_vram_d3cold_threshold(sysfs_fd, 0);
+
+	switch (type) {
+	case SUSPEND_SYSTEM:
+		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
+		break;
+	}
+
+	mods_curr_value = read_mods(device->debugfs_fd);
+
+	/* Restore threshold */
+	set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
+	igt_assert_f(mods_curr_value > mods_prev_value,
+		     "Mods residency is inaccurate: %" PRIu64 "\n", mods_curr_value);
+
+	cleanup(*device);
+}
+
+static void kms_poll_state_restore(int sig)
+{
+	int sysfs_fd;
+
+	sysfs_fd = open(KMS_HELPER, O_RDONLY);
+
+	if (sysfs_fd >= 0) {
+		__igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
+		close(sysfs_fd);
+	}
+}
+
+igt_main
+{
+	char buf[256];
+	device_t device;
+	int sysfs_fd, ret;
+
+	igt_fixture {
+		memset(&device, 0, sizeof(device));
+		device.fd_xe = drm_open_driver(DRIVER_XE | DRIVER_INTEL);
+		kmstest_set_vt_graphics_mode();
+		device.debugfs_fd = igt_debugfs_dir(device.fd_xe);
+		igt_require_f(device.debugfs_fd != -1, "debugfs directory not accessible\n");
+		igt_display_require(&device.display, device.fd_xe);
+
+		ret = igt_debugfs_simple_read(device.debugfs_fd, "vrsr_capable", buf, sizeof(buf));
+		igt_require_f(ret >= 0, "Debugfs vrsr_capable is not present.\n");
+		igt_require_f(strstr(buf, "Y"), "VRSR is not enabled.\n");
+
+		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
+		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
+		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
+
+		/* Always perform initial once-basic exec checking for health */
+		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
+
+		sysfs_fd = igt_sysfs_open(device.fd_xe);
+		device.res = drmModeGetResources(device.fd_xe);
+		igt_install_exit_handler(kms_poll_state_restore);
+	}
+
+	igt_describe("Validated VRSR during system suspend alongside active display flip");
+	igt_subtest("vrsr-system-suspend")
+		vrsr_suspend_test(&device, sysfs_fd, SUSPEND_SYSTEM);
+
+	igt_fixture {
+		close(device.debugfs_fd);
+		close(sysfs_fd);
+		drmModeFreeResources(device.res);
+		igt_display_fini(&device.display);
+		drm_close_driver(device.fd_xe);
+	}
+
+	igt_exit();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 9736f2338..6e913cb07 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -269,6 +269,7 @@ intel_kms_progs = [
 	'kms_pm_dc',
 	'kms_pm_lpsp',
 	'kms_pm_rpm',
+        'kms_pm_vrsr',
 	'kms_psr',
 	'kms_psr2_sf',
 	'kms_psr2_su',
-- 
2.25.1

