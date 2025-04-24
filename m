Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F7DC369D1
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 07:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7500210E765;
	Thu, 24 Apr 2025 07:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NN3GqZ6P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C8510E765
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 07:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745481180; x=1777017180;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uZ5vUXcNWCBrQEu2MMs1MkkXUIhteAZVYS6tHN0aVTw=;
 b=NN3GqZ6Pf5xzXlWmoOJcDZ974X0QFaBT95WxPw8iZ9NHdLRwpbwxSFUG
 6L1Qa+agDOQDY91/zY161wxopcEv58Hj7ENpJjdzLsPQLMFnEXM/9T1BX
 /IeoF5v7Lbif/EiNoWznNaXMvIT9syVmn07HCzKnbQ35lf5fLvhNUGpRe
 I60+XTOcvMVW/CgUGttyPoEdepXzBy8/gPc0Ebqd03LK70xcbY3XEcw2B
 iyweI9447Np9hnRPmVSusETgdJ2+pz/FFYPPws01MjRotMcwc7HBMHZyw
 fzze0aBXINXB3YT/tMywsaF4VAffARQRRvTuzbetbVu96p8KEh1TbMGMl w==;
X-CSE-ConnectionGUID: f5sOdluKTtK0SuWEpXLA0w==
X-CSE-MsgGUID: Jd586gmZSGm27I8OzsVoAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64512680"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="64512680"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:53:00 -0700
X-CSE-ConnectionGUID: iY7hHVP6RJe9QOCxYYX05Q==
X-CSE-MsgGUID: Q0mcXsfURDuSZPl/bk7jUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="137712976"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:52:58 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 0/2] Async flips with tiled modifiers
Date: Thu, 24 Apr 2025 13:15:04 +0530
Message-Id: <20250424074506.2946884-1-santhosh.reddy.guddati@intel.com>
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

 tests/kms_async_flips.c | 68 +++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 16 deletions(-)

-- 
2.34.1

