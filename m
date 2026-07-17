Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF76C4450F
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 03:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E954810E3D9;
	Fri, 17 Jul 2026 03:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhiTuI/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C91110E3D9
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 03:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784260627; x=1815796627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J7C40KbUFf3YeI5dxKzw0yDZtaUT1E9S0A3topnkrXc=;
 b=IhiTuI/dpDcaQCSbsC+N7xQgkUsMnzejA+ekqOUdz3GX3I0Xsfk6h5iW
 B4CGLXKjo+uAZDru+MU92Zv4BWTX/eIu3fAFmL0Dur4C/hDyvpxgREfrs
 77dtrJHE93CnAAoUl8F2hVhRrrPjxrFgB0ch/bK5jVKyTRyl0FeyKCZQ3
 AKUNx02kDl2WbCfb1ZZRfraD8Kj/P56ulwQvNEVOxous4rja8pOszTlXh
 ZuRLraUC9y9VploxbJ+D9WoScXtR108+vA1QbEcgoNUvEuGHZwVN+PK1F
 MQulMz89POcHVWflSTCREzPW7FXkhBAeWYM+ekPD+jDDbcRWpOWOy+Ae/ g==;
X-CSE-ConnectionGUID: orjzugzmScymedxcz9TLng==
X-CSE-MsgGUID: LeSkl91QToecBVlSoMK0Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="110480301"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="110480301"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 20:57:07 -0700
X-CSE-ConnectionGUID: H1UENZ8OTcy0uKUxN6vvwA==
X-CSE-MsgGUID: aAIW1/H5SiGo0VId4TfW+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="261626360"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 20:57:05 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/kms_pm_dc: Add test to validate YUV420
 with DC3CO
Date: Fri, 17 Jul 2026 09:26:56 +0530
Message-ID: <20260717035658.857405-1-jeevan.b@intel.com>
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

