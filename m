Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A45FC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC94E10ED3B;
	Thu, 21 Mar 2024 15:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFkSPr+u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC3010ED31
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035671; x=1742571671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IaeCY+WxzBWxBFt5ctrVaiQxJCWKKYa1xQL9rkMdGyU=;
 b=FFkSPr+uz94v2O9UYVzjw8FxP02oGkg5+Vx6B0v2k0zAoBWKeEb6dThP
 8hNlbJp6JW44WjiOPd3i08UoBhR+UEOE5Qhn89zfkuwyNkwa2L6JA6SRb
 BT38bkS9ieTY3UbH0yTEuAUOULOlRmfmvFliZaWqPibPE9PAkY+NBknRF
 f3Bg4XwKjWU+IlpajKDNrZ4GdPqDlaDSo9BOiS5H+K1TGlYfmnBsnB19u
 DJ3Ve9apLSmjwtm8MwoD8Chv8VcDuig1iB+XPx89Sn35FyNPlQsdSu8FH
 VtoPQU4oEXXCADV2dH/i726PGlFQeNo1VQtvgcQH6Kq9uiwCd8SK2EnoG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5885169"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5885169"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19197787"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:41:10 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 13/24] tests/intel: Introduce Obsolete subcategory
Date: Thu, 21 Mar 2024 15:38:36 +0000
Message-Id: <20240321153847.1787625-14-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
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

