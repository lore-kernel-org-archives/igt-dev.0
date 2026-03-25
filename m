Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59760106B518
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 12:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0866010E6F5;
	Wed, 25 Mar 2026 12:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmDslm2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B5110E6E3
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 12:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774441439; x=1805977439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4dpDTUgMXV8YDUGlDtvOz4Pkyo6Sbx59zNKhbYBbXss=;
 b=UmDslm2W9cmOabmfe9z3guighsU/ULTb38b3ETpC8WEfuJzmO2Cct5q0
 9MhEq4T8IJfGeEKJmWYXv4RwbgKxEF8iAbw83fTQyrZv2sHPgle9r1ca3
 4GIhID0/oRJMFz6ws2LLgCTMBDMCc1qjcZ/jFxUlleQ6wyiZkuI44V3vM
 z0REb0r+1f0CQSAL9T5NlgGlka62mI3i7qLn8F3jcoUxSr3JY8FgdVP2W
 AXsXSMeGbEDwB8zR7E5+VmFNkkR8PiD54zM0Il+5wGH+tvcKd3K4v/yFo
 KWFcgJlcomk7lZK/cGJ+kLfyP0RMHEllotM7/k471h+TErYq2K3upgMnr g==;
X-CSE-ConnectionGUID: wNnsFZQ/QfuAglJ5ERbkqw==
X-CSE-MsgGUID: 7UjsHUHqQlunmWyWEaIbyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75498148"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75498148"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:23:59 -0700
X-CSE-ConnectionGUID: myOI21FGSkm8T5ehPU+RWA==
X-CSE-MsgGUID: EMIzjI6DScuFfglya2ZgZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="229442860"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:23:57 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] intel-ci: Blocklist BMG specific modifiers on NVL/PTL
Date: Wed, 25 Mar 2026 18:02:37 +0530
Message-Id: <20260325123237.692836-1-swati2.sharma@intel.com>
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

v2: -Add bmg-ccs tests to blocklist (Karthik)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/xe.nvl.display.blocklist.txt | 4 ++--
 tests/intel-ci/xe.ptl.display.blocklist.txt | 8 +++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
index 15ad4345a..5d8398918 100644
--- a/tests/intel-ci/xe.nvl.display.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
@@ -62,9 +62,9 @@ igt@kms_scaling_modes@scaling-mode-none
 ##############################################################################
 igt@kms_ccs@.*-dg2-.*
 igt@kms_ccs@.*-mtl-.*
-igt@kms_flip_scaled_crc@.*dg2rcccs.*
 igt@kms_ccs@.*4-tiled-bmg-ccs
-igt@kms_plane@pixel-format.*(mtl|dg2).*
+igt@kms_flip_scaled_crc@.*dg2rcccs.*
+igt@kms_plane@pixel-format.*(mtl|dg2|bmg).*
 ##############################################################################
 # Valid skip: Valid for display ver < 13
 ##############################################################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index aaf7eb1ef..99758c2ec 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -67,12 +67,13 @@ igt@kms_writeback@.*
 ##############################################################################
 igt@kms_scaling_modes@scaling-mode-none
 ##############################################################################
-# Valid skip: DG2 & MTL specific
+# Valid skip: DG2 & MTL & BMG specific
 ##############################################################################
 igt@kms_ccs@.*-dg2-.*
 igt@kms_ccs@.*-mtl-.*
+igt@kms_ccs@.*4-tiled-bmg-ccs
 igt@kms_flip_scaled_crc@.*dg2rcccs.*
-igt@kms_plane@pixel-format.*(mtl|dg2).*
+igt@kms_plane@pixel-format.*(mtl|dg2|bmg).*
 ##############################################################################
 # Valid skip: Valid for display ver < 13
 ##############################################################################
@@ -123,9 +124,6 @@ igt@kms_bw@linear-tiling-.*-display.*
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

