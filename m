Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58A0CD0430
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 03:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7813C10E458;
	Tue,  6 Jan 2026 03:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Flveeaxc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D3A10E458
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 03:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767669898; x=1799205898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S41XDF7rMPf/2BAX+R3tZGPIkeh1bc/PA9UNlfwi/aY=;
 b=FlveeaxcqLV48YSujLAirGbyTqLulzCPWvgIxZk/0ZFnganeTcpmP2Ev
 FSZX6JlHmm0Vpht3clKbZBjT4DymC+d+/7i+QLMwltzLurfH/27jt7DmD
 c4qy2JQUnX6Dtoz3TfOdaOYnieL2KLOoanVt9toV5/f5OXmakRpoW9dYz
 ZwPEFAvAdof9n/yD2UBxPAYRVuYQx4YmeEOUkeDlt0SPWCYs9Rf2utnVc
 T7bj109DbcGQ+ovZD2s/og6OWikVwxuf0QgnUhrOwMKAFdFkw5EAM8m7+
 Dtm+Rap4R6Gbxa7ABXwRLRxbJMIVKmjFT+xc1y2ONXlSwmv6E+gXZL1uL A==;
X-CSE-ConnectionGUID: fO5k3MamS4GtyV1+pCgTnw==
X-CSE-MsgGUID: 2o+apdskQt2hQJZ/oqBwaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79342118"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="79342118"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 19:24:58 -0800
X-CSE-ConnectionGUID: fDCVbrjLSB2+WoF5T+mZVQ==
X-CSE-MsgGUID: tCLsQN4zS3KNnEWx518IMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207429645"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 19:24:56 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>,
	Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] intel-ci: Update display blocklist
Date: Tue,  6 Jan 2026 08:54:39 +0530
Message-ID: <20260106032440.30128-1-jeevan.b@intel.com>
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

Add y/yf tile kms_pipe_stress subtests to the blocklist for BMG/LNL,
and add the kms_pm_rpm@package-g7 subtest as it's not supported on iGPU.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/xe.bmg.display.blocklist.txt | 2 +-
 tests/intel-ci/xe.lnl.display.blocklist.txt | 6 ++++++
 tests/intel-ci/xe.ptl.display.blocklist.txt | 5 +++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index d6af8e2b4..5a03dc9de 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -10,7 +10,7 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
 igt@kms_flip_scaled_crc@.*(yf|y)tile.*
 igt@kms_async_flips@invalid-async-flip
 igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
-igt@kms_pipe_stress@.*ytiled$
+igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
 #########################################
 # Valid skip :- 90/270 rotation is not supported
 ##########################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index cd1e6d19c..4151582f6 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -10,6 +10,7 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
 igt@kms_flip_scaled_crc@.*(yf|y)tile.*
 igt@kms_async_flips@invalid-async-flip
 igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
 #########################################
 # Valid skip :- 90/270 rotations are not supported
 ##########################################
@@ -173,3 +174,8 @@ igt@kms_vrr@seamless-rr-switch-drrs
 igt@kms_vrr@seamless-rr-switch-vrr
 igt@kms_dirtyfb@drrs-dirtyfb-ioctl
 igt@kms_frontbuffer_tracking@.*drrs.*
+########################################
+# Valid Skip : Not supported on igfx
+########################################
+igt@kms_pm_rpm@package-g7
+########################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index 27261fa00..ba784140e 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -172,3 +172,8 @@ igt@kms_vrr@seamless-rr-switch-drrs
 igt@kms_vrr@seamless-rr-switch-vrr
 igt@kms_dirtyfb@drrs-dirtyfb-ioctl
 igt@kms_frontbuffer_tracking@.*drrs.*
+#########################################
+# Valid Skip : Not supported on igfx
+#########################################
+igt@kms_pm_rpm@package-g7
+#########################################
-- 
2.43.0

