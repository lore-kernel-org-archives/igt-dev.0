Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23F2C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A2B10FBD1;
	Thu, 14 Mar 2024 14:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0iMGPbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9009F10FBD1
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710427129; x=1741963129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wFzELWk1b1AUWtKJk+mBjnMTpSWkyX8JTT5F8oQwFxk=;
 b=F0iMGPboE6YIYa5euCyxhokCnAc192lPU2ERrKpg4t8shEPf89QEF0vI
 PNmKlQj435bGz9yENuWC2EvEA/yvQGKZmbgJROtSofKCHjdH3KxXzFXMX
 flkkGDQmGkXJb9gsPFeljBYoOw3r9uK6JVPKvU9Ioy+xkiDozMP65F91x
 d5VJ2ABtxUfOcTw8gsR61LczwAiBX944VZ5h4cVIFRZk4T5hXtY3gwg/I
 7UN1+7mvL1mDhT3uRyshQ1JAIgf1uzuCxU2E2srhs03ypfnONbvowsAJ6
 bd5fiMHbi8Z1dAV9+R4giMmr/Cq7lZd/gossNk4Xz7Uggq7Cgf6Q2OVBb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="22706707"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="22706707"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="17036560"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:38:48 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 23/25] tests: Add missing documentation fields for
 SRIOV and Display
Date: Thu, 14 Mar 2024 14:34:53 +0000
Message-Id: <20240314143455.1436688-24-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
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

Add missing documentation fields for:

 tests/intel/i915_pipe_stress.c - add Category, Sub-category, Functionality to
KMS test
 tests/sriov_basic.c - add missing functionality

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/i915_pipe_stress.c | 11 ++++++++---
 tests/sriov_basic.c            |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
index 79f83d266..a487f70de 100644
--- a/tests/intel/i915_pipe_stress.c
+++ b/tests/intel/i915_pipe_stress.c
@@ -20,9 +20,14 @@
 #include "i915/gem.h"
 /**
  * TEST: i915 pipe stress
- * Description:
- *   Stress test how gpu and cpu behaves if maximum amount of planes, cpu and gpu utilization is
- *   achieved in order to reveal possible bandwidth/watermark and similar problems.
+ * Category: Display
+ * Description: Stress test how gpu and cpu behaves if maximum amount of
+ *              planes, cpu and gpu utilization is achieved in order to reveal
+ *              possible bandwidth/watermark and similar problems.
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Sub-category: Display
+ * Test category: stress test
  * Run type: FULL
  *
  * SUBTEST: stress-xrgb8888-untiled
diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index bc7c09e1c..b2b63c702 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -14,6 +14,7 @@ IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
  * Category: Software building block
  * Mega feature: SR-IOV
  * Sub-category: VFs enabling
+ * Functionality: configure / enable VFs
  * Description: Validate SR-IOV VFs enabling
  */
 
-- 
2.34.1

