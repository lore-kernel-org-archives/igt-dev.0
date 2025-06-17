Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AF7C71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 14:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A8710E3E4;
	Tue, 17 Jun 2025 14:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7w9hvvo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2489410E3E4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750170542; x=1781706542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2lVbILBGVt4McyEUHfwxZ7TCXusPHC0RuR2R3uWmqRA=;
 b=H7w9hvvoL2iquIBBCTBWvySqjNt5nJuBKMslqeU2UGkeyKI0fMGHDN/m
 HsH/2XHemfTMGDYdwcycLnWuU3662f4+AZzOK7UQpwtdYmGazWYvaRvNf
 Iw8ppp5yxEur8T9Q4+rsyn8K4hD7t97Duu+/NG/XdRZsCY/kes5tkH1bR
 6lFVZPatC+D+VkUuWLvHkS3aZUJ92j0VwyrxeRe2bDrN+YjBCFRSmb1/S
 4UFkPLGYOxMQeMftpq18pYFv1rX+UThjvYs+nBl6Zp8vYe+a7uNGwdYzy
 +melVfGgG94Nii9uu2RXGCRKTty1KselWYkLxf42o7okq9MoQwriOYdzM A==;
X-CSE-ConnectionGUID: oZ8W1Jp/S7yTzbn0fTmGOA==
X-CSE-MsgGUID: JhfSMWeMSKq0nE3BcFurSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63003341"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="63003341"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:29:02 -0700
X-CSE-ConnectionGUID: f2LVi3JrSJy4AOIv1RrAXw==
X-CSE-MsgGUID: e8aUDh2GRFSLLqJ7Bu0rwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="149687397"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:29:00 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v14 0/5] Support for IN_FORMATS_ASYNC plane property
Date: Tue, 17 Jun 2025 19:57:02 +0530
Message-Id: <20250617142707.490235-1-santhosh.reddy.guddati@intel.com>
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

Use IN_FORMATS_ASYNC property to get list of async modifiers
and improve async flips test to add coverage for the supported modifiers
and formats.

Santhosh Reddy Guddati (5):
  lib/igt_kms: Add support to retrieve async modifiers and formats
  tests/kms_async_flips: use in_formats_async for async modifiers
  tests/kms_async_flips: Add test for all async format modifiers
  tests/kms_async_flips: Remove allow_fail flag from async flip tests
  tests/kms_async_flips: Skip Async Flips with Linear Modifier

 lib/igt_kms.c           |  73 ++++++++++-------
 lib/igt_kms.h           |   7 +-
 tests/kms_async_flips.c | 169 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 206 insertions(+), 43 deletions(-)

-- 
2.34.1

