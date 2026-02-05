Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F95FEA7960
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 04:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42A410E7AB;
	Thu,  5 Feb 2026 04:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uaj4o+eS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC1110E7AB
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 04:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770265854; x=1801801854;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wIY7EZqWSegZeezOfmre99Y+S+B6eCQJwPK+j60hoek=;
 b=Uaj4o+eSJ58iCsmId6IIQd1pzXmQMxukBGzGOYNHNZNBHLaYBF12yv9v
 1Md/TuvP4AKJbhqFap7dUvMmBcum7lpb2Clus2E+BeMK1hVIMVExnKp8z
 Bc169r1105mC0fVQ+mYxNVm/+vQX1A+KI+hTmzOLF0K2SUeEDGOwV6/xB
 rbvWy7X9WicJVak7WpDoRvi4jbocXcoskDEXVoGX81TYihSM2Im5nSylb
 O112/liOX1LPvznHbiafd2rUgFTMpQZS97Dzh3hQiYZNfBHlfNMRb6l83
 03kLuXBBfUf1SMhJpR22fL3USwZIlPODNR1qRyu8UUkhnBznvB/yCGhMK A==;
X-CSE-ConnectionGUID: qWOead38TgqingZn1xmCbA==
X-CSE-MsgGUID: Ra/Hgm4LRNqbzS+KHqCuoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75312469"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="75312469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 20:30:53 -0800
X-CSE-ConnectionGUID: YKSXsE2MSZ6yDfIfJnWedg==
X-CSE-MsgGUID: BG5TmtBESMOzBjsQgnS8Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214897782"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa004.jf.intel.com with ESMTP; 04 Feb 2026 20:30:51 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 0/2] tests/kms_plane: Refine clamping and modifier
 skips
Date: Thu,  5 Feb 2026 10:11:26 +0530
Message-Id: <20260205044128.1052937-1-pranay.samala@intel.com>
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

These changes avoid running source clamping tests on cursor planes and
skip modifier subtests that are not supported on the target display
platform.

Pranay Samala (2):
  tests/kms_plane: Skip cursor plane for source clamping
  tests/kms_plane: Skip unsupported modifiers

 tests/kms_plane.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

-- 
2.34.1

