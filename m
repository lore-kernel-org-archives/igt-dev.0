Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2658C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479AB10FCEC;
	Wed, 27 Mar 2024 12:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="id0SFdZL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C59410FCEC
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542572; x=1743078572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xNXO2HG86zVU42FcqmdgJ7S/FKFgj4y3uRXoj454rCs=;
 b=id0SFdZLd/km7zY0KOWvlFuUo1Kr1ZADuIdgZzWAXcVqjBZGeKf9YF64
 Z5+8tjCP3Vf28J3//7pGPphhfbE2buXkghIH66E0A3xNnVFIPAKEeiuP6
 G+kMof0A1kl2bWM55prSjUquSStBTLcd6Wj5w6Qbvwu8XJ7yyAvJUlBVb
 O6k0A5K+pwfVhvSSwCVjh/OF8gKWGRbS+aCA7B6unooNv11t90Zjrp+/r
 FDg/DWMUdFnN+k/Lizk/VY3hjqifJMjLctVn6TuBBC+CYUsS5LeyodVIE
 ok1MJ9Bxgot2Z5VdKoFanVafZ/c4GPLtKsNw0tbwykIjary6Nw24U+Eok w==;
X-CSE-ConnectionGUID: 7hamlFFHR06q2yf47f4opA==
X-CSE-MsgGUID: kHbWEXXRQfaCvyB81CgNuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="10419151"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="10419151"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:29:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16336958"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:29:27 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 11/16] tests/intel: Introduce FlatCCS mega feature
Date: Wed, 27 Mar 2024 12:27:26 +0000
Message-Id: <20240327122731.2104614-12-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
References: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
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

Add mega feature to FlatCCS tests.
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
 tests/intel/gem_ccs.c      | 5 +++--
 tests/intel/xe_evict_ccs.c | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index e4126bcaa..80aae9e5a 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -19,10 +19,11 @@
 /**
  * TEST: gem ccs
  * Description: Exercise gen12 blitter with and without flatccs compression
- * Feature: flat_ccs_mapping
- * Sub-category: Flat-ccs
  * Category: Desktop \ Server
+ * Mega feature: FlatCCS
+ * Sub-category: Flat-ccs tests
  * Functionality: block-copy
+ * Feature: flat_ccs_mapping
  *
  * SUBTEST: block-copy-compressed
  * Description: Check block-copy flatccs compressed blit
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 8e43f691d..1d4fa8e72 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -6,7 +6,8 @@
 /**
  * TEST: Check flat-ccs eviction
  * Category: Software building block
- * Sub-category: Flat-ccs
+ * Mega feature: FlatCCS
+ * Sub-category: Flat-ccs tests
  * Functionality: ccs-evict
  * GPU requirements: GPU needs to have dedicated VRAM
  */
-- 
2.34.1

