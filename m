Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E215DC54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8368510FBAF;
	Thu, 14 Mar 2024 14:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfksgaJh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548C510FBAF
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710426972; x=1741962972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iOpOzNX8w7iqGepxVsTOyQ2bdBv4G6T8AT4RkoviRFg=;
 b=ZfksgaJhrKZEDP5atJ56ZX7GxrMdbHimRaUYcE9bmbQc3MxQB1sEWT4f
 MvpsSXFUA7EQBG8kouU1SrNF4ZI6SD5QFYG/6itI59kFd2RZZ4X30FQQE
 axbFEhJ+eb+bYQ6P4oxOtXXoS5nwQT8EYUBq7/RPmK7vCG3CdSLaZXSLN
 QpdQjzbp8CQDtdfX47ixWdd5uNPX88dcP/nt9Rffkbuf8OzDvKLYzmOCs
 uzj7pWwT3XVgTc3V01PUQ9Ihli6WGWanksBA8Kg/abFbX48nTxy94K4m5
 Ird6pP0b8PcpD16q4qhFwpmbcuY/qqeFqcVlF9VsvhgwJJfFdZCdnwjiq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16697623"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16697623"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12233817"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:36:10 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v4 06/25] tests/intel: Add tests to Compute subcategory
Date: Thu, 14 Mar 2024 14:34:36 +0000
Message-Id: <20240314143455.1436688-7-katarzyna.piecielska@intel.com>
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

Let's add to Compute subcategory:
 - tests/intel/gem_compute.c
 - tests/intel/gem_vm_create.c

v2: Make Sub-category/Functionality/Feature unique values. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_compute.c         | 2 +-
 tests/intel/gem_ctx_persistence.c | 2 +-
 tests/intel/gem_vm_create.c       | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index 8d0214c4d..8bd9635ae 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Check compute-related functionality
  * Category: Hardware building block
- * Sub-category: compute
+ * Sub-category: Compute
  * Test category: functionality test
  * Run type: BAT
  */
diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
index 3f10c0fa3..1c1476356 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -47,7 +47,7 @@
 #include "sw_sync.h"
 /**
  * TEST: gem ctx persistence
- * Feature: context
+ * Feature: contexts
  * Category: Server
  * Functionality: context
  * Sub-category: Compute
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index 8834c987f..12503c0e5 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -30,10 +30,11 @@
 /**
  * TEST: gem vm create
  * Category: Server
- * Functionality: context management
- * Run type: FULL
+ * Functionality: context
  * Sub-category: Compute
+ * Feature: mapping
  * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: create-ext
  * Feature: mapping
-- 
2.34.1

