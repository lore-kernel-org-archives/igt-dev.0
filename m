Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F124CD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D899A10F0BC;
	Thu, 11 Apr 2024 13:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AyCe6BRC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DE610F0BA
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712841396; x=1744377396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xR3/XESXjGWzm4AlpHznyaprDT90HWRRDU1Yfg3Tjps=;
 b=AyCe6BRCGGoXhHnTsI77yw7vpGHjZPfOsLhaF/4egA5vH0ScaDhw7Jql
 K+K6qoJd86nAuQpPY6Fuz4+B0prS0l22IWuP1YKTz908KDbUep5Xarg2w
 zNGxCctE/CbxeAh8XzJ1YJC60a0mcRVF0Ju7JRTPeHKoWHmqYs5mKovQN
 kKikwzs9xqPnJF3dHRdkOloDOZ70soSerXa2IHQ8b8QYE965m6OlYwb3f
 EZwnjcPsbLQLtxhX9CdkxwuIjitH4ImyMnJonhTbO/Raegp9R1mSWG0F5
 tALXijhrPed/QMzb6SgH/3fQWX3OtYNYH1uAktAhm1ht1qKYpmlunI40u w==;
X-CSE-ConnectionGUID: LQVCoT13Teqo+nKjU2KAmQ==
X-CSE-MsgGUID: 6B60qcStRuKEqzdKLBg+2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25760731"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25760731"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:16:25 -0700
X-CSE-ConnectionGUID: RZGYnfOqRY2a5hoAVajxFQ==
X-CSE-MsgGUID: yprvokbnROOaz5v1n+x/1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21486903"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:16:23 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 2/5] tests/intel: Remove name collision in Display
 tests visible in Core docs
Date: Thu, 11 Apr 2024 13:15:51 +0000
Message-Id: <20240411131554.2999053-3-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411131554.2999053-1-katarzyna.piecielska@intel.com>
References: <20240411131554.2999053-1-katarzyna.piecielska@intel.com>
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

Display team is not using Subcategory field, but this test is
visible in Core documentation. Let's remove name collision in
Category, Subcategory and Functionality.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/i915_pipe_stress.c | 2 +-
 tests/intel/prime_mmap_kms.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
index 6c5e951ab..de4df830f 100644
--- a/tests/intel/i915_pipe_stress.c
+++ b/tests/intel/i915_pipe_stress.c
@@ -26,7 +26,7 @@
  *              possible bandwidth/watermark and similar problems.
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Sub-category: Display
+ * Sub-category: Display Tests
  * Test category: stress test
  *
  * SUBTEST: stress-xrgb8888-untiled
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index 35d1eedde..7759b9469 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -41,7 +41,7 @@ IGT_TEST_DESCRIPTION(
  * TEST: prime mmap kms
  * Category: Infrastructure
  * Feature: prime
- * Functionality: memory management
+ * Functionality: prime
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
-- 
2.34.1

