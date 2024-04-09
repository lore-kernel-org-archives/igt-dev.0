Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DBCC67861
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 11:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E753112CCA;
	Tue,  9 Apr 2024 11:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndGmW4SA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BDF112CC9
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 11:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712661598; x=1744197598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xGFkT8KEEO084QD/DqlqS/4GgXx42kIA08NNIF2JJ1w=;
 b=ndGmW4SAcOolR67Wk0+p6PjccI/YEz1qXINoahWzv36LiPuU0VUGyYzY
 EN96Gj7sL1K3CvX5jl8DRsam9gZ9h/LABxc7IxUD1Jf7VXULe8FaXcsSu
 YKi08mGh/YdWtr0W/vFSUTsnrCAoLcoqhfLjbvl2A+k3xN6lrbzT1cVqf
 AYNcQjXKVxJI5cbSheviS7cQsLFu1gIZdvjflN/pAoEFs4XikllPK3nMh
 XXvmvxPupDwqrCXtisK6e9uITqQId2XlN1bCFMto2qymMvyiq3wKwDS4q
 U7MVxNBRAnLwW7TUW8wULgZe+4+kz0PuDwMjpUtTGHNqKam/IYmUuaetU w==;
X-CSE-ConnectionGUID: plzXdOpBS5OJzOuRe5SQpA==
X-CSE-MsgGUID: 9eNsMVc3Re+vcHlskWApnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7839741"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7839741"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:19:58 -0700
X-CSE-ConnectionGUID: g2MkZnYsTjWcjE+zDdP7uw==
X-CSE-MsgGUID: f3pxq/+vRq+f6q0osfetXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20640515"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:19:57 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 3/5] tests/intel: Remove documentation collision for
 Obsolete category
Date: Tue,  9 Apr 2024 11:19:13 +0000
Message-Id: <20240409111915.2842477-4-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
References: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
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

