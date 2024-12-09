Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9B5E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 08:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD73C10E4AD;
	Mon,  9 Dec 2024 08:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6c/DWwt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A766210E4AD
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 08:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733731565; x=1765267565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FDSURYNGkKLMW8qOjq/IkblVKbWDR9XUIeHp3rfj0K8=;
 b=m6c/DWwtu0ojl33rMNVGhWnGL58294m7hm/wvxhJeltcY1bkC4DlOtOZ
 Vz3GZHLofCmzGCezyepr9E8JQ14XGyhSqx/141mClkJMIAuuucVDA3EEp
 IJpMNi4QkUcrfWbXnhRqchJrefWC4taczPtQJ2E0sLEbPxPv7tTDL3bSP
 r5QeHeOfFR5K+2PzapzTnhGN2CzVww/8Ho6u65rR6MpL2/L1m040w8aQM
 aiGMh8iX/YRnUVNSDCNZJDyp9DOYfoyWGGu0yJLkqoEsVNb1F5KA9Ssli
 4MkBEdB3AHp6JfhraAIdGE8sPkppETqRZ7biFcr0cBa5q2yEJHxV8RcyU g==;
X-CSE-ConnectionGUID: b8Crqj2SRp+LstKmnfFrPg==
X-CSE-MsgGUID: 8IDkmWjBTKGkM2z6Hnl1qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="56495714"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="56495714"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:06:05 -0800
X-CSE-ConnectionGUID: oW51LdXwRRSuuuQjTY1UwQ==
X-CSE-MsgGUID: knYAqUtgQx6+48LW/COcrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="99952456"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.211.135.227])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:06:04 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel: Adjust test documentation to given
 standard
Date: Mon,  9 Dec 2024 08:05:46 +0000
Message-Id: <20241209080546.557032-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209080546.557032-1-katarzyna.piecielska@intel.com>
References: <20241209080546.557032-1-katarzyna.piecielska@intel.com>
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

Change Category for:
 * tests/intel/xe_exec_sip.c
 * tests/intel/xe_tlb.c

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_sip.c | 8 ++++----
 tests/intel/xe_tlb.c      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 91c8df161..062b80a08 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -5,12 +5,12 @@
 
 /**
  * TEST: Tests for GPGPU shader and system routine (SIP) execution
- * Category: Software building block
- * Description: Exercise interaction between GPGPU shader and system routine
- *              (SIP), which should handle exceptions raised on Execution Unit.
- * Functionality: system routine
+ * Category: Core
  * Mega feature: Compute
  * Sub-category: GPGPU tests
+ * Functionality: system routine
+ * Description: Exercise interaction between GPGPU shader and system routine
+ *              (SIP), which should handle exceptions raised on Execution Unit.
  * Test category: functionality test
  */
 
diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
index 8104e45d8..9b920fe8a 100644
--- a/tests/intel/xe_tlb.c
+++ b/tests/intel/xe_tlb.c
@@ -15,7 +15,7 @@
 
 /**
  * TEST: Check Translation Lookaside Buffer Invalidation.
- * Category: Software building block
+ * Category: Core
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: TLB invalidate
-- 
2.34.1

