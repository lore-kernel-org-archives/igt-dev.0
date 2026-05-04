Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1848CD342F
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 22:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F2510E11F;
	Mon,  4 May 2026 22:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aV5xdc01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58CE10E11F
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 22:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777934248; x=1809470248;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CV6z3itIM7cPG2sQqo9NSfGrShrOvpVJp6/sLGl4hpg=;
 b=aV5xdc01+1vqjxbObeDFDukWv6OTuczcJvDg1azW3MEHlH3EAf6VViqu
 oQd7NHukW5UMTFgp6m1af9Pvx9kOIvbcSzN6M1v8uUAbM4O9/DOdnd6rQ
 e5XFucMEN+klEqNRj2RJsPKG0RrZkSG50VQEDYzBGxubGLl6rrrJeCvTN
 DtPUXlXLZoEALGPEeBQq3rLI/LB7vNKKs58QsJDreqjzeWU+jOB78aGtT
 8D9tScbNkTEA0Zt4EqSIoNwTlXlv4vFTWwhP8HUJw1NL9WFpMvI5Z5suF
 ihkZeBkD+K1x3db0Hbm/rFZThl4x6DeFYamv6BLK6bfnTc4qIsJ8ZFOVp w==;
X-CSE-ConnectionGUID: OTmic1bbQ4m4Cn/KPxMI2g==
X-CSE-MsgGUID: eysmFgLHSCq5tYAzR4TV1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89103664"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="89103664"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 15:37:23 -0700
X-CSE-ConnectionGUID: IYQIQqCgRimEUiOCdSNoIw==
X-CSE-MsgGUID: QalhosLFThSASf9nWIAHVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="235694433"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.31])
 by orviesa009.jf.intel.com with ESMTP; 04 May 2026 15:37:22 -0700
From: Jia Yao <jia.yao@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH] xe_exec_system_allocator: fix PREFETCH_SPLIT_VMA bo_size for
 PVC
Date: Mon,  4 May 2026 22:37:17 +0000
Message-ID: <20260504223717.1080309-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
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

The PREFETCH_SPLIT_VMA subtest splits a buffer in half and relies on a
GPU atomic fault to trigger SVM migration of the first half to VRAM.
On PVC (XE_VRAM_FLAGS_NEED64K), xe_svm_range_needs_migrate_to_vram()
rejects ranges smaller than 64K, so when bo_size=SZ_64K the 32K split
half never migrates, causing an atomic timeout.

Fix by passing SZ_128K as bo_size for PREFETCH_SPLIT_VMA subtests so
each half is exactly 64K, and align bo_size to 64K inside
madvise_prefetch_op() to match the granularity PVC requires.

Cc: Sobin Thomas <sobin.thomas@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 5580099f7..deef7626c 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1380,7 +1380,10 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 	uint32_t num_ranges;
 
 	if (flags & PREFETCH_SPLIT_VMA) {
-		bo_size = ALIGN(bo_size, SZ_4K);
+		uint16_t dev_id = intel_get_drm_devid(fd);
+		size_t alignment = IS_PONTEVECCHIO(dev_id) ? SZ_64K : SZ_4K;
+
+		bo_size = ALIGN(bo_size, alignment);
 
 		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, 0);
 
@@ -2751,9 +2754,19 @@ int igt_main()
 
 	for (const struct section *s = msections; s->name; s++) {
 		igt_subtest_f("madvise-%s", s->name) {
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
+			xe_for_each_engine(fd, hwe) {
+				/*
+				 * PREFETCH_SPLIT_VMA splits the buffer in half
+				 * and migrates the first half. On platforms with
+				 * 64K VRAM granularity (e.g. PVC), each half
+				 * must be >= 64K, so use SZ_128K as bo_size.
+				 */
+				size_t bo_size = (s->flags & PREFETCH_SPLIT_VMA) ?
+						 SZ_128K : SZ_64K;
+
+				test_exec(fd, hwe, 1, 1, bo_size, 0, 0, NULL,
 					  NULL, s->flags, NULL);
+			}
 		}
 	}
 
-- 
2.43.0

