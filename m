Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8617DCD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 11:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFC410F01D;
	Thu, 11 Apr 2024 11:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2qwCM7O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0216010F01D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 11:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712834277; x=1744370277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xGFkT8KEEO084QD/DqlqS/4GgXx42kIA08NNIF2JJ1w=;
 b=h2qwCM7OkxAVkVgZJnXYwh+6EF42s+Z1d9MDZ36+sDL24oWlWPq5BBBT
 tukSXVu1OyBZhjBh0px0UswwnjB9dF7MFt1QYA0H3qT9OOzWxWUWtqEJk
 FVJFmiK8geI/nSjDSGgaO2YMVJfi1ety18KqDyW61aGV2je7muV6J54s3
 zi+dqXs0l56g8MFdaZSmi3rl5fo6ahNIRAwQDgJjlaAsENg/+b832bEvJ
 lJrd1gwx9QLGes0FZl3YvfMaFR5xLU13f1HNazFB3IBqmYo0RzKu0dTPZ
 Ly6Z8MQX5ZRDHoE40fJR8ccVY2jAB/nWfeKEtyDzl8qWpcaYvJJ3m6YKw Q==;
X-CSE-ConnectionGUID: UKk7Kf3DRVKZioKzeh6Inw==
X-CSE-MsgGUID: Zky/aswxTwqcd5v5hI7Fgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8344503"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8344503"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:17:57 -0700
X-CSE-ConnectionGUID: TWj9aw/WQ+m0WaKnlYJsuQ==
X-CSE-MsgGUID: D7xbOzFySX+9Mpg4EqJupA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="44156195"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:17:54 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 3/5] tests/intel: Remove documentation collision for
 Obsolete category
Date: Thu, 11 Apr 2024 11:17:15 +0000
Message-Id: <20240411111717.2941810-4-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411111717.2941810-1-katarzyna.piecielska@intel.com>
References: <20240411111717.2941810-1-katarzyna.piecielska@intel.com>
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

Let's remove collision in Category and Feature.
Once I am here let's order docs as in other places:
	SUBTEST
	Description
	Category
	Sub-category
	Funtionality
	Feature

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_exec_params.c          | 4 ++--
 tests/intel/gen3_mixed_blits.c         | 4 ++--
 tests/intel/gen3_render_linear_blits.c | 4 ++--
 tests/intel/gen3_render_mixed_blits.c  | 4 ++--
 tests/intel/gen3_render_tiledx_blits.c | 4 ++--
 tests/intel/gen3_render_tiledy_blits.c | 4 ++--
 tests/intel/perf.c                     | 6 +++---
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
index 9ce4d7653..b2f8fb247 100644
--- a/tests/intel/gem_exec_params.c
+++ b/tests/intel/gem_exec_params.c
@@ -111,10 +111,10 @@
  * SUBTEST: rsvd2-dirt
  *
  * SUBTEST: secure-non-master
- * Feature: cmd_submission, obsolete
+ * Feature: cmd_submission, obsolete test
  *
  * SUBTEST: secure-non-root
- * Feature: cmd_submission, obsolete
+ * Feature: cmd_submission, obsolete test
  *
  * SUBTEST: sol-reset-invalid
  *
diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
index ea65579b2..55bbb5d45 100644
--- a/tests/intel/gen3_mixed_blits.c
+++ b/tests/intel/gen3_mixed_blits.c
@@ -50,10 +50,10 @@
 #include "igt.h"
 /**
  * TEST: gen3 mixed blits
- * Feature: obsolete
+ * Category: Obsolete
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
- * Category: Obsolete
+ * Feature: obsolete test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
index e370c4406..43a443e0a 100644
--- a/tests/intel/gen3_render_linear_blits.c
+++ b/tests/intel/gen3_render_linear_blits.c
@@ -49,10 +49,10 @@
 #include "igt.h"
 /**
  * TEST: gen3 render linear blits
- * Feature: obsolete
+ * Category: Obsolete
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
- * Category: Obsolete
+ * Feature: obsolete test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
index 14fae3e7b..c7336adfe 100644
--- a/tests/intel/gen3_render_mixed_blits.c
+++ b/tests/intel/gen3_render_mixed_blits.c
@@ -50,10 +50,10 @@
 #include "igt.h"
 /**
  * TEST: gen3 render mixed blits
- * Feature: obsolete
+ * Category: Obsolete
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
- * Category: Obsolete
+ * Feature: obsolete test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
index a2748f272..f5818135b 100644
--- a/tests/intel/gen3_render_tiledx_blits.c
+++ b/tests/intel/gen3_render_tiledx_blits.c
@@ -50,10 +50,10 @@
 #include "igt.h"
 /**
  * TEST: gen3 render tiledx blits
- * Feature: obsolete
- * Sub-category: Obsolete_gen3
  * Category: Obsolete
+ * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
+ * Feature: obsolete test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
index eb63aaa82..b40be62f6 100644
--- a/tests/intel/gen3_render_tiledy_blits.c
+++ b/tests/intel/gen3_render_tiledy_blits.c
@@ -50,10 +50,10 @@
 #include "igt.h"
 /**
  * TEST: gen3 render tiledy blits
- * Feature: obsolete
- * Sub-category: Obsolete_gen3
  * Category: Obsolete
+ * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
+ * Feature: obsolete test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index 651ea9fd8..7a63a3bdd 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -99,7 +99,7 @@
  * Feature: oa perf
  *
  * SUBTEST: gen8-unprivileged-single-ctx-counters
- * Feature: oa perf, obsolete
+ * Feature: oa perf, obsolete test
  *
  * SUBTEST: global-sseu-config
  * Description: Verify specifying SSEU opening parameters
@@ -155,7 +155,7 @@
  * Description: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: per-context-mode-unprivileged
- * Feature: oa perf, obsolete
+ * Feature: oa perf, obsolete test
  *
  * SUBTEST: polling
  * Description: Test polled read with default hrtimer frequency
@@ -180,7 +180,7 @@
  * Description: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: unprivileged-single-ctx-counters
- * Feature: oa perf, obsolete
+ * Feature: oa perf, obsolete test
  *
  * SUBTEST: whitelisted-registers-userspace-config
  * Description: Test the i915 perf metrics streaming interface
-- 
2.34.1

