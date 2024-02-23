Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B80C48BC4
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 06:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F2B10E06D;
	Fri, 23 Feb 2024 06:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="il9+IcaV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED6310E06D
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2024 06:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708671120; x=1740207120;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BZF1NYzYEbFczdmQ/jOx6H0Ii8egaBf1bQoyjI+SmM0=;
 b=il9+IcaVikaAuvUPJ5P9zkR/sQNRl+9VDmpsXqv3J5NlUV+KXjY+lip3
 bRFa70genbVZE7b8jnEm08xxxYNPNZSdaMmRHAdDfdgh4jnpp4cofIWxl
 kmndM69XNDVkEtVDlbME7AkLlsj/epFXJ68BtyFa5ehebWwWR1xGsdnO0
 sQUCSK7QegdoFqiRS5gjY7bB1WYt/dpgNvPVzkWmohUbpHuGjX08thc98
 6t5zWF5GDw87CMbLETmzTI85DS/74BMygdNJ6NN1Ijv1kpfQdEJNYPTYD
 pJ+tmz+hdrNmZswmoRIplblrU3JETTr0aui5n8HM2dRfKIRHLkraCOqhZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2856564"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2856564"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 22:51:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="10510504"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa004.jf.intel.com with ESMTP; 22 Feb 2024 22:51:58 -0800
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vm bind
 functionality with suspend and resume.
Date: Fri, 23 Feb 2024 12:21:36 +0530
Message-Id: <20240223065136.19900-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test validates vm bind functionality, by suspend and resuming the device
before and after binding VM to a VA.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_pm.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index a0045da0b..f9d2ce421 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -550,9 +550,96 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	close(fw_handle);
 }
 
+/**
+ * SUBTEST: vm-bind
+ * Description: Validate vm bind functionality with suspend and resume
+ * Functionality: pm
+ * Run type: FULL
+ */
+static void vm_bind(device_t device, struct drm_xe_engine_class_instance *eci)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct data {
+		uint32_t batch[16];
+		uint32_t data;
+		uint64_t addr;
+	} *data;
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint32_t bind_engine;
+	uint32_t syncobj;
+	size_t bo_size;
+	int value = 0x123456;
+	uint64_t addr = 0x100000;
+	uint32_t bo = 0;
+	int b = 0;
+	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
+	uint64_t batch_addr = addr + batch_offset;
+	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
+	uint64_t sdi_addr = addr + sdi_offset;
+
+	syncobj = syncobj_create(device.fd_xe, 0);
+	sync.handle = syncobj;
+
+	vm = xe_vm_create(device.fd_xe, 0, 0);
+	bo_size = sizeof(*data);
+	bo_size = xe_bb_size(device.fd_xe, bo_size);
+
+	bo = xe_bo_create(device.fd_xe, vm, bo_size,
+			  vram_if_possible(device.fd_xe, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	exec_queue = xe_exec_queue_create(device.fd_xe, vm, eci, 0);
+	bind_engine = xe_bind_exec_queue_create(device.fd_xe, vm, 0);
+	xe_vm_bind_async(device.fd_xe, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	data = xe_bo_map(device.fd_xe, bo, bo_size);
+
+	b = 0;
+	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data->batch[b++] = sdi_addr;
+	data->batch[b++] = sdi_addr >> 32;
+	data->batch[b++] = value;
+	data->batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data->batch));
+
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_exec(device.fd_xe, &exec);
+
+	igt_assert(syncobj_wait(device.fd_xe, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data->data, value);
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_exec(device.fd_xe, &exec);
+
+	igt_assert(syncobj_wait(device.fd_xe, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data->data, value);
+
+	syncobj_destroy(device.fd_xe, syncobj);
+	munmap(data, bo_size);
+	gem_close(device.fd_xe, bo);
+
+	xe_exec_queue_destroy(device.fd_xe, exec_queue);
+	xe_vm_destroy(device.fd_xe, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine *engine;
 	device_t device;
 	uint32_t d3cold_allowed;
 	int sysfs_fd;
@@ -693,6 +780,11 @@ igt_main
 		}
 	}
 
+	igt_subtest("vm-bind") {
+		engine = xe_engine(device.fd_xe, 1);
+		vm_bind(device, &engine->instance);
+	}
+
 	igt_fixture {
 		close(sysfs_fd);
 		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
-- 
2.39.1

