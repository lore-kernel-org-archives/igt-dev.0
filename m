Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7A0E7719E
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 06:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B64210E164;
	Mon, 13 Jan 2025 06:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BuUOs22l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E2610E164
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 06:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736749871; x=1768285871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mhq93ESIijmQSq3XzEOYNPnDkFpqiytOOK/3Wur0TPo=;
 b=BuUOs22lTmTEOLlBL7RT5cEW3RNiRyNtSHQ4anGxudue7Y6wsPaT9prZ
 utgPeXY0UL33qQ0/XWg3Y5nMky17+rWlla1QdlL/FtmMiP8QURaBP0umm
 1Nx4Ncr7sq+88KyJ0qTIwX9NP3DZyKlXIPEZwYYq/5X6tYqihNl+O404i
 jmjIBeQZ3KsCi4DbmNLX0bxjjaHCYA4M7R4TXpsyNPj4XCzwp2tO11Yyl
 p0nq8n/7/rkieYTKlSWSA2go4MhuVWGJzkGlyL98sO4VrfMTLrQ2EXfVV
 miFaZYKP+PSJVtS0U85hWaRNaiQ25mf0Vqlkv/xywtfkFlh1M6PAqxjZ9 w==;
X-CSE-ConnectionGUID: nNm1j3pFSsyp3UR3pAhV6A==
X-CSE-MsgGUID: +0lCeIu2SKq/7eaOnZdL0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48411375"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="48411375"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 22:31:10 -0800
X-CSE-ConnectionGUID: /ZiNE/8aRGCgeSaGBL9lYg==
X-CSE-MsgGUID: SOKwPFfDQOiHBwiKa0CnoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135260301"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 22:31:08 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t v3 0/3] Miscellaneous OA Refactors
Date: Mon, 13 Jan 2025 11:49:46 +0530
Message-Id: <20250113061949.753864-1-sai.teja.pottumuttu@intel.com>
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

The patch series cleans up some unused arguments and also removes
hardcoded time heuristics. It also reduces the number of mmap periodic
reports being checked.

Sai Teja Pottumuttu (3):
  tests/intel/xe_oa: Remove unused function arguments
  tests/intel/xe_oa: Reduce the number of mmap reports checked
  tests/intel/xe_oa: Remove hardcoded time heuristics

 tests/intel/xe_oa.c | 51 ++++++++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 17 deletions(-)

-- 
2.34.1

