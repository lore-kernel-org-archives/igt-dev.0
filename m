Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE76C44512
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 15:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DBF10F34C;
	Thu, 16 Jul 2026 15:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4F4htiV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74CD10F34C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 15:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784215995; x=1815751995;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J7C40KbUFf3YeI5dxKzw0yDZtaUT1E9S0A3topnkrXc=;
 b=C4F4htiV/2vblCyyQVmlvDyHScrkyUZ3ymokEihornEOr/1Q9JMvb1Q3
 f6n1rNVW94M6MT82YbLyHBo/ofhk6C9q38Yy4bHSgKwfS19hREkTezHy/
 cJ8y6aN8hxuKcE5mZ/GKV92fjM5eB1XNkpBtnzptvNrNYGYF1t6fdRXhj
 bmLbI516xSqFOjBz2zxKbDyMy6Vf3z0Ky6bdgxS234BeQJWSJ+kFN2Gxm
 DegEZGaENPhUBng0vyW4zNjdf8b+JJbFAa1U2p6MLImcXUDHn2NRL7v5B
 owDISVmaxoC8c64E1k3RJ8tCxd9tAxU+FUcuGLExDCNG+zWPNp1E7DeCC Q==;
X-CSE-ConnectionGUID: XlJ11okJQrSpCd1VNj7CIg==
X-CSE-MsgGUID: 9E8OQ7haSkuaWXN3+5Zd/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84971930"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84971930"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:33:14 -0700
X-CSE-ConnectionGUID: NMvMt4jgR8uGrAMa3agq7g==
X-CSE-MsgGUID: u3sddr9cRGiNMJNn5XNWAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="280981987"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:33:12 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/kms_pm_dc: Add test to validate YUV420
 with DC3CO
Date: Thu, 16 Jul 2026 21:03:03 +0530
Message-ID: <20260716153305.817439-1-jeevan.b@intel.com>
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

Fix PSR/PR entry timeout in dynamic subtests and
Add test to validate YUV420 with DC3CO

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  tests/intel/kms_pm_dc: Fix PSR/PR entry timeout in dynamic subtests
  tests/intel/kms_pm_dc: Add test to validate YUV420 with DC3CO

 tests/intel/kms_pm_dc.c | 92 ++++++++++++++++++++++++-----------------
 1 file changed, 55 insertions(+), 37 deletions(-)

-- 
2.43.0

