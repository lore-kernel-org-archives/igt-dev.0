Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBDCC48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 03:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BF010E5F2;
	Wed, 21 Feb 2024 03:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDYs7ycY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B662410E5F6
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 03:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708486224; x=1740022224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+iSU2RsNYjdle8F3GwAYVtb4WKy9dq7FdQrKpyEE9ak=;
 b=JDYs7ycYB3pH7hxwzdJlscvPmdMhUth6S7pkxbiWc3xNRR1TzJ5f2TZ8
 6DabKMHsuDBif5hioVkK+5YBHTQ3XynRw9iQIFm+jk0aCs7bmUV4ITrHN
 syzlIPKMElG4LNsjh+JIJn6DGPC/9QTpArXvHvcKSHO1NL/eC1nd796nh
 AJy5dvaBjSEgbRGt7QdGHiE/F9taorS8HeOl838zfod4TdZUv54e27Dsr
 Cv61psuN+oRATcRYSfWHfTbl/eBBNsBoygF4oy1IZCWLAHRY1yswWTIeT
 0rkZ6OEOlcL01H1G8ErAdf9E/wb1Sx4cDuvCmhHzAbkDQ7p7GDgtvzaPD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13745935"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="13745935"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 19:30:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9639431"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 19:30:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/1] tests/intel/xe_vm: Add test for 64k page corners
Date: Tue, 20 Feb 2024 19:31:07 -0800
Message-Id: <20240221033107.3731001-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221033107.3731001-1-matthew.brost@intel.com>
References: <20240221033107.3731001-1-matthew.brost@intel.com>
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

64k pages - either compact or 64k hint set in PTE have corner cases
around partial unbinds / rebinds. Add a section which tests these
corners.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 129 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 79fd007023..2e08ab2057 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -365,6 +365,129 @@ static void userptr_invalid(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: compact-64k-pages
+ * Description:
+ *	Take corner cases related to compact and 64k pages
+ * Functionality: bind
+ * Test category: functionality test
+ */
+static void compact_64k_pages(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	size_t page_size = xe_get_default_alignment(fd);
+	uint64_t addr0 = 0x10000000ull, addr1;
+	uint32_t vm;
+	uint32_t bo0, bo1;
+	uint32_t exec_queue;
+	void *ptr0, *ptr1;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data = NULL;
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	int i, b;
+
+#define EIGHT_MB	0x800000
+#define SIXTY_FOUR_KB	0x10000
+
+	vm = xe_vm_create(fd, 0, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	bo0 = xe_bo_create(fd, vm, EIGHT_MB,
+			   vram_if_possible(fd, eci->gt_id),
+			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	ptr0 = xe_bo_map(fd, bo0, EIGHT_MB);
+
+	bo1 = xe_bo_create(fd, vm, EIGHT_MB / 2,
+			   vram_if_possible(fd, eci->gt_id),
+			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	ptr1 = xe_bo_map(fd, bo1, EIGHT_MB / 2);
+
+	sync[0].handle = syncobj_create(fd, 0);
+	if (page_size == 0x1000) {
+		/* Setup mapping to split a 64k PTE in cache */
+		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, SIXTY_FOUR_KB, 0, 0);
+
+		addr1 = addr0 + (SIXTY_FOUR_KB / 2);
+		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, SIXTY_FOUR_KB / 2,
+				 sync, 1);
+	} else if (page_size == SIXTY_FOUR_KB) {
+		addr0 += page_size;
+
+		/* Setup mapping to split compact 64k pages */
+		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, EIGHT_MB, 0, 0);
+
+		addr1 = addr0 + (EIGHT_MB / 4);
+		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, EIGHT_MB / 2,
+				 sync, 1);
+	}
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	i = 0;
+	{
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr0 + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr0 + sdi_offset;
+		data = ptr0;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+
+		sdi_addr = addr1 + sdi_offset;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].handle = syncobj_create(fd, 0);
+		exec.exec_queue_id = exec_queue;
+		exec.address = batch_addr;
+		xe_exec(fd, &exec);
+
+		igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0,
+					NULL));
+
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+		data = ptr1;
+		igt_assert_eq(data[i].data, 0xc0ffee);
+	}
+
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	syncobj_reset(fd, &sync[0].handle, 1);
+	xe_vm_unbind_all_async(fd, vm, 0, bo0, 0, 0);
+	xe_vm_unbind_all_async(fd, vm, 0, bo1, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, sync[1].handle);
+	munmap(ptr0, EIGHT_MB);
+	munmap(ptr1, EIGHT_MB / 2);
+	gem_close(fd, bo0);
+	gem_close(fd, bo1);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: shared-%s-page
  * Description: Test shared arg[1] page
@@ -2143,6 +2266,12 @@ igt_main
 	igt_subtest("userptr-invalid")
 		userptr_invalid(fd);
 
+	igt_subtest("compact-64k-pages")
+		xe_for_each_engine(fd, hwe) {
+			compact_64k_pages(fd, hwe);
+			break;
+		}
+
 	igt_subtest("shared-pte-page")
 		xe_for_each_engine(fd, hwe)
 			shared_pte_page(fd, hwe, 4,
-- 
2.34.1

