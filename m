Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657A3C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BE8112E63;
	Tue, 12 Mar 2024 14:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6wgMT2T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E900112E64
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710253000; x=1741789000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IaeCY+WxzBWxBFt5ctrVaiQxJCWKKYa1xQL9rkMdGyU=;
 b=I6wgMT2T93rovYot5VKlg2iIDodShv+HfTai/h1rv7FGa9ep6RXN2pFo
 NSNZBEO2upaK5iNnuql5RonYYIQ/NUols1J30vmSf2nCqdjdE0DdRCUYV
 wFk/wwIqVUBoiBgJZkp3aycj686QFDWjgYzavV1lpBIheopbPpx09QhsT
 +YaixhGJfpUeh3jQB2W7vbm6IvzhkGNBZkEARCq5KWo9/+xRKycJdFlwX
 9E/N4j5k850KB+ID4/r1h6js8bqXCw3xngZjjzyYM+XpzYPXPx9YfWt17
 /6IZTB/Mqpxjj+XISFDoijD4GXC2pUCJxYC1nnXRkSh1u1+bbABEmXPmk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5133519"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5133519"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:16:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11522158"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:16:38 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 14/25] tests/intel: Introduce Obsolete subcategory
Date: Tue, 12 Mar 2024 14:14:08 +0000
Message-Id: <20240312141419.1277931-15-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
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
v3: Category and Sub-category need to be unique as well, so change
Sub-category s/Obsolete/Obsolete_gen3/.

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
index 3c6fb141a..2bb5517c8 100644
--- a/tests/intel/gen3_mixed_blits.c
+++ b/tests/intel/gen3_mixed_blits.c
@@ -51,6 +51,9 @@
 /**
  * TEST: gen3 mixed blits
  * Feature: obsolete
+ * Sub-category: Obsolete_gen3
+ * Functionality: obsolete_test
+ * Category: Obsolete
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
index 7dfb2709a..681d7b01b 100644
--- a/tests/intel/gen3_render_linear_blits.c
+++ b/tests/intel/gen3_render_linear_blits.c
@@ -50,6 +50,9 @@
 /**
  * TEST: gen3 render linear blits
  * Feature: obsolete
+ * Sub-category: Obsolete_gen3
+ * Functionality: obsolete_test
+ * Category: Obsolete
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
index f8e1bdfbd..ee42f068b 100644
--- a/tests/intel/gen3_render_mixed_blits.c
+++ b/tests/intel/gen3_render_mixed_blits.c
@@ -51,6 +51,9 @@
 /**
  * TEST: gen3 render mixed blits
  * Feature: obsolete
+ * Sub-category: Obsolete_gen3
+ * Functionality: obsolete_test
+ * Category: Obsolete
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
index 1abe5adbc..ca49576a9 100644
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
+ * Sub-category: Obsolete_gen3
+ * Category: Obsolete
+ * Functionality: obsolete_test
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
index b1f4b628a..dfd3ef947 100644
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
+ * Sub-category: Obsolete_gen3
+ * Category: Obsolete
+ * Functionality: obsolete_test
  * Run type: FULL
  *
  * SUBTEST:
-- 
2.34.1

