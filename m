Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FCEC55170
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 09:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC93A10E7A5;
	Fri, 20 Feb 2026 09:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2wUFnEr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2A110E79C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 09:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771579845; x=1803115845;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8F2hXzC/oXR+XJm2LKTtEF1FcrZAycJLFKw2rRsMRs0=;
 b=H2wUFnErdx5roiwahzU9W+aYkdZQU9WpRYw9Qpcv7wKNr4+kh1mO7oLk
 ApJ9H9kDcO6PAakiyQRFltNbUHrLHid1Zk5CJJ/u5hngJsU2woKQ6lfqy
 axkSh8CG3h405ZUtO3QXkyYCdaz09TUt4Ljm1ArhUjoG+CmGO1/xfdA5Z
 8bc2jrT4fNxLHsF9qTw5Zbk/sn5DoOrHTwcN9DMFgEQ+FnZGoZfEtgFlb
 JFjw0IX86tRYY9SH1MMP4Nx/NE2n6t3Ws+Mdc9YmgrcHLlRNOdiN4A3hZ
 HKOwIu9gJMvMi7M3GEKSkzVy5PDwdTYbUcxKi7XHu3xP3TaDOMZNIknI7 Q==;
X-CSE-ConnectionGUID: sy4thJ3TRfegJbS/n+/yiA==
X-CSE-MsgGUID: s9X21o/UTsyaxCVMinq7WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72373785"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72373785"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 01:30:45 -0800
X-CSE-ConnectionGUID: T+7/Vb4pTNuruZK829BgDA==
X-CSE-MsgGUID: W565laKtS/iuP4/d4ayaoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214030425"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.6])
 by orviesa010.jf.intel.com with ESMTP; 20 Feb 2026 01:30:44 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 1/3] tests/intel/xe_exec_store: Validate PCIe6 relax
 ordering
Date: Fri, 20 Feb 2026 09:30:39 +0000
Message-Id: <20260220093041.1911492-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220093041.1911492-1-nishit.sharma@intel.com>
References: <20260220093041.1911492-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

To improve GPU BW, certain copy engine write instructions
to system memory is using relaxed pcie transaction which
can lead to out of order write to system memory.
The recommendation is to use MI_MEM_FENCE for such instructions
like MEM_COPY and MEM_SET to serialize the memory writes.

This test validates MEM_FENCE with MEM_COPY instruction and also
validates out of order mem writes which are not guaranteed 100% of the
time.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_store.c | 125 ++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 6935fa8aa..989d9e6b9 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -412,6 +412,113 @@ static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
 	free(buf);
 }
 
+/**
+ * SUBTEST: mem-write-ordering-check
+ * Description: Verify that copy engines writes to sys mem is ordered
+ * Test category: functionality test
+ *
+ */
+static void mem_transection_ordering(int fd, size_t bo_size, bool fence)
+{
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, }
+	};
+
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+
+	int count = 3; // src, bounce, dest, batch
+	int i, b = 0;
+	uint64_t offset[count];
+	uint32_t exec_queues, vm, syncobjs;
+	uint32_t bo[count], *bo_map[count];
+	uint64_t ahnd;
+	uint32_t *batch_map;
+	int src_idx = 0, dst_idx = 1;
+
+	bo_size = xe_bb_size(fd, bo_size);
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
+	exec_queues = xe_exec_queue_create(fd, vm, &inst, 0);
+	syncobjs = syncobj_create(fd, 0);
+	sync[0].handle = syncobj_create(fd, 0);
+
+	for (i = 0; i < count; i++) {
+		bo[i] = xe_bo_create_caching(fd, vm, bo_size, system_memory(fd), 0,
+					     DRM_XE_GEM_CPU_CACHING_WC);
+		bo_map[i] = xe_bo_map(fd, bo[i], bo_size);
+		offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
+								bo_size, 0,
+								ALLOC_STRATEGY_NONE);
+		xe_vm_bind_async(fd, vm, 0, bo[i], 0, offset[i], bo_size, sync, 1);
+	}
+
+	batch_map = xe_bo_map(fd, bo[i - 1], bo_size);
+	exec.address = offset[i - 1];
+
+	// Fill source buffer with a pattern
+	for (i = 0; i < bo_size; i++)
+		((uint8_t *)bo_map[src_idx])[i] = i % bo_size;
+
+	batch_map[b++] = MEM_COPY_CMD;
+	batch_map[b++] = bo_size - 1;// src # of bytes
+	batch_map[b++] = 0; //src height
+	batch_map[b++] = -1; // src pitch
+	batch_map[b++] = -1; // dist pitch
+	batch_map[b++] = offset[src_idx];
+	batch_map[b++] = offset[src_idx]  >> 32;
+	batch_map[b++] = offset[dst_idx];
+	batch_map[b++] = offset[dst_idx]  >> 32;
+	batch_map[b++] = intel_get_uc_mocs_index(fd) << 25 | intel_get_uc_mocs_index(fd);
+	if (fence)
+		batch_map[b++] = MI_MEM_FENCE | MI_WRITE_FENCE;
+
+	batch_map[b++] = MI_BATCH_BUFFER_END;
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].handle = syncobjs;
+	exec.exec_queue_id = exec_queues;
+	xe_exec(fd, &exec);
+	igt_assert(syncobj_wait(fd, &syncobjs, 1, INT64_MAX, 0, NULL));
+
+	if (fence) {
+		igt_assert(memcmp(bo_map[src_idx], bo_map[dst_idx], bo_size) == 0);
+	} else {
+		bool detected_out_of_order = false;
+
+		for (i = bo_size - 1; i >= 0; i--) {
+			if (((uint8_t *)bo_map[src_idx])[i] != ((uint8_t *)bo_map[dst_idx])[i]) {
+				detected_out_of_order = true;
+				break;
+			}
+		}
+
+		if (detected_out_of_order)
+			igt_info("Tested detected out of order write at idx %d\n", i);
+		else
+			igt_info("Tested didn't detect out of order writes\n");
+	}
+
+	for (i = 0; i < count; i++) {
+		munmap(bo_map[i], bo_size);
+		gem_close(fd, bo[i]);
+	}
+
+	munmap(batch_map, bo_size);
+	put_ahnd(ahnd);
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, syncobjs);
+	xe_exec_queue_destroy(fd, exec_queues);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -483,6 +590,24 @@ int igt_main()
 		igt_collection_destroy(set);
 	}
 
+	igt_subtest_with_dynamic("mem-write-ordering-check") {
+		struct {
+			size_t size;
+			const char *label;
+		} sizes[] = {
+			{ SZ_1M,  "1M" },
+			{ SZ_2M,  "2M" },
+			{ SZ_8M,  "8M" },
+		};
+
+		for (size_t i = 0; i < ARRAY_SIZE(sizes); i++) {
+			igt_dynamic_f("size-%s", sizes[i].label) {
+				mem_transection_ordering(fd, sizes[i].size, true);
+				mem_transection_ordering(fd, sizes[i].size, false);
+			}
+		}
+	}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		close(fd);
-- 
2.34.1

