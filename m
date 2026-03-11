Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CEE106286B
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 11:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAD789EAC;
	Wed, 11 Mar 2026 11:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZyNA1gn";
	dkim-atps=neutral
Received: from mgamail.intel.com (unknown [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E479C89EAC
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 11:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773230074; x=1804766074;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DQI2bspqgLRwDsJaM5N5rOv3qt50uku1P6mdxxVlNDA=;
 b=gZyNA1gntjjeiR3SQ+FeQ+aUcKQFWKjTC/uMl0i+Hx9KvNVSIJyEDI1G
 1zssfuiIIuVeQujw4/6ZpyXs+xD5udC7E9NEBSFSIRfkaqFW8aNutA6xs
 iSJcEp/AHCPc1BXSrgYl9lRvURXubIh5nsgnigp5AZOlrTMUyIxxy1HHS
 NGNJsIK3NlClKXzCe6MIvOTx2+wsLh5psyrXkqOkMX06opiht2CddieFK
 VSehQRm/p2Wra81NXooFsuJ4EHo37D2rZwKc3SWdtCTGIC1Wt7R2OPDDz
 Q9v3E5diMeX1oRozDaeIa6zVcQZs0liYlebVh34u6nzmBGzpDqGSIdLP4 w==;
X-CSE-ConnectionGUID: vBeR+c0fTAuBywOJ37mi5w==
X-CSE-MsgGUID: rP0VhiXgS6KnzJLRp6RR9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74333601"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74333601"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:54:24 -0700
X-CSE-ConnectionGUID: dx7ZcRU+T0erOuRcASpfmA==
X-CSE-MsgGUID: HkTd+qe9StmZhKlCqE2KkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="258354787"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:54:22 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] intel-ci: Blocklist BMG specific modifiers on NVL/PTL
Date: Wed, 11 Mar 2026 17:33:00 +0530
Message-Id: <20260311120300.577179-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

The 4-tiled BMG CCS modifier is not supported on NVL/PTL platforms,
making these skips expected. Blocklist to avoid CI noise.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/xe.nvl.display.blocklist.txt | 3 +--
 tests/intel-ci/xe.ptl.display.blocklist.txt | 7 ++-----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
index 15ad4345a..814e79928 100644
--- a/tests/intel-ci/xe.nvl.display.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
@@ -63,8 +63,7 @@ igt@kms_scaling_modes@scaling-mode-none
 igt@kms_ccs@.*-dg2-.*
 igt@kms_ccs@.*-mtl-.*
 igt@kms_flip_scaled_crc@.*dg2rcccs.*
-igt@kms_ccs@.*4-tiled-bmg-ccs
-igt@kms_plane@pixel-format.*(mtl|dg2).*
+igt@kms_plane@pixel-format.*(mtl|dg2|bmg).*
 ##############################################################################
 # Valid skip: Valid for display ver < 13
 ##############################################################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index aaf7eb1ef..9b192d67c 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -67,12 +67,12 @@ igt@kms_writeback@.*
 ##############################################################################
 igt@kms_scaling_modes@scaling-mode-none
 ##############################################################################
-# Valid skip: DG2 & MTL specific
+# Valid skip: DG2 & MTL & BMG specific
 ##############################################################################
 igt@kms_ccs@.*-dg2-.*
 igt@kms_ccs@.*-mtl-.*
 igt@kms_flip_scaled_crc@.*dg2rcccs.*
-igt@kms_plane@pixel-format.*(mtl|dg2).*
+igt@kms_plane@pixel-format.*(mtl|dg2|bmg).*
 ##############################################################################
 # Valid skip: Valid for display ver < 13
 ##############################################################################
@@ -123,9 +123,6 @@ igt@kms_bw@linear-tiling-.*-display.*
 ##############################################################################
 igt@kms_getfb@getfb2-accept-ccs
 ##############################################################################
-# BMG modifiers are valid skips for PTL
-##############################################################################
-igt@kms_ccs@.*4-tiled-bmg-ccs
 ##############################################################################
 # Expected fail on current CI config
 ##############################################################################
-- 
2.25.1

