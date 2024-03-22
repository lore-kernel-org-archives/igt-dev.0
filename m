Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E993C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AC510F820;
	Fri, 22 Mar 2024 12:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZ1T4ODD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C48F10F820
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711111375; x=1742647375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PR0HYDyiFp/tfrOlcimwQg71/VpSOYh03JqUkG8LQ94=;
 b=WZ1T4ODDrcMX9ft/4oCJ5JD7jfUlzTDetE7W1TXpOsFRSugMvkzw2dRA
 6MwMagddN1FbOL5qpd8AES7rsXHBMAfSq1aX5evEihRNEuaLt1l5tpgOP
 3BWUnlxTb6WAgaSz95Nsh5HzZ9Q132JVFEqmSnB/EcQTnURQsXJFlmR5h
 balvknfHJRNlT+HhxXbULCbN890zVft2pusY9hjBFpwjCfbeSId7+AsHI
 EtIp6+WCg8p3GVnc1lkXtDsEdmkG1SOt21p79Me1Yr3Pg/ZuPNfksgmxi
 CTA05cT9XMAo7AiZcvslHFxodw//e/P9g6npkNXoYPNGzqMdIn69mLK5q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23645163"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="23645163"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="14994429"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:53 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 09/12] tests/intel: Move xe_exec_queue_property to
 Sub-category uapi
Date: Fri, 22 Mar 2024 12:41:05 +0000
Message-Id: <20240322124108.1825345-11-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
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

Let's move xe_exec_queue_property to Sub-category uapi to align with
i915 test documentation.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/intel/xe_exec_queue_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index b1cdc7ffe..51ecd725d 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Basic tests to check exec_queue set/get property functionality
  * Category: Software building block
- * Sub-category: exec queue property
+ * Sub-category: uapi
  * Functionality: exec queue set property
  * Test category: functionality test
  * SUBTEST: priority-set-property
-- 
2.34.1

