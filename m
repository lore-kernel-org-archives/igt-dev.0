Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7015C3DA7F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 10:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9106910E012;
	Fri, 26 Jul 2024 10:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/C7K0/F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD91C10E012
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 10:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721988231; x=1753524231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a00bqdH+VToWFJmNfqX4HZ8KM6Tj2Sj7ozCooKbiY/U=;
 b=h/C7K0/F9GM3nwWL6KxjL2HvmFZ0Lu6MJs/y24YrE2+Rqw3cy1bPjhTG
 7dK5CgcdGJ8zRyRSkBTFpGjZK5+RNG4il36ro0Kh7lMKp/Yr238LwePZu
 x4u7rHWzv1tkyXDGu1y7D8AVQtwnkLrJClOnm3QYFAd1pa7SnpNfH6FHL
 EwJnQU+zytgeVbeudXVMpq781rokDWMGI/er5hxiLnNghxX3uh2HNj65c
 Fz7M/Cm7jXv4AG4SO5cn/3CeLFZ6XUdWLf84SMfPtV3+Ms6/acdwMtKNP
 azokZ/AtAjHsi6jJFUg34/D4dOk/FZh+YE2zhXdla5RugUogsQlAvpuWP Q==;
X-CSE-ConnectionGUID: z0kxPAtmRB2EPGL7tkkWrw==
X-CSE-MsgGUID: TcMQREDIQ4aBWaO2yT5L2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="22689727"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="22689727"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 03:03:50 -0700
X-CSE-ConnectionGUID: Bsmpb5k7SyusoLJwStuTQA==
X-CSE-MsgGUID: hHHHG98qSV2nycUOaFDrKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="58008660"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 03:03:48 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, suraj.kandpal@intel.com, kamil.konieczny@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 0/4] Improvise-the-deep-pkgc
Date: Fri, 26 Jul 2024 15:37:47 +0530
Message-ID: <20240726100751.918038-1-ramanaidu.naladala@intel.com>
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

Naladala Ramanaidu (4):
  tests/intel/kms_pm_dc: Update test_deep_pkgc_state function
  tests/intel/kms_pm_dc: Update test duration to 4 seconds
  tests/intel/kms_pm_dc: Add polling for deep-pkgc
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 164 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 269 +----------------------
 tests/intel/kms_pm_dc.c                  |  41 ++--
 3 files changed, 29 insertions(+), 445 deletions(-)

-- 
2.43.0

