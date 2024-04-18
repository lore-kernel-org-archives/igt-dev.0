Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92720C04FF8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 09:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113B110F2FD;
	Thu, 18 Apr 2024 09:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzyoVvlO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B187210F2FD
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 09:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713432371; x=1744968371;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O8cHvbqfFv/t9zU6SfjquFWk//lYpqjy1swx+h2mRGA=;
 b=KzyoVvlORG+BdM5y0Sn+L7Rv2z5whD6D6T4PYsW+mGyak0L6FUIqqXvL
 TiYV3+ntDWG7rb+y4DyjPe7OK3vJ1CBAhID5pdDHDU95Kwm0p1MPWOzYS
 GljqB4mxl4CtinlsfKHn/AAgOtCZCXbeeRLD7UH/pWzqfR3Dtk8JcuKmL
 7dTY5Gzzu4Bg9l9l7UCPK+49wjwd4JkZj00PSaG4AZ8A4unmdOrjn7jEK
 rN1cXDcxxJHsMbjcGPMUWKeM/PRIY+aYhWWkTGSwiBYpnzr7INn5IaZHa
 de7WHpOTy42ARqR+1hrz+Ijp+Bkprp2Zm12hB19PduqOz26vy8MOJPiBd Q==;
X-CSE-ConnectionGUID: sr8WqEfbQbiWxbXieDIwiA==
X-CSE-MsgGUID: umYjRVB0Rf+nXv3D+x5cbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31447781"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="31447781"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:10 -0700
X-CSE-ConnectionGUID: 9R/Zw5tJQieYLy7E02ujsw==
X-CSE-MsgGUID: H8adSLY9TmSqhNQAbblCMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="53855367"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:08 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V2 0/6] Force joiner support in bigjoiner checks
Date: Thu, 18 Apr 2024 14:49:53 +0530
Message-ID: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

As we recently introduced the option (through debugfs) to
force the bigjoiner, needs to extend the support in bigjoiner
checks to handle the force joiner.

Bhanuprakash Modem (6):
  lib/igt_kms: New helper to check force joiner status
  lib/igt_kms: Force joiner support in bigjoiner checks
  tests/intel/kms_pm_lpsp: Force joiner support in bigjoiner checks
  tests/kms_flip: Force joiner support in bigjoiner checks
  tests/kms_setmode: Force joiner support in bigjoiner checks
  HAX: Test force joiner on BAT

 lib/igt_kms.c              | 47 ++++++++++++++++++++++++++++++++++----
 lib/igt_kms.h              |  1 +
 tests/intel/kms_pm_lpsp.c  |  3 +++
 tests/kms_flip.c           | 47 ++++++++++++++++++++++++++++++++++----
 tests/kms_pipe_crc_basic.c |  6 +++++
 tests/kms_setmode.c        | 22 ++++++++++++++----
 6 files changed, 114 insertions(+), 12 deletions(-)

-- 
2.43.2

