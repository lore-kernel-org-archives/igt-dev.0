Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84961C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 10:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCC710E650;
	Mon, 13 May 2024 10:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNmyMLg3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0E410E658
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 10:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715597367; x=1747133367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FC/u6YHTqx8cDRRTweuO5yn0JucMKrHb3bZEa9G434s=;
 b=SNmyMLg3jkv42ZjTgMVVU8tCVHrd9wFpntGJUIddNuxFW+JEMGDfzhUB
 /62J4t55pY3HGQMtvVtVFnvwpWxfDHOmf52xkcV3yAnTUwxyRo6zaicwG
 Mrl0sXTvodPi/6zWs79TOJu9g06bPUQwjZtUI7lZHp6pxs0P2uRWLxxzY
 WBqDZiwCVwTci73vyl8KTqyqmO3vkT6ACoASVma6C0MWvbEbyegAhXzh3
 l0wSily+7tI5HeMCP0jLQZdK/f7cL9H82mKndYyKDEmCbImdeHahfDDs9
 PE2wB5+t1Tn/rvYAjgI9t60Yr1k0i96mw0VTJBcWNq2UVws5RgSa1eAgC g==;
X-CSE-ConnectionGUID: 7hI25pIOQzWDvagXwjDnlQ==
X-CSE-MsgGUID: X6Ez8dDsRO+HPazyzwY2fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11465697"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11465697"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:49:26 -0700
X-CSE-ConnectionGUID: iGysDFLbSkmLRkmlwqR4pg==
X-CSE-MsgGUID: 1MMhuaWvTrOI9RJk6g8cVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30379650"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:49:24 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v3 03/16] tests/intel: Add Blitter tests to General Core
 Mega feature
Date: Mon, 13 May 2024 10:48:33 +0000
Message-Id: <20240513104846.362332-4-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
References: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
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

Add Blitter tests to General Core mega feature.
Group:
	SUBTEST
	Description
	Category
	Mega feature
	Sub-category
	Functionality

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/intel/gem_exercise_blt.c      |  5 +++--
 tests/intel/gem_linear_blits.c      |  7 ++++---
 tests/intel/gem_set_tiling_vs_blt.c |  7 ++++---
 tests/intel/gen9_exec_parse.c       |  7 ++++---
 tests/intel/i915_selftest.c         | 10 ++++++----
 tests/intel/xe_ccs.c                |  3 ++-
 tests/intel/xe_copy_basic.c         |  3 ++-
 tests/intel/xe_exercise_blt.c       |  3 ++-
 8 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
index 7554aaef1..4d62a037a 100644
--- a/tests/intel/gem_exercise_blt.c
+++ b/tests/intel/gem_exercise_blt.c
@@ -13,10 +13,11 @@
 /**
  * TEST: gem exercise blt
  * Description: Exercise blitter commands
- * Feature: blitter feature
- * Sub-category: Blitter
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: Blitter tests
  * Functionality: fast-copy
+ * Feature: blitter
  * Test category: GEM_Legacy
  *
  * SUBTEST: fast-copy
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
index 023b2026b..f5b86e37c 100644
--- a/tests/intel/gem_linear_blits.c
+++ b/tests/intel/gem_linear_blits.c
@@ -51,11 +51,12 @@
 #include "intel_blt.h"
 /**
  * TEST: gem linear blits
- * Category: Infrastructure
  * Description: Test doing many blits with a working set larger than the aperture size.
- * Feature: blitter feature
+ * Category: Infrastructure
+ * Mega feature: General Core features
+ * Sub-category: Blitter tests
  * Functionality: linear blits
- * Sub-category: Blitter
+ * Feature: blitter
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
index 1a1bd86aa..ecd4fc711 100644
--- a/tests/intel/gem_set_tiling_vs_blt.c
+++ b/tests/intel/gem_set_tiling_vs_blt.c
@@ -60,10 +60,11 @@
 /**
  * TEST: gem set tiling vs blt
  * Description: Check for proper synchronization of tiling changes vs. tiled gpu access.
- * Feature: blitter feature, gtt
- * Functionality: tiling
- * Sub-category: Blitter
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: Blitter tests
+ * Functionality: tiling
+ * Feature: blitter, gtt
  *
  * SUBTEST: tiled-to-tiled
  * Description: Check for proper synchronization of tiled->tiled transition.
diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
index c9d97ba7a..021c07c38 100644
--- a/tests/intel/gen9_exec_parse.c
+++ b/tests/intel/gen9_exec_parse.c
@@ -35,10 +35,11 @@
 #include "sw_sync.h"
 /**
  * TEST: gen9 exec parse
- * Feature: blitter feature, command_parser
- * Sub-category: Blitter
- * Functionality: command parser
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: Blitter tests
+ * Functionality: command parser
+ * Feature: blitter, command_parser
  *
  * SUBTEST: allowed-all
  *
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 95561f3a3..a1acd8c9a 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -40,11 +40,12 @@
  * Sub-category: Synchronization
  *
  * SUBTEST: live@blt
- * Category: Selftest
  * Description: Blitter validation
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: Blitter tests
  * Functionality: command streamer
  * Test category: i915 / HW
- * Sub-category: Blitter
  *
  * SUBTEST: live@client
  * Category: Selftest
@@ -376,11 +377,12 @@
  * Test category: i915
  *
  * SUBTEST: live@win_blt_copy
- * Category: Selftest
  * Description: Validation of migration interface
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: Blitter tests
  * Functionality: migration interface
  * Test category: i915 / HW
- * Sub-category: Blitter
  *
  * SUBTEST: live@workarounds
  * Category: Selftest
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 706d760cc..a083325c0 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -21,7 +21,8 @@
 /**
  * TEST: xe ccs
  * Category: Hardware building block
- * Sub-category: Blitter
+ * Mega feature: General Core features
+ * Sub-category: Blitter tests
  * Functionality: flat_ccs
  * Description: Exercise gen12 blitter with and without flatccs compression on Xe
  * Test category: functionality test
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 25e8adca0..86fdac0ce 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -22,7 +22,8 @@
 /**
  * TEST: Test to validate copy commands on xe
  * Category: Software building block
- * Sub-category: Blitter
+ * Mega feature: General Core features
+ * Sub-category: Blitter tests
  * Functionality: copy
  */
 
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index 253edec7f..1b86e9757 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -15,7 +15,8 @@
 /**
  * TEST: xe exercise blt
  * Category: Hardware building block
- * Sub-category: Blitter
+ * Mega feature: General Core features
+ * Sub-category: Blitter tests
  * Functionality: flat_ccs
  * Description: Exercise blitter commands on Xe
  * Test category: functionality test
-- 
2.34.1

