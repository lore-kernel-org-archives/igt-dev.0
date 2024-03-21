Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8410EC54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72F110ECCE;
	Thu, 21 Mar 2024 15:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QFjae1EP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D4610ECC4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035587; x=1742571587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rIz2XDocHK9C3HSMCuJ7jUBhSNUaPPXSSGu1FopILjw=;
 b=QFjae1EPniZQvx/ImJFuxNr7j7slonOo49PWzA6ONnASILXy8TDgP20v
 Ha/CbDk0q2oEOdC5rQ7fSWGYPkoC53afcY7egynmOU8yusFOU0qHJNVWo
 OxvMBvF2QwV8QkFZANGyww62lKzKpUoEWyMjib6dcjWEL3LMEEcylQ1b7
 NyHblTNCifGVAtIWO/c4L9TxDaiJGGkZM6iS+Ml2IVcA2pJSBjpWSAZgk
 UBOxMsje7Il1B+Z67W7VD/LOf9ci+sFEiY9sQp5PqCOHLikdRrSNCCx4l
 dlpR7QSZ8PaoKghjOhmwdmyZYY78qrXiFF3u527CnlOFAIK/aGLXr9f99 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6146365"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6146365"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19266807"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:39:45 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v5 04/24] tests/intel: Let's introduce Workarounds
 subcategory
Date: Thu, 21 Mar 2024 15:38:27 +0000
Message-Id: <20240321153847.1787625-5-katarzyna.piecielska@intel.com>
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

There is gem_workaround test that deserves it's own subcategory.

v2: Make Sub-category/Functionality/Feature unique values (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_workarounds.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index d83c0a1db..682fc3163 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -35,9 +35,9 @@
 /**
  * TEST: gem workarounds
  * Category: Infrastructure
- * Feature: workarounds
- * Functionality: workarounds
- * Sub-category: Context
+ * Feature: workaround
+ * Functionality: context
+ * Sub-category: Workarounds
  * Test category: GEM_Legacy
  * Run type: FULL
  *
@@ -45,11 +45,14 @@
  * SUBTEST: basic-read-context
  * SUBTEST: basic-read-fd
  * SUBTEST: hibernate-resume
- * Feature: hibernate, workarounds
+ * Feature: hibernate, workaround
+ *
  * SUBTEST: hibernate-resume-context
- * Feature: hibernate, workarounds
+ * Feature: hibernate, workaround
+ *
  * SUBTEST: hibernate-resume-fd
- * Feature: hibernate, workarounds
+ * Feature: hibernate, workaround
+ *
  * SUBTEST: reset
  * SUBTEST: reset-context
  * SUBTEST: reset-fd
@@ -59,12 +62,12 @@
  *
  * SUBTEST: suspend-resume-context
  * Description: Test to verify gem WA registers during suspend-resume
- * Feature: suspend, workarounds
+ * Feature: suspend, workaround
  * Test category: suspend
  *
  * SUBTEST: suspend-resume-fd
  * Description: Test to verify gem WA registers during suspend-resume
- * Feature: suspend, workarounds
+ * Feature: suspend, workaround
  * Test category: suspend
  */
 
-- 
2.34.1

