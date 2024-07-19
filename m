Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FB4C3DA5D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 19:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F86610E144;
	Fri, 19 Jul 2024 19:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEvfCrYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB84B10E144
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 19:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721416241; x=1752952241;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LmZlUtDvsrQov6gR7AXTm2UgO8Ow4FBtmT48UZirJK8=;
 b=hEvfCrYtHEpyGiyVY0e6FQO8QTbFsFAxM5KwQj90TzlsZigTLongNvM1
 naejSvo8/L/7QFRlFCoGAT/Ijg9RnqlNUiGWjjKgiwMXfD/jwFq+n64Ln
 8BAKqFUI0TgKmM4mzC5CPMm7UbyLx8l8U+NbQbQ8WJrnp6OiMeZ0AMXAN
 8c01Xrv3DvSoTFApqe5bujQnPPZkJEfNXa7u+UdFiFZNGgcSNxyynYWeH
 5UZoM3W96E/uE7ARaL/EAWgUQwUoEa/ly38YRe/N3O38uQuGwq5YR43h2
 T/ubTE/2rFAkTzKokfkBb4shitIdXuIw7FrKqfa3kD7pFq9TuoPcXLdQw A==;
X-CSE-ConnectionGUID: p8o+75wLT1Om+WMbAg9c0w==
X-CSE-MsgGUID: Y+YorKDoTJ+ggpgrirjshg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22815724"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="22815724"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:10:41 -0700
X-CSE-ConnectionGUID: 9qGsfjP8RGqa8CUmE0vbUQ==
X-CSE-MsgGUID: dupOIP0bT2KkwQxk+weK7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="82267756"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:10:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel/xe_vm: Add test for 64k page corners
Date: Fri, 19 Jul 2024 12:11:26 -0700
Message-Id: <20240719191126.1535811-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add sections which split compact 64k pages in 4k pages.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 128 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index a4f6c7a0b4..d507e7cb16 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -366,6 +366,128 @@ static void userptr_invalid(int fd)
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
+	/* Verify 1st mapping working */
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
+		igt_assert_eq(data[i].data, 0xc0ffee);
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
@@ -1973,6 +2095,12 @@ igt_main
 	igt_subtest("bind-flag-invalid")
 		bind_flag_invalid(fd);
 
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

