Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640E6C982EE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 12:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42E410E170;
	Mon, 21 Sep 2026 12:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O692nRJf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3707410E170
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 12:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789993471; x=1821529471;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zc1kMoLBwmP5blrFeDgaaJOt58Chba7B8E4t3S1CK0w=;
 b=O692nRJf0MLJOsKwJ38JakA7YeR8cctFemMqvcEOC0TRXDgaPy+ihRDr
 TD5Vp0ez6KOV6TfZ9Ec7Z8Dr5lQcjCJ+c0D9/55DUal48DDQgKDKQJm6h
 2kiR5l7iF6A54+gzmRaf6D2KrDzSGKdP9O1ZbaqNAwi2NdH1S+GstiANX
 CCnpXUPMAGQTGLHTDxU2MLe/amYJWtvS7lTSKSmCQUMrIzsAc/Q59Ms6j
 x6wo53W/c6C/q8ipG+yLjGoTJZJcpd8cHD6F/9RwvSZVfpKkeak8iPsko
 vtOmCNcZDz23Z4K2RsQyNVgJkIJdpIpc5sHvvTPrW6VtnSWOg0nBMRC77 w==;
X-CSE-ConnectionGUID: 58O82CqEQbyeip+dyFPRoA==
X-CSE-MsgGUID: HZoAAwOwSTmej+MxoRsS3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89637170"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="89637170"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:24:31 -0700
X-CSE-ConnectionGUID: sc04at4KSdeJM2CSwHJ6TA==
X-CSE-MsgGUID: QzSsFUeHS26x4yWA2EfUrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="272791471"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 05:24:30 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] intel-ci: Add fixed-matrix chamelium tests
Date: Mon, 21 Sep 2026 18:03:42 +0530
Message-Id: <20260921123342.1068658-1-swati2.sharma@intel.com>
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

Extend chamelium-only testlist with fixed-matrix yuv-rgb
conversion tests for BT2020/BT601/BT709.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/chamelium-only.testlist | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index 898c53134..6b395e8da 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -16,6 +16,18 @@ igt@kms_chamelium_color@degamma
 igt@kms_chamelium_color@gamma
 igt@kms_chamelium_color_pipeline@plane-ctm3x4
 igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d
+igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020
+igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim
+igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d
+igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d
+igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601
+igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim
+igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d
+igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d
+igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709
+igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim
+igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d
+igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d
 igt@kms_chamelium_color_pipeline@plane-lut1d
 igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4
 igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d
-- 
2.25.1

