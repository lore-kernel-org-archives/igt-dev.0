Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94DEC5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCC810E3AC;
	Mon,  4 Mar 2024 11:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YL17ri/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A848410E3AC
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551137; x=1741087137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Acmocrip9WG/bpa/qmAXjXp6Z8qVsZqnRlTcZuN/npE=;
 b=YL17ri/9gFRZ7bxIgW4co5XHy+iG60hK1LHYk4NBZxVUJIcsZFMgUsDe
 tRm9Ujvv66pVRG2nn+49UTXNV3PCV/wfHO9dgJgmTe6mx4QoM3YVCq+um
 29xNLOmK31oxgDzM86Z36apKFrrYlO6mjaUxy89ZEb3bvMI2tWI42UXtG
 GCbtrL6+k1VTGw0hUuHSBzgsL4O9HLRLsyXVfUW9lwHw3+etTONFwQYk0
 vCxPWp2FNoYDSJlfqdMTb9XolVgsXp92EugdBF5Jou+HOcWhzEPbvWACk
 J/4gg9LlaIMNloAlBJPlIwJdB28F3XK8lEYDuUdvELcGsiogSDgp/89xd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="29461591"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="29461591"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:18:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="39818147"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:18:55 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 14/24] tests/intel: Introduce Obsolete subcategory
Date: Mon,  4 Mar 2024 11:16:07 +0000
Message-Id: <20240304111617.849785-15-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
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

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gen3_mixed_blits.c         | 3 +++
 tests/intel/gen3_render_linear_blits.c | 3 +++
 tests/intel/gen3_render_mixed_blits.c  | 3 +++
 tests/intel/gen3_render_tiledx_blits.c | 3 +++
 tests/intel/gen3_render_tiledy_blits.c | 3 +++
 5 files changed, 15 insertions(+)

diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
index 3c6fb141a..b9ae784da 100644
--- a/tests/intel/gen3_mixed_blits.c
+++ b/tests/intel/gen3_mixed_blits.c
@@ -51,6 +51,9 @@
 /**
  * TEST: gen3 mixed blits
  * Feature: obsolete
+ * Sub-category: Obsolete
+ * Functionality: obsolete
+ * Category: Obsolete
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
index 7dfb2709a..e62a0e9a1 100644
--- a/tests/intel/gen3_render_linear_blits.c
+++ b/tests/intel/gen3_render_linear_blits.c
@@ -50,6 +50,9 @@
 /**
  * TEST: gen3 render linear blits
  * Feature: obsolete
+ * Sub-category: Obsolete
+ * Functionality: obsolete
+ * Category: Obsolete
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
index f8e1bdfbd..f3fa937d0 100644
--- a/tests/intel/gen3_render_mixed_blits.c
+++ b/tests/intel/gen3_render_mixed_blits.c
@@ -51,6 +51,9 @@
 /**
  * TEST: gen3 render mixed blits
  * Feature: obsolete
+ * Sub-category: Obsolete
+ * Functionality: obsolete
+ * Category: Obsolete
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
index 1abe5adbc..88dd606ec 100644
--- a/tests/intel/gen3_render_tiledx_blits.c
+++ b/tests/intel/gen3_render_tiledx_blits.c
@@ -51,6 +51,9 @@
 /**
  * TEST: gen3 render tiledx blits
  * Feature: obsolete
+ * Sub-category: Obsolete
+ * Category: Obsolete
+ * Functionality: obsolete
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
index b1f4b628a..c2fa63c74 100644
--- a/tests/intel/gen3_render_tiledy_blits.c
+++ b/tests/intel/gen3_render_tiledy_blits.c
@@ -51,6 +51,9 @@
 /**
  * TEST: gen3 render tiledy blits
  * Feature: obsolete
+ * Sub-category: Obsolete
+ * Category: Obsolete
+ * Functionality: obsolete
  * Run type: FULL
  *
  * SUBTEST:
-- 
2.34.1

