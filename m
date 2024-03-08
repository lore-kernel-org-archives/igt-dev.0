Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DB9C54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613C3113668;
	Fri,  8 Mar 2024 08:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kK+6A8zx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D25113611
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887107; x=1741423107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXBQH/WCwlqcgfe6/YaUxA7AWqzChclOjAvExIeinIU=;
 b=kK+6A8zxwEUQFbBFC1DFc+nZBGWQzNhYtfHw/9ZEXswUTsx3s6VlgMAg
 HAsa1QD48FWILXcVZMYFtgU6LkdelmCwryFqkembbdin5KMBK5mCWnjnR
 oxaHsLOG+hjoCGQEF3Ne/PyZCgDM2kJYd+Gq4KymhMSHLNxPK/xBdKpGN
 XCUaQ7khoPjLM/9yNuhNWGW8z29FMenx/VpXqWv/nUjA7TNeL06Etqg+5
 1sJiPdrrh/0fjjxn96K0aEBbypHkSc1GdqDdZRpsr0GwqoZPh4kFveqQ1
 fU/UYKd6YJjlrgsnumLEFg2lsgBH+458A08OkOu1c4Vaweg7TNHH4p+Fj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22122237"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="22122237"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="14956828"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:38:26 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v2 07/25] tests/intel: Introduce GPGPU subcategory
Date: Fri,  8 Mar 2024 08:36:39 +0000
Message-Id: <20240308083657.1092049-8-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
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

Let's introduce GPGPU subcategory.

v2: functionality s/gpgpu/gpgpu_fill/ to not trouble automation tools

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_gpgpu_fill.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index ac283620e..3a6d66b35 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -51,13 +51,13 @@
 /**
  * TEST: gem gpgpu fill
  * Category: Server
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: Compute
+ * Functionality: gpgpu_fill
+ * Sub-category: GPGPU
  * Test category: GEM_Legacy
+ * Feature: compute
+ * Run type: FULL
  *
  * SUBTEST: basic
- * Feature: compute
  */
 
 #define WIDTH 64
-- 
2.34.1

