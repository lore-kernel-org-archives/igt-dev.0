Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2C1C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32B610F8FC;
	Fri,  8 Mar 2024 08:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkbrSpEx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9482C10F8FC
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887170; x=1741423170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o1Po81roL0IFycGZEKXhU1IZ5d1zmli10fi6pYXh34I=;
 b=MkbrSpEx5fgNmQNAzsue6KiR4+BIkLVI07zoxwbNACbXgSLhPS9oVvhb
 os2KLH1Im/0MANmfWOrzdnWbpWkpCTtFEYnQx5en1ejpG6WdKBFzMBobw
 c1wcSA/FDtNUXxKh7/aggQynuu/VmpIY2hmg+TyyNMw+S5sCRApo/f9QM
 qDA9I8DNcVVDWddwV7MYecNLQYTTSi5mi5ssK8w4DdmX1dzFS+Yidb7Tl
 xXLSC/oW8ZAYvL/rg8CoaEiROFs++NATyyLsHE5ljsrCksNWjRefDQZ3k
 mJ3TBFtdVU2KuxieAAjS8Vvd65VkB1vPvGwDr4fbh6mqIhvp996Ulz12P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4737210"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4737210"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10808517"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:39:29 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 14/25] tests/intel: Introduce Obsolete subcategory
Date: Fri,  8 Mar 2024 08:36:46 +0000
Message-Id: <20240308083657.1092049-15-katarzyna.piecielska@intel.com>
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

gen3_* tests are obsolete, so let's put them into one subcategory.

v2: change functionality to 'obsolete_test' to not break automation
tools

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gen3_mixed_blits.c         | 3 +++
 tests/intel/gen3_render_linear_blits.c | 3 +++
 tests/intel/gen3_render_mixed_blits.c  | 3 +++
 tests/intel/gen3_render_tiledx_blits.c | 5 ++++-
 tests/intel/gen3_render_tiledy_blits.c | 5 ++++-
 5 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
index 3c6fb141a..f204244db 100644
--- a/tests/intel/gen3_mixed_blits.c
+++ b/tests/intel/gen3_mixed_blits.c
@@ -51,6 +51,9 @@
 /**
  * TEST: gen3 mixed blits
  * Feature: obsolete
+ * Sub-category: Obsolete
+ * Functionality: obsolete_test
+ * Category: Obsolete
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
index 7dfb2709a..97976ac20 100644
--- a/tests/intel/gen3_render_linear_blits.c
+++ b/tests/intel/gen3_render_linear_blits.c
@@ -50,6 +50,9 @@
 /**
  * TEST: gen3 render linear blits
  * Feature: obsolete
+ * Sub-category: Obsolete
+ * Functionality: obsolete_test
+ * Category: Obsolete
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
index f8e1bdfbd..4f02ec5ba 100644
--- a/tests/intel/gen3_render_mixed_blits.c
+++ b/tests/intel/gen3_render_mixed_blits.c
@@ -51,6 +51,9 @@
 /**
  * TEST: gen3 render mixed blits
  * Feature: obsolete
+ * Sub-category: Obsolete
+ * Functionality: obsolete_test
+ * Category: Obsolete
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
index 1abe5adbc..65358b053 100644
--- a/tests/intel/gen3_render_tiledx_blits.c
+++ b/tests/intel/gen3_render_tiledx_blits.c
@@ -25,7 +25,7 @@
  *
  */
 
-/** @file gen3_linear_render_blits.c
+/** @file gen3_render_tiledx_blits.c
  *
  * This is a test of doing many blits, with a working set
  * larger than the aperture size.
@@ -51,6 +51,9 @@
 /**
  * TEST: gen3 render tiledx blits
  * Feature: obsolete
+ * Sub-category: Obsolete
+ * Category: Obsolete
+ * Functionality: obsolete_test
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
index b1f4b628a..c13e395b9 100644
--- a/tests/intel/gen3_render_tiledy_blits.c
+++ b/tests/intel/gen3_render_tiledy_blits.c
@@ -25,7 +25,7 @@
  *
  */
 
-/** @file gen3_linear_render_blits.c
+/** @file gen3_render_tiledy_blits.c
  *
  * This is a test of doing many blits, with a working set
  * larger than the aperture size.
@@ -51,6 +51,9 @@
 /**
  * TEST: gen3 render tiledy blits
  * Feature: obsolete
+ * Sub-category: Obsolete
+ * Category: Obsolete
+ * Functionality: obsolete_test
  * Run type: FULL
  *
  * SUBTEST:
-- 
2.34.1

