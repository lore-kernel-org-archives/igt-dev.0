Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154AAC55196
	for <igt-dev@archiver.kernel.org>; Mon,  3 Aug 2026 21:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC2510E7C6;
	Mon,  3 Aug 2026 21:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEmbOQNZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0839010E092
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2026 21:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785792352; x=1817328352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1gs5kTBdRvfrx86CrmpL+PSVGdTrVvNyc1U1StVk8+U=;
 b=TEmbOQNZYAyfH4WPsMHDaouE6B6Vao+ODtaoMqoP/cVdqZj45koX2dCC
 4nxnGhbdcduRTDVwzaV4oePQytaB1620guXi8IC2H9MYZT1x1wFRu6nwM
 XmtPWBHdopIpmXI2JSRzaIfb399YFc/5HGZGS07NvfsVMoYuJjJmbj2MW
 JmC8xJIOyZWJ1Z7iYJ28pIa47RrHELpwJV3BtTMw1iZzQk/TKzrPrE38f
 BgD4T06cm2htgYViCYGAEKr4YX9hg7I09qYjd2uNcXetM6sAIuL+rKihv
 tDprDi5dH8EVanPx8j5aFfgtywaMXWVRw4ZCm5oa0g4wz84AX2YMxUY5K w==;
X-CSE-ConnectionGUID: xG1MX754TT2xHXY4H8OvIg==
X-CSE-MsgGUID: t5PEaLNpRfu1eYuFSyz3cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="96699852"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="96699852"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 14:25:51 -0700
X-CSE-ConnectionGUID: +eTrZgjSTuS7DYvFFkLJCw==
X-CSE-MsgGUID: PeiIcVavR+mat4ZY1r9vhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="265588533"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.44])
 by orviesa005.jf.intel.com with ESMTP; 03 Aug 2026 14:25:51 -0700
From: Jia Yao <jia.yao@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>,
	Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH] xe_exec_system_allocator: fix MADVISE_MULTI_VMA and
 PREFETCH_SAME_ATTR bo_size for PVC
Date: Mon,  3 Aug 2026 21:25:49 +0000
Message-ID: <20260803212549.108737-1-jia.yao@intel.com>
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

Both flags split the buffer in half with madvise, creating a bo_size/2
VMA fragment.  On PVC (NEED64K) drm_gpusvm requires chunks >= 64K, so
with bo_size=SZ_64K the 32K fragment causes -EINVAL, a GPU CAT error
and EIO from xe_wait_ufence.

Add both flags to the existing SZ_128K condition so each half is exactly
64K on NEED64K platforms.

Fixes: 022265cb9ebcb199 ("xe_exec_system_allocator: fix PREFETCH_SPLIT_VMA bo_size for PVC")
Cc: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 50cd6ead7..6ca53aa5f 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2814,8 +2814,18 @@ int igt_main()
 				 * and migrates the first half. On platforms with
 				 * 64K VRAM granularity (e.g. PVC), each half
 				 * must be >= 64K, so use SZ_128K as bo_size.
+				 *
+				 * MADVISE_MULTI_VMA applies madvise on
+				 * data+bo_size/2 for bo_size/2 bytes, and
+				 * PREFETCH_SAME_ATTR applies madvise on data
+				 * for bo_size/2 bytes after a full-buffer
+				 * prefetch.  Both create a bo_size/2 VMA
+				 * fragment; on NEED64K platforms that fragment
+				 * must be >= 64K, so use SZ_128K for them too.
 				 */
-				size_t bo_size = (s->flags & PREFETCH_SPLIT_VMA) ?
+				size_t bo_size = (s->flags & (PREFETCH_SPLIT_VMA |
+							      MADVISE_MULTI_VMA |
+							      PREFETCH_SAME_ATTR)) ?
 						 SZ_128K : SZ_64K;
 
 				test_exec(fd, hwe, 1, 1, bo_size, 0, 0, NULL,
-- 
2.43.0

