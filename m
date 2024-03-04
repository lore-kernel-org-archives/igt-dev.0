Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758DEC5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D45112004;
	Mon,  4 Mar 2024 11:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqvvyUcA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FED112004
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551056; x=1741087056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mtyreevWd7t4wE6TnlbAgKtmDBcnmfrweeUfSe7I3d0=;
 b=bqvvyUcAtKYKjPkuTaezvoCVQNDi1lmam95CV6brTcnxpVbyp35j+aQx
 qDie0GqAodxZow0pFxIpHy4HMai+hym1nYabe3DjW+rYLLu8Sa80nFHax
 8kSo/K3GlZzZPH8+BCAtn82MGxDiYl4vGne3s4rGukBScmAZDLVEnIzBZ
 vXwpvNzPyn0jWXIu28CNpAkxs0viAveAakDIKtYSS2jK2F0isMt3SzLMh
 CpFRMbeMKaUKReMOh1nGp/pkT5u+hUOmti7tNhYOS1N8vlp5BP/uN4kj4
 MRGhqwg5uWfEKU8RePNaY5sga2oroxThFoAoA5lqwaLP1J26hATwMYRuL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15444950"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15444950"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:17:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8840423"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:17:34 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH i-g-t 06/24] tests/intel: Introduce Context subcategory
Date: Mon,  4 Mar 2024 11:15:59 +0000
Message-Id: <20240304111617.849785-7-katarzyna.piecielska@intel.com>
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

Let's introduce Context subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/gem_ctx_bad_destroy.c | 4 ++--
 tests/intel/gem_ctx_engines.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_ctx_bad_destroy.c b/tests/intel/gem_ctx_bad_destroy.c
index 65f6b5583..b6575e2d8 100644
--- a/tests/intel/gem_ctx_bad_destroy.c
+++ b/tests/intel/gem_ctx_bad_destroy.c
@@ -39,9 +39,9 @@
  * Category: Infrastructure
  * Description: Negative test cases for destroy contexts.
  * Feature: context
- * Functionality: context management
+ * Functionality: context
  * Run type: FULL
- * Sub-category: i915
+ * Sub-category: Context
  * Test category: GEM_Legacy
  *
  * SUBTEST: double-destroy
diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
index 61718494e..75770e1f1 100644
--- a/tests/intel/gem_ctx_engines.c
+++ b/tests/intel/gem_ctx_engines.c
@@ -47,9 +47,9 @@
  * TEST: gem ctx engines
  * Category: Infrastructure
  * Feature: context
- * Functionality: context management
+ * Functionality: context
  * Run type: FULL
- * Sub-category: i915
+ * Sub-category: Context
  * Test category: GEM_Legacy
  *
  * SUBTEST: execute-allforone
-- 
2.34.1

