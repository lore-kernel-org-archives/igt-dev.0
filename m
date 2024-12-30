Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F68E77188
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 18:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC6810E579;
	Mon, 30 Dec 2024 18:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3tWwxIV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D316910E579
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 18:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735585091; x=1767121091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YZFTUKlDQSoZCmIFxEXgvj8U7PFC9zt3OmtEW8lelPo=;
 b=X3tWwxIVwxWiZ9+b2nTHJ70I8SRozen4Iw9NmdBOPLKrQbzyr1Vi1EtN
 hmqnwS+wZ0xxOwfjf//KcIdDn9ne9ZcDtneXTQGLRWCSu7pMPgU8GnGrY
 Stpj7JjLERRz/tv986ybjJ3AGR7fvl1ZzXdWsks0ml/ZM4mmJPi62FGPO
 sXXBWy3/BZmyJ3H7tGu35yxfFTXno2r9JUaMiSznimInknxONq3smj2Vv
 6dApxPi4mQoEseoejqjm2QqCuKDFtRJPDL5YFW+fii68qtnM9o1/86wMq
 eKv/hNT5cssJznRy1iRBOR4CevqbU2ziaKj1ulP0vOxwC8s06yVBaKy3s Q==;
X-CSE-ConnectionGUID: ff2aYYypTBuHEAyOOM6ZEQ==
X-CSE-MsgGUID: rh+bbbr/Q2+HTY7FqIhAew==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39803536"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="39803536"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:10 -0800
X-CSE-ConnectionGUID: 2/Ys0uaWTNGtpwThwikKNA==
X-CSE-MsgGUID: uBOkpbibQyKCLRZOk5vzzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="100728905"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:09 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/6] tests/intel/kms_cdclk: Refactor mode setting and CD
 clock verification
Date: Tue, 31 Dec 2024 00:33:09 +0530
Message-Id: <20241230190315.48821-1-swati2.sharma@intel.com>
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

Based on the review comments received, add highres and lowres
functions to lib and made corresponding changes in the lib.
On top, broken initial patches into smaller patches to better
review.

Swati Sharma (6):
  lib/igt_kms: Add highres() and lowres() func
  tests/intel/kms_cdclk: Modify highest resolution restriction
  tests/intel/kms_cdclk: Add conditions to filter valid outputs
  tests/intel/kms_cdclk: Introduce set_mode()
  tests/intel/kms_cdclk.c: Modify skip condition
  tests/intel/kms_cdclk: Add get_max_cdclk_freq()

 lib/igt_kms.c             |  34 +++++++
 lib/igt_kms.h             |   2 +
 tests/intel/kms_cdclk.c   | 199 +++++++++++++++++++++-----------------
 tests/intel/kms_dsc.c     |  14 +--
 tests/kms_display_modes.c |  14 +--
 5 files changed, 146 insertions(+), 117 deletions(-)

-- 
2.25.1

