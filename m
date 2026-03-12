Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134F11067021
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 13:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DE110E259;
	Thu, 12 Mar 2026 13:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhjofvYG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76BD10EA0F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 13:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773323337; x=1804859337;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LYCxtgfAgvmJszSyIUJY/ODBVkdgZN7mXG1JLpBjOqc=;
 b=RhjofvYGsWdgeTRCs7cipHm+6GEowHRIuvErqI157omefHARMHlYAGpO
 Ekd05vxki951EA8KoCALC96V8sZbh0axUXpM3eHorouuzY1FjFZZkN2V7
 nV+cZemopZ6jFLO+yR09UlurbqHFMcRbHrvaMAA1R/ujWz6DVg7f94Ot5
 3iHQckvb9/j23wWSMUinsrhQ/2DnysWPK5tJi07nio2b7vHxwpiev8veO
 FK7MopeDv6YU81CHFRo6oWgojf5mErQ50AUlpJFtqMzclAxwWxvDQPZey
 qIe1Cti9xE1SVwzjuRBRXEGzboDwo/VP4lpe40Dd0QJhC8rCtcRK/IaPV g==;
X-CSE-ConnectionGUID: x68PdoDjRlqs0tW8070K9g==
X-CSE-MsgGUID: moocBtWPR6K5Pr+zQ0Lvlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78268094"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="78268094"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:48:57 -0700
X-CSE-ConnectionGUID: 9u80gJSXRry4qU/GCfgqBQ==
X-CSE-MsgGUID: 2JQdQ0MLTyafyPLSuptpdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220767534"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.11])
 by orviesa009.jf.intel.com with ESMTP; 12 Mar 2026 06:48:55 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v4 2/2] tests/intel/xe_svm_usrptr_madvise: Unify batch
 buffer alignment
Date: Thu, 12 Mar 2026 13:48:51 +0000
Message-Id: <20260312134851.647568-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312134851.647568-1-nishit.sharma@intel.com>
References: <20260312134851.647568-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

This patch refactors the SVM userptr copy test and batch buffer setup
to use aligned buffer mapping for batch buffers, ensuring compatibility
across both Ponte Vecchio (PVC) and BMG platforms.
Batch buffer mapping now uses platform-required alignment, eliminating
the need for platform-specific address assignment and conditional code
paths.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_svm_usrptr_madvise.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_svm_usrptr_madvise.c b/tests/intel/xe_svm_usrptr_madvise.c
index bfa5864e4..db7b9ee35 100644
--- a/tests/intel/xe_svm_usrptr_madvise.c
+++ b/tests/intel/xe_svm_usrptr_madvise.c
@@ -98,7 +98,8 @@ gpu_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 {
 	uint32_t width = copy_size / 256;
 	uint32_t height = 1;
-	uint32_t batch_bo_size = BATCH_SIZE(fd);
+	uint64_t alignment = xe_get_default_alignment(fd);
+	uint32_t batch_bo_size = ALIGN(BATCH_SIZE(fd), alignment);
 	uint32_t batch_bo;
 	uint64_t batch_addr;
 	void *batch;
@@ -108,7 +109,7 @@ gpu_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	int i = 0;
 
 	batch_bo = xe_bo_create(fd, vm, batch_bo_size, vram_if_possible(fd, 0), 0);
-	batch = xe_bo_map(fd, batch_bo, batch_bo_size);
+	batch = xe_bo_map_aligned(fd, batch_bo, batch_bo_size, alignment);
 	cmd = (uint32_t *)batch;
 	cmd[i++] = MEM_COPY_CMD | (1 << 19);
 	cmd[i++] = width - 1;
@@ -140,7 +141,7 @@ gpu_copy_batch_create(int fd, uint32_t vm, uint32_t exec_queue,
 		      uint64_t src_addr, uint64_t dst_addr,
 		      uint32_t *batch_bo, uint64_t *batch_addr)
 {
-	gpu_batch_init(fd, vm, src_addr, dst_addr, SZ_4K, batch_bo, batch_addr);
+	gpu_batch_init(fd, vm, src_addr, dst_addr, SZ_16K, batch_bo, batch_addr);
 }
 
 static void
@@ -209,10 +210,10 @@ static void test_svm_userptr_copy(int fd)
 			      &batch_bo, &batch_addr);
 	gpu_exec_sync(fd, vm, exec_queue, &batch_addr);
 
-	igt_assert(memcmp(svm_ptr, userptr_ptr, SZ_4K) == 0);
+	igt_assert(memcmp(svm_ptr, userptr_ptr, 64) == 0);
 
 	bo_map = xe_bo_map(fd, bo, size);
-	igt_assert(memcmp(bo_map, svm_ptr, SZ_4K) == 0);
+	igt_assert(memcmp(bo_map, svm_ptr, 64) == 0);
 
 	xe_vm_bind_lr_sync(fd, vm, 0, 0, batch_addr, BATCH_SIZE(fd),
 			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
-- 
2.34.1

