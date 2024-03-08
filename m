Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0779FC5475B
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54D2113732;
	Fri,  8 Mar 2024 08:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ju02fuOG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7E4113732
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887225; x=1741423225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OJ/9TrQoHcrr1Zdiha/iRuGx/t0PC+1SfB0Xg/PGoSo=;
 b=Ju02fuOGd09isV49Y0+99eU18eUMnqDsU5Mp/3AJVNzM7aVc5iiR2Rxo
 62PexhBBZyc7VcxFu8PKLl6K3Zw/0pAGDOHCbuhAnlS5qQ7a/HA+5Ewur
 Ec0A1DiIzfL5M8RD7RuppvRO0Pfr/R6QpK+/QNppnphqxIat/MvD9zde8
 nqufp010stxRHWkUSXnSvFt1EspIuBal3xxptfaqGpTrK4IVV7//37bqk
 kx6IPu2MOONqQXGkjDme9XR0BL7n3Yg18aZa0X5NbRJ7AMnqNJghWJWfp
 5p5/uwjJRCHghoSXQrTuvPB/443Fq+uhaymZ+W3/HYdo3Hwx+MSkcxkDl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4767399"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4767399"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10411518"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:40:23 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 John Harrison <john.c.harrison@intel.com>
Subject: [PATCH i-g-t v2 20/25] tests/intel: Introduce Debugging subcategory
Date: Fri,  8 Mar 2024 08:36:52 +0000
Message-Id: <20240308083657.1092049-21-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
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

