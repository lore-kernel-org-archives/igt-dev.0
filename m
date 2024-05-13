Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CEFC25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 10:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3445B10E636;
	Mon, 13 May 2024 10:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XO6D74on";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247C910E636
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 10:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715597474; x=1747133474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L8Ojz55tgTx0YPReCVYoScCHw7J+e+mPgRMWmqoDAF0=;
 b=XO6D74onnjOTXMUtjwGmluwgLA0b3G9YGDyiyGkiRZUOm6kxcfOULRkF
 wTQQOFzJl8K1U42Sg1nbdeTDw+FaYetXtBBTZU2wnk+UPw2QCJvFgZTMN
 h1Md5Vv/R1qW7MTV5OJgl5yei5USy8AZZvcbkqPX73C4OFA+ZF+2/pK3G
 KewfeUu7aOwDiBwLXA7QByvE0y41gus5lXLhczXLh0fpaQtE7SccP9xzO
 mUoyq6kWTIyvMCDpINdP4/PtjhlH3n3vvKJO7EnMWeT6b52a+wKATU7X1
 inoQHUi4BBGvXWoHsHvsChtE/r3cUwtQ+bOiw3ulosyp2daLBwfDghbee A==;
X-CSE-ConnectionGUID: IaA1FfeIQ1m1tTnTts6Zuw==
X-CSE-MsgGUID: IXqrmmDESn+PYJfGTjXing==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22125222"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22125222"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:51:13 -0700
X-CSE-ConnectionGUID: Q5Led226Qy6IYHqu06ZtaA==
X-CSE-MsgGUID: 7VKnzknBQqOKJo6N+im9KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34719936"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:51:12 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v3 14/16] tests/intel: Introduce Media Mega feature
Date: Mon, 13 May 2024 10:48:44 +0000
Message-Id: <20240513104846.362332-15-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
References: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
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

Add mega feature to Media tests.
Group:
	SUBTEST
	Description
	Category
	Mega feature
	Sub-category
	Functionality

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/intel/gem_media_fill.c | 7 ++++---
 tests/intel/gem_media_vme.c  | 5 +++--
 tests/intel/xe_media_fill.c  | 9 +++++----
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
index e9455df9e..e22565b86 100644
--- a/tests/intel/gem_media_fill.c
+++ b/tests/intel/gem_media_fill.c
@@ -48,10 +48,11 @@
 /**
  * TEST: gem media fill
  * Description: Basic test for the media_fill() function, a very simple workload for the Media pipeline.
- * Feature: media feature
- * Sub-category: Media
  * Category: Desktop client
- * Functionality: fill media
+ * Mega feature: Media
+ * Sub-category: Media tests
+ * Functionality: fill surface with media block
+ * Feature: media
  *
  * SUBTEST: media-fill
  */
diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
index 89ce8c55d..1ec4d4492 100644
--- a/tests/intel/gem_media_vme.c
+++ b/tests/intel/gem_media_vme.c
@@ -38,10 +38,11 @@
 /**
  * TEST: gem media vme
  * Description: A very simple workload for the VME media block.
- * Feature: media feature
- * Sub-category: Media
  * Category: Desktop client
+ * Mega feature: Media
+ * Sub-category: Media tests
  * Functionality: vme media block
+ * Feature: media
  *
  * SUBTEST:
  */
diff --git a/tests/intel/xe_media_fill.c b/tests/intel/xe_media_fill.c
index e6b5aaf73..1adafee4f 100644
--- a/tests/intel/xe_media_fill.c
+++ b/tests/intel/xe_media_fill.c
@@ -27,11 +27,12 @@
 
 /**
  * TEST: xe media fill
- * Category: Hardware building block
- * Sub-category: Media
- * Functionality: fill media
  * Description: Basic tests for the media_fill() function.
- * Feature: media feature
+ * Category: Hardware building block
+ * Mega feature: Media
+ * Sub-category: Media tests
+ * Functionality: fill surface with media block
+ * Feature: media
  * Test category: functionality test
  *
  * SUBTEST: media-fill
-- 
2.34.1

