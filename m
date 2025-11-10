Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FA6CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 03:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D21C10E16E;
	Mon, 10 Nov 2025 03:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7WZjHS9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A9610E16E
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 03:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762746621; x=1794282621;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yKcv5sAMH8XHft5i67hL4YD7ga8QpNM4TiNlSdeiL/g=;
 b=Z7WZjHS9ktmwK3MgipoAHvcW4zBRFGalk5fLYltXqORgAXFGobdoMZ5M
 TWlDrYANRhmnGLG/Itq1HXI0ov/MFsHFSmvBSgNwAVnwsOXTp7eCSKh2g
 rOC4i1yIssGOKgL+We2rrpLERwB612CEukuxrVRQQfsPUi+E98dczaSj4
 509gT/ZBFAb0mmLgnxgln32fBIUc7QwLHih+OBvEgeF0JJcY5c9jxbf8M
 WT0O82lftEWHwyJ2y5MPOdOTfK3po+d/69xfoVHSbvZZ0lvI004CFpdzH
 TYz77sTpv87kdwslVIYVNbHUr/Ys6XG96ZdvFM5Opbz/gvqwbBdGyDy1S w==;
X-CSE-ConnectionGUID: tGiYmL39TZ2u7TLS6koL+w==
X-CSE-MsgGUID: BM+7AN7xTsKch/QZuYV2tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="76143610"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; d="scan'208";a="76143610"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 19:50:21 -0800
X-CSE-ConnectionGUID: dhdyaJlWRyy50FmjwOl4sQ==
X-CSE-MsgGUID: ZBgUPgaGRnitjjjF3ee6Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; d="scan'208";a="189287640"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa010.fm.intel.com with ESMTP; 09 Nov 2025 19:50:21 -0800
From: Nishit Sharma <nishit.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 8/8] tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU
 migration test
Date: Mon, 10 Nov 2025 03:50:17 +0000
Message-ID: <20251110035020.221884-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251104153201.677938-1-nishit.sharma@intel.com>
References: <20251104153201.677938-1-nishit.sharma@intel.com>
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

This test allocates a buffer in SVM, accesses it from GPU 1, then GPU 2
and then the CPU. It verifies that the buffer migrates correctly between
devices and remains accessible across all agents in a multi-GPU environment.
---
 tests/intel/xe_multisvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_multisvm.c b/tests/intel/xe_multisvm.c
index a57b3d62a..7bb41c62f 100644
--- a/tests/intel/xe_multisvm.c
+++ b/tests/intel/xe_multisvm.c
@@ -47,6 +47,7 @@ struct xe_svm_gpu_info {
 	int fd;
 };
 
+#if 0
 static void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 			       uint64_t addr, uint64_t size, uint32_t flags)
 {
@@ -84,6 +85,7 @@ static void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
 		xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
 	free((void *)sync_addr);
 }
+#endif
 
 static void batch_init(int fd, uint32_t vm, uint64_t src_addr, uint64_t dst_addr,
 		       uint64_t copy_size, uint32_t *bo, uint64_t *addr)
-- 
2.48.1

