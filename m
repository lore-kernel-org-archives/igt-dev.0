Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C739ACF9C6B
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 11:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE0E10E0B9;
	Tue, 24 Sep 2024 11:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MvIfmPSC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA66A10E0B9
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 11:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727178987; x=1758714987;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Jy8rohj2UggTelJXxjWShKXYVPLQdTgw04JoBJjjs4=;
 b=MvIfmPSC7q8V10MFiKb/GwXfNld7/REa7RQ5FfNoQ+zJ+T7GuwKPsz1N
 3b5PPSzl97aF3G+G9vt12U+3FTAN3j1QG5ZQVbL5VHYvj5nANF38mweSI
 OpjE+mo6FYTk8FYEzeEowranDAVwWtC0pgh4dRtusSkUAP/UQ/mFKUrt2
 jE3Ong4Xy9XrTIAQjBsyLlBJX+/KNi5IzspUeAskp445ahnbq72BaWunS
 GjQhaeyYSThTQhbmqF5FJGYbLaRcigmI2Wg68nGr7pG249rpVjSiCYlO7
 bwBsSQodGF2HWLCbUadcf8WS/ZdQtOWN6sJ0iEdZ7riQ38Iovp3xOoURb Q==;
X-CSE-ConnectionGUID: RDx6R+7FRsu+6Mle+VhAZQ==
X-CSE-MsgGUID: UBZx+9OdQfOGyKGzF2MzUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37544188"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="37544188"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:56:26 -0700
X-CSE-ConnectionGUID: je64nTgQQuaaClM3wi4V0A==
X-CSE-MsgGUID: 8l8f7J3hSmuQrRSiMja+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="75906156"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 04:56:25 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 0/2] Backlight control on HDR-enabled eDP panels
Date: Tue, 24 Sep 2024 17:25:53 +0530
Message-Id: <20240924115555.773860-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Validate backlight control by changing brightness on HDR enabled eDP
panels via sysfs.

Santhosh Reddy Guddati (2):
  tests/kms_hdr: Add brightness tests for hdr
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 183 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 289 +----------------------
 tests/kms_hdr.c                          | 106 +++++++++
 3 files changed, 130 insertions(+), 448 deletions(-)

-- 
2.34.1

