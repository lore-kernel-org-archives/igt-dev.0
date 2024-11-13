Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BA2D637A6
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 17:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167EC10E2EA;
	Wed, 13 Nov 2024 17:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCS9ZPPQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C3F10E252
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 17:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731520439; x=1763056439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sLwI3VMKFeWlaaMGUCWyotoSlpfw2kiCU2RfnGblqkM=;
 b=ZCS9ZPPQigXRpevJcMvsHO2uyF2eM1KzlCJ45Md0jXLmyy9tx9ZLqfDf
 5/FStG3VMR8spf0Vk9VgYVJG6lBSzb7tos+QSQ+TnJ4VBfzh7LLFLFz62
 NqQFJTs2LGwgnqLGVuGXtnUU+hdYtdtDn3EHOWU/ncPN7WCiTKUuD+xGH
 RXmGz2QGSsAplR5QzPXLqFbqYsGEmIkyw2anOCAuHbMm1Dd1xmvN37/EF
 Z25kzpMiykzPkn3Wc2bUh6wbnPv/uX4/UreEUcYUIpSphIjrQ124lvo9G
 51DvxghQQP6QcbBMOU9pQTM++y3XWcSwZax+E0Qu8qSWxfU1zjLfV2Rxc w==;
X-CSE-ConnectionGUID: UvCe4PVhTEKRvn7EhGnwxA==
X-CSE-MsgGUID: VR9VwE6iRjy9Qb47lL8I0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31666707"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="31666707"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:53:57 -0800
X-CSE-ConnectionGUID: 7JSKKPwxRCC8/0oRwsM1eQ==
X-CSE-MsgGUID: 1YcmqEQYQnilswJAm/pjzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="91984961"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2024 09:53:56 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: lucas.demarchi@intel.com,
	igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH 2/2] tests/xe_spin_batch: Add spin-timestamp-check
Date: Wed, 13 Nov 2024 23:22:07 +0530
Message-Id: <20241113175207.399101-3-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113175207.399101-1-pravalika.gurram@intel.com>
References: <20241113175207.399101-1-pravalika.gurram@intel.com>
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

V3: call allocator in run_spinner and pass to spinner ctx [Zbigniew]
v4: Integrate spin_ctx to xe_cork [Lucas]

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_spin_batch.c | 121 ++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 9314e229e..9a5cdb830 100644
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
+	ctx = xe_spin_ctx_init_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
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

