Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FA9E7716D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 05:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6661710E0E6;
	Wed,  4 Dec 2024 05:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIy1MiqQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2F110E0E6
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 05:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733291662; x=1764827662;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LiAa5iRKWdNmQMbnkcKQQ02f2c2Uh88TKfBQpmqKbJY=;
 b=jIy1MiqQynC02Gr148rsHWeRf4j75bCJ9HOeEePJXMJawvb0xE6761Zr
 anAnmnk3LS6wuMRlMGAvVF9wnSyx2dAxywrxdz9nk2p0yfnqQWNdZ+0yD
 SrdkANmdK6SvWwrIRnWtPuwwM0Prz0inmR9g5jwvScOt4cshiWb+G7nKc
 rT9GhxI1TcE0QH1KFR32MOatc64uaLPeSZAK6AWffLx4VaQSRclxrUSpf
 OdVHQI8/2482f9RtBypIzh61453EnhFDHVI3Y+mjMIOumDsp7yzWP4f8Z
 5GlLVIBtBI93AkSIMT0bxsgXM25jY6h5hPYg/2gkoOF35mVuZwgnoH0Cc A==;
X-CSE-ConnectionGUID: kFQ6KKpVSPa4nZCg9gLweQ==
X-CSE-MsgGUID: Ekc5GtrjQIOrnKGEEohlcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33461010"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="33461010"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 21:54:21 -0800
X-CSE-ConnectionGUID: Ehe7nUSOTTymFeVGF9C5Gw==
X-CSE-MsgGUID: TAlN+f0SSYeyJ1YcQc4Fag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98677549"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 21:54:20 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/4] Skip test if joiner display is connected
Date: Wed,  4 Dec 2024 11:39:20 +0530
Message-Id: <20241204060924.1155970-1-jeevan.b@intel.com>
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

Skip tests on joiner outputs to prevent failures caused by high-resolution
displays. This ensures the test suite runs smoothly without unnecessary issues.

Add 6k resolution support for a single CRTC and update calls.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (3):
  lib/igt_kms: Add is_joiner_mode function
  tests/kms_display_modes: Skip test if joiner display is connected
  lib/igt_kms: Add 6k resolution support for a single CRTC

Santhosh Reddy Guddati (1):
  tests/kms_async_flips: Skip async flips on joiner output

 lib/igt_kms.c             | 55 +++++++++++++++++++++++++++++++++------
 lib/igt_kms.h             |  6 +++--
 tests/intel/kms_pm_lpsp.c |  4 +--
 tests/kms_async_flips.c   | 18 +++++++++++--
 tests/kms_display_modes.c | 10 +++++++
 tests/kms_flip.c          |  4 +--
 tests/kms_setmode.c       |  4 +--
 7 files changed, 83 insertions(+), 18 deletions(-)

-- 
2.25.1

