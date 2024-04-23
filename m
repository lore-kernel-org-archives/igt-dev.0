Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1EBC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 10:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FA610FBC7;
	Tue, 23 Apr 2024 10:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2PmVln6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001DC10FBC7
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713869394; x=1745405394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eK3j1budVR6yaLJtZgDXD2ZENBrvZKpijsUelIMIfMQ=;
 b=k2PmVln6O5zX6Dst+ZaDpgWP+e22XjroGKg7mZNmz4KjJYznUSxQnC9y
 D/stnTtBNUVLr4TRIaC8bh8sKvlI5uG5WvZhp3cE61ri/bIBFoz84WLkM
 IIA/dD8ATm6uBilGNejO82ZPiF9txaeImVVpnowmBEK2R7xELzkoVUahA
 1BgAdoL/1lDhUrt2xiYU4BhyYWmdRNcdgaz/kR1KKei5qFb2QwZsAMx0z
 6zaN/wa/zWNEWFSO8560fH53H39UKNR5xjBFfhm+F5KQbjjxLdV6AQYgS
 n8o5RSDs8pU4HkldK25yArZjFgv953QJh0b/2Ilxv8Z/QgdRoOIxNbxv7 w==;
X-CSE-ConnectionGUID: KYKjowFrQkCHDSefgq/8pQ==
X-CSE-MsgGUID: WlrlT8IdSg2a8vdjRPPnpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9554302"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9554302"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:49:53 -0700
X-CSE-ConnectionGUID: pPmMzqkhSzWMN7/yppem+w==
X-CSE-MsgGUID: 80+Ubr8mQNqgV8/rEVNDWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29002056"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:49:51 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v2 03/16] tests/intel: Add Blitter tests to General Core
 Mega feature
Date: Tue, 23 Apr 2024 10:49:00 +0000
Message-Id: <20240423104913.3559587-4-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
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
index 5d17f3bf1..a673e9b03 100644
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
index b3bf97af7..ea0dff764 100644
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

