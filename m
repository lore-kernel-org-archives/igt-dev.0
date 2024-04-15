Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7A7C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 08:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34131123A0;
	Mon, 15 Apr 2024 08:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6dKewIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5968B11239C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713170522; x=1744706522;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hlBGiHmtaaPjzNanuhiXAdAH/9psm9IqC/vh+6mE4+s=;
 b=Y6dKewIMzZ74rR/uSNV/Ist5lzjV4/LwkqhF2Tb64sipVKm/WiEFbm/b
 gXmuKIM6xAm6KMUTbg/e0ouqnLAnb/z69QyKdptI6XidoKTdz9PvfuAbg
 lYLFMPKUtC23QG9HT72Cyf691fN/CdYBTwejMKKWRZHFrQd1atmMz/uZk
 mZNsMSIF/3kMadz4vhcvW7aljZnYI3iNwIESTzTxxQtT8Gy89s7jfJ/HN
 //1qjDrNcavx0nhtfZatn5dXS2YL+gQu1LrQNPBSiekBivIaR2CUPfa6s
 c6PLF0YvvkDVVQrYuWVH7My41COIiP4IWZolUDaNcVobCNqFIQ4nKZ13M Q==;
X-CSE-ConnectionGUID: BcYAWZLsRVWRenM5uhGELw==
X-CSE-MsgGUID: /on2CRWbT2y3Ly/wPF/4OQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="12395208"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="12395208"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 01:42:01 -0700
X-CSE-ConnectionGUID: 90kN+D6NRGuaw/tBoZMPEA==
X-CSE-MsgGUID: pjCcpwAQQYiShrpT5u1n6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="21941379"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2024 01:41:59 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH i-g-t 0/3] tests/intel/xe_pm: Tests to validate vm-bind with
 S&R
Date: Mon, 15 Apr 2024 14:10:32 +0530
Message-Id: <20240415084035.2603-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

This patch series has following changes:
1. Validate functionality of VM_BIND USERPTR/PREFETCH op with S&R
2. Test vm_unbind op by binding multiple va's to a vm and check the
functionality with S&R.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (3):
  tests/intel/xe_pm: Test validates vm-bind userptr flag with suspend
    and resume
  tests/intel/xe_pm: Validate vm-bind prefetch flag with suspend and
    resume
  tests/intel/xe_pm: Tests vm-unbind all flag functionality with S&R

 tests/intel/xe_pm.c | 107 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 87 insertions(+), 20 deletions(-)

-- 
2.39.1

