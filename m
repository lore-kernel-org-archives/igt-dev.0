Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BD9CD4F3C
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 03:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4959110E2CC;
	Mon, 18 May 2026 03:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YI7FJvVR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158F410E2CC
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 03:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779076382; x=1810612382;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G1KM0j9KrmAKZA8Ua1CxHDMKx9aeQg6q1q6bhark3+Y=;
 b=YI7FJvVRpFHM4SVaoqYGhiYKBRQqfxTsz5Z6LyGSYLit8X+jafh/JRGD
 Uu5gKYmdCT2ESRDIRLlszjoZ4WDvFAI/noPEgFTPMny0RJQ7xt5vXyjuZ
 hFSNGZFEuCPad2m+LrGv6++vSwgqGlPgb5mNeNZ41XVyNfvufGqjfrjku
 whlYphdLN6Y07IJxfDVpH8Qb5BLzPok7aSwlEZbYYA0aiox3Bd0w3XFeU
 D2+Rn1T3kR90PmT5bNTgzhoSEjY/yOySWTSiHaXVQA7a5M761Oye+q/iJ
 AcQ0siUpkpVw1vB7a2rdUn+2eq0nfVQEOTbtaJMKoOBr+reYXuXI12p00 g==;
X-CSE-ConnectionGUID: V61i9pbpRZG5isRDCB6slw==
X-CSE-MsgGUID: 8X5kmr/aTgmdpT7HmX062w==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79970567"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="79970567"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 20:53:02 -0700
X-CSE-ConnectionGUID: 9ocFafI+QF+4yZiLB0bLqA==
X-CSE-MsgGUID: x+Fh9DSUTIqbvRPXxTRNGg==
X-ExtLoop1: 1
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa003.fm.intel.com with ESMTP; 17 May 2026 20:53:00 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 0/3] Improve max-bpc query error handling
Date: Mon, 18 May 2026 09:33:50 +0530
Message-Id: <20260518040353.212734-1-pranay.samala@intel.com>
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

This series refactors max-bpc query handling in IGT for better
error reporting.

The revert commit restores outer capability checks. The API
refactor changes igt_get_output_max_bpc() from assert-based
to bool+output-parameter, enabling graceful error handling.
Test updates use the new API with explicit failure handling
and clearer logging.

Pranay Samala (3):
  Revert "tests/kms_hdr: Move capability checks inside dynamic subtests"
  lib/igt_kms: make max bpc query return status
  tests/: Handle max bpc read failures explicitly

 lib/igt_kms.c                          |  38 ++++--
 lib/igt_kms.h                          |   2 +-
 tests/amdgpu/amd_bypass.c              |   6 +-
 tests/amdgpu/amd_dp_dsc.c              |  10 +-
 tests/intel/kms_dsc.c                  |  13 +-
 tests/intel/kms_frontbuffer_tracking.c |  10 +-
 tests/kms_color_helper.c               |   5 +-
 tests/kms_dither.c                     |   9 +-
 tests/kms_hdr.c                        | 169 +++++++++++++++----------
 9 files changed, 173 insertions(+), 89 deletions(-)

-- 
2.34.1

