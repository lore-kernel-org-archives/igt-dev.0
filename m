Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9E9FAD41F
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 06:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C0A10E142;
	Thu, 23 Apr 2026 06:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErKDMcjg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2CB10E142
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 06:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776926358; x=1808462358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PdV3KR2qPH4mZiiPCeZu75wxPiUR/jU4/UOD97ezsmI=;
 b=ErKDMcjgv9QZhMFTqEMMh1Re/1AwVNhrMc7nPTw0qasMkmvG1nwMP4Hw
 rYTLM7wmDaNzSRILW2Xbpx6oNZCxLr/v7PtdJFFpv7DvKKZ7Y8ArL+5iP
 FP6P22/4+q2I1M67MJqOaVRMZO/4GiT8s7AgupuNLjeHM416KHjor85PK
 fvkJd3Kiku/sAThCP40GVyEfpFMDyK8JMcTJ+Qpv5zo4j9b6XAgRbLhJ8
 dbeH9+coDelxAzjkWhlvOXjHMi0SKWnbEp7vjBNaTe6Yo3ej49gOQWo3S
 uaAF1xXutCsKPe+zjmI4MVX0ldIub+vmPjU3Up0xVLbwQLnpnkZiNvoZJ Q==;
X-CSE-ConnectionGUID: QGf/Pb3kSyG4J63GQ8uKUA==
X-CSE-MsgGUID: v8JujbXmR/27Bo8NY7o01Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="76921579"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="76921579"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 23:39:18 -0700
X-CSE-ConnectionGUID: bPwWDhjmQ++QJh1VtHI5Ug==
X-CSE-MsgGUID: DOKgEFkVSQe0N66052GjCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="237557298"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 23:39:16 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arvind.yadav@intel.com, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 2/4] tests/intel/xe_madvise: Add atomic-device subtest
Date: Thu, 23 Apr 2026 12:08:51 +0530
Message-ID: <20260423063904.3944005-3-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423063904.3944005-1-varun.gupta@intel.com>
References: <20260423063904.3944005-1-varun.gupta@intel.com>
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

Validate that madvise ATOMIC_DEVICE allows GPU MI_ATOMIC_INC on SVM
memory.  The test creates a fault-mode VM with CPU_ADDR_MIRROR binding
over heap memory allocated via aligned_alloc().  After setting
ATOMIC_DEVICE via DRM_XE_MEM_RANGE_ATTR_ATOMIC madvise, the GPU
executes MI_ATOMIC_INC through the page-fault handler which migrates
pages to VRAM for device atomics.

Also adds the shared atomic test infrastructure: struct
atomic_data, atomic_build_batch() helper, timeout constants, and the
atomic subtest group gated on VRAM and fault-mode support.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 tests/intel/xe_madvise.c | 110 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index e79cafbff..1f4fb16b9 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -14,9 +14,11 @@
 #include "igt.h"
 #include "xe_drm.h"
 
+#include "intel_gpu_commands.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
-#include "lib/igt_syncobj.h"
 
 /* Purgeable test constants */
 #define PURGEABLE_ADDR		0x1a0000
@@ -27,6 +29,11 @@
 #define PURGEABLE_TEST_PATTERN	0xc0ffee
 #define PURGEABLE_DEAD_PATTERN	0xdead
 
+/* Atomic test constants */
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+#define FIVE_SEC		(5LL * NSEC_PER_SEC)
+#define QUARTER_SEC		(NSEC_PER_SEC / 4)
+
 static bool xe_has_purgeable_support(int fd)
 {
 	struct drm_xe_query_config *config = xe_config(fd);
@@ -768,6 +775,96 @@ out:
 		igt_skip("Unable to induce purge on this platform/config");
 }
 
+/*
+ * Atomic madvise subtests — validate DRM_XE_MEM_RANGE_ATTR_ATOMIC
+ * modes (DEVICE, GLOBAL, CPU) on fault-mode SVM VMAs.
+ */
+
+struct atomic_data {
+	uint32_t batch[32];
+	uint64_t vm_sync;
+	uint64_t exec_sync;
+	uint32_t data;
+};
+
+static void atomic_build_batch(struct atomic_data *d, uint64_t gpu_addr)
+{
+	uint64_t data_offset = (char *)&d->data - (char *)d;
+	uint64_t sdi_addr = gpu_addr + data_offset;
+	int b = 0;
+
+	d->batch[b++] = MI_ATOMIC | MI_ATOMIC_INC;
+	d->batch[b++] = sdi_addr;
+	d->batch[b++] = sdi_addr >> 32;
+	d->batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(d->batch));
+}
+
+/**
+ * SUBTEST: atomic-device
+ * Description: madvise atomic device supports only GPU atomic operations,
+ *		test executes GPU MI_ATOMIC_INC on SVM memory via fault handler
+ * Test category: functionality test
+ */
+static void test_atomic_device(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	struct atomic_data *data;
+	uint32_t vm, exec_queue;
+	uint64_t addr;
+	size_t bo_size;
+	int va_bits;
+
+	va_bits = xe_va_bits(fd);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	bo_size = xe_bb_size(fd, sizeof(*data));
+	data = aligned_alloc(bo_size, bo_size);
+	igt_assert(data);
+	memset(data, 0, bo_size);
+
+	addr = to_user_pointer(data);
+
+	/* Bind entire VA space as CPU_ADDR_MIRROR */
+	sync[0].addr = to_user_pointer(&data->vm_sync);
+	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
+			    DRM_XE_VM_BIND_OP_MAP,
+			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
+			    sync, 1, 0, 0);
+	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
+	data->vm_sync = 0;
+
+	xe_vm_madvise(fd, vm, addr, bo_size, 0,
+		      DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_DEVICE, 0, 0);
+
+	atomic_build_batch(data, addr);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = addr + ((char *)&data->batch - (char *)data);
+
+	sync[0].addr = to_user_pointer(&data->exec_sync);
+	xe_exec(fd, &exec);
+	xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
+		       exec_queue, FIVE_SEC);
+
+	igt_assert_eq(data->data, 1);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	free(data);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -826,6 +923,17 @@ int igt_main()
 			}
 	}
 
+	igt_subtest_group() {
+		igt_fixture() {
+			igt_require(xe_has_vram(fd));
+			igt_require(!xe_supports_faults(fd));
+		}
+
+		igt_subtest("atomic-device")
+			xe_for_each_engine(fd, hwe)
+				test_atomic_device(fd, hwe);
+	}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

