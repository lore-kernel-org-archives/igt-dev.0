Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B27CD5BB0
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 13:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E3510F55A;
	Fri, 22 May 2026 13:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKZBLYXb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F4310F576
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 13:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779455358; x=1810991358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sjyZUGdp2pX0SX9HHTwDSe9Cf32i1aKf3V8FujsYyFA=;
 b=PKZBLYXbFH3E3gHUTKiYSsUA/Clp2nCC//IJkDn84vrAnT7N7RmxCmcN
 7W5dA9OA73NedKmYWCQF5FICPmcaxMN9Boy+rko4fCFjX6CS+yYzjZD23
 NSfbS62oJYaH3fGiiOGRuMRkuuHIXH6mn3iAPU+R6lGYSwaTWJ+5BNFfj
 3B6ThtU1J7F0+COREF/oRN3uldeofLK109xh3L8cvHHEHoLglovOSqCjb
 oddWWiCfZhwvuaCTvk6g9wc7f4NCFxepIVxaVQ7x+/fs7ooCyL8khvg9b
 iqnd0Ug+eHJ9QazeI9HqM9xMkhv6jQNP5bdBK75Pxm/T4NhzZ7cip5Wh+ g==;
X-CSE-ConnectionGUID: jKTBe0SBT0a0XJ6m+jy5Lw==
X-CSE-MsgGUID: ZJ3D0z5VRRCMigWv9Yfm4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="82962070"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="82962070"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 06:09:18 -0700
X-CSE-ConnectionGUID: ANY+OyW6TnOT+Tg8LSTCiA==
X-CSE-MsgGUID: uELH74xgScCU7aH/r4GT3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="240067361"
Received: from shawnle1-i9-build-machine.itwn.intel.com ([10.225.64.200])
 by orviesa010.jf.intel.com with ESMTP; 22 May 2026 06:09:17 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Subject: [PATCH i-g-t 0/2] tests/kms_vrr: Add full-range refresh rate testing
Date: Fri, 22 May 2026 13:00:22 +0000
Message-Id: <20260522130024.1591744-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515063251.2239524-1-shawn.c.lee@intel.com>
References: <20260515063251.2239524-1-shawn.c.lee@intel.com>
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

This series extends kms_vrr to validate hardware stability across the
entire VRR refresh rate spectrum, rather than only fixed step increments.

The first patch reverts a previous workaround that started virtual RR
tests above the midpoint to avoid mode fallback. This workaround is no
longer needed once full-range testing is in place.

The second patch introduces a 'full-range' testing mode to kms_vrr.
When enabled, the test iterates from maximum down to minimum refresh
rate (stepping by 1Hz), covering all supported rates within the VRR
range. For eDP displays, the test is skipped if the panel does not
support multiple refresh rates. Standard behavior (min-to-max with
defined step size) is preserved for existing subtests.

Lee Shawn C (2):
  Revert "tests/kms_vrr: Start virtual RR test above midpoint to avoid
    mode fallback"
  tests/kms_vrr: add support for full range refresh rate testing

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>

 tests/kms_vrr.c | 179 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 138 insertions(+), 41 deletions(-)

-- 
2.34.1

