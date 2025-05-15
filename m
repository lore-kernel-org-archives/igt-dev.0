Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808D5C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 19:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C5810E94E;
	Thu, 15 May 2025 19:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UP8uUGEH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6700C10E951
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 19:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747338781; x=1778874781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kcbp9Rr+pevoyG76CJRHPbhyDOZ30DhDAYI+6jpkGDg=;
 b=UP8uUGEHLuAApqmG9l6hfTfupPjEP50U9RUqsrq8N5HSBnTD4TpvArNQ
 cVYre2/oTsmP3DnsJDRS+uq41IdQSTS4RmFuOkUkLbkK2Nl1mPjqCWJPw
 2or42TweR9kAejUuMSwX/nALxhqtEr8NzY6xxufKRi7CDmwDFdpPeaETP
 HwWJKdsKuGV90oimhmPmXnfnia4M/1RlVVBhe6J2WGqOBchxP/RTqU0+O
 aFOYa2d8zn2WZJVa/igVFtrluGl3YJJElYNZPP6NtxQ9MohVGVZmt8JD9
 r1Hua62yyQZLwpnJ5GuDPtnxBt0q4FFhQ4Ny/51sfnU93bTC+kOB+MgMN g==;
X-CSE-ConnectionGUID: 4oZjANVNRHW0gVkC07IDFg==
X-CSE-MsgGUID: nSHdKQRkQKuEvb7CTDidZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49454492"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49454492"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 12:53:01 -0700
X-CSE-ConnectionGUID: oc38ihqtQguJZzMyiE1tEA==
X-CSE-MsgGUID: E3b0QVTrT3iwXGKiqwfLhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138347410"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 15 May 2025 12:52:58 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH 12/14] tests/intel/xe_create: Conditionally define PAGE_SIZE
 for non-Android platforms
Date: Thu, 15 May 2025 19:52:05 +0000
Message-ID: <20250515195207.106414-13-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
References: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
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

Ensure PAGE_SIZE is defined only if it is not already defined,
addressing compatibility with Android where PAGE_SIZE is predefined.

Note: PAGE_SIZE is defined in multiple files; a cleanup will be
addressed in a future patch series.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 tests/intel/xe_create.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index b22084c84..e8b8bb025 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -18,7 +18,9 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#ifndef PAGE_SIZE
 #define PAGE_SIZE 0x1000
+#endif
 
 static struct param {
 	unsigned int quantity;
-- 
2.34.1

