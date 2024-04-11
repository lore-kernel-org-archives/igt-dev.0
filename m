Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC31CD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5E710F0BE;
	Thu, 11 Apr 2024 13:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IO+T9BqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9F310F0BC
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712841396; x=1744377396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YOC6ghMqsvKUycXtnzqNZ88uDhS1IQcv2M6vCH9EJM0=;
 b=IO+T9BqIZQZV1+UEYZurFfz7A8UOxduK9NY99A129/95HZK2IvW5lZrk
 qTJlC8Z4/ZKqJo0nYuwDwZEhiwqXrw5syZGJOb8IvpFlvA3SKcA5AmL51
 E/i9pVy0Hyq7iXbMmqRgWpQA2giTv5dEzreHhXd/SqtOzkkGkXDDkQqf3
 1cEKJwLlz87eK8Xoywe1XLRsjDBV7BRwAi9k6gh3iVOcjF74eNl0IbKRE
 y/+CtrymOHs21Ax3kcc41+Zq5VS1pBxJfmbV41a4xCJcLXV9TBcTj3l5O
 P+OFXEXhgdAYeKatzUYz5hu6rsTDthdvdZVEjLyl5FLFdYQWq0xn1tds0 g==;
X-CSE-ConnectionGUID: /baJyTp8S5+00K3CPSstAQ==
X-CSE-MsgGUID: enNLEIoVTR2onRF9hoFLvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25760741"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25760741"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:16:33 -0700
X-CSE-ConnectionGUID: 6S3WQYHuSyei7O5ZJqBwgA==
X-CSE-MsgGUID: Hnrmd7Q6QgyNSRpy4QA56Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21486933"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:16:31 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 3/5] tests/intel: Remove documentation collision for
 Obsolete category
Date: Thu, 11 Apr 2024 13:15:52 +0000
Message-Id: <20240411131554.2999053-4-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411131554.2999053-1-katarzyna.piecielska@intel.com>
References: <20240411131554.2999053-1-katarzyna.piecielska@intel.com>
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
v2: s/obsolete/obsolete_test/ for 2 remaining kms tests.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_exec_params.c          | 4 ++--
 tests/intel/gen3_mixed_blits.c         | 4 ++--
 tests/intel/gen3_render_linear_blits.c | 4 ++--
 tests/intel/gen3_render_mixed_blits.c  | 4 ++--
 tests/intel/gen3_render_tiledx_blits.c | 4 ++--
 tests/intel/gen3_render_tiledy_blits.c | 4 ++--
 tests/intel/kms_pipe_b_c_ivb.c         | 2 +-
 tests/intel/perf.c                     | 6 +++---
 tests/kms_tv_load_detect.c             | 2 +-
 9 files changed, 17 insertions(+), 17 deletions(-)

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
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 73277e970..71699e792 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -30,7 +30,7 @@
  * Description: Exercise the FDI lane bifurcation code for IVB in the kernel by
  *              setting different combinations of modes for pipes B and C.
  * Driver requirement: i915
- * Functionality: kms_core, obsolete
+ * Functionality: kms_core, obsolete_test
  * Mega feature: General Display Features
  * Test category: functionality test
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
diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
index 13394f2c6..7270172a2 100644
--- a/tests/kms_tv_load_detect.c
+++ b/tests/kms_tv_load_detect.c
@@ -34,7 +34,7 @@
  * SUBTEST: load-detect
  * Description: Check tv load detection works correctly.
  * Driver requirement: i915, xe
- * Functionality: obsolete
+ * Functionality: obsolete test
  * Mega feature: General Display Features
  * Test category: functionality test
  */
-- 
2.34.1

