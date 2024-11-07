Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F94D4336A
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 14:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DB210E1D9;
	Thu,  7 Nov 2024 14:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlUpNYO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E67910E1D9
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730990128; x=1762526128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WfxiKxdc/rhXTcYX0K8/OKjxJc2ytXsYQJ1JUwOFWY4=;
 b=mlUpNYO4Uvzw1iSPNt6riyVTtnzw6K8Ael5z7U1XTbYU7H18iZAUa27J
 iU2tjdFqC9meL0KaqoCRIvaDSqKzkjlkIdUG3Tg3fEyxyZloEdYh5pkRR
 rSjmaRrhtAAP502mYEwP1RgIZbx46PoKjg42ptrP2WLHlr/GW00r30sN/
 eDUVXL+8FCR1Knv6l65W78E9yKP47FHfglyb3ZGp+bRAP/P8zc6gEoJGk
 Q0Lf3Qc6YSpHWn/8I+idE4h/R8m3VNF+yAXUvu+9EXUYjZPENZyoC5O1S
 pt80Z9TtUpM7IB6ZHmo+NY6aqg4BCLwJYnfQtocRiw+B4LQTSi5HRVNgH g==;
X-CSE-ConnectionGUID: 6Rznrr4VQ/eH9hOElAdR7A==
X-CSE-MsgGUID: xA642z9nSDWWMVpuYCJpjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="56231467"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="56231467"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 06:35:12 -0800
X-CSE-ConnectionGUID: cYt47M0/TgKkIBhDFf6i6g==
X-CSE-MsgGUID: M3N+ICGLSE6gH1z/j8g0Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="84632602"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2024 06:35:11 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH 2/2] tests/xe_spin_batch: Add spin-timestamp-check
Date: Thu,  7 Nov 2024 20:03:22 +0530
Message-Id: <20241107143322.348545-3-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107143322.348545-1-pravalika.gurram@intel.com>
References: <20241107143322.348545-1-pravalika.gurram@intel.com>
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

V2: move spinner code to lib avoid code redundancy
    use flags to maintain the readability
    use READ_ONCE to prevent compiler from optimizing it out [Lucas]

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_spin_batch.c | 118 ++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 9314e229e..72dcf20f9 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -309,6 +309,118 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
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
+	struct spin_ctx *ctx = NULL;
+	uint32_t vm;
+	uint32_t ts_1, ts_2;
+
+	vm = xe_vm_create(fd, 0, 0);
+	ctx = xe_spin_ctx_init(fd, eci, vm, 1, 1);
+	xe_spin_sync_start(fd, ctx);
+
+	/* Collect and check timestamps before stopping the spinner */
+	usleep(50000);
+	ts_1 = READ_ONCE(ctx->spin->timestamp);
+	usleep(50000);
+	ts_2 = READ_ONCE(ctx->spin->timestamp);
+	igt_assert_neq_u32(ts_1, ts_2);
+
+	xe_spin_sync_end(fd, ctx);
+	xe_spin_ctx_destroy(fd, ctx);
+
+	xe_vm_destroy(fd, vm);
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
+
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
@@ -343,6 +455,12 @@ igt_main
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

