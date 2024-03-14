Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A96C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB5D10FBAD;
	Thu, 14 Mar 2024 14:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVPwwhnm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAA310FBAD
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710426961; x=1741962961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WWlKM6aY9Btc80pnltiGNy75tCnr+FcS+DaQGuVCSPE=;
 b=AVPwwhnmXts5X5kRH7ogPElpBO+dvQI7A7YkMaOJHeGnZorl+yzoXNdK
 gf1AKa9TSlWF91Njcze2FBUvbjEQex3UVbMmxkZAyUeyCZOX8E3uYISZQ
 Z/pVYlYJ4EMrGH9qh8wz5tih8flG83ZJmT+0b3CIqVU6zW72nAOvE8kkl
 rBgtLDJuvAFmR1l8ZquLV1haWLH4dZM9H39yv9FMOA3kgZiRwdBjS7qB4
 sRbDn8WK62D2AJgjIH3hpKqvo2FVKRHxBwWmfxSMX8zDJK6OU0nU1tfjc
 UjwXsAA0LnSx6jpoSMtY/AIdqLQD1wqtI+G6u7HG9OIybTEz57YcnUD5R g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16697589"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16697589"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12233788"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:36:00 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v4 05/25] tests/intel: Let's introduce Workarounds
 subcategory
Date: Thu, 14 Mar 2024 14:34:35 +0000
Message-Id: <20240314143455.1436688-6-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
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
 tests/intel/gem_workarounds.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index d83c0a1db..ddb9bddbe 100644
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
@@ -59,12 +59,12 @@
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

