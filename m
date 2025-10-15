Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08B2CCD18E
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 06:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6139310E264;
	Wed, 15 Oct 2025 06:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnxYhae/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D9D10E264
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 06:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760509780; x=1792045780;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+U902Bps+bV8n8CyeNRMSrPSCyIEVcmPoxJrgYzG1Bo=;
 b=nnxYhae/aL0SaZHjlNXZOPPEymfREdOWwvGJmCN63ZF3Yw/aGe8EN15m
 5+nIEWm1nYg+vUMWFpHeWh5G7AMSArfpCdVQ4PszwpKbwi7O001f1AJL5
 vcmxv0ztGpp4mWdn6hLpNu7OSn+pQR/ufeRpeTzgBp9tc3VIAHSV2TBzC
 s1AmJby/htgfzqMmMMU34yTK/qZeihGOLHpTzlupKqFZNSXTvv5LjBkhR
 N9fcibRCPwrc2HYwrYp8/nj+M1Z4A0Pc9MIqRJsvVxY+aqDoDFDqAcS3w
 FUNIsTAZ38KX8Q4PA0NwsNKFTQSgT0Z79CfrB+zY4vkA+IicbcOtESNRV g==;
X-CSE-ConnectionGUID: IZcGQfIdTha9J59+Ll2fVw==
X-CSE-MsgGUID: DFYoSe2tRv6a2pM5D91ZZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66503635"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66503635"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 23:29:40 -0700
X-CSE-ConnectionGUID: 0YX2Cm6MQV+1SV0cu3NecA==
X-CSE-MsgGUID: oAomStFrR56YHVtdhuWOTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="182559268"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 23:29:38 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 0/2] tests/kms_vrr: Dynamically verify LOBF across
 vrefresh steps
Date: Wed, 15 Oct 2025 11:59:20 +0530
Message-ID: <20251015062922.447336-1-ramanaidu.naladala@intel.com>
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

Conditional logging applied. Replace the static LOBF check with
iterative vrefresh stepping to detect LOBF enablement.

Naladala Ramanaidu (2):
  tests/kms_vrr: Dynamically verify LOBF across vrefresh steps
  tests/kms_vrr: Reduce unnecessary logging in specific test cases

 tests/kms_vrr.c | 54 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 16 deletions(-)

-- 
2.43.0

