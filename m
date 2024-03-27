Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A19C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0164F10FCF4;
	Wed, 27 Mar 2024 12:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fE7d7sVP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C05F10FCF4
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542610; x=1743078610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxekVTwtpVMkPkEr9edVzakllVStSkKZVrU834FKs4o=;
 b=fE7d7sVPcZDk+A2ZPbLgwjYL4aszxcOMpmxl5FM/UxM6QLwN2dc4Hc+B
 9fhIT3Lc+wdYvQT8FkJgfGwlev9ZQTYu1RG5EEoxhQ2QKDHYtIWhBzXkP
 BU3NKcBesicvn8z6v8z5+3bvMYGvDpImBAkU0C1/WFyoFycqJodFQ4CV/
 Rpz+BiKEjSOCHxMmJNp4f6KKwvS8ykdOBKBqNXd2s8QiYxKZNRZ2izu1/
 K0LlQnuPO0gqF8eWmxxOHTbLgvS4J33JtAmCr2ZZQ+XreaUthGd/Xm7zu
 IBrbz4KmKdC/qba/ZR/mcPXlxU74HjBKJ1h6ULzunGVga8lc6mJy5KRY3 w==;
X-CSE-ConnectionGUID: 0iHUEQeDSLiF2hW8SV7zTg==
X-CSE-MsgGUID: VMkABZbxTquM4opLGMHugQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17781561"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="17781561"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="20982533"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:30:06 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 15/16] tests/intel: Introduce RAS mega feature
Date: Wed, 27 Mar 2024 12:27:30 +0000
Message-Id: <20240327122731.2104614-16-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
References: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
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

