Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF9EC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD5E10EE1A;
	Tue, 26 Mar 2024 09:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkGF2qSA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9509810EE1A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445448; x=1742981448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QZdQkihFBK53Ut9gGDa3YyoH7S2vO3eHQST96ZZHRpI=;
 b=SkGF2qSAT5SKajBVQiu36ZFwa/eqzLpoTva5cl+q3O+vyn+XRyCDH75c
 WhAEyvx5/94vawxPu7OnPQt94g6gdNAyyhFutNBZCEZqjKIbI34neoGwz
 rlE7dgaIXy793m1CUivOa0dAFTNb3bqYQstIdv8MQdm2qYu7P0acsFRz1
 42g+gqxCxWTyJjsyP2LfNk9m7WypY42By98jscdzV1/2bZBvVJiOTWPnq
 X5LtGGniO+xJqMWcCkiwRrvjsbwybkP/Mb2puG10Jj10EHqQaZSbRiU8r
 eJYeYHW3uFOmapwOqz93QTP6ZDN2isNWIS5U8WBMnSO5cb5UsmDBFbGO1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10280028"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="10280028"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="47064764"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:45 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 10/13] tests/intel: Move xe_exec_queue_property to
 Sub-category uapi
Date: Tue, 26 Mar 2024 09:29:04 +0000
Message-Id: <20240326092907.1979345-11-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
References: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
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
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

