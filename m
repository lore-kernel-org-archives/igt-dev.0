Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2177C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5200A10F63B;
	Fri,  8 Mar 2024 08:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hG3Jr/V/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55AD10F63B
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887145; x=1741423145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/0SAuUj4g07ufI+TWESdTrcW/tKM6IsTKQi2dW1WUhA=;
 b=hG3Jr/V/iuWtuyhoxZWd8kaJhNf0yEYacKLEC8imDCR+OyJkWyGyumVV
 TFakewFA5Bb9kERHSkBFEcbHlLAPf2fOM1s6u8of/q6QenFnpVwZBoUmv
 XG9+jAAOZYAcQrid2mnBqGUUQKka13zhEEOdcmVOkIfNqMrX8ElNPazf8
 verEfzTBTEGLioClS9mA8G9BQjuO9w781MTk8duyZZDmWEyLc/tIIkthu
 GX/t3yIEevuE+ZhIco9dl4ESsRVeQrFLBGKiUhB4sp2j4Q3QmUZzxjnno
 eyu6Fl33hVQgrgAv4xRPht0OB5Puk/PH7VJ6Ixg0lpZnwQwsz2SZ68pGI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4737180"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4737180"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:39:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10808433"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:39:02 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Antonio Argenziano <antonio.argenziano@intel.com>,
 Feng Qi <feng.qi@intel.com>, Tony Ye <tony.ye@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 11/25] tests/intel: Introduce Firmware subcategory
Date: Fri,  8 Mar 2024 08:36:43 +0000
Message-Id: <20240308083657.1092049-12-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
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

Let's put huc & guc tests under Firmware subcategory.

v2: Let's introduce Firmware subcategory and put there GUC and HUC related
tests.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Feng Qi <feng.qi@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_huc_copy.c  |  3 +++
 tests/intel/i915_selftest.c | 12 ++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
index 246fa0a8b..e0e16aa58 100644
--- a/tests/intel/gem_huc_copy.c
+++ b/tests/intel/gem_huc_copy.c
@@ -39,6 +39,9 @@
  * TEST: gem huc copy
  * Description: A very simple workload for the HuC.
  * Feature: huc
+ * Sub-category: Firmware
+ * Category: Desktop client
+ * Functionality: HUC
  * Run type: BAT
  *
  * SUBTEST: huc-copy
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index bb0e844e9..2c5f6bce2 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -192,25 +192,29 @@
  * SUBTEST: live@guc
  * Category: Selftest
  * Feature: GuC
- * Functionality: Guc specific selftests
+ * Sub-category: Firmware
+ * Functionality: GUC
  * Test category: GuC
  *
  * SUBTEST: live@guc_doorbells
  * Category: Selftest
  * Feature: GuC
- * Functionality: Guc specific selftests
+ * Sub-category: Firmware
+ * Functionality: GUC
  * Test category: GuC
  *
  * SUBTEST: live@guc_hang
  * Category: Selftest
  * Feature: GuC
- * Functionality: Guc specific selftests
+ * Sub-category: Firmware
+ * Functionality: GUC
  * Test category: GuC
  *
  * SUBTEST: live@guc_multi_lrc
  * Category: Selftest
  * Feature: GuC
- * Functionality: Guc specific selftests
+ * Sub-category: Firmware
+ * Functionality: GUC
  * Test category: GuC
  *
  * SUBTEST: live@hangcheck
-- 
2.34.1

