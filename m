Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC28FC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 09:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525AA10FE2A;
	Mon, 29 Apr 2024 09:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeaCrjvE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8875310FE2A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714382161; x=1745918161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9eO+sQi4NC+iEFrVat5D3z79FAKs1A90EHSFVCF9YMk=;
 b=PeaCrjvEyv30tD5hCxwyjJ4K2Mn/4DtW35CJY1vyftykD+hebFqJBglK
 4dSXc4boCM0k3ZcHk+yRpRVPwOf9UU04GmsdT/TtbUiuBKISLzW4osgWL
 prhBFiU2d/A5Ju4CVSzBKcs94/UAmN67pmMRh90sNoLZp24Tdq6tEKKyZ
 xCtGItOiULtFlfvdpEA80N+ao2lXTl7HoSLo90Mrax0du+0Fhe0zgfuoI
 Nq4HRIE6ROxwfhIwcfyyVC63HGGNkv8XvIp9LbjLcjWqCrLndoBeHyKhh
 m0edJdh7YoVRBHTnVK231tgKgHc9G4+qjZHrdG8xmm4oExZnnT241eKW4 w==;
X-CSE-ConnectionGUID: MTNXqJloTvG8gX+NQfvFyg==
X-CSE-MsgGUID: lrPY/4LtQIOWwGUKGcc7Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="35428311"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="35428311"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:01 -0700
X-CSE-ConnectionGUID: wydvMKlmSPumDQszdWL+YA==
X-CSE-MsgGUID: zrKLh/8RTpqjzEiv/8xRnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26059815"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:15:59 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V5 0/8] Force joiner support in bigjoiner checks
Date: Mon, 29 Apr 2024 14:39:22 +0530
Message-ID: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
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

Bhanuprakash Modem (8):
  lib/igt_kms: Split the bigjoiner check into multiple
  lib/igt_kms: Update force joiner debugfs check
  lib/igt_kms: New helper to check force joiner status
  lib/igt_kms: Force joiner support in bigjoiner checks
  tests/intel/kms_pm_lpsp: Force joiner support in bigjoiner checks
  tests/kms_flip: Force joiner support in bigjoiner checks
  tests/kms_setmode: Force joiner support in bigjoiner checks
  HAX: Test force joiner on BAT

 lib/igt_kms.c                | 112 +++++++++++++++++++++++++++++------
 lib/igt_kms.h                |   3 +-
 tests/intel/kms_big_joiner.c |   2 +-
 tests/intel/kms_pm_lpsp.c    |   3 +
 tests/kms_flip.c             |  30 ++++++++--
 tests/kms_pipe_crc_basic.c   |   6 ++
 tests/kms_setmode.c          |  22 +++++--
 7 files changed, 151 insertions(+), 27 deletions(-)

-- 
2.43.2

