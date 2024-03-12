Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102D5C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62C3112E5C;
	Tue, 12 Mar 2024 14:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KIOEVFTV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A77D112E5F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252991; x=1741788991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HS7qF87pQ2XQoHx03MKQLGAIvphgrK4A9t548P7G5CM=;
 b=KIOEVFTVQsIqxW9WOHwHww+OH8v7mw5hzPqmGxOjzfOzngZWD6ew6RkI
 NmhMlfL8Z8a6YD5R8FklAyGdbb55mQXkbrDq3uI33ylbEHAK8RIvi0B8T
 Ufr5AlY8JG0Sp5DryiipzuyG+PhabculqxFMTwAkoUm5pOvWmCdSQgIKR
 9ahCl8XLlAzgCnmQPMOSN9wmIrkxOpMFjzaqgK9U8smxWpj+lVZySs4+2
 QqeYdmnBfMFkwwFISEGn1O0thQise6i4ZycMBmpR0GSx1lOnjrAIOxRqN
 M1KXv5HM/6Z/NY9YrsAXK+jkwa7rTdXMh92OaSf/X8I4it2VOQ7chE/FO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5133484"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5133484"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:16:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11522120"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:16:11 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Antonio Argenziano <antonio.argenziano@intel.com>,
 Feng Qi <feng.qi@intel.com>, Tony Ye <tony.ye@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 11/25] tests/intel: Introduce Firmware subcategory
Date: Tue, 12 Mar 2024 14:14:05 +0000
Message-Id: <20240312141419.1277931-12-katarzyna.piecielska@intel.com>
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

