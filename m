Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995E5C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3496810E728;
	Tue, 12 Mar 2024 14:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OUxDQyn2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763DA10F165
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710253081; x=1741789081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wFzELWk1b1AUWtKJk+mBjnMTpSWkyX8JTT5F8oQwFxk=;
 b=OUxDQyn2/vVUa1ECEpMPhaWlThdua2zVEev1H4OMsELlGErZDkCn5prF
 duLPttDnCTD20FQCaxgKHuQIsm95+zXBeTKSM7o54BKdOUg3U/WZWQjG2
 bSxga7zyJCuQdthC1txjHvLiwO2Dqj3UQYls/sllT3PQVSUvb7vJdJo/d
 OpSzd0zwl4xNQ+4QbLACpLmfPoDN+owg/40qV5vnSX8vP38x5tdO93psc
 T3zs7u/DASETzRjVAxBtkV0TfBSC0yc7ZW0cm0ON50durEa8lx8BNXP7y
 M8GvAV6QTW8w9WXb1kypVay8+sQPvxDAeVKkhY9x3lT5fCf/V34kjs2ar Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="7909609"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="7909609"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11459615"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:17:59 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 23/25] tests: Add missing documentation fields for
 SRIOV and Display
Date: Tue, 12 Mar 2024 14:14:17 +0000
Message-Id: <20240312141419.1277931-24-katarzyna.piecielska@intel.com>
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

