Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A915C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 10:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3387010FBC3;
	Tue, 23 Apr 2024 10:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXGufT3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF71710FBC3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713869519; x=1745405519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NvqpTx8x6DB35I86wFhM6bAy8RMy13VS0TbLe0r7r0Y=;
 b=DXGufT3obKKaao06T9RUCgIkjD/ULJskRFTjDImhWKG9cciw5xEzsE12
 eUaaxmtp3ji1hFv4ms1vjgwtxgUnqZlN9nLLHEvm8MIrg8QGKPLQaelS5
 uafMdaKWXE5oj9ust+W2pmE4SzOwcybHIcS0+Zn+Zz1H8JskqN17lRJIn
 Vdd7wwyf/l8JdZykYygVgaRd6v7tXU4Ka3o3TQt/tgUudW9AQ4mqXMBJJ
 FWyqZCUqWARPVkJ1qTJoAF62mlVWrioOqyKtPVyEpYv8nlBcjhVWejUpQ
 YRENLGe7HUcocOOQULHFNH5xqa+JnyITwZJpMm/uioG2AskN4gIEj0QfW Q==;
X-CSE-ConnectionGUID: l7eCq834T4eOKPSwcA6LzA==
X-CSE-MsgGUID: v7IqxbJ1QR2zbzQQKb6vug==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="31935786"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="31935786"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:51:58 -0700
X-CSE-ConnectionGUID: YxrHQ9xLQ/umoiOTLgH+gA==
X-CSE-MsgGUID: KNSYsdXSSbme6wUjsKaEVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24339431"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:51:57 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v2 16/16] tests/intel: Add display tests to General
 Display Features
Date: Tue, 23 Apr 2024 10:49:13 +0000
Message-Id: <20240423104913.3559587-17-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
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

Add display tests to General Display Features.
Group:
	SUBTEST
	Description
	Category
	Mega feature
	Sub-category
	Functionality

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/intel/i915_pipe_stress.c | 4 ++--
 tests/intel/i915_selftest.c    | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
index de4df830f..203eb46a3 100644
--- a/tests/intel/i915_pipe_stress.c
+++ b/tests/intel/i915_pipe_stress.c
@@ -20,13 +20,13 @@
 #include "i915/gem.h"
 /**
  * TEST: i915 pipe stress
- * Category: Display
  * Description: Stress test how gpu and cpu behaves if maximum amount of
  *              planes, cpu and gpu utilization is achieved in order to reveal
  *              possible bandwidth/watermark and similar problems.
- * Functionality: kms_core
+ * Category: Display
  * Mega feature: General Display Features
  * Sub-category: Display Tests
+ * Functionality: kms_core
  * Test category: stress test
  *
  * SUBTEST: stress-xrgb8888-untiled
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index a5e5059bf..5f0bd30b8 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -74,9 +74,10 @@
  *
  * SUBTEST: live@display
  * Category: Selftest
+ * Mega feature: General Display Features
+ * Sub-category: Display tests
  * Functionality: display sanity
  * Test category: i915
- * Sub-category: Display tests
  *
  * SUBTEST: live@dmabuf
  * Category: Selftest
-- 
2.34.1

