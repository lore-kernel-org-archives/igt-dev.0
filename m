Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E934CC54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6984D10EF60;
	Wed, 27 Mar 2024 12:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1ONqOmn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7143710EF60
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542489; x=1743078489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i1cEVj3u7NiIy6x2r8sVvSpO0XSDe9JJUTHT5pYO9Dc=;
 b=J1ONqOmnXwdoPn44Bmj/KC+RiBfBIxi6jax1061f73ZkDK5NijE4wW+s
 GVsUI4txg/a09h97f9oXBT1lCaDxDVTKEkSASsyVQ5TUopHZMPLLY5Dpe
 SW6vO3Y+5fT/6Tr5joDNNexk4RkpvZXY/dXtpOA2s6z2nRajhYQL0TrIm
 kkQm8igFc1jag2skROpvXnG6QAMeCl7Tyn8mEgt6uIhOx4Qis37hItieG
 xslb4D4HyFrtg0zW8eMrgRAAvylY19TSO233NJtcBujQJ7lmsCw7qb6I1
 gNksGwdJVBe1/GlHgh5U++bfCwgbjeC7S5I+U9Ld2ikvsZBq+EpOF4w3e w==;
X-CSE-ConnectionGUID: jAOIJghFTR6uwmNIUzYewQ==
X-CSE-MsgGUID: HXS6nvpgTpaPQc+JowfRGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6530847"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6530847"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16932856"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:07 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 03/16] tests/intel: Introduce Blitter megafeature
Date: Wed, 27 Mar 2024 12:27:18 +0000
Message-Id: <20240327122731.2104614-4-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
References: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
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

Add mega feature to Blitter tests.
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
index 7554aaef1..6531d123f 100644
--- a/tests/intel/gem_exercise_blt.c
+++ b/tests/intel/gem_exercise_blt.c
@@ -13,10 +13,11 @@
 /**
  * TEST: gem exercise blt
  * Description: Exercise blitter commands
- * Feature: blitter feature
- * Sub-category: Blitter
  * Category: Desktop client
+ * Mega feature: Blitter
+ * Sub-category: Blitter tests
  * Functionality: fast-copy
+ * Feature: blitter
  * Test category: GEM_Legacy
  *
  * SUBTEST: fast-copy
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
index 023b2026b..e333dd230 100644
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
+ * Mega feature: Blitter
+ * Sub-category: Blitter tests
  * Functionality: linear blits
- * Sub-category: Blitter
+ * Feature: blitter
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
index 1a1bd86aa..a7a7cf76d 100644
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
+ * Mega feature: Blitter
+ * Sub-category: Blitter tests
+ * Functionality: tiling
+ * Feature: blitter, gtt
  *
  * SUBTEST: tiled-to-tiled
  * Description: Check for proper synchronization of tiled->tiled transition.
diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
index c9d97ba7a..44d3e8d5c 100644
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
+ * Mega feature: Blitter
+ * Sub-category: Blitter tests
+ * Functionality: command parser
+ * Feature: blitter, command_parser
  *
  * SUBTEST: allowed-all
  *
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index ae91f852d..580cfd127 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -40,11 +40,12 @@
  * Sub-category: Synchronization
  *
  * SUBTEST: live@blt
- * Category: Selftest
  * Description: Blitter validation
+ * Category: Selftest
+ * Mega feature: Blitter
+ * Sub-category: Blitter tests
  * Functionality: command streamer
  * Test category: i915 / HW
- * Sub-category: Blitter
  *
  * SUBTEST: live@client
  * Category: Selftest
@@ -374,11 +375,12 @@
  * Test category: i915
  *
  * SUBTEST: live@win_blt_copy
- * Category: Selftest
  * Description: Validation of migration interface
+ * Category: Selftest
+ * Mega feature: Blitter
+ * Sub-category: Blitter tests
  * Functionality: migration interface
  * Test category: i915 / HW
- * Sub-category: Blitter
  *
  * SUBTEST: live@workarounds
  * Category: Selftest
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 7d0f2f2a1..a337dd609 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -21,7 +21,8 @@
 /**
  * TEST: xe ccs
  * Category: Hardware building block
- * Sub-category: Blitter
+ * Mega feature: Blitter
+ * Sub-category: Blitter tests
  * Functionality: flat_ccs
  * Description: Exercise gen12 blitter with and without flatccs compression on Xe
  * Test category: functionality test
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 25e8adca0..d0977b610 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -22,7 +22,8 @@
 /**
  * TEST: Test to validate copy commands on xe
  * Category: Software building block
- * Sub-category: Blitter
+ * Mega feature: Blitter
+ * Sub-category: Blitter tests
  * Functionality: copy
  */
 
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index 253edec7f..418edc506 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -15,7 +15,8 @@
 /**
  * TEST: xe exercise blt
  * Category: Hardware building block
- * Sub-category: Blitter
+ * Mega feature: Blitter
+ * Sub-category: Blitter tests
  * Functionality: flat_ccs
  * Description: Exercise blitter commands on Xe
  * Test category: functionality test
-- 
2.34.1

