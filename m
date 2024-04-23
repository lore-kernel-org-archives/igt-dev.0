Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F72C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 10:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB921132D1;
	Tue, 23 Apr 2024 10:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZpT+ih0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B80E10FBC7
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 10:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713869509; x=1745405509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxekVTwtpVMkPkEr9edVzakllVStSkKZVrU834FKs4o=;
 b=GZpT+ih0tQAWqV9Ip2XFqhQxiMwD1j6q7SLzKtwamQdSPrKO9Pcv3bca
 ssqg3DtSlt2CEqaXvO6zP8DD+Zmfj+fjB2Rl1i3dzkJWYEXvFXkxenepN
 p6XHyOhisiTpWjs3CHVk3Pvlkv9j9yahbKDed1BUUjhYR7lL/BiWeZiB8
 nmqqEShfoowhsilDhplUe2Lf0rToy92R/JWqswpf/xQxuNG5YUVV0tL8d
 unlnt0Jr+5seQWe6CusF4dlZiEBNDCmN55Eh9E0KxHcBguKxpABx2UI8v
 VFbwo5I+ufyiYCWhQ7bMiJH89OhqOdOD8cGwJdYpuTQbx0jweBskH/yJ/ Q==;
X-CSE-ConnectionGUID: RcnroaSnQbGvgaQWZMo0YA==
X-CSE-MsgGUID: fqYoG8DXTA270Rgzy/CyAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="31935774"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="31935774"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:51:49 -0700
X-CSE-ConnectionGUID: sX9KQYPSQsa6OemEjH6hEA==
X-CSE-MsgGUID: YZrBq8liQqqJfmvViIA1nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24339366"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:51:47 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v2 15/16] tests/intel: Introduce RAS Mega feature
Date: Tue, 23 Apr 2024 10:49:12 +0000
Message-Id: <20240423104913.3559587-16-katarzyna.piecielska@intel.com>
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

