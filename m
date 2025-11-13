Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C037CD8CA4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 16:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F2810E8C0;
	Thu, 13 Nov 2025 16:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DgYeaIWF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846F410E8C0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763051591; x=1794587591;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=socyUAnG5Xoraj3L2c5pbJ5GcoJ1S2de4XcfHOLrvKA=;
 b=DgYeaIWFEBJ/Av8PVstP3X4JoDfYcM8w1/fUPWheruvuDobhBniN+c8u
 bpEqos4mVGdwUxq8Ly+rAr+aOuhNETI7eGk866Goc7sItsjbdeEidfr8y
 BqoMCkmP1MGC1bT7cKDthiEVhf4vJRxQk7+9FPEL0U5XAZN9f06xwoa2a
 r8kQf/Pk8QrnDc9CX5gxeXdm/ZS2Baq+Wgx2AxSC1uFXVy4cNbUrwMTlM
 V+Oey3oVPYY9M5u4rPQ9+6gseLQG8aaUa4+8shgRUPaffNhz5D+fv9G3h
 9S3I5DvDtxCOKhuA3TJK5FVZdr8uVjAkvHVNLL6j2EM+sYEbVX5P7RrQR g==;
X-CSE-ConnectionGUID: poVHEVNBS6ymsuYm2WEWkg==
X-CSE-MsgGUID: m8XsOD6PROa2zQ1wWWyBDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76482247"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="76482247"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:33:10 -0800
X-CSE-ConnectionGUID: W4a+BlXSSs+SVY+jYO1joA==
X-CSE-MsgGUID: CrBEZLNfRlSGZu/NpuiWSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="194533900"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2025 08:33:08 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v7 02/10] tests/intel/xe_exec_system_allocator: Add
 parameter in madvise call
Date: Thu, 13 Nov 2025 16:33:01 +0000
Message-ID: <20251113163308.633818-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113163308.633818-1-nishit.sharma@intel.com>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
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

Parameter instance added in xe_vm_madvise() call. This parameter
addition cause compilation issue in system_allocator test. As a fix
0 as instance parameter passed in xe_vm_madvise() calls.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index b88967e58..1e7175061 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1164,7 +1164,7 @@ madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
 	xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
 		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
 		      preferred_loc,
-		      0);
+		      0, 0);
 }
 
 static void
@@ -1172,7 +1172,7 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 		       int pat_index)
 {
 	xe_vm_madvise(fd, vm, addr, range, 0,
-		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0);
+		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
 }
 
 static void
@@ -1181,7 +1181,7 @@ xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 {
 	xe_vm_madvise(fd, vm, addr, range, 0,
 		      DRM_XE_MEM_RANGE_ATTR_ATOMIC,
-		      mem_attr, 0);
+		      mem_attr, 0, 0);
 }
 
 static void
@@ -1190,7 +1190,7 @@ xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr, uint64_t range)
 	xe_vm_madvise(fd, vm, addr, range, 0,
 		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
 		      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
-		      DRM_XE_MIGRATE_ALL_PAGES);
+		      DRM_XE_MIGRATE_ALL_PAGES, 0);
 }
 
 static void
-- 
2.48.1

