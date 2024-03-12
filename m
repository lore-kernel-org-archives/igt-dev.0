Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CEDC54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108FA112E59;
	Tue, 12 Mar 2024 14:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBwtYDVO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D4611227B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252947; x=1741788947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xoOVqWS6Pku0IXcd3mAE2paVpX1e9SPziLntgOEKlQw=;
 b=FBwtYDVOU1pECT5LNtI/v4QwzDAiBnIQ4g3ZAgRE6ZA/t9p+bAVqwr0R
 smOnuxb5AQz3rkH/zTNGI+b4z4mjS+pX2027+Dekyt9vBD87njvT68rVd
 gicAx8AU156q1mAv1AHeCPWKnYRdLceXVw/rHUJyAyuivHDKpWDqfqjjr
 t6Kt1FZo76lVLyFGzuvsF8K20lD+sd/aWrvL+WkuRMoHx3ItzFrte8su2
 ia8EFV8CHnhGSMDyPTYubDzzHyHUu8Dw3W4VanqdPGS89WK1H6FVGEQPU
 ta5diOWEvKExpaUayjtqLtq+kNNGKcEY00p7MFuT5mv1VKLF2SY+lxX+H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5085543"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5085543"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11474434"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:15:07 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH i-g-t v3 04/25] tests/intel: Introduce Caching subcategory
Date: Tue, 12 Mar 2024 14:13:58 +0000
Message-Id: <20240312141419.1277931-5-katarzyna.piecielska@intel.com>
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

Let's have 'Caching' subcategory to show where we are testing cashing.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Acked-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_caching.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
index 4a8f69e97..4a95cf528 100644
--- a/tests/intel/gem_caching.c
+++ b/tests/intel/gem_caching.c
@@ -45,9 +45,9 @@
  * Category: Desktop client
  * Description: Test snoop consistency when touching partial cachelines.
  * Feature: caching
- * Functionality: data coherency
+ * Functionality: coherency
  * Run type: FULL
- * Sub-category: i915
+ * Sub-category: Caching
  * Test category: GEM_Legacy
  *
  * SUBTEST: read-writes
-- 
2.34.1

