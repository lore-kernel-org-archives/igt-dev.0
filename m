Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9D3CD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F9310EE15;
	Tue, 26 Mar 2024 09:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8H9x8G9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C7510EE15
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445431; x=1742981431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RHyL3Ri+gnkHsfWvmmx3iy42EICJEZkrcK0WGpMJSYg=;
 b=H8H9x8G9uXWme57uPKp5vtV5IbULIboHMue8bwfFvKwgLSPC8oEhv0Jd
 ovVm98f9V08JpUtTiQC7MF2vl4eFpC2ylnaRXmxaX+7sWcbIMQ9gIN8r7
 xyTSWiAP0+lk0n7XQqdM3gMTYPem0kePiSdkvVfuGBBrEQ+wOmD5XKimF
 5fNBmly6XWExW8e2BTMXn/Y9FxgKiwQQ14kN960WJTIvxetw7pBNRVihZ
 oBRxjbSoSrI5z1ClGhDF8YXy0na6RhVJ4gvM6tfKSnveHKm1nqJHdOfNK
 AzoGa1ZjOKksQ78L9lqGqPahngSlHyHFwiihz3EJN0sgvuSpc4bjpE4ho w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10279956"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="10279956"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="47064561"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:27 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 08/13] tests/intel: Move xe_mmap to Memory management
 Sub-category
Date: Tue, 26 Mar 2024 09:29:02 +0000
Message-Id: <20240326092907.1979345-9-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
References: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
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

It looks like Memory management is more suitable Sub-category for
xe_mmap test.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index e96192d23..dcd36a50d 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Test if the driver is capable of doing mmap on different memory regions
  * Category: Software building block
- * Sub-category: VMA
+ * Sub-category: Memory management
  * Functionality: mmap
  */
 
-- 
2.34.1

