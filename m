Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB30C54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 14:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB5C10EDA7;
	Thu, 22 May 2025 14:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3U7bhoh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4353310ED66
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 14:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747924497; x=1779460497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h/ys446EhI39GuzL/M5IKwa91/NKhwLF+irBH034zhY=;
 b=L3U7bhohSri1QsWhFLFiATWYvzgSHmOxss/EgKkIvDL0bD9r6BXqEv6N
 U6Af/ia0QSuJPQlSEuQzTdVcJcjFxVODMCS2Bv5yGQPlY+FERN+6BgPyl
 Tl+Knm/yo1OAPgjXvmo8UtUuzLcoW/+BO4LM6qcCup/cuy5CXQSZ6TuTP
 ItVr7LLeGLpY07WDezsqHO2usdDZRYKnYHhn5MfIfrxBhZymYC6MOV4rd
 5j4IgYWuNMR01m0tIVeLRazSdTTaOH5c0TBbM0j2dqd83ieQxG9PCqubJ
 H86DFCOHwVTmHnHJebqsw5Fb1eFcOHxVD5gxyEWhSeAXKoTbRkTKUNDMA g==;
X-CSE-ConnectionGUID: WGDZCaMcQFGWIhuMnm3zSQ==
X-CSE-MsgGUID: 1hUdwt4zQEe7pSVrLrehCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75351202"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="75351202"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:34:57 -0700
X-CSE-ConnectionGUID: CBfOf2IKRnCDBAz1s1pOEg==
X-CSE-MsgGUID: hoOdbQ2LQA6w9W0+AF5p6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="140495565"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 22 May 2025 07:34:55 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v10 6/7] tests/intel/xe_create: Conditionally define
 PAGE_SIZE for non-Android platforms
Date: Thu, 22 May 2025 14:34:18 +0000
Message-ID: <20250522143419.28888-7-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
References: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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
2.49.0

