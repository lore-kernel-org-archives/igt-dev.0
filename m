Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F49FED2F0
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 08:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DA910EA25;
	Thu, 12 Mar 2026 08:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZV8HW9Eg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E4710EA16
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 08:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773304657; x=1804840657;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LYCxtgfAgvmJszSyIUJY/ODBVkdgZN7mXG1JLpBjOqc=;
 b=ZV8HW9EgkRMLB3LNvgTaCQqh+Zz2h9SLqq4zLxwnOe1kJhLA8B0xcLmT
 AkIi3WpmP7irOTUGnc3kqod6wkHjVx/6wSdBya4niEKQcbnx+10pYa7v/
 O8lBpVflSUUhi/YwsQmeE5NviBn4R/nDxVAWBMUBJnJ8jcw1H11GvBPdD
 0kckrQHSiuiSLqpZzo2+AMk/xto1RTMP4kDJTcbihyWpBYuw2QcA/WGkc
 eo19+4vm40DIm5nPswLcMbWBYH7pZkxXhxR31DfFHzy/BUSbbASGNCKgn
 LxnI4spkFjstJRgdSyh6zogeo1y/UQEXy0NraHqvRJj7eeW7u29vK7HGC Q==;
X-CSE-ConnectionGUID: BZIBYv5PQZ6f3BBE/0RHiA==
X-CSE-MsgGUID: uea7E9VQRreK0+6toH1euA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85089914"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85089914"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:37:36 -0700
X-CSE-ConnectionGUID: L6XYbcCATR+1wEV1/c8r7w==
X-CSE-MsgGUID: IFB5xZs2R9ORRP04wX/msw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225450934"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.11])
 by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2026 01:37:35 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v3 2/2] tests/intel/xe_svm_usrptr_madvise: Unify batch
 buffer alignment
Date: Thu, 12 Mar 2026 08:37:31 +0000
Message-Id: <20260312083731.644793-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312083731.644793-1-nishit.sharma@intel.com>
References: <20260312083731.644793-1-nishit.sharma@intel.com>
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

