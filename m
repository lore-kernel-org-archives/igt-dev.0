Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A0FC369C2
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 15:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3859710E96B;
	Wed, 16 Apr 2025 15:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwmcXzBH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9528C10E96A
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744816262; x=1776352262;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kbvwNyD/2878mdhB5hgPIcJ9m/AMyBmcNJ2V2/vy0GE=;
 b=XwmcXzBHSZRFda8pY5b6KaK3XFEKCNXOj7om1Y4wvWoX3xxeeyX9P7Mf
 F/Y2C5QgVLLIvhK9GyzSIv9/Nl1B9GuWjmZHXAqjdiVC2qmMJDakBQhrj
 PAlc4kshYMz6ILZtX5MxPWH0WtfXhxkwvhZmWGAKRGMJVzkNFprAjMSmt
 DwJ0mORMrGPUn8daa68F7ptTiC2dEaZpzxT2lfv3/fdOWbg+1pXOCxE5p
 yBGYoV1LJPPly57xTN1Wr4Z7FNQ9WFTb83X1UnBoDnY5h+D8mXrTu4Ocf
 SEhLh2LpHCEcIeNsRcT1Gk7/9qt0NTFUILbq2ShG00pMMrfQqpI00uwAb A==;
X-CSE-ConnectionGUID: TN2Sj7t5RyKKhN6cNmCXMA==
X-CSE-MsgGUID: falM4N7gRuaLW7LE6Ecx/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68859621"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="68859621"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 08:11:02 -0700
X-CSE-ConnectionGUID: ALqiftjTRpCUQdBd1ha7zg==
X-CSE-MsgGUID: TwOfzaFQTFCIlaf43fms5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130828761"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 08:10:50 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/2] Async flips with tiled modifiers
Date: Wed, 16 Apr 2025 20:33:46 +0530
Message-Id: <20250416150348.2901159-1-santhosh.reddy.guddati@intel.com>
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

Async flips with linear modifiers combination is a corner and not practical to use,
update the existing subtests to use the tiled modifiers.

Santhosh Reddy Guddati (2):
  tests/kms_async_flips: Split subtest to handle linear buffers
    separately
  tests/kms_async_flips: Use tiling modifiers

 tests/kms_async_flips.c | 56 +++++++++++++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 8 deletions(-)

-- 
2.34.1

