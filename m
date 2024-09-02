Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBBBCD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 09:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC0010E261;
	Mon,  2 Sep 2024 09:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3aliix9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A966610E265
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725267615; x=1756803615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l8ybMKI/VpGJ7CY3lwqtq0pxZ4IdGzKedJ5tvVqkwmM=;
 b=l3aliix97hNDZH+KyS9HIPbtYkdNUG4D8bxnYgoPejSSb7LqRbVehayx
 Q5uw8l1gwXFYzGoT6uWU0nhv5maiCZGRr1BtAPW92ZHviXKjnh+njyqJu
 bfEPVMXyim4cn87ko3TliGOk4rYPORtHNN8+13HAFPiajHmsOiKt/sV2+
 QzUpUA5tv5RPfbi/U+cdAepV85PrD/QycCIpDLk51CTh04XezDErExVAc
 rXy9ePKRMmilCcIbdjYOTLpBXKbMR+SRS4SP8YRFl7acHMu6EIyCJ+qVb
 6jwyo1fKu2X9K69ulHLfJltmu6uKvOYWKGTAAlXWSksla0IRkDD9YNApO A==;
X-CSE-ConnectionGUID: vCSWThD5St+4vKQ/Kgp0xQ==
X-CSE-MsgGUID: wBPhCXXJR32Al6VSX81HPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41316171"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="41316171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:00:14 -0700
X-CSE-ConnectionGUID: inityxoQRO+mHmGH32pilA==
X-CSE-MsgGUID: V1D3Ee1HQCCXZ82g7K/SJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64749641"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 02:00:12 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 0/4] Improvise-the-deep-pkgc
Date: Mon,  2 Sep 2024 14:29:39 +0530
Message-ID: <20240902085943.1496088-1-ramanaidu.naladala@intel.com>
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

 tests/intel/kms_pm_dc.c | 49 ++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 15 deletions(-)

-- 
2.43.0

