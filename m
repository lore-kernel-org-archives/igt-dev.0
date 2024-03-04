Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4053C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F2710F201;
	Mon,  4 Mar 2024 11:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhgiiXUx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC98410F201
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551197; x=1741087197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qhUOzP767bCmjsn/aKV0KYhwz1Tf8UtKhUO+vN/0sjA=;
 b=UhgiiXUxLrPMbPENftvHgzOd1EPCVDwYGo+6oLD6pKf28C3mF2fMu6SB
 0Vpdqtsbvua/uMKZEd93WiaCz9WRnBfcjJu9l2OA9JqVZVQeuBex8NNKp
 OTEKeCJUDwN2hJuQ6XFhAZ90mhyHSqS88ig+hatizamiiaBCRh5Jl1/um
 JAmhpa1wCSQrj9Kdp1EO+y15lCBnuSN823sH8QUiYvARnfMvhBRok+7VQ
 ptlv9a8G1IxXFTUb6qY4+H7iHQ9Qydx1u42sW4xYpNQd+h2xk2tPaMHTa
 big7GIA12OtqGHstZ7t6QocssCrizCfSEdnnTDeK2iVv66sfXxTkQ4k1+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4199262"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4199262"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:19:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="32125357"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:19:55 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 John Harrison <john.c.harrison@intel.com>
Subject: [PATCH i-g-t 20/24] tests/intel: Introduce Debugging subcategory
Date: Mon,  4 Mar 2024 11:16:13 +0000
Message-Id: <20240304111617.849785-21-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
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
---
 tests/intel/i915_hangman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

