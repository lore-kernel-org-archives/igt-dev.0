Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D84BC5B542
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 22:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D401510E0D0;
	Tue, 27 May 2025 22:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hF5y+0St";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB3D10E546
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 21:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748383200; x=1779919200;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2bxE2lQReaRSQcRmFaYOtbX7rdaud8ZXQWZ+GG5CYyc=;
 b=hF5y+0St6U980dRtBszCGxu15CqW3TmGZDJFX8iBu6I7IU1kRpRE1+Ya
 muHq2yl4sGQRLdS4PbM40HvTaWUfYTfE/cKpBllV6mNCZhhawktzvGiE2
 cmMAjAarkPejBxmagOqarGPUl0s9VUIL4dvVbTVAeByaXtiXP2mZNHht9
 Cts56D3ubJcgjmev10d66sY8rpf9/V3/pu9ulqRH7plK6M/Vp2juzKMLv
 1vpshz8ByhfAnGU/X5ZNETvQF+mO46KgizYxUQRWRT9X5/E4GM82wSQ0S
 HJ59gYNDAWwJ1v+gVwbaRlWv0R4KB/CsOMSKah9lnJR8kQ/d1xi+7xzNk A==;
X-CSE-ConnectionGUID: y+Wa7ySFQ1iMgjPMyZ4wXw==
X-CSE-MsgGUID: L1cxUb4nR1aMHTm5SaL8HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61053202"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="61053202"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 14:59:57 -0700
X-CSE-ConnectionGUID: tynd2E3gTJqPpAQYery17w==
X-CSE-MsgGUID: h8W+0RHCSaSSlpayvFgZJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="143338164"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 27 May 2025 14:59:56 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>, Alex Zuo <alex.zuo@intel.com>
Subject: [PATCH] tests/intel/xe_vm: Fix assertion on the return value of mmap
Date: Tue, 27 May 2025 21:59:15 +0000
Message-Id: <20250527215915.395919-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

The return value of mmap is stored in map, so the assertion should
use map instead of data.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Alex Zuo <alex.zuo@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 5cbd56037..b5bba7b7e 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1846,7 +1846,7 @@ try_again_after_invalidate:
 		map = mmap(from_user_pointer(addr), bo_size, PROT_READ |
 			    PROT_WRITE, MAP_SHARED | MAP_FIXED |
 			    MAP_ANONYMOUS, -1, 0);
-		igt_assert(data != MAP_FAILED);
+		igt_assert(map != MAP_FAILED);
 		goto try_again_after_invalidate;
 	}
 
-- 
2.25.1

