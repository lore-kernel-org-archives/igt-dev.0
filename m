Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5675CCD128A
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 06:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25F110E270;
	Mon,  8 Apr 2024 06:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2//Hj+P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1854112118
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2024 06:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712557095; x=1744093095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fGBKRU8Tj116TukNysAg9xQlMf6mZr4vIEVKAS4tC4M=;
 b=U2//Hj+P4ktCmWT4n5eyi884Mc1xoCSSyqT6lnuRUdydEgdWRKpzgFtb
 LM3308Wb/Ruo0lcrAdBMQjaDkOKfKbtZT2vw3rWV/rgEfYRkI74cSPIUy
 ypTZCD7nnDLgUVgTWU7rTm0St+6McxngnbtU8JV3f+JwKINzpZ0ePuoIB
 qdo7VY3afSoQeUAr2pQonPVu9MZjFrXcqYtFlTTQktDAsyCl6UDD0/+8y
 nzchuxvXrrub+YDzOZh7PtgNlT9RnvMQCd6hSCxASozv8aGb3woxvExil
 AwTHA6L7LaDuGuI1L9yjLy/1P8a2mybuKdr4UOKvuTRg4HlwrLxg/Ucso A==;
X-CSE-ConnectionGUID: o2ZOkt1eQvmzcuWuEJXBaw==
X-CSE-MsgGUID: Jbbv7iRRS7OhjJVRINeaTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7940229"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7940229"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:18:14 -0700
X-CSE-ConnectionGUID: Uz0iZ/1wSbiS/pyQ0hIGWA==
X-CSE-MsgGUID: NdW6hMItSm+Wz9tc7yhTYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="50976970"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:18:12 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 0/5] Check the validity of selected pipe/output combo
Date: Mon,  8 Apr 2024 11:42:16 +0530
Message-ID: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
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

Use IGT lib helper to make sure the selected pipe/output/mode combo is valid.

Bhanuprakash Modem (5):
  lib/igt_kms: Check validity of the selcted pipe/output combo
  tests/kms: Drop redundant check for pipe/output combo validity
  tests/chamelium: Use lib helper to check the pipe/output combo
    validity
  tests/intel/kms: Use lib helper to check the pipe/output combo
    validity
  tests/kms: Use lib helper to check the pipe/output combo validity

 lib/igt_kms.c                          |  9 ++-
 tests/chamelium/kms_chamelium_helper.c | 12 +++-
 tests/chamelium/kms_chamelium_hpd.c    |  5 +-
 tests/intel/kms_pm_backlight.c         |  7 +-
 tests/intel/kms_psr.c                  | 17 +++--
 tests/kms_content_protection.c         |  3 -
 tests/kms_dither.c                     | 24 ++++---
 tests/kms_hdr.c                        | 90 +++++++++++++++-----------
 tests/kms_properties.c                 |  3 -
 tests/kms_vrr.c                        | 22 +++----
 10 files changed, 108 insertions(+), 84 deletions(-)

-- 
2.43.2

