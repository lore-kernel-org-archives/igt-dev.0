Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A193C25B75
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 10:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BC610E645;
	Mon, 13 May 2024 10:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHqgF7DX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EB510E645
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715597485; x=1747133485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxekVTwtpVMkPkEr9edVzakllVStSkKZVrU834FKs4o=;
 b=WHqgF7DXpuvXD0YOfzgVHocSp8QjHcmZXf9qEvxmrJc9irMpRX0ODbrK
 OVi8cFYD0w1E8zXew50fKu1bTjMQMBe9eiOI8rQDeTQSqpyiSP+TOro6x
 kM/qj8WukAXiVMbSM+jiJp6+JBD9dWOEzoOMCnNhPQ1DAkDVq5G2ioFcq
 9nhMjnAwPNzOd2OAw5ZKStLMc9tf5q4lVela16DsKIzqGCaAfsGKvBzJV
 fNvjEObTTXWuYObj3XiijdtxEexc6rQNbLtaM/4n9dOTUIijDFxoH4CNk
 mGDeZiAS3Tdl2IjqWgtwIdlyCH+5VE4wnnbS923IeOvJ6n2VWXAkrT9vh w==;
X-CSE-ConnectionGUID: WvV3aegJSLyudaRwMUHkGA==
X-CSE-MsgGUID: ynarTStDRcGXAenIqKEkgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22193344"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22193344"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:51:24 -0700
X-CSE-ConnectionGUID: +lIlO7wSTKOCzYCC+eBElg==
X-CSE-MsgGUID: gpPmnokEQp6GtaL/wf5/uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34994774"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:51:22 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v3 15/16] tests/intel: Introduce RAS Mega feature
Date: Mon, 13 May 2024 10:48:45 +0000
Message-Id: <20240513104846.362332-16-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
References: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
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

Add mega feature to RAS tests.
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
 tests/intel/intel_hwmon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index 7c6ee0100..448f780d4 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -12,7 +12,8 @@
  * TEST: intel hwmon
  * Description: Tests for intel hwmon
  * Category: Software Building Block
- * Sub-category: RAS
+ * Mega feature: RAS
+ * Sub-category: RAS tests
  * Functionality: hwmon
  * Test category: functionality
  *
-- 
2.34.1

