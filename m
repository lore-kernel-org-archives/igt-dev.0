Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCF4C54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66548112E5C;
	Tue, 12 Mar 2024 14:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwwMoUh+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B96112E56
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252965; x=1741788965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gKIbXZSHk4Ke71TRbP4vvt4qXqJRMyEfJGlUeb5qfag=;
 b=QwwMoUh+49LEsVWHmcjaXBYfiW7HLPmj0M6M3Hf72gy7wWIFYnGLKwYO
 tDeEmLMTBNqP4k8bqZf555kqR66cw2+/Up1gSl32rpcLLPLOLEGGAEQzo
 HuXL/uV8y7jFlVtdjr9Xn+FqmZkrLpOWXgO45sASGm/VgVC/zl1WVEG0p
 oiUGODFxuas8oJhAWhfAusSSfcHiIqVCDpco2e5SXa6GqilpBW1fsyauJ
 9mmiK3nSyFEobqxBP5s/1q7+VK77ZeZqfPZMkT8RahI0sxwd7cmso1WQI
 d2itsacZ6BWMNqyh1u1aNYrJ3BzpL9WN2A1ecJ+NsWV4bmo85mMrbPG+6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5085622"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5085622"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11474715"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:15:26 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v3 06/25] tests/intel: Add tests to Compute subcategory
Date: Tue, 12 Mar 2024 14:14:00 +0000
Message-Id: <20240312141419.1277931-7-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
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

Let's add to Compute subcategory:
 - tests/intel/gem_compute.c
 - tests/intel/gem_vm_create.c

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_compute.c   | 2 +-
 tests/intel/gem_vm_create.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index 8d0214c4d..8bd9635ae 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Check compute-related functionality
  * Category: Hardware building block
- * Sub-category: compute
+ * Sub-category: Compute
  * Test category: functionality test
  * Run type: BAT
  */
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index 8834c987f..12503c0e5 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -30,10 +30,11 @@
 /**
  * TEST: gem vm create
  * Category: Server
- * Functionality: context management
- * Run type: FULL
+ * Functionality: context
  * Sub-category: Compute
+ * Feature: mapping
  * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: create-ext
  * Feature: mapping
-- 
2.34.1

