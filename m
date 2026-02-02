Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA2FE73146
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 08:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C123810E3B4;
	Mon,  2 Feb 2026 08:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpQO36gw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DEA10E3B4
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 08:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770021418; x=1801557418;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mDPkPM48EsM+6l2BbKp9wqprkW1Q+ZbDSsDMigOXHvQ=;
 b=kpQO36gwuls6JU0GLBxuiBDGOzE/GqDhW/Lf0XGMqNbd8w+htPeB9nWr
 HVr6I+8vqIOyG3gzNtq5LSgKPM1P+vS7vWk5tZXEoWten5LKPEKFd4mxb
 tvMBQae4SXAmh/RvBGwb3XWkaxCnvzdGNTAlSSPr/3u3PwP+aNGnyqJM7
 7gLolQSUnV24WMxVdUQHWOcVky7SLzeDePlMvdBFS2lWas2CY7Attuae/
 CRM8sXFngJm65j6T4O85bJ9I69wuY/pvKQjItpgJ5bS9YBUQALGfjTjN1
 oc0HHcN9O0/QWykhq6ibi9NciYtWSSHhbTAQ+yg2NS0bJmCax2UA/LMWs g==;
X-CSE-ConnectionGUID: XV0CgOCtR/mUbFeyfKzETw==
X-CSE-MsgGUID: KaJzZd4UTx6UsKMxDB8rcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71259763"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71259763"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:36:58 -0800
X-CSE-ConnectionGUID: OiFogmA+Spicvl+d9myZaw==
X-CSE-MsgGUID: 4m3ku0vMTkK8ewrkJRR5aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209317400"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:36:57 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 1/2] intel-ci: Add valid skips on kms_plane to display
 blocklist
Date: Mon,  2 Feb 2026 14:02:59 +0530
Message-ID: <20260202083300.647462-1-karthik.b.s@intel.com>
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

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/xe.bmg.display.blocklist.txt | 2 ++
 tests/intel-ci/xe.lnl.display.blocklist.txt | 3 ++-
 tests/intel-ci/xe.ptl.display.blocklist.txt | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

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

