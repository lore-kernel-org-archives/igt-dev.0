Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE300C2BD05
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 07:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F1F10E370;
	Mon, 24 Jun 2024 07:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PhucFqrX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3720710E370
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 07:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719212769; x=1750748769;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8MjoGCQGARdPa17g9RTQ3sHapqHBq6kHt5On6ohHBtw=;
 b=PhucFqrXSXc+zGngiR2ckyxcvSTBeSjOO7dkXRN9yv4rmUYXZwpgV3WL
 SH1MedojZ1JlvPbTwyyDd7BFoSqwNPowHPgydKSD8/2uD6XlebH/2OmlV
 RFhdjGvxlJZ5HSSLcbanGHUvBQymaW05x2zdgLfR7/Httr0ypHxtR0esa
 B2lRAjryy4i6WaeT/QQ+TdAEeK+wILbEClCmsdfeGRKZkL+5FDITVtiN8
 ND101JRVOtYU5Ddqm9LTRopO6mvaosfQKKWO+n8dy+z6twnFvFERulSJE
 tJdm6VLJOqODHkua7symd3Qn2UP2PAHnq0xLfJdPB58YkQ8v2+2R23+8Q A==;
X-CSE-ConnectionGUID: SkTrdV9BQYedQ1zC6XWbfQ==
X-CSE-MsgGUID: zRzkjdH3RUGor61Ejv5YfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15921313"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="15921313"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:06:09 -0700
X-CSE-ConnectionGUID: tRfoKsjGRc6u8CqdfOAB3Q==
X-CSE-MsgGUID: SJGhzUUiSz6/bx/2LzYlMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="48372190"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 00:06:07 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH 0/2] tests/chamelium: fixes for chamelium tests
Date: Mon, 24 Jun 2024 12:48:03 +0530
Message-Id: <20240624071805.1356668-1-kunal1.joshi@intel.com>
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

add support for xe driver in i915_hpd_storm_ctl debugfs cleanup
Prefer HDMI connector over DP for chamelium_color tests

Kunal Joshi (2):
  lib/igt_debugfs: handle xe driver as well
  tests/chamelium/kms_chamelium_color: plug ports and prefer HDMI

 lib/igt_debugfs.c                     |  2 +-
 tests/chamelium/kms_chamelium_color.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.25.1

