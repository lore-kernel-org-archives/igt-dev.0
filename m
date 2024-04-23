Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB83C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 10:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EF010FBC7;
	Tue, 23 Apr 2024 10:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ag8TAEko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DC110FBC7
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713869477; x=1745405477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TP8wxkpYKuMA+Sz+ODo45zL1S4y2bCiesa9cJ7FS908=;
 b=ag8TAEkoFUQrxMkNkfgD/IyvxY6v4WHUa1ESMFDBwMrf51+d4JqI0xhh
 YT/D+0tpr1VQ50a4evanM222DO27/nOI9ilMg32VCt/KgTq10Ea9EBr4Y
 Gf8E+XrC1DSKyKPbZnG/0z1Y+bE/yoVYQqDiaWSrzwtE/sV0FZDxDQmi0
 TS4i7OURJOMJQsZhVf1LVF2qAFj1/Ss/ce/OuiqPcqTnOME1Bk2eElVtJ
 WsGFY6G1nsJ6/Th5E+pwKi0QHU1lFvLwFo+6tgiumitULlvRLqNxy7VVQ
 X8OPulCFxsWcr7fDn/kLQzfo/NDjvH/Ieev1gNHSYhUpVJj2tni7g0eX9 g==;
X-CSE-ConnectionGUID: zUmZrNiITqSgmJZkXHVlkA==
X-CSE-MsgGUID: z5+YeXvhRtq/oKbx/t95Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20864797"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20864797"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:51:11 -0700
X-CSE-ConnectionGUID: oMV7eWfbR5qCsLvP61ocIQ==
X-CSE-MsgGUID: js2+tOloSAeHGYsqAPFQCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="47614696"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:51:09 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v2 11/16] tests/intel: Introduce Compression Mega feature
Date: Tue, 23 Apr 2024 10:49:08 +0000
Message-Id: <20240423104913.3559587-12-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
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

Add Compression mega feature to FlatCCS tests.
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
index a8e7e8a74..9b523dfec 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -19,10 +19,11 @@
 /**
  * TEST: gem ccs
  * Description: Exercise gen12 blitter with and without flatccs compression
- * Feature: flat_ccs_mapping
- * Sub-category: Flat-ccs
  * Category: Desktop \ Server
+ * Mega feature: Compression
+ * Sub-category: Flat-ccs tests
  * Functionality: block-copy
+ * Feature: flat_ccs_mapping
  *
  * SUBTEST: block-copy-compressed
  * Description: Check block-copy flatccs compressed blit
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 8e43f691d..34b59cb96 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -6,7 +6,8 @@
 /**
  * TEST: Check flat-ccs eviction
  * Category: Software building block
- * Sub-category: Flat-ccs
+ * Mega feature: Compression
+ * Sub-category: Flat-ccs tests
  * Functionality: ccs-evict
  * GPU requirements: GPU needs to have dedicated VRAM
  */
-- 
2.34.1

