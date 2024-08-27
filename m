Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAF2C54735
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 12:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36F010E305;
	Tue, 27 Aug 2024 12:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuAvI+bg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4086F10E305
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 12:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724762443; x=1756298443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0gpns3NErYqBAF5ZkIUkp9DDi00T8R+dEfP/O6o3fGI=;
 b=CuAvI+bgmLhsc8WSSN3Oo8uGJxoys8DZ+5CN6KHco6142xSSoVbaGn86
 S+oOM+UoPj2xuAC6fmvOhh66QWaENpDNP9J8wrbDFA9z1PfLGu8Rb+4nI
 w+ZuVCyZoHeR7OzQOFY6ZibGVSdPts62/lqy5/WK8HVPd0iiGEqRISuk6
 ejc1uhoYU6iDadfeP0OzhZd34b/IvU+PC3LKyhU6f5R0dFzFLED+jZKSZ
 KzxVr7x32HSV1BC+g6PE6ZgrG5xfXpFoeEt2taPZ6mJRVIE8sCpcq8m3y
 t+wx+NPHG+uGn9iHmuEg4sAkQ74obr8nwIs3xRaJ4SpAmqnlc0bu++IJq w==;
X-CSE-ConnectionGUID: 3U4n0WYkSW2f38CNApRB0w==
X-CSE-MsgGUID: yTuYV0K8Q4y8+9P0WGIPOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="27117241"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="27117241"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 05:40:43 -0700
X-CSE-ConnectionGUID: Llm2ax+tT62srfI9ISbdOA==
X-CSE-MsgGUID: 1f/lLmK9Q1ybYCPjzHKacg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62905818"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:40:41 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 0/4] Improvise-the-deep-pkgc
Date: Tue, 27 Aug 2024 18:10:14 +0530
Message-ID: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
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

This update improve deep pkgc. Add a check for the eDP connector
to ensure proper connector handling. Increase the test duration
to 4 seconds. Modify the loop to use igt_wait for better handling
of the package C-state counter read.

Naladala Ramanaidu (4):
  tests/intel/kms_pm_dc: Add time unit macros and update delay
    calculation
  tests/intel/kms_pm_dc: Update VRR handling and eDP output check
  tests/intel/kms_pm_dc: Update test duration to 4 seconds
  tests/intel/kms_pm_dc: Add polling for deep-pkgc

 tests/intel/kms_pm_dc.c | 51 +++++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 15 deletions(-)

-- 
2.43.0

