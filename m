Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08691EA7945
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 03:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2EF10E79D;
	Thu,  5 Feb 2026 03:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F9MSRq2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B2C10E79D
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 03:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770263120; x=1801799120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9gIM9nPDGEnv1GMHCkQEilNy340EtETuz+YqHgikN5s=;
 b=F9MSRq2GkNHFyDwJraf6T2aRaaJUFAUBcDvds3oVU632VnzQ+xSqX7sd
 HGqVWIDhysYUlftXTDzgScqHkii+Q81lqjSTiO++nT/ZcgfdJz5opSrHs
 CjpYQU05Re/Bb8bc0j+bGGeI0UW9nEg8r/FIdSR6fMXbhVqT/yx5S8Qyv
 IgX2ycV166idfZEffS8qAxdb8T7GgsrtgKkZU/qhnCoD2FHMl3do3xgn9
 nilqG4ufMOMxycq+Hhfb39xYm/Sz+D/PuZw5caWnA1UnCqjWfQ8U4ILXc
 mFOlKLYkSIFEGLxVG6mpZL6BhHnmrwCgSpuRCRqozkPOhzwB3takkYH7H A==;
X-CSE-ConnectionGUID: 3y7zsEXiQWu22TvWjJ1Xgg==
X-CSE-MsgGUID: psOSdYTjTem5EDeyPOiK9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71353126"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71353126"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:45:20 -0800
X-CSE-ConnectionGUID: 1dxIurBQQOqK1WR1CPRRgA==
X-CSE-MsgGUID: FBOndicnQ6m1H1YYHZWKmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214886940"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:45:18 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 1/3] intel-ci: Add valid skips on kms_plane to
 display blocklist
Date: Thu,  5 Feb 2026 09:11:18 +0530
Message-ID: <20260205034120.793193-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

Multiple kms_plane@pixel-format-* are skipping as those modifiers are
not on bmg,lnl and ptl. Add these subtests into relavent blocklists.

v2: Add these on nvl blocklist. (Swati)

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/xe.bmg.display.blocklist.txt | 2 ++
 tests/intel-ci/xe.lnl.display.blocklist.txt | 3 ++-
 tests/intel-ci/xe.nvl.display.blocklist.txt | 3 +++
 tests/intel-ci/xe.ptl.display.blocklist.txt | 3 +++
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index 2c0c4a0e8..86c1bbd72 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -11,6 +11,7 @@ igt@kms_flip_scaled_crc@.*(yf|y)tile.*
 igt@kms_async_flips@invalid-async-flip
 igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
 igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
+igt@kms_plane@pixel-format-(y|yf)-tiled.*
 #########################################
 # Valid skip :- 90/270 rotation is not supported
 ##########################################
@@ -116,6 +117,7 @@ igt@kms_ccs@.*-dg2-.*
 igt@kms_ccs@.*-lnl-.*
 igt@kms_ccs@.*-mtl-.*
 igt@kms_flip_scaled_crc@.*dg2rcccs.*
+igt@kms_plane@pixel-format.*(mtl|dg2).*
 ##########################################
 # Valid skip :- Simulation specific
 ##########################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index d92e12d64..d280fb16a 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -11,6 +11,7 @@ igt@kms_flip_scaled_crc@.*(yf|y)tile.*
 igt@kms_async_flips@invalid-async-flip
 igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
 igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
+igt@kms_plane@pixel-format-(y|yf)-tiled.*
 #########################################
 # Valid skip :- 90/270 rotations are not supported
 ##########################################
@@ -85,7 +86,7 @@ igt@kms_ccs@.*-dg2-.*
 igt@kms_ccs@.*-mtl-.*
 igt@kms_flip_scaled_crc@.*dg2rcccs.*
 igt@kms_ccs@.*4-tiled-bmg-ccs
-
+igt@kms_plane@pixel-format.*(mtl|dg2).*
 ##########################################
 # Valid skip :- Simulation specific
 ##########################################
diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
index 749514129..15ad4345a 100644
--- a/tests/intel-ci/xe.nvl.display.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
@@ -10,6 +10,7 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
 igt@kms_flip_scaled_crc@.*(yf|y)tile.*
 igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
 igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
+igt@kms_plane@pixel-format-(y|yf)-tiled.*
 ##############################################################################
 # Valid skip: Test skip due to hybrid config requirement
 ##############################################################################
@@ -63,6 +64,7 @@ igt@kms_ccs@.*-dg2-.*
 igt@kms_ccs@.*-mtl-.*
 igt@kms_flip_scaled_crc@.*dg2rcccs.*
 igt@kms_ccs@.*4-tiled-bmg-ccs
+igt@kms_plane@pixel-format.*(mtl|dg2).*
 ##############################################################################
 # Valid skip: Valid for display ver < 13
 ##############################################################################
@@ -103,6 +105,7 @@ igt@kms_rotation_crc@primary-4-tiled-reflect-x.*
 ##############################################################################
 igt@kms_(plane_lowres|plane_multiple|rotation_crc|big_fb|flip_scaled_crc)@.*(x-tile|xtile|tiling-x).*
 igt@kms_pipe_stress@stress-xrgb8888-xtiled
+igt@kms_plane@pixel-format-x-tiled.*
 ##############################################################################
 # Valid skip: DRRS not supported on LNL+
 ##############################################################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index e9d0775e7..bb5c83f15 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -19,6 +19,7 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
 igt@kms_flip_scaled_crc@.*(yf|y)tile.*
 igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
 igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
+igt@kms_plane@pixel-format-(y|yf)-tiled.*
 ##############################################################################
 # Valid skip: Test skip due to hybrid config requirement
 ##############################################################################
@@ -71,6 +72,7 @@ igt@kms_scaling_modes@scaling-mode-none
 igt@kms_ccs@.*-dg2-.*
 igt@kms_ccs@.*-mtl-.*
 igt@kms_flip_scaled_crc@.*dg2rcccs.*
+igt@kms_plane@pixel-format.*(mtl|dg2).*
 ##############################################################################
 # Valid skip: Valid for display ver < 13
 ##############################################################################
@@ -148,6 +150,7 @@ igt@kms_rotation_crc@primary-4-tiled-reflect-x.*
 ##############################################################################
 igt@kms_(plane_lowres|plane_multiple|rotation_crc|big_fb|flip_scaled_crc)@.*(x-tile|xtile|tiling-x).*
 igt@kms_pipe_stress@stress-xrgb8888-xtiled
+igt@kms_plane@pixel-format-x-tiled.*
 ##############################################################################
 # Not supported by current CI configs
 ##############################################################################
-- 
2.43.0

