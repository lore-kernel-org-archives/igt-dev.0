Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7041C369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 14:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B65610E4AB;
	Tue, 29 Apr 2025 14:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9mFAewr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11DB10E4AB
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745937061; x=1777473061;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VpIiy0CBZIbBvFoUVHEu9i2H5kL78EADvksJFFuwZJw=;
 b=f9mFAewruerh1//wsJg1YEMUPTchLPC4pJEv5b353Onpvgre5Vf5hbTN
 ZT5d9nyQ6wAx7AXR4mdGSnYv1Zzuw1uRUzDHNKIxIxUJfB6sm131ypXQc
 gBHdZEYf0p8P5pMLtzY687K2uPshRG3rE2YfYIWdFBPt/HLyVmRXGg9dI
 tp8zW06tVMEIw8aR7IPyMPKdw3hp/6G6h2YYw1rKF+TloZ26tm9GJFYYV
 ZJjwCFIlHKEXp3k7XlLIcnmsOuVzpPrWHwl5/ljNuS7z2kRGs9s8q+RWB
 gsp8hdwkjSmqcoAqET6l3awg783Brv58bnZ+iI/ayQYRcPywkmyACSzwv g==;
X-CSE-ConnectionGUID: CJ8vFS4xQQ28MdjDAfDOTw==
X-CSE-MsgGUID: x+ocDiDbQlSJGXg9Cqtqrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58927477"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="58927477"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 07:31:00 -0700
X-CSE-ConnectionGUID: 4mCJ9FTXT1G73TkShpc6nQ==
X-CSE-MsgGUID: zA1VMMHzQMqLjxkp1KT1UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="134790534"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.14])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 07:30:58 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Fix 32-bit
 compilation
Date: Tue, 29 Apr 2025 16:30:51 +0200
Message-ID: <20250429143051.36969-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

There is one more place which needs fixing of Xe test
compilation for 32-bit platforms, reported errors are:

../tests/intel/xe_exec_system_allocator.c:382:41: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  aligned_alloc_type.ptr = (void *)ALIGN((uint64_t)aligned_alloc_type.__ptr, alignment);
                                         ^
../tests/intel/xe_exec_system_allocator.c:382:27: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
  aligned_alloc_type.ptr = (void *)ALIGN((uint64_t)aligned_alloc_type.__ptr, alignment);
                           ^
cc1: some warnings being treated as errors

Fixes: 9eda33fedff7 ("tests/xe: Add system_allocator test")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index e1121a862..30b99f3ed 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -374,12 +374,15 @@ struct aligned_alloc_type {
 static struct aligned_alloc_type __aligned_alloc(size_t alignment, size_t size)
 {
 	struct aligned_alloc_type aligned_alloc_type;
+	uint64_t addr;
 
 	aligned_alloc_type.__ptr = mmap(NULL, alignment + size, PROT_NONE, MAP_PRIVATE |
 					MAP_ANONYMOUS, -1, 0);
 	igt_assert(aligned_alloc_type.__ptr != MAP_FAILED);
 
-	aligned_alloc_type.ptr = (void *)ALIGN((uint64_t)aligned_alloc_type.__ptr, alignment);
+	addr = to_user_pointer(aligned_alloc_type.__ptr);
+	addr = ALIGN(addr, (uint64_t)alignment);
+	aligned_alloc_type.ptr = from_user_pointer(addr);
 	aligned_alloc_type.size = size;
 	aligned_alloc_type.__size = size + alignment;
 
-- 
2.49.0

