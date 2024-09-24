Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6C1CF9C6B
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 11:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6256310E266;
	Tue, 24 Sep 2024 11:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHJMeOXg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154B810E266
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 11:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727178470; x=1758714470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LEzYqNS13ugVwRWUY3m35YDeS860KFNB1HsNMGzrh98=;
 b=RHJMeOXgPv7U0lakstaEADSEKFd4CUhOv39KFGMvVHExJfhF+f0ujL8R
 UkpSIEe+i/mtZdRqJAt6pIvEP4d2RUy3fQueO7ESQGnj8KmugCxo6t5Nu
 IU0usQotiYs12Qrv/qSOsu3onpR4m6+Q2EQRrGdYPLXzn+ecaKAGfqAH5
 S4bDLlO338Vku9iYGu8ll4L9eWVsoumLzA4JVyu5ObhKXqC1SqlWkG1Sq
 RjFijqHsKLU0kf3fzq994AbSJcJaSAU0Jk8NNBfWMcY/vh3KrKCMZlHq1
 KLRgC9TBK2zDCJTD2Ha6Qkgon13I+c/t9JGEoHrgjlUUkwIFy3ir0QxVn A==;
X-CSE-ConnectionGUID: QB6I2txrQ8y2T3Esykmklg==
X-CSE-MsgGUID: 1tNWE9cwQouQbFUg3M/A4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26261772"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="26261772"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:47:50 -0700
X-CSE-ConnectionGUID: zBfZZycMT9WCZqTJe53PHA==
X-CSE-MsgGUID: deUaQfOdQ/Ohl+KFFzwXLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="71002811"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 04:47:48 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 0/2] tests/kms_plane_scaling: Cdclk exceeds max Cdclk
 issue fix
Date: Tue, 24 Sep 2024 17:17:06 +0530
Message-ID: <20240924114708.2100110-1-ramanaidu.naladala@intel.com>
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

This change will solve the cdclk exceeds max cdclk issue.

Naladala Ramanaidu (2):
  tests/kms_plane_scaling: Add mode override in scaling test
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 196 +++------------
 tests/intel-ci/xe-fast-feedback.testlist | 307 +++--------------------
 tests/kms_plane_scaling.c                |   1 +
 3 files changed, 67 insertions(+), 437 deletions(-)

-- 
2.43.0

