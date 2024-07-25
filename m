Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10C7C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 17:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D6710E0B7;
	Thu, 25 Jul 2024 17:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9NJsE6R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E7610E0B7
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721929000; x=1753465000;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oMOqFs9g/pbL6cJF6ovkTIqNfFinn28nFAJPx7tiqo0=;
 b=K9NJsE6RGTObLo3BinRE5gH9wI4HIxEa0ETqwh7SSHy9oPt67xeGQ3ik
 nJlpHeSIFTVsV1EpKEMu12R428SM/3vdpbbYVxuVUXD/98aa+1HEMilSd
 08EKpDXRPOn08eRjnyccswovUOvO1LAqvZSGZnL22m4UhrqvzoMKo4c66
 9KL7oZwpKT3jWxUzNXs9TR+5Eu71x0TyaYbjUybtNcEUyaFC5XfEENEnM
 QtmNbnVh759q0HO596rb+DKowvAojhxXSD1ifhCz7sr91b8Xhg3wWkubG
 o7NI7wg5v6weMGDMKOV5AUNiOpH5YQmSxq52bhXNmPy7r099B8z0WyurL g==;
X-CSE-ConnectionGUID: N7ujlEHyQtWJ0sxT9/L15w==
X-CSE-MsgGUID: ojctafM2S62NUy4h78QfXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19826213"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19826213"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 10:33:52 -0700
X-CSE-ConnectionGUID: 1/eRZZorTgKVAZQ5dUSJrA==
X-CSE-MsgGUID: OcPtsgBdQly6w0pBHRfsKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="53072752"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 10:33:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com
Subject: [PATCH v2] tests/intel/xe_vm: Add test for 64k page corners
Date: Thu, 25 Jul 2024 10:34:39 -0700
Message-Id: <20240725173439.1931317-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add sections which splits 64k pages in 4k pages or splits compact 64k in
64k pages.

v2:
 - Use SZ_* (Zbigniew)
 - Remove clock block (Zbigniew)
 - Update commit message / comments

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 95 ++++++++++++++++++++++-----------------------
 1 file changed, 46 insertions(+), 49 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index d507e7cb16..f41c6aca53 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -397,80 +397,77 @@ static void compact_64k_pages(int fd, struct drm_xe_engine_class_instance *eci)
 		.num_syncs = 2,
 		.syncs = to_user_pointer(sync),
 	};
-	int i, b;
-
-#define EIGHT_MB	0x800000
-#define SIXTY_FOUR_KB	0x10000
+	uint64_t batch_offset;
+	uint64_t batch_addr;
+	uint64_t sdi_offset;
+	uint64_t sdi_addr;
+	int b = 0;
 
 	vm = xe_vm_create(fd, 0, 0);
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 
-	bo0 = xe_bo_create(fd, vm, EIGHT_MB,
+	bo0 = xe_bo_create(fd, vm, SZ_8M,
 			   vram_if_possible(fd, eci->gt_id),
 			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	ptr0 = xe_bo_map(fd, bo0, EIGHT_MB);
+	ptr0 = xe_bo_map(fd, bo0, SZ_8M);
 
-	bo1 = xe_bo_create(fd, vm, EIGHT_MB / 2,
+	bo1 = xe_bo_create(fd, vm, SZ_8M / 2,
 			   vram_if_possible(fd, eci->gt_id),
 			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	ptr1 = xe_bo_map(fd, bo1, EIGHT_MB / 2);
+	ptr1 = xe_bo_map(fd, bo1, SZ_8M / 2);
 
 	sync[0].handle = syncobj_create(fd, 0);
-	if (page_size == 0x1000) {
+	if (page_size == SZ_4K) {
 		/* Setup mapping to split a 64k PTE in cache */
-		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, SIXTY_FOUR_KB, 0, 0);
+		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, SZ_64K, 0, 0);
 
-		addr1 = addr0 + (SIXTY_FOUR_KB / 2);
-		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, SIXTY_FOUR_KB / 2,
+		addr1 = addr0 + (SZ_64K / 2);
+		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, SZ_64K / 2,
 				 sync, 1);
-	} else if (page_size == SIXTY_FOUR_KB) {
+	} else if (page_size == SZ_64K) {
 		addr0 += page_size;
 
 		/* Setup mapping to split compact 64k pages */
-		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, EIGHT_MB, 0, 0);
+		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, SZ_8M, 0, 0);
 
-		addr1 = addr0 + (EIGHT_MB / 4);
-		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, EIGHT_MB / 2,
+		addr1 = addr0 + (SZ_8M / 4);
+		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, SZ_8M / 2,
 				 sync, 1);
 	}
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	/* Verify 1st mapping working */
-	i = 0;
-	{
-		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
-		uint64_t batch_addr = addr0 + batch_offset;
-		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
-		uint64_t sdi_addr = addr0 + sdi_offset;
-		data = ptr0;
+	/* Verify 1st and 2nd mappings working */
+	batch_offset = (char *)&data[0].batch - (char *)data;
+	batch_addr = addr0 + batch_offset;
+	sdi_offset = (char *)&data[0].data - (char *)data;
+	sdi_addr = addr0 + sdi_offset;
+	data = ptr0;
 
-		b = 0;
-		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-		data[i].batch[b++] = sdi_addr;
-		data[i].batch[b++] = sdi_addr >> 32;
-		data[i].batch[b++] = 0xc0ffee;
+	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data[0].batch[b++] = sdi_addr;
+	data[0].batch[b++] = sdi_addr >> 32;
+	data[0].batch[b++] = 0xc0ffee;
 
-		sdi_addr = addr1 + sdi_offset;
-		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-		data[i].batch[b++] = sdi_addr;
-		data[i].batch[b++] = sdi_addr >> 32;
-		data[i].batch[b++] = 0xc0ffee;
+	sdi_addr = addr1 + sdi_offset;
+	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data[0].batch[b++] = sdi_addr;
+	data[0].batch[b++] = sdi_addr >> 32;
+	data[0].batch[b++] = 0xc0ffee;
 
-		data[i].batch[b++] = MI_BATCH_BUFFER_END;
-		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+	data[0].batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data[0].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[1].handle = syncobj_create(fd, 0);
-		exec.exec_queue_id = exec_queue;
-		exec.address = batch_addr;
-		xe_exec(fd, &exec);
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].handle = syncobj_create(fd, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+	xe_exec(fd, &exec);
 
-		igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0,
-					NULL));
-		igt_assert_eq(data[i].data, 0xc0ffee);
-		data = ptr1;
-		igt_assert_eq(data[i].data, 0xc0ffee);
-	}
+	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0,
+				NULL));
+	igt_assert_eq(data[0].data, 0xc0ffee);
+	data = ptr1;
+	igt_assert_eq(data[0].data, 0xc0ffee);
 
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	syncobj_reset(fd, &sync[0].handle, 1);
@@ -481,8 +478,8 @@ static void compact_64k_pages(int fd, struct drm_xe_engine_class_instance *eci)
 	xe_exec_queue_destroy(fd, exec_queue);
 	syncobj_destroy(fd, sync[0].handle);
 	syncobj_destroy(fd, sync[1].handle);
-	munmap(ptr0, EIGHT_MB);
-	munmap(ptr1, EIGHT_MB / 2);
+	munmap(ptr0, SZ_8M);
+	munmap(ptr1, SZ_8M / 2);
 	gem_close(fd, bo0);
 	gem_close(fd, bo1);
 	xe_vm_destroy(fd, vm);
-- 
2.34.1

