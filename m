Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0624BC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B60A10ED79;
	Thu, 21 Mar 2024 15:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7cpqlIh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B91210ED79
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035767; x=1742571767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wFzELWk1b1AUWtKJk+mBjnMTpSWkyX8JTT5F8oQwFxk=;
 b=d7cpqlIhXBEDFyouqsdzdfkmokprRP4Hz7FAxXQ+eNt+Yh3Lmdb2ETYu
 Fg+u8FX9zgSd/Idcwcbnayj+9BPzLT86WmeR/Qf5pT09mP/riLb0S/9bd
 ASGKIU+5ONptr/n+nhZ3bUPbS7glJ4tnrRSyd9IT7K64sYBFl9hh/sG88
 G8Yw8FLQs6pgpdDYBG+zrNIpT79oKyq0ngxS8blqjl8ewb+DGxkd9sMcx
 X/LHIgmyc94efwMpoBdHUpM9NXfOhkeGE1U4DruDuTXOgpjDQuUlnHM/7
 amElJiiNlI8AR+oX9t7u2RXi+XFxwetWjaDjWRH/Vd48hYbPPnCgULaZj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9837820"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="9837820"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="45660522"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:42:44 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 23/24] tests: Add missing documentation fields for
 SRIOV and Display
Date: Thu, 21 Mar 2024 15:38:46 +0000
Message-Id: <20240321153847.1787625-24-katarzyna.piecielska@intel.com>
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

