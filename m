Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09DCCD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305B210E453;
	Tue, 26 Mar 2024 09:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mM6rWS3t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441BD10E453
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445367; x=1742981367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l+2ZIlou5WpWt9i7JB3RokgCVHExser/8boTDYOJ21c=;
 b=mM6rWS3toj7mGlnnkGSDdm1Cvoc7ywlt8bH94pzDNt3A6WjbxgHNGsgV
 epeCmzBOMun6sTjtuhYAfL43qQIPbuH1FhmaBBBC6TJFlMC5J0dOQbKVX
 wAitc7Bl/tFeQN2a+WQ64RKzlMFY5cTtYh4CzUGhwLsNbuzlPDU1dLLjF
 0/TbXRpy1ugzFWYkreXuMiFR2uPsWvViLjl0Kkjj0zTKl8sOne7EVEj+j
 3z3e18yTtyuYpC159xgbdpyBuHjHPfCWH8aOeOr3UpcnCrS/yXp57AedF
 bFz3e7n20DaIhJv4t9VDnXivh47YdgiqWrnq72EaMRa7tFHJ8Cj/jbolT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6378507"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6378507"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15964864"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:29:24 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 01/13] tests/intel: Unify Blitter subcategory for
 i915 and Xe
Date: Tue, 26 Mar 2024 09:28:55 +0000
Message-Id: <20240326092907.1979345-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
References: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
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

After cleaning up test documentation for i915 tests some Xe tweaks are
needed. Let's unify Blitter subcategory between Xe and i915.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_ccs.c        | 2 +-
 tests/intel/xe_copy_basic.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index aec83a057..7d0f2f2a1 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -21,7 +21,7 @@
 /**
  * TEST: xe ccs
  * Category: Hardware building block
- * Sub-category: blitter
+ * Sub-category: Blitter
  * Functionality: flat_ccs
  * Description: Exercise gen12 blitter with and without flatccs compression on Xe
  * Test category: functionality test
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 66c666eac..25e8adca0 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -22,8 +22,8 @@
 /**
  * TEST: Test to validate copy commands on xe
  * Category: Software building block
- * Sub-category: Copy
- * Functionality: blitter
+ * Sub-category: Blitter
+ * Functionality: copy
  */
 
 /**
-- 
2.34.1

