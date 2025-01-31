Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC715C02194
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 19:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683A310E431;
	Fri, 31 Jan 2025 19:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9omZQP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EEB10E430
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 19:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738350055; x=1769886055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wDiYURF/JCJZWjIxIQzbqRo10HCgr+6jxYHs4rljgHs=;
 b=R9omZQP19m04Yl0wJMMwJ5iPwp4cCg2PFFje+lGhtiPRAbm6rsmonBkE
 Eq2FMRnEtzWw68EDFWuziTitfdqG/1OkuCjaKVVkz9XTMLMljbE7CWhXd
 26rCMvkEn8bQs5ZBu/kxemxpkuH24Pcxhl5g6hzaWvQjP/7GppyvNEz5I
 LdIe7zObVhub/DcSI3wHHKpVr17vvgg8fXs441Rxm0fuEzOzzJLFYU2Q2
 Rkq26qVwP33FAyiqxpQRnyzXqnE01e297Piynr31yakcN8PZyYp67y6zG
 ItJx3MG5heCfs8bT9htG7D+Rznmv7xFKFcpxXSg79pDq83qmI2gTADbsH w==;
X-CSE-ConnectionGUID: bN1ZXPO8SmW/EYzf4wDDng==
X-CSE-MsgGUID: BO7tckp7RWKgThV4aVtK7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38630667"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38630667"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 11:00:41 -0800
X-CSE-ConnectionGUID: NhEWkwpuSI6VCTBhO1Gzcw==
X-CSE-MsgGUID: 90hAMocnQh2IHcfRwozb2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114855371"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 11:00:40 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] tests/kms_atomic: Free up CRC resources
Date: Sat,  1 Feb 2025 00:46:11 +0530
Message-Id: <20250131191613.447979-1-ramanaidu.naladala@intel.com>
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

Add necessary checks to ensure proper cleanup CRC.

Naladala Ramanaidu (2):
  tests/kms_atomic: Add necessary checks to ensure proper cleanup
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 168 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 273 +----------------------
 tests/kms_atomic.c                       |  10 +
 3 files changed, 12 insertions(+), 439 deletions(-)

-- 
2.25.1

