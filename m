Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB85C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BA710ED0E;
	Thu, 21 Mar 2024 15:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYIa3T0e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5281D10ED1D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035645; x=1742571645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+0D+x4+VM9EleBAcz2fsefGdG705TKAIGnufG+vGkhI=;
 b=hYIa3T0eIYdTJLQsWfTkwM8JZzQDs907Sti2342IHVnXdpBTIbBHtknG
 jZceZ7X64Lda8cUqmgofT0ptxZcZucMvqXEwBFeykdPqE8q+AxowAdEXt
 X+kx73ws+wqD2GTWXPFCcL5v8i/o/ZS2lFswm2inzq9WF8FKFvx8ZbFG5
 /EiBYP/1Jge6nWbhoalU9DfxaJpnD5PZj/5t4Uy/8H4aAnNVACUsyAOsr
 1DEKZ5IOhlOS4aVTny3mCHwi0FU8XGDx/qkQEJTKQFioXfcVqdbr6H0Vt
 V42BZpVjQMRcRx0YEfPpdcjRiEWrKD4h9hkZzMErVRaAq4B1Bjp0wVrsy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23527502"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="23527502"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:40:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="45538590"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:40:43 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Antonio Argenziano <antonio.argenziano@intel.com>,
 Tony Ye <tony.ye@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 10/24] tests/intel: Introduce Firmware subcategory
Date: Thu, 21 Mar 2024 15:38:33 +0000
Message-Id: <20240321153847.1787625-11-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
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
v3: Make Sub-category/Functionality/Feature unique values. (Kamil)
v4: change functionality name s/HUC/huc copy/

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_huc_copy.c  |  5 ++++-
 tests/intel/i915_selftest.c | 12 ++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
index 246fa0a8b..a5b891247 100644
--- a/tests/intel/gem_huc_copy.c
+++ b/tests/intel/gem_huc_copy.c
@@ -38,7 +38,10 @@
 /**
  * TEST: gem huc copy
  * Description: A very simple workload for the HuC.
- * Feature: huc
+ * Feature: firmware feature
+ * Sub-category: Firmware
+ * Category: Desktop client
+ * Functionality: huc copy
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

