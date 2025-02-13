Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB605C0219D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 13:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7269F10E3F2;
	Thu, 13 Feb 2025 13:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VV1bdXsq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8A710EA93
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739452978; x=1770988978;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WCsa03n/j86I6DC9zZhWIF1dc4BzepmXlvdJz4vdgyo=;
 b=VV1bdXsqPm0o6vMtLTHHn9GTjyvDw3mMMSxN9JTGPCDhbJkw1foOfwRg
 s4rfma5f16CicQCria91JIWG5/2Cem6uryJmvTGH4/nJ7ODfsJIgTvLlG
 95PZQ94XaGnntEjqXSJ5O3LCAWl0VReRo+nGror2tI6uqMOkMunDgSgOn
 d1Ouh5ZWVkHkV1B+PR6kGBV/VPl/g7idWirvfmMdadCsqY1vXY0a4Qqck
 bQnhfi9hwKDqTxdxRGYac/K5PtI9QkngUD11f/Zu6iltbbYG8QXibDwLt
 IxOxCZhAfAjep0kVK9nRN3ZNAWnD7hldfOf2g0u6DTR+qihMI1azhsoCQ w==;
X-CSE-ConnectionGUID: eUofOS7NRYK8FvLCefMc4A==
X-CSE-MsgGUID: HhM4fiFeRJ+awSV8l9XIzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="27750377"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="27750377"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:22:58 -0800
X-CSE-ConnectionGUID: DIsHlkohSxqRnNca8FJJng==
X-CSE-MsgGUID: hWoKy8TVTx+CvlikeAb3Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136369904"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:22:56 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci: Add kms_sysfs_edid_timing to blocklist
Date: Thu, 13 Feb 2025 18:58:02 +0530
Message-Id: <20250213132802.357921-1-swati2.sharma@intel.com>
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

Add kms_sysfs_edid_timing to blocklist. Test was written with the
idea that edid read shouldn't take an unreasonable amount of time.
The timeout is an arbitrary value because it depends on when the
display responds and, in some cases, especially when the display
is coming back from sleep, it can take quite a while. This test
has sporadic behavior across various platforms connected to
different displays.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/blacklist.txt    | 10 ++++++++++
 tests/intel-ci/xe.blocklist.txt |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 1236b8280..9917bf46a 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -151,3 +151,13 @@ igt@kms_ccs@.*-4-tiled-xe2-ccs
 igt@kms_frontbuffer_tracking@plane-fbc-rte
 igt@kms_pm_dc@deep-pkgc
 igt@kms_vrr@cmrr
+
+###############################################
+# Test was written with the idea that edid read shouldn't take an
+# unreasonable amount of time. The timeout is an arbitrary value
+# because it depends on when the display responds and, in some cases,
+# especially when the display is coming back from sleep, it can take
+# quite a while. This test has sporadic behavior across various
+# platforms connected to different displays.
+###############################################
+igt@kms_sysfs_edid_timing
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 6964628f1..80ceba9a5 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -80,6 +80,15 @@ igt@kms_pm_rpm@cursor.*
 ##################################################################
 igt@kms_prime@.*
 ##################################################################
+# KMS: Test was written with the idea that edid read shouldn't take an
+# unreasonable amount of time. The timeout is an arbitrary value
+# because it depends on when the display responds and, in some cases,
+# especially when the display is coming back from sleep, it can take
+# quite a while. This test has sporadic behavior across various
+# platforms connected to different displays.
+##################################################################
+igt@kms_sysfs_edid_timing
+##################################################################
 # KMS: Non-Intel tests
 ##################################################################
 igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
-- 
2.25.1

