Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923C1C54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F5010F63B;
	Fri,  8 Mar 2024 08:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXxUYMkf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BA010F63B
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887116; x=1741423116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C38a6QVl4MRwy93iQLk2AtZPLm9GfvvgFGZ/EKWVwxY=;
 b=PXxUYMkfoY9wHx5g9ssjrs2a+6uq9E/L6HNhFZsM7x76rx15OdFtp7wA
 cmEzjjjce9K1dFjHwETXvoTQ7odyx7bLmrGqMezXLlcl4ks0qZRxNY3CS
 cwBQooQEFkUi9KrmxNZKuWjUcCAxHaHwDuao8S6lPh8mMI2QfW+js+n17
 7qGX5xgiUxsam3xvQIzCVODBMYN3RPdtaDGXjwZqxFKp+DzTQ7OuKangH
 mGKhaWC/zfDKVDi2zF7wqIVJQ1krTJ/Y3C48DYqiXP9GKedMKkQd3YFpN
 kqKcmclQ+X8E9vglIvVUz0ThmWzT1bA+cLqTnByUXbHlyY+XzYon3ZKhB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22122243"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="22122243"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:38:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="14956838"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:38:34 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v2 08/25] tests/intel: Introduce Blitter subcategory
Date: Fri,  8 Mar 2024 08:36:40 +0000
Message-Id: <20240308083657.1092049-9-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Let's introduce Blitter subcategory.

v2: introduce more granularity in Blitter subcategory to not break
automation:
 - igt@gem_exercise_blt@fast-copy* - s/blitter/fast-copy/
 - igt@gem_linear_blits@ - s/blitter/linear blit/

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_exercise_blt.c      | 14 +++++++-------
 tests/intel/gem_linear_blits.c      |  4 ++--
 tests/intel/gem_set_tiling_vs_blt.c |  3 +++
 tests/intel/gen9_exec_parse.c       |  3 +++
 4 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
index 4a9bc3729..0aa660ce9 100644
--- a/tests/intel/gem_exercise_blt.c
+++ b/tests/intel/gem_exercise_blt.c
@@ -14,18 +14,18 @@
  * TEST: gem exercise blt
  * Description: Exercise blitter commands
  * Feature: blitter
- * Run type: FULL
+ * Sub-category: Blitter
+ * Category: Desktop client
+ * Functionality: fast-copy
  * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: fast-copy
- * Description:
- *   Check fast-copy blit
- *   blitter
+ * Description: Check fast-copy blit blitter
  *
  * SUBTEST: fast-copy-emit
- * Description:
- *   Check multiple fast-copy in one batch
- *   blitter
+ * Description: Check multiple fast-copy in one batch blitter
+ *
  */
 
 IGT_TEST_DESCRIPTION("Exercise blitter commands");
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
index 64f220cb3..eeb5cd541 100644
--- a/tests/intel/gem_linear_blits.c
+++ b/tests/intel/gem_linear_blits.c
@@ -54,8 +54,8 @@
  * Category: Infrastructure
  * Description: Test doing many blits with a working set larger than the aperture size.
  * Feature: blitter
- * Functionality: blitter
- * Sub-category: CMD submission
+ * Functionality: linear blits
+ * Sub-category: Blitter
  * Test category: GEM_Legacy
  * Run type: FULL
  *
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
index 9077e0f3f..28469f5f3 100644
--- a/tests/intel/gem_set_tiling_vs_blt.c
+++ b/tests/intel/gem_set_tiling_vs_blt.c
@@ -61,6 +61,9 @@
  * TEST: gem set tiling vs blt
  * Description: Check for proper synchronization of tiling changes vs. tiled gpu access.
  * Feature: blitter, gtt
+ * Functionality: tiling
+ * Sub-category: Blitter
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: tiled-to-tiled
diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
index 33ff6bcb5..509a2e80f 100644
--- a/tests/intel/gen9_exec_parse.c
+++ b/tests/intel/gen9_exec_parse.c
@@ -36,6 +36,9 @@
 /**
  * TEST: gen9 exec parse
  * Feature: blitter, command_parser
+ * Sub-category: Blitter
+ * Functionality: command_parser
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: allowed-all
-- 
2.34.1

