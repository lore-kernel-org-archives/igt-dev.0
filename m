Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3E6C54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7225E10FBCB;
	Thu, 14 Mar 2024 14:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqSd94Y1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018F110FBC9
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710427103; x=1741963103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OJ/9TrQoHcrr1Zdiha/iRuGx/t0PC+1SfB0Xg/PGoSo=;
 b=bqSd94Y1LCiU5qvpx2yRBu8mmPdao7fjpPhbHuJQDqF6ZWJGE73ajTUy
 d2KewKcfryZbqWk9MUguzbb89JZaAccGKAIR2FsKEYzs6jt/xur4w/LCK
 5oEvSWOcKfToQDgWCzE0BpHleIxyBJSeUsUbvddPObxQK6Touc0FGx6w8
 yXxZKFBhIkKm4fJEOYtON9DzJqDBcCLtqnip8mEdn7NQY+FK+FRsz6ps8
 c6VfOKZV8H59GBZXLF9pfKItqom1RMnV5eOL8IQsNjwjJPuzr5wODlc7f
 dvmDtj88NCtOpfxpeqXi1DParMF3Ev+f7Jx0NaRuWbllrBzSxCRUNexSU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5099045"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5099045"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12376331"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:38:21 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 John Harrison <john.c.harrison@intel.com>
Subject: [PATCH i-g-t v4 20/25] tests/intel: Introduce Debugging subcategory
Date: Thu, 14 Mar 2024 14:34:50 +0000
Message-Id: <20240314143455.1436688-21-katarzyna.piecielska@intel.com>
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

Test i915_hangman is focusing on debugging capabilities.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_exec_capture.c | 2 +-
 tests/intel/i915_hangman.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 1596a4979..0be3c5349 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -38,7 +38,7 @@
  * Feature: cmd_submission
  * Category: Server
  * Functionality: offline debugging
- * Sub-category: Debugger
+ * Sub-category: Debugging
  * Test category: GEM_Legacy
  * Run type: FULL
  *
diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index 8a7de5626..0749a9900 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -46,7 +46,7 @@
  * Description: Tests for hang detection and recovery
  * Feature: reset
  * Functionality: error handling
- * Sub-category: debugger
+ * Sub-category: Debugging
  * Test category: GEM_Legacy
  *
  * SUBTEST: detector
-- 
2.34.1

