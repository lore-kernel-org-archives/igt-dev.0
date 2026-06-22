Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C07CCD98F6
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 05:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3F210E498;
	Mon, 22 Jun 2026 05:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/l0vrI0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FD010E498
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 05:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782105410; x=1813641410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hRNNo+GgBCEXDPPQE/RDB0mOQuAsTBnZA/ilchaAUEA=;
 b=c/l0vrI0RbkQfclTHNHQda22lZyc60g1rsriTQ42NK8OOYn2AmEp/h5U
 1eV0Urt5DhRLB28uEh0tJXJ4grC9Gp3fp473CeJZ4WxPkHemWNYQLoWZv
 uAuk+ukXjnIwV3D4Hataf1Y/oGLzzVLMPPQGrUHTZqgZvA6CmR9qskSgM
 2fQ49SIQWg6a6BMW9aUbAdbDXqryE7vyE/46k3nSbPPe0n7WqqoMbU2AC
 HEhsqyZTYKvNnI+H+blVyXd96deQAFQV1+W/IEyO6zPMwyhTNF3Vo53S7
 qF2KwgkKkSp1KVOaV0dLk78ZaD3pLIVSgusKtPPcUTfhbGv2GNv2oB4Ne A==;
X-CSE-ConnectionGUID: mClvVjyVSyqe6HaY6i7v7Q==
X-CSE-MsgGUID: iDygY5CFTo679wLzrfd9zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="100260122"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="100260122"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 22:16:50 -0700
X-CSE-ConnectionGUID: PajNdpxnQqW8IWLbsCJaog==
X-CSE-MsgGUID: nzLtidupRdCW2yr2X1QIxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="279324273"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 22:16:49 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] intel-ci: Add dc3co tests to LNL, PTL,
 BMG and I915 blocklist
Date: Mon, 22 Jun 2026 10:46:41 +0530
Message-ID: <20260622051641.3007639-1-jeevan.b@intel.com>
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

dc3co tests are only valid on display ver 35 and above. Block these
subtest on older platforms.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/i915.blocklist.txt           | 2 ++
 tests/intel-ci/xe.bmg.display.blocklist.txt | 3 ++-
 tests/intel-ci/xe.lnl.display.blocklist.txt | 3 ++-
 tests/intel-ci/xe.ptl.display.blocklist.txt | 6 ++----
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index 1068e2e15..17b2f1f3f 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -206,4 +206,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
 ##################################################################
 igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
 igt@kms_flip_scaled_crc@.*linear-reflect-x
+igt@kms_pm_dc@dc3co-.*
+igt@kms_vrr@lobf-dc3co
 ##################################################################
diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index 04f23af28..4c2a7390a 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -121,7 +121,6 @@ igt@kms_plane@pixel-format.*(mtl|dg2).*
 ##########################################
 # Valid skip :- Simulation specific
 ##########################################
-igt@kms_pm_dc@dc3co-vpb-simulation
 igt@kms_simulation_hpd@sim-hpd
 #########################################
 #########################################
@@ -179,4 +178,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
 ########################################
 igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
 igt@kms_flip_scaled_crc@.*linear-reflect-x
+igt@kms_pm_dc@dc3co-.*
+igt@kms_vrr@lobf-dc3co
 ########################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index 5f918a003..1dbb24ae3 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -91,7 +91,6 @@ igt@kms_plane@pixel-format.*(mtl|dg2).*
 ##########################################
 # Valid skip :- Simulation specific
 ##########################################
-igt@kms_pm_dc@dc3co-vpb-simulation
 igt@kms_simulation_hpd@sim-hpd
 #########################################
 # HDMI/VGA subtests on chamelium are
@@ -189,4 +188,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
 ########################################
 igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
 igt@kms_flip_scaled_crc@.*linear-reflect-x
+igt@kms_pm_dc@dc3co-.*
+igt@kms_vrr@lobf-dc3co
 ########################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index c897f3c69..1041931a1 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -88,10 +88,6 @@ igt@kms_plane_scaling@.*downscale-factor-0-25.*
 igt@kms_plane_scaling@planes-downscale-factor-0-(5|75)$
 igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
 ##############################################################################
-# Valid skip: Simulation specific
-##############################################################################
-igt@kms_pm_dc@dc3co-vpb-simulation
-##############################################################################
 # Feature Currently not supported
 ##############################################################################
 igt@kms_pm_power_saving@.*
@@ -183,4 +179,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
 ########################################
 igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
 igt@kms_flip_scaled_crc@.*linear-reflect-x
+igt@kms_pm_dc@dc3co-.*
+igt@kms_vrr@lobf-dc3co
 ########################################
-- 
2.43.0

