Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AA5C982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 12:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F8910E151;
	Mon, 21 Sep 2026 12:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8C7/e38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE06910E151
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789994651; x=1821530651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NAgFq2DSbapJV24wiZ3kNpxPNb17z1p4NL2zBnIdWIU=;
 b=D8C7/e380QXYFp+Hw/5vc35XsdcPt9CoqTWMFs1LtTye8jBMeooTkK1m
 jIGoe4QGF75Bzmw/Pypajs1/lYaiwsWV8gLzcY2SJaAUvNN+S0dUbfzhX
 cRo2M4oyvppk6mJCgaaf7mZPCabsHKE0CqcvrTVQvjZCqmoJh79JN0urS
 9eido9VJj5OnjfAu8UemNYDeWInbarYqWCbYjq+g5CXi5bjmP9lYYCK79
 qvJw+OTH6ciNe7Af8sIRVZ75vTX5bQwSVG9B+2hkSQ6R9HdyqlGF0ca21
 6kYlGv9AW3iOzxMmVVtGizvyzHwAykYEL6M0jjNxak+vI0C5MDAsgSTQL w==;
X-CSE-ConnectionGUID: 1bwSI3DTRVSBAYMgOimHMg==
X-CSE-MsgGUID: EgMXYWpvS1+XDvq5kxUqTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="1007022"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="1007022"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:44:11 -0700
X-CSE-ConnectionGUID: ++Ruj96pRVy6eEtND8Jiog==
X-CSE-MsgGUID: UL6P/a37TDqelrNIP/8lwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="272798006"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa008.fm.intel.com with ESMTP; 21 Sep 2026 05:44:10 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t 0/3] tests/intel: validate PSR2 selective fetch under
 joiner
Date: Mon, 21 Sep 2026 12:44:05 +0000
Message-ID: <20260921124408.358774-1-mika.kahola@intel.com>
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

PSR2 selective fetch and (big)joiner were never validated together:
kms_psr2_sf didn't know which pipe/output combos are even valid when
joiner is active, and nothing exercised PSR2 SF entry while forced
into big joiner mode.

Patch 1 is a small refactor to test_single_joiner() needed by patch 2.
Patch 2 adds a force-big-joiner + PSR2 SF entry test to kms_joiner.
Patch 3 makes kms_psr2_sf skip pipe/output combos that can't do PSR
with joiner, and resets the display before arming PSR so the forced
modeset doesn't fail against a stale joiner config.

Mika Kahola (3):
  tests/intel/kms_joiner: Pass output array into test_single_joiner()
  tests/intel/kms_joiner: Add PSR2 selective fetch test with joiner
  tests/intel/kms_psr2_sf: Handle the joiner

 tests/intel/kms_joiner.c  | 96 +++++++++++++++++++++++++++++++++++++--
 tests/intel/kms_psr2_sf.c | 22 +++++++++
 2 files changed, 113 insertions(+), 5 deletions(-)

-- 
2.43.0

