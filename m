Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C74E7717F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 08:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDFF10EF60;
	Fri, 13 Dec 2024 08:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcKxUG9M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43D110EF60
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 08:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734079203; x=1765615203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ILaLUzu2YLl1bpYsAED3eGBQZnmggKk1lYplp/R8To=;
 b=RcKxUG9MzTc2QW5Zj+IN87hKtGH0o5Du0sr0lOOzQAjsHVQXC06WoVn3
 z384VaRYXKxk8vxAqT14OB9W0efA11TWcot0ZpxFa9PZwBV6syeDHa++n
 +cn+93gC95MLZTOz3tiRb1dUn5WH77X6U13IfMfcppoqwAIngy5R9361Z
 TisKAqgJTaeCFR/zBewa+0gQrsT3lqhguohMXyxe7aitrdLTwZGWLx54U
 VNgnvEwD/3gspaNOttrL/NVFytHc7Oo874zveHIupqyxO9P29FJQpYhZZ
 kVNU0IvOHtKEXQ6RT5SYlKCWOKr70VEGx/9IZn5w3/HbdTjnq5MmTKJdK w==;
X-CSE-ConnectionGUID: wSHjDYNaTM649b+ZGUAXzA==
X-CSE-MsgGUID: CFTlQbSBSN266v9F0YLXFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="37374483"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="37374483"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 00:40:03 -0800
X-CSE-ConnectionGUID: iSLhdDCgRw62h2AH52aWWg==
X-CSE-MsgGUID: F5GtQD5rSz6/MUhnDbfG5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="97035364"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2024 00:40:01 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v9 2/2] tests/xe_spin_batch: Add spin-timestamp-check
Date: Fri, 13 Dec 2024 14:07:30 +0530
Message-Id: <20241213083730.642423-3-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213083730.642423-1-pravalika.gurram@intel.com>
References: <20241213083730.642423-1-pravalika.gurram@intel.com>
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

check the ctx_timestamp register post gt reset for each engine.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_spin_batch.c | 121 ++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 9314e229e..00299fcdf 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -309,6 +309,121 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
 	put_ahnd(ahnd);
 }
 
+static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
+		       bool hang)
+{
+	uint64_t ahnd, bb_size, bb_addr;
+	uint32_t vm, exec_queue, bb;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync syncobj = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE,
+	};
+
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&syncobj),
+	};
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+	} *data;
+	uint64_t batch_offset, batch_addr, sdi_offset, sdi_addr;
+	int64_t timeout = NSEC_PER_SEC;
+	int i, ret;
+
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+	vm = xe_vm_create(fd, 0, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	bb_size = xe_bb_size(fd, sizeof(*data));
+	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id), 0);
+	bb_addr = intel_allocator_alloc_with_strategy(ahnd, bb, bb_size, 0,
+						      ALLOC_STRATEGY_LOW_TO_HIGH);
+	data = xe_bo_map(fd, bb, bb_size);
+	syncobj.addr = to_user_pointer(&data->vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bb, 0, bb_addr, bb_size, &syncobj, 1);
+	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+
+	batch_offset = (char *)&data->batch - (char *)data;
+	batch_addr = bb_addr + batch_offset;
+	sdi_offset = (char *)&data->data - (char *)data;
+	sdi_addr = bb_addr + sdi_offset;
+
+	i = 0;
+
+	data->batch[i++] = MI_STORE_DWORD_IMM_GEN4;
+	data->batch[i++] = sdi_addr;
+	data->batch[i++] = sdi_addr >> 32;
+	data->batch[i++] = 0;
+	if (!hang)
+		data->batch[i++] = MI_BATCH_BUFFER_END;
+	igt_assert(i <= ARRAY_SIZE(data->batch));
+
+	syncobj.addr = bb_addr + (char *)&data->exec_sync - (char *)data;
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+	xe_exec(fd, &exec);
+	ret = __xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE, 0, &timeout);
+	igt_assert(hang ? ret < 0 : ret == 0);
+
+	munmap(data, bb_size);
+	gem_close(fd, bb);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+
+	put_ahnd(ahnd);
+}
+
+static void run_spinner(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	struct xe_cork *ctx = NULL;
+	uint32_t vm;
+	uint32_t ts_1, ts_2;
+	uint64_t ahnd;
+
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	ctx = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
+	xe_cork_sync_start(fd, ctx);
+
+	/* Collect and check timestamps before stopping the spinner */
+	usleep(50000);
+	ts_1 = READ_ONCE(ctx->spin->timestamp);
+	usleep(50000);
+	ts_2 = READ_ONCE(ctx->spin->timestamp);
+	igt_assert_neq_u32(ts_1, ts_2);
+
+	xe_cork_sync_end(fd, ctx);
+	xe_cork_destroy(fd, ctx);
+
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+}
+
+#define TRUE 1
+#define FALSE 0
+/**
+ * SUBTEST: spin-timestamp-check
+ * Description: Intiate gt reset then check the timestamp register for each engine.
+ * Test category: functionality test
+ */
+static void xe_spin_timestamp_check(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	/*sanity check for exec submission*/
+	exec_store(fd, eci, FALSE);
+
+	exec_store(fd, eci, TRUE);
+
+	run_spinner(fd, eci);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -343,6 +458,12 @@ igt_main
 			xe_for_each_engine_class(class)
 				xe_spin_fixed_duration(fd, gt, class, SPIN_FIX_DURATION_PREEMPT);
 
+	igt_subtest_with_dynamic("spin-timestamp-check")
+		xe_for_each_engine(fd, hwe) {
+			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
+				xe_spin_timestamp_check(fd, hwe);
+		}
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.34.1

