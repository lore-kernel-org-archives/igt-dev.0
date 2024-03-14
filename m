Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772CDC54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2526A10E2EC;
	Thu, 14 Mar 2024 14:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZtoGWHaV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9056E10E2EC
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710426953; x=1741962953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LxRCfgdX3vAucM0C/G+elkP7Aqyc4gRoeWjF8/45wuE=;
 b=ZtoGWHaVvTbS2q1TN7SC8sLBxzVpfF1XgTakx5fSaglzj34Fk2mAeTdc
 3mD7TgwwN9KUNE7TsTMbaSvfweK7DcBCaPqBPWSfa7t2OKbJ/0WEVy5Iz
 iMpDMGgGFTIWCv1CXahjZ+jaLwcjJWXZvl0QcMAdZcaLQxIxI+f2ahH3K
 N4Mdj41EdEWcorF00xSY1uMBZvma7yajCLpADLKiVrblgflR8DLAANLh5
 q7MO0MAYhZB0gsDz4Pz1NPLxznyV5HsCSCuil1J8UfGrER6CuIa4vwySR
 JPe+a6NOexwxsla45MvlcRhIG0XZuGQT2qCZVihXp8dM8Vlkax/yytGmZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16697557"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16697557"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:35:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12233775"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:35:51 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH i-g-t v4 04/25] tests/intel: Introduce Caching subcategory
Date: Thu, 14 Mar 2024 14:34:34 +0000
Message-Id: <20240314143455.1436688-5-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
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

Let's have 'Caching' subcategory to show where we are testing cashing.

v2: Make Sub-category/Functionality/Feature unique

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/gem_caching.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
index 4a8f69e97..963982e11 100644
--- a/tests/intel/gem_caching.c
+++ b/tests/intel/gem_caching.c
@@ -44,10 +44,10 @@
  * TEST: gem caching
  * Category: Desktop client
  * Description: Test snoop consistency when touching partial cachelines.
- * Feature: caching
- * Functionality: data coherency
+ * Feature: caching feature
+ * Functionality: coherency
  * Run type: FULL
- * Sub-category: i915
+ * Sub-category: Caching
  * Test category: GEM_Legacy
  *
  * SUBTEST: read-writes
-- 
2.34.1

