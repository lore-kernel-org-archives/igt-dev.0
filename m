Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5140BC28B30
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 21:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A4710E4E4;
	Mon, 10 Mar 2025 21:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yxyn+QUV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D62A10E2C1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741640625; x=1773176625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Rp8Z+HUWRCVNZEp6Gmzw+2U4hKcErWTFPmC1If+G0o=;
 b=Yxyn+QUVsri1dxYN+5SRQG6c0nTQnogKac3ZBdP2+mVd4H6bHUGIjCqJ
 FgykgZyuRvZKoqNUWgzq8i2Cx+xBQKEXOW7IdXwGmXIt+IgUzOs2i7AlX
 pSlzlksMAybrAjKaRj6whDUAmbEGgVsmQ6Wy46FNWjpQfVpP9QKpI60MC
 ccoIC2squM4jwsgBIr+3Tc45GYe5/qGVufYBmZYo5AGUkRm2h56HgoaBV
 UVNU7vhCF54is90aJQHrT10AVdjw8RvDyL1uHm5uZpOhVx/9ElJRheL2r
 jr8LCJYoXXD+TR725R6G7KdE0G8mCPf43QJDCzGdYgrdLqzlA8smVssyB A==;
X-CSE-ConnectionGUID: e/qC8E65Q0G72wnapnjhZg==
X-CSE-MsgGUID: 0/v8HjDXQyKQBfmc38G0fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="60061549"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="60061549"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:03:45 -0700
X-CSE-ConnectionGUID: SlHw7yEcSEKv43EVaxD1xA==
X-CSE-MsgGUID: DoBDZwfSQhe9JMBt2Ygi9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="120630412"
Received: from dut4432lnl.fm.intel.com ([10.105.10.85])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:03:46 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com
Subject: [PATCH 4/4] tests/intel/xe_vm: Test DRM_IOCTL_XE_VM_GET_FAULTS fault
 reporting
Date: Mon, 10 Mar 2025 21:03:43 +0000
Message-ID: <20250310210343.204246-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310210343.204246-1-jonathan.cavitt@intel.com>
References: <20250310210343.204246-1-jonathan.cavitt@intel.com>
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

Add a test to xe_vm that determines if pagefaults are correctly tracked
and reported to the struct drm_xe_vm_get_faults.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_vm.c | 177 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 40928b441c..a841c2a877 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2359,6 +2359,10 @@ static void invalid_vm_id(int fd)
  * SUBTEST: vm-get-faults-invalid-fault-count
  * Functionality: ioctl_input_validation
  * Description: Check query with invalid fault_count returns expected error code
+ *
+ * SUBTEST: vm-get-faults-exercise
+ * Functionality: drm_xe_vm_get_faults
+ * Description: Check query correctly reports pagefaults on vm
  */
 static void get_faults_invalid_reserved(int fd, uint32_t vm)
 {
@@ -2396,6 +2400,178 @@ static void get_faults_invalid_fault_count(int fd, uint32_t vm)
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_FAULTS, &query, EINVAL);
 }
 
+static void gen_pf(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t addr = 0x1a0000;
+	uint64_t sync_addr = 0x101a0000;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t exec_queues[1];
+	uint32_t bind_exec_queues[1];
+	size_t bo_size, sync_size;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint32_t data;
+	} *data;
+	uint64_t *exec_sync;
+	int i, b;
+	int map_fd = -1;
+	int n_exec_queues = 1;
+	int n_execs = 64;
+
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = xe_bb_size(fd, bo_size);
+	sync_size = sizeof(*exec_sync) * n_execs;
+	sync_size = xe_bb_size(fd, sync_size);
+
+#define	MAP_ADDRESS	0x00007fadeadbe000
+	data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+		    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+		    MAP_ANONYMOUS, -1, 0);
+	igt_assert(data != MAP_FAILED);
+	memset(data, 0, bo_size);
+
+#define EXEC_SYNC_ADDRESS	0x00007fbdeadbe000
+	exec_sync = mmap((void *)EXEC_SYNC_ADDRESS, sync_size, PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(exec_sync != MAP_FAILED);
+	memset(exec_sync, 0, sync_size);
+
+	for (i = 0; i < n_exec_queues; i++) {
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		bind_exec_queues[i] = 0;
+	}
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
+				 to_user_pointer(data), addr,
+				 bo_size, sync, 1);
+
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+
+	xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
+				 to_user_pointer(exec_sync), sync_addr,
+				 sync_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_exec_queues;
+
+		b = 0;
+
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].addr = sync_addr + (char *)&exec_sync[i] - (char *)exec_sync;
+
+		exec.exec_queue_id = exec_queues[e];
+		exec.address = batch_addr;
+		xe_exec(fd, &exec);
+
+		if (i + 1 != n_execs) {
+			/*
+			 * Wait for exec completion and check data as
+			 * userptr will likely change to different
+			 * physical memory on next mmap call triggering
+			 * an invalidate.
+			 */
+			xe_wait_ufence(fd, &exec_sync[i],
+				       USER_FENCE_VALUE, exec_queues[e],
+				       NSEC_PER_SEC);
+			igt_assert_eq(data[i].data, 0xc0ffee);
+			data = mmap((void *)MAP_ADDRESS, bo_size,
+				    PROT_READ | PROT_WRITE, MAP_SHARED |
+				    MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		}
+	}
+
+	for (i = n_execs - 1; i < n_execs; i++) {
+		int64_t timeout = NSEC_PER_SEC;
+
+		igt_assert_eq(__xe_wait_ufence(fd, &exec_sync[i], USER_FENCE_VALUE,
+					       exec_queues[i % n_exec_queues], &timeout), 0);
+	}
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	data[0].vm_sync = 0;
+	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, sync_addr, sync_size,
+			   sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
+			   sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], NSEC_PER_SEC);
+
+	for (i = 0; i < n_exec_queues; i++) {
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+		if (bind_exec_queues[i])
+			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
+	}
+
+	munmap(exec_sync, sync_size);
+	if (map_fd != -1)
+		close(map_fd);
+}
+
+static void get_faults_exercise(int fd, uint32_t vm)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct xe_vm_fault *faults, f0, f;
+	struct drm_xe_vm_get_faults query = {0};
+	int i;
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_FAULTS, &query), 0);
+
+	igt_assert_eq(query.size, 0);
+	igt_assert_eq(query.fault_count, 0);
+
+	xe_for_each_engine(fd, hwe)
+		gen_pf(fd, vm, hwe);
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_FAULTS, &query), 0);
+	igt_assert_lt(0, query.size);
+	igt_assert_eq(query.size, query.fault_count / sizeof(struct xe_vm_fault));
+
+	faults = malloc(query.size);
+	igt_assert(faults);
+
+	query.faults = to_user_pointer(faults);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_FAULTS, &query), 0);
+
+	f0 = faults[0];
+	for (i = 0; i < query.fault_count; i++) {
+		f = faults[i];
+		igt_assert_eq(f.address, f0.address);
+		igt_assert_eq(f.address_type, f0.address_type);
+		igt_assert_eq(f.address_precision, f0.address_precision);
+	}
+}
+
 static void test_get_faults(int fd, void (*func)(int fd, uint32_t vm))
 {
 	uint32_t vm;
@@ -2526,6 +2702,7 @@ igt_main
 		{ "invalid-vm-id", get_faults_invalid_vm_id },
 		{ "invalid-size", get_faults_invalid_size },
 		{ "invalid-fault-count", get_faults_invalid_fault_count },
+		{ "exercise", get_faults_exercise },
 		{ }
 	};
 
-- 
2.43.0

